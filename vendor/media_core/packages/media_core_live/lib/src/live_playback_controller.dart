import 'dart:async';

import 'package:media_core/media_core.dart';

import 'package:media_core_live/src/live_request.dart';
import 'package:media_core_live/src/live_watchdogs.dart';

/// How long a freshly opened source has to prove that playback is real.
const Duration _verificationWindow = Duration(seconds: 8);

/// Resolves the sources for the next engine of a sweep.
///
/// Invoked *before* the controller attaches the next engine, with the
/// engine id that is about to be attached and the sources that just
/// failed. Many live-site URLs are signed and single-use — consumed by
/// the first engine's attempt — so the caller usually wants to refetch
/// fresh lines here. Return the new sources to sweep from line 0, an
/// empty list to reuse the current ones.
typedef EngineFallbackSourceResolver = Future<List<PlayerSource>> Function(
  String nextEngine,
  List<PlayerSource> currentSources,
);

/// Orchestrates live playback on top of a [PlayerKernel].
///
/// One structural idea holds the module together: **every action is a task
/// on a single-slot [TaskManager]** — play, switch line, retry, pause,
/// resume, close, recover. The queue serializes them, so none of the
/// classic live-playback races can exist by construction:
///
/// - a recovery task and a user action cannot interleave — the user's task
///   runs first, and queued recovery work is cancelled when the user takes
///   over ([pause], [close], [play], [retry], [switchLine]);
/// - two rapid `play()` calls cannot double-open — the first is cancelled
///   out of the queue before the second starts;
/// - an engine switch cannot replay a stale request over a newer one —
///   there is no delayed replay anywhere; a switch is just the next task.
///
/// Recovery is a plain function of the caller's declarations, not a
/// subsystem:
///
/// ```text
/// attempt(source, engine) fails
///   → next source on the same engine           (the lines the caller gave)
///   → sources exhausted → next engine, sweep again    (if the caller allowed)
///   → nothing left → PlayerFailure on [onError]
/// ```
///
/// "Fails" means one of: the open threw, the engine could not be attached,
/// or — the case that used to look like a freeze — the source opened
/// cleanly but playback position never advanced within
/// [_verificationWindow]. Verification is what makes the sweep honest.
///
/// Watchdogs stay pure detectors: a stall or an adapter error becomes a
/// recover task — reopen the current source once, then join the same
/// sweep. The kernel-side recovery ladder is disabled for live players, so
/// there is exactly one recovery path and the caller can read all of it
/// here.
final class LivePlaybackController {
  LivePlaybackController(this.kernel, {LiveWatchdogs? watchdogs, this.onEngineFallbackSources})
    : watchdogs = watchdogs ?? LiveWatchdogs() {
    _wireWatchdogs();
  }

  /// The kernel providing players and adapters.
  final PlayerKernel kernel;

  /// Called before the sweep attaches the next engine, when every line
  /// failed on the current one. See [EngineFallbackSourceResolver].
  ///
  /// Null — the default — reuses the existing lines for the next engine.
  final EngineFallbackSourceResolver? onEngineFallbackSources;

  /// Watchdog bundle inferring stalls.
  final LiveWatchdogs watchdogs;

  /// Single-slot queue. Every user action and every recovery step is a
  /// task here; capacity one makes the controller sequential by design.
  final TaskManager _tasks = TaskManager(maxConcurrentTasks: 1);

  final Map<TaskId, _PendingTask> _pending = <TaskId, _PendingTask>{};

  bool _draining = false;
  bool _disposed = false;

  /// Whether a sweep task is running right now.
  ///
  /// While it is, adapter errors and watchdog stalls are the *running
  /// sweep's* business — its catch already advances to the next
  /// candidate. Enqueueing a recover task on top used to start a second
  /// sweep that re-opened line 0 behind the first one's back, which is
  /// Last adapter error seen while a sweep is running. The verification
  /// loop checks it so an engine-reported failure fails the candidate
  /// immediately instead of waiting out the full verification window.
  String? _sweepAdapterError;

  /// Bumped by [play] and [close]. A sweep captures it when it starts and
  /// abandons itself if it moved meanwhile.
  int _playGeneration = 0;

  LiveSourceRequest? _request;
  /// Ledger of the candidate lines and engines this sweep holds.
  ///
  /// The player being watched is counted by the kernel, not here: what this
  /// module owns is the fallback list, and the list is what tells a reader how
  /// many signed URLs are being kept alive.
  /// This instance's key in the shared account.
  late final String _memoryKey = memoryContributorKey(this);

  final MemoryAccount _memory = MediaCoreMemory.of(MemoryModule.live);

  /// Reports the candidate lines and engines the sweep is holding.
  void _reportMemory() {
    final entries = _sources.length + _engines.length;
    _memory.report(_memoryKey, 
      items: entries,
      bytes: entries * MemoryEstimates.cacheEntry,
      note: '${_sources.length} line(s), ${_engines.length} engine(s) in the sweep',
    );
  }

  List<PlayerSource> _sources = const <PlayerSource>[];
  List<String> _engines = const <String>[];
  int _engineIndex = 0;
  int _sourceIndex = 0;
  PlayerHandle? _handle;
  PlayerSource? _currentSource;
  String? _preferredBackend;
  bool _engineFallbackAllowed = true;
  bool _playbackRequested = false;
  bool _audioOnly = false;
  PlayerState state = PlayerState.idle;

  /// Line each engine's sweep starts from: the line that was being played
  /// when the previous engine failed, so a fresh engine first retries the
  /// line the user was watching.
  int _sweepStart = 0;

  final StreamController<PlayerState> _stateController = StreamController<PlayerState>.broadcast();
  final StreamController<PlayerHandle> _handleController = StreamController<PlayerHandle>.broadcast();
  final StreamController<PlayerFailure> _failureController = StreamController<PlayerFailure>.broadcast();
  StreamSubscription<PlayerAdapterEvent>? _adapterSub;
  StreamSubscription<PlayerBackendChange>? _backendSub;

  /// Playback state stream.
  Stream<PlayerState> get onStateChanged => _stateController.stream;

  /// Emitted whenever the attached handle changes - an engine switch
  /// committed a staged player, or the player was released. Consumers that
  /// render the video surface must rebind on this and not on the old
  /// handle's own streams: the old handle is disposed by the time the new
  /// one is committed, so subscriptions taken from it go dead.
  Stream<PlayerHandle> get onHandleChanged => _handleController.stream;

  /// Terminal failure stream. Emitted exactly once per exhausted sweep.
  Stream<PlayerFailure> get onError => _failureController.stream;

  /// The active player handle, when one exists.
  PlayerHandle? get handle => _handle;

  /// Current backend id, when a handle exists.
  String? get backendId => _handle?.backendId;

  /// Identity of the logical player, when a handle exists.
  ///
  /// One identity per player, owned by the handle — the controller does
  /// not mint its own.
  PlayerId? get playerId => _handle?.id;

  /// Latest session snapshot of the player.
  ///
  /// The session is the handle's; this is a passthrough, not a second one.
  SessionSnapshot? get sessionSnapshot => _handle?.snapshot;

  /// Candidate sources of the active request.
  List<PlayerSource> get sources => _sources;

  /// Index of the source currently being played.
  int get sourceIndex => _sourceIndex;

  /// Whether playback is restricted to the audio track.
  bool get audioOnly => _audioOnly;

  // ---------------------------------------------------------------------------
  // Public actions — every one of them a queued task
  // ---------------------------------------------------------------------------

  /// Starts playing [request].
  ///
  /// [preferredBackend] pins the engine for this playback; when omitted the
  /// engine order is the selector's scored order for the primary source.
  Future<void> play(LiveSourceRequest request, {String? preferredBackend}) {
    _request = request;
    _sources = request.sources;
    _reportMemory();
    _preferredBackend = preferredBackend;
    _engineFallbackAllowed = request.allowEngineFallback ?? true;
    // Engine escalation is allowed for every request unless the caller
    // explicitly refuses it. A single-URL request has no other line to
    // sweep, so its sweep is one engine, one line — but if that fails the
    // next engine still gets its turn on the same URL before the failure
    // is surfaced. The number of URLs decides how much *line* fallback
    // there is, never whether engines may be tried.
    _playbackRequested = true;
    _playGeneration++;
    _sweepStart = 0;

    _supersedeQueued('superseded by play');

    return _enqueue(TaskType.open, (_) => _startPlayback());
  }

  /// Switches to the source at [index].
  Future<void> switchLine(int index) {
    if (index < 0 || index >= _sources.length) {
      return Future<void>.value();
    }

    _sourceIndex = index;
    _sweepStart = index;
    _playbackRequested = true;
    _playGeneration++;

    _supersedeQueued('superseded by line switch');

    return _enqueue(TaskType.load, (_) => _openCurrentSource());
  }

  /// Replays the current source from scratch.
  Future<void> retry() {
    if (_request == null || _sources.isEmpty) {
      return Future<void>.value();
    }

    _playbackRequested = true;
    _playGeneration++;

    _supersedeQueued('superseded by retry');

    return _enqueue(TaskType.retry, (_) => _openCurrentSource());
  }

  /// Pauses playback. Cancels queued recovery: a user pause is a recovery
  /// boundary, not a recovery opportunity.
  Future<void> pause() async {
    _playbackRequested = false;
    _playGeneration++;

    _supersedeQueued('superseded by pause');

    watchdogs.cancelAll();

    await _enqueue(TaskType.pause, (token) async {
      await _handle?.pause();
      _setState(_liveState(PlayerPlaybackState.paused));
    });
  }

  /// Resumes playback.
  Future<void> resume() async {
    _playbackRequested = true;

    await _enqueue(TaskType.play, (token) async {
      final handle = _handle;

      if (handle == null || handle.disposed) {
        return;
      }

      await handle.play();
      _setState(_liveState(PlayerPlaybackState.playing));
    });
  }

  /// Toggles pause/resume.
  Future<void> togglePlayPause() async {
    if (state.playback == PlayerPlaybackState.playing) {
      await pause();
    } else {
      await resume();
    }
  }

  /// Sets volume (0.0–1.0).
  Future<void> setVolume(double volume) {
    return _handle?.setVolume(volume.clamp(0.0, 1.0).toDouble()) ?? Future<void>.value();
  }

  /// Mutes or unmutes audio output.
  Future<void> setMute(bool muted) {
    return _handle?.setMute(muted) ?? Future<void>.value();
  }

  /// Whether audio output is muted.
  bool get muted => _handle?.muted ?? false;

  /// Sets whether playback restarts after completion.
  Future<void> setLoop(bool loop) {
    return _handle?.setLoop(loop) ?? Future<void>.value();
  }

  /// Current playback position on the attached engine.
  Duration get position => _handle?.position ?? Duration.zero;

  /// Stream duration on the attached engine (zero for live streams).
  Duration get duration => _handle?.duration ?? Duration.zero;

  /// Restricts playback to the audio track.
  Future<void> setAudioOnly(bool audioOnly) async {
    _audioOnly = audioOnly;

    watchdogs.setVideoExpected(!audioOnly);

    await _handle?.setAudioOnly(audioOnly);
  }

  /// Marks whether the current route owns the mounted video presentation.
  void setPresentationVisible(bool visible) {
    watchdogs.setPresentationVisible(visible);
  }

  /// Records that the app was backgrounded and the player was auto-paused.
  ///
  /// Without this, the unexpected-pause watchdog reads the background
  /// auto-pause as a network fault and silently resumes playback the user
  /// cannot see. A background pause is a system intent: playback is no
  /// longer requested until the user resumes.
  void noteBackgrounded() {
    _playbackRequested = false;

    watchdogs.cancelAll();
  }

  /// Stops playback and releases the player.
  Future<void> close() async {
    _playbackRequested = false;
    _playGeneration++;

    _supersedeQueued('superseded by close');

    watchdogs.cancelAll();

    await _enqueue(TaskType.close, (token) async {
      await _releaseHandle();
      _setState(PlayerState.idle);
    });
  }

  /// Disposes the controller.
  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;

    _playbackRequested = false;
    _playGeneration++;

    _supersedeQueued('superseded by dispose');
    watchdogs.cancelAll();

    await _adapterSub?.cancel();
    _adapterSub = null;
    await _backendSub?.cancel();
    _backendSub = null;

    await _releaseHandle();

    watchdogs.dispose();

    _memory.withdraw(_memoryKey);

    _tasks.dispose();
    await _stateController.close();
    await _handleController.close();
    await _failureController.close();
  }

  // ---------------------------------------------------------------------------
  // The sweep: engine × source, verified
  // ---------------------------------------------------------------------------

  Future<void> _startPlayback() async {
    final engines = _engineOrder();
    final primary = _sources.isNotEmpty ? _sources.first : null;
    final handle = _handle;

    // A duplicate play of exactly the playback already running - a
    // double-tap, or the app re-entering its play flow while the first
    // sweep is still verifying - must not supersede and tear down what it
    // just asked for. Full-URI comparison: refreshed signatures share the
    // path but differ in query, so a legitimate re-play still runs.
    if (handle != null &&
        !handle.disposed &&
        _playbackRequested &&
        primary != null &&
        _currentSource?.uri == primary.uri &&
        (engines.isEmpty || handle.backendId == engines.first)) {
      return;
    }

    _engines = engines;
    _reportMemory();
    _engineIndex = 0;
    _sourceIndex = 0;

    await _sweep();
  }

  /// Whether the newer command that superseded [generation] is a play of
  /// exactly [source] on [engine] - in which case committing the staged
  /// player is correct, and discarding it would only fail the sweep and
  /// burn the request's single-use URLs on a replay.
  bool _supersededBySamePlayback(String engine, PlayerSource source) {
    return _playbackRequested &&
        _request != null &&
        _sourceIndex < _sources.length &&
        _engineIndex < _engines.length &&
        _sources[_sourceIndex].uri == source.uri &&
        _engines[_engineIndex] == engine;
  }

  Future<void> _openCurrentSource() async {
    if (_engines.isEmpty || _engineIndex >= _engines.length) {
      _engines = _engineOrder();
      _engineIndex = 0;
    }

    await _sweep(startAtCurrent: true);
  }

  /// Tries candidates in order until one verifies, then reports failure.
  ///
  /// The whole sweep runs inside one queued task, so the only things that
  /// can interrupt it are a user action taking the queue or the task being
  /// cancelled — never another recovery path.
  Future<void> _sweep({bool startAtCurrent = false}) async {
    final generation = _playGeneration;
    var first = true;

    while (!_disposed && _playbackRequested && generation == _playGeneration) {
      final source = _sources[_sourceIndex];
      final engine = _engines[_engineIndex];

      try {
        await _openOn(engine, source);

        return;
      } catch (error) {
        MediaCoreLog.warning(
          LogCategory.recovery,
          'candidate failed: ${source.uri} on $engine'
              '${first && startAtCurrent ? ' (reopen of the playing line)' : ''}',
          error: error,
          fields: <String, Object?>{'sourceIndex': _sourceIndex, 'engineIndex': _engineIndex},
        );

        first = false;
      }

      if (!await _nextCandidate()) {
        await _reportExhausted(source, engine);

        return;
      }
    }
  }

  /// Moves to the next candidate: next source, else next engine (when
  /// allowed) restarting its sweep at the line the user was watching.
  ///
  /// Before the engine switch, [onEngineFallbackSources] gets one chance
  /// to hand over fresh lines: signed live URLs are frequently single-use,
  /// and replaying them on the next engine would fail the whole sweep for
  /// an expired signature rather than a broken engine.
  Future<bool> _nextCandidate() async {
    if (_sourceIndex + 1 < _sources.length) {
      _sourceIndex++;

      return true;
    }

    if (!_engineFallbackAllowed || _engineIndex + 1 >= _engines.length) {
      return false;
    }

    final nextEngine = _engines[_engineIndex + 1];

    var nextSources = _sources;
    var resumeAt = _sweepStart;

    final resolver = onEngineFallbackSources;

    if (resolver != null) {
      try {
        final refreshed = await resolver(nextEngine, _sources);

        if (refreshed.isNotEmpty) {
          nextSources = List<PlayerSource>.unmodifiable(refreshed);
          resumeAt = 0;

          MediaCoreLog.info(
            LogCategory.fallback,
            'engine switch sources refreshed by the caller',
            fields: <String, Object?>{'nextEngine': nextEngine, 'lines': nextSources.length},
          );
        }
      } catch (error) {
        MediaCoreLog.warning(
          LogCategory.fallback,
          'engine switch source refresh failed — reusing the current lines',
          error: error,
          fields: <String, Object?>{'nextEngine': nextEngine},
        );
      }
    }

    MediaCoreLog.info(
      LogCategory.fallback,
      'all sources failed on ${_engines[_engineIndex]} — switching to $nextEngine',
      fields: <String, Object?>{
        'from': _engines[_engineIndex],
        'to': nextEngine,
        'resumeAtLine': resumeAt,
        'refreshed': !identical(nextSources, _sources),
      },
    );

    _sources = nextSources;
    _sweepStart = resumeAt;
    _engineIndex++;
    _sourceIndex = resumeAt;

    return true;
  }

  /// Opens [source] on [engine], starts playback and verifies it.
  ///
  /// Line switches inside one engine re-open the existing handle. An
  /// engine switch is **staged**: the replacement player is created,
  /// opened and verified *alongside* the current one, and only a verified
  /// player is committed. Committing after verification is what keeps the
  /// engine-switch black flash short - the mounted surface is replaced at
  /// the moment the new engine already has a decoded frame, instead of
  /// showing a placeholder for the engine's whole time-to-first-frame.
  Future<void> _openOn(String engine, PlayerSource source) async {
    final generation = _playGeneration;

    final current = _handle;
    final sameEngine = current != null && !current.disposed && current.backendId == engine;

    if (!sameEngine) {
      await _openOnStaged(engine, source, generation: generation, previous: current);
      return;
    }

    final handle = current;

    _setState(_liveState(PlayerPlaybackState.opening));

    // Recovery is this module's job; the handle's own ladder stays
    // dormant so there is exactly one recovery path.
    handle.setRecoveryEnabled(false);
    handle.declarePlayIntent(true);

    // Every watchdog armed for a previous candidate is stale now: cancel
    // them, and clear the position observation so the new source starts
    // unobserved. The first position sample of the *new* source is then
    // what enables and arms the stall detector - exactly once.
    watchdogs.cancelAll();
    watchdogs.resetPositionSignal();

    _sweepAdapterError = null;

    await handle.open(source);

    if (_abandoned(generation)) {
      return;
    }

    await handle.play();

    // The step that separates "opened" from "playing": without it an
    // engine that accepts a source but never delivers a frame reads as
    // success and the sweep stops on a frozen player.
    await _verifyPlayback(handle, source);

    if (_abandoned(generation)) {
      return;
    }

    _currentSource = source;

    watchdogs.armSourceReady();

    _setState(_liveState(PlayerPlaybackState.buffering));
  }

  /// Builds the replacement player for [engine], proves it plays, then
  /// commits it. Any failure disposes the staged player and rethrows - the
  /// sweep moves on, and nothing already on screen is torn down for a
  /// lost race.
  Future<void> _openOnStaged(
    String engine,
    PlayerSource source, {
    required int generation,
    required PlayerHandle? previous,
  }) async {
    MediaCoreLog.info(
      LogCategory.fallback,
      'attaching engine $engine for ${source.uri}',
      fields: <String, Object?>{'line': _sourceIndex, 'staged': previous != null},
    );

    _setState(_liveState(PlayerPlaybackState.opening));

    watchdogs.cancelAll();

    _sweepAdapterError = null;

    // The engine being replaced keeps playing while this attempt runs, and
    // its subscription is otherwise only swapped at commit - so for the
    // whole verification window it kept feeding observations (position,
    // playing, buffering) to a watchdog set that had just been cancelled
    // for this attempt. That is what produced a second "armed" line per
    // engine switch, armed from the retiring source's samples. Detach it
    // for the attempt; a failed attempt restores the subscription so the
    // still-running playback keeps its coverage.
    final retireeSub = previous == null ? null : _adapterSub;

    if (retireeSub != null) {
      _adapterSub = null;

      await retireeSub.cancel();
    }

    final staged = await kernel.create(preferredBackend: engine);

    try {
      staged.setRecoveryEnabled(false);
      staged.declarePlayIntent(true);

      if (_audioOnly) {
        await staged.setAudioOnly(true);
      }

      await staged.open(source);

      if (_abandoned(generation) && !_supersededBySamePlayback(engine, source)) {
        throw StateError('Staged engine $engine was abandoned mid-open.');
      }

      await staged.play();
      await _verifyPlayback(staged, source);

      if (_abandoned(generation) && !_supersededBySamePlayback(engine, source)) {
        throw StateError('Staged engine $engine was abandoned mid-verify.');
      }

      // Commit: the replacement has proven itself. Surface consumers see
      // the new handle through onHandleChanged and rebind at this moment,
      // when the first frame is already decoded.
      //
      // The per-source position observation is cleared first: the retiring
      // engine has been feeding the watchdogs throughout verification (its
      // subscription is only replaced by _attach), so its samples would
      // otherwise arm the stall detector for a source that is going away -
      // one arm per engine switch too many in the log.
      watchdogs.resetPositionSignal();

      _attach(staged);

      if (previous != null && !previous.disposed) {
        try {
          await kernel.release(previous.id);
        } catch (_) {
          // Best-effort release of the retired engine.
        }
      }
    } catch (error) {
      try {
        await kernel.release(staged.id);
      } catch (_) {
        // Best-effort cleanup of the failed staging.
      }

      // The retired engine is still the active one after a failed attempt:
      // give its adapter events back, or a stream that keeps playing would
      // run without stall detection until the next candidate commits. The
      // watchdog capabilities and playing state are re-seeded with it -
      // the attempt cancelled them, and the retiring handle's Playing event
      // is long past, so without this the position stall could never re-arm
      // for a stream that is in fact still running.
      if (previous != null && !previous.disposed && identical(_handle, previous) && _adapterSub == null) {
        _adapterSub = previous.adapterEvents.listen(_onAdapterEvent, onError: (Object _) {});

        watchdogs.updateCapabilities(previous.adapter.capabilities);
        watchdogs.setVideoExpected(!_audioOnly);
        watchdogs.onPlayingChanged(_playbackRequested, fromUserIntent: false);
      }

      rethrow;
    }

    if (_abandoned(generation)) {
      return;
    }

    _currentSource = source;

    watchdogs.armSourceReady();

    _setState(_liveState(PlayerPlaybackState.buffering));
  }

  /// Waits until [handle] shows any sign of real playback.
  ///
  /// An engine that accepts a source but never delivers a frame — the
  /// "freeze that looks like success" — fails here instead of ending the
  /// sweep on a silent player.
  ///
  /// The success bar is *any* positive position progress, not a jump:
  /// some live sources (huya FLV, for one) start their demuxer clock near
  /// zero and only creep forward a few tens of milliseconds while the
  /// picture is in fact playing. Requiring a 400ms jump used to condemn
  /// exactly those healthy streams, and the sweep then tore down engine
  /// after engine that was already on screen. A stream that moves at all
  /// has passed verification; if it later stops moving, the position-stall
  /// watchdog is the detector for that, not this gate.
  Future<void> _verifyPlayback(PlayerHandle handle, PlayerSource source) async {
    final until = DateTime.now().add(_verificationWindow);
    var last = handle.playbackStream.value.position;

    while (DateTime.now().isBefore(until)) {
      if (_disposed || !_playbackRequested) {
        throw StateError('Playback verification abandoned: playback was stopped.');
      }

      final adapterError = _sweepAdapterError;

      if (adapterError != null) {
        throw StateError('${source.uri} on ${handle.backendId} failed while verifying: $adapterError');
      }

      final position = handle.playbackStream.value.position;

      // A reopen restarts the demuxer clock: the mirror still holds the
      // previous playback's position (18s of the old session, say), and
      // the fresh stream starts near zero. Without re-baselining, every
      // new sample is "smaller than last" and a perfectly healthy reopen
      // is condemned as frozen at the stale value.
      if (position < last) {
        last = position;
        continue;
      }

      if (position > last) {
        return;
      }

      await Future<void>.delayed(const Duration(milliseconds: 250));
    }

    throw StateError(
      '${source.uri} on ${handle.backendId} opened but never played '
      '(position frozen at ${last.inMilliseconds}ms for '
      '${_verificationWindow.inSeconds}s).',
    );
  }

  /// Terminal: every allowed candidate failed. Exactly one failure per
  /// sweep — the caller decides what happens next.
  Future<void> _reportExhausted(PlayerSource source, String engine) async {
    MediaCoreLog.error(
      LogCategory.recovery,
      'live sweep exhausted — reporting to the caller',
      fields: <String, Object?>{
        'sources': _sources.length,
        'enginesTried': _engineFallbackAllowed ? _engineIndex + 1 : 1,
        'lastEngine': engine,
        'lastLine': source.uri.toString(),
      },
    );

    _setState(_liveState(PlayerPlaybackState.error));

    if (!_failureController.isClosed) {
      _failureController.add(
        PlayerFailure(
          code: PlayerErrorCode.noPlayableStream,
          message: 'Live playback failed after trying ${_sources.length} source(s)'
              '${_engineFallbackAllowed ? ' across ${_engineIndex + 1} engine(s)' : ''}. '
              'Last attempt: ${source.uri} on $engine.',
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Engine order and handle lifecycle
  // ---------------------------------------------------------------------------

  /// Backend ids to try, best first: the pinned engine (if any), then the
  /// selector's scored order for the primary source.
  List<String> _engineOrder() {
    final primary = _sources.isNotEmpty ? _sources.first : _request?.primary;
    final source = primary ?? _request!.primary;
    final scored = kernel.selector
        .candidatesFor(source)
        .where((registration) => registration.enabled)
        .map((registration) => registration.id)
        .toList(growable: false);

    // A pinned engine still has to be able to play the source. The user
    // preference must not put an engine that does not declare the source's
    // format at the front of the sweep: it would burn every single-use
    // line failing on a format it cannot decode before a capable engine
    // gets its turn. With an unknown format nothing is filtered.
    final capable = source.format.isKnown
        ? scored
              .where((id) {
                final registration = kernel.registry.get(id);

                return registration == null ||
                    kernel.selector.formatMatches(registration.capabilities, source);
              })
              .toList(growable: false)
        : scored;

    final engines = capable.isNotEmpty ? capable : scored;

    final pinned = _preferredBackend;

    if (pinned == null) {
      return engines;
    }

    if (!engines.contains(pinned)) {
      // The pin lost its turn because its own declaration excludes this
      // format. Silence here is what makes "I chose ExoPlayer and got mpv"
      // unanswerable from the outside — the preference was honoured all the
      // way to this line and then dropped. Either the declaration is too
      // narrow (FLV was, see `BetterPlayerFormats`) or the engine really
      // cannot open the source, and both are worth a line.
      MediaCoreLog.warning(
        LogCategory.fallback,
        'pinned engine "$pinned" does not declare the source format — falling back to the scored order',
        fields: <String, Object?>{
          'pinned': pinned,
          'format': source.format.name,
          'tried': engines.join(','),
        },
      );

      return engines;
    }

    return <String>[pinned, ...engines.where((id) => id != pinned)];
  }

  void _attach(PlayerHandle handle) {
    _handle = handle;

    if (!_handleController.isClosed) {
      _handleController.add(handle);
    }

    handle.setRecoveryEnabled(false);

    watchdogs.updateCapabilities(handle.adapter.capabilities);
    watchdogs.setVideoExpected(!_audioOnly);

    // The staged engine plays *before* it is attached: open/play/verify
    // all run while nothing feeds the watchdogs, so their playing state is
    // stale at attach time and the adapter's Playing event - a one-shot on
    // engines with a state latch - may never arrive again. Seed from the
    // declared intent rather than the adapter mirror: live always declares
    // play intent, and the mirror can read "paused" for an engine that
    // paused itself mid-open (mpv does) even though playback is on.
    watchdogs.onPlayingChanged(_playbackRequested, fromUserIntent: false);

    _adapterSub?.cancel();
    _adapterSub = handle.adapterEvents.listen(_onAdapterEvent, onError: (Object _) {});

    _backendSub?.cancel();
    _backendSub = handle.backendChanges.listen((change) {
      watchdogs.updateCapabilities(change.adapter.capabilities);
      watchdogs.setVideoExpected(!_audioOnly);
    });

    if (_audioOnly) {
      unawaited(handle.setAudioOnly(true));
    }
  }

  Future<void> _releaseHandle() async {
    _adapterSub?.cancel();
    _adapterSub = null;
    _backendSub?.cancel();
    _backendSub = null;

    final handle = _handle;
    _handle = null;
    _currentSource = null;

    if (handle != null && !_handleController.isClosed) {
      _handleController.add(handle);
    }

    watchdogs.updateCapabilities(null);

    if (handle != null) {
      try {
        await kernel.release(handle.id);
      } catch (_) {
        // Best-effort release of an engine that may already be gone.
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Watchdogs and adapter events → recover tasks
  // ---------------------------------------------------------------------------

  void _wireWatchdogs() {
    watchdogs.onStall = (kind) {
      // A task already running owns the player: a sweep handles its own
      // failures, and pause/close supersede recovery. Only a stall with
      // the queue idle — normal playback — enqueues a recover task.
      if (!_playbackRequested || _disposed || _draining) {
        return;
      }

      MediaCoreLog.warning(
        LogCategory.recovery,
        'watchdog stall: ${kind.name}',
        fields: <String, Object?>{'line': _currentSource?.uri.toString(), 'backend': backendId},
      );

      // A stall is a failure like any other: reopen the playing line
      // first, then let the sweep decide. Queued behind whatever is in
      // flight; superseded by the next user action.
      _supersedeQueued('superseded by stall recovery');
      _sweepStart = _sourceIndex;

      unawaited(_enqueue(TaskType.recover, _runRecoverTask));
    };

    watchdogs.onRecoveryRequested = (action) {
      if (!_playbackRequested || _disposed) {
        watchdogs.reportRecoveryResult(false);
        return;
      }

      // reassertPlay is a command, not a recovery: it goes through the
      // handle directly so the watchdog gets its answer immediately.
      final handle = _handle;

      if (handle == null || handle.disposed) {
        watchdogs.reportRecoveryResult(false);
        return;
      }

      unawaited(
        handle.play().then((_) {
          watchdogs.reportRecoveryResult(true);
        }, onError: (Object _) {
          watchdogs.reportRecoveryResult(false);
        }),
      );
    };
  }

  Future<void> _runRecoverTask(TaskCancelToken token) {
    return _sweep(startAtCurrent: true);
  }

  void _onAdapterEvent(PlayerAdapterEvent event) {
    if (_disposed) {
      return;
    }

    switch (event) {
      case PlayerAdapterPlaying():
        _setState(_liveState(PlayerPlaybackState.playing));
        watchdogs.onPlayingChanged(true, fromUserIntent: false);

      case PlayerAdapterPaused():
        watchdogs.onPlayingChanged(false, fromUserIntent: !_playbackRequested);

        if (!_playbackRequested) {
          _setState(_liveState(PlayerPlaybackState.paused));
        }

      case PlayerAdapterBuffering(buffering: final buffering):
        _setState(_liveState(buffering ? PlayerPlaybackState.buffering : PlayerPlaybackState.playing));
        watchdogs.onBufferingChanged(buffering);

      case PlayerAdapterPositionChanged(position: final position):
        watchdogs.onPositionProgress(position);

      case PlayerAdapterVideoFrameProgress():
        watchdogs.onFrameProgress();

      case PlayerAdapterErrorEvent(message: final message):
        MediaCoreLog.warning(
          LogCategory.error,
          'adapter error: $message',
          fields: <String, Object?>{'backend': backendId, 'line': _currentSource?.uri.toString()},
        );

        // The queue is the serialization authority. A task already
        // running (a sweep, a pause, a close) owns this failure: the
        // sweep's catch advances to the next candidate, and pause/close
        // supersede recovery outright. Only an error with the queue idle
        // — normal playback — enqueues a recover task.
        if (_draining) {
          _sweepAdapterError = message;
        } else if (_playbackRequested) {
          _supersedeQueued('superseded by adapter error');
          _sweepStart = _sourceIndex;

          unawaited(_enqueue(TaskType.recover, _runRecoverTask));
        }

      case PlayerAdapterVideoSizeChanged():
      case PlayerAdapterStopped():
      case PlayerAdapterCompleted():
      case PlayerAdapterOpened():
      case PlayerAdapterDurationChanged():
      case PlayerAdapterVideoReconfigured():
      case PlayerAdapterHwdecChanged():
      case PlayerAdapterAudioReconfigured():
      case PlayerAdapterAudioDeviceChanged():
      case PlayerAdapterSubtitleChanged():
      case PlayerAdapterCacheChanged():
      case PlayerAdapterMetadataChanged():
      case PlayerAdapterPlaylistChanged():
      case PlayerAdapterClientMessage():
      case PlayerAdapterLogMessage():
      case PlayerAdapterVolumeChanged():
      case PlayerAdapterRateChanged():
        break;
    }
  }

  // ---------------------------------------------------------------------------
  // Task queue plumbing
  // ---------------------------------------------------------------------------

  /// Queues [action] as a task and starts draining.
  ///
  /// The action travels with its task: the drain handler dispatches by
  /// task id, so the order actions were enqueued in is the order they run
  /// in, regardless of which enqueue happened to start the drain.
  Future<void> _enqueue(TaskType type, Future<void> Function(TaskCancelToken token) action) {
    final pending = _PendingTask(action);
    final task = _tasks.createAndQueue(
      id: TaskId.generate(),
      type: type,
      playerId: _handle?.id,
      generationId: GenerationId.generate(),
    );

    _pending[task.id] = pending;

    unawaited(_drain());

    return pending.completer.future;
  }

  /// Runs queued tasks one at a time. Capacity is one; this loop is what
  /// turns the queue into the controller's serialization spine.
  Future<void> _drain() async {
    if (_draining) {
      return;
    }

    _draining = true;

    try {
      while (!_disposed && _tasks.hasQueuedTasks) {
        try {
          await _tasks.executeAvailable((task) async {
            final pending = _pending.remove(task.id);

            if (pending == null) {
              return null;
            }

            final token = _tasks.cancelToken(task.id);

            // The operation record lives on the handle (the anchor every
            // consumer holds). A task that creates the handle records from
            // the moment it exists; earlier there is simply nothing to
            // record on.
            _handle?.beginOperation(_operationTypeOf(task.type));

            try {
              if (token == null || !token.isCancelled) {
                await pending.action(token ?? TaskCancelToken());
              }

              pending.completer.complete();
              _handle?.completeOperation();
            } catch (error, stackTrace) {
              pending.completer.completeError(error, stackTrace);
              _handle?.failOperation();
              rethrow;
            }

            return null;
          });
        } catch (error) {
          // A task that threw after its own completer was already settled
          // (or a manager-level failure) ends here; the task record keeps
          // the failure for diagnostics.
          MediaCoreLog.debug(LogCategory.player, 'live task ended: $error');
        }
      }
    } finally {
      _draining = false;
    }
  }

  /// Cancels every queued (not yet started) task and releases its waiter.
  void _supersedeQueued(String reason) {
    final cancelled = _tasks.cancelQueuedTasks(reason);

    for (final task in cancelled) {
      _pending.remove(task.id)?.completer.complete();
    }
  }

  /// Task types and operation types describe the same actions; the record
  /// is written in the operation module's vocabulary.
  OperationType _operationTypeOf(TaskType type) {
    return switch (type) {
      TaskType.open => OperationType.open,
      TaskType.load => OperationType.load,
      TaskType.retry => OperationType.retry,
      TaskType.pause => OperationType.pause,
      TaskType.play => OperationType.play,
      TaskType.close => OperationType.close,
      TaskType.recover => OperationType.recover,
      TaskType.fallback => OperationType.fallback,
      _ => OperationType.load,
    };
  }

  bool _abandoned(int generation) {
    return _disposed || !_playbackRequested || generation != _playGeneration;
  }

  // ---------------------------------------------------------------------------
  // State mirroring
  // ---------------------------------------------------------------------------

  PlayerState _liveState(PlayerPlaybackState playback) {
    return PlayerState(lifecycle: PlayerLifecycleState.ready, playback: playback, hasSource: _sources.isNotEmpty);
  }

  void _setState(PlayerState next) {
    if (state == next) {
      return;
    }

    state = next;

    // Mirror into the handle's session — the one session this player has.
    // Consumers reading SessionSnapshot from the handle see the same
    // lifecycle the controller reports on [onStateChanged].
    _handle?.session.updateState(_toSessionState(next));

    if (!_stateController.isClosed) {
      _stateController.add(next);
    }
  }

  SessionState _toSessionState(PlayerState playerState) {
    return switch (playerState.playback) {
      PlayerPlaybackState.idle => const SessionState.idle(),
      PlayerPlaybackState.opening => const SessionState.opening(),
      PlayerPlaybackState.playing => const SessionState.playing(),
      PlayerPlaybackState.paused => const SessionState.paused(),
      PlayerPlaybackState.buffering => const SessionState.buffering(),
      PlayerPlaybackState.stopped || PlayerPlaybackState.stopping => const SessionState.stopped(),
      PlayerPlaybackState.completed => const SessionState.completed(),
      PlayerPlaybackState.error => const SessionState.error(),
      // Live streams do not seek; treat as an in-flight transition.
      PlayerPlaybackState.seeking => const SessionState.buffering(),
    };
  }
}

/// A queued action paired with the future of whoever awaited it.
final class _PendingTask {
  _PendingTask(this.action) : completer = Completer<void>();

  final Future<void> Function(TaskCancelToken token) action;
  final Completer<void> completer;
}
