import 'dart:async';
import 'dart:typed_data';

import 'package:media_core/core/player_state.dart';
import 'package:media_core/source/player_source.dart';
import 'package:media_core/adapter/player_adapter.dart';
import 'package:media_core/screenshot/screenshot_request.dart';
import 'package:media_core/adapter/player_adapter_event.dart';
import 'package:media_core/adapter/player_adapter_context.dart';
import 'package:media_core/adapter/player_adapter_metrics.dart';
import 'package:media_core/adapter/player_adapter_capabilities.dart';

/// Sentinel used by [PlayerAdapterStateMirror.copyWith] to distinguish
/// "parameter omitted" from "parameter explicitly set to null".
///
/// Without it, `copyWith(duration: null)` would fall back to the current
/// value because `null ?? this.duration` returns the old field, which
/// makes clearing a nullable field impossible.
const Object _unset = Object();

/// A scriptable [PlayerAdapter] used in tests.
///
/// [FakePlayerAdapter] records every call and simulates
/// state transitions without a real playback backend.
///
/// Failures can be injected through the [behavior] field to
/// test error paths of higher layers.
final class FakePlayerAdapter implements PlayerAdapter {
  /// Creates a fake adapter.
  FakePlayerAdapter({this.behavior = const FakePlayerAdapterBehavior(), String id = 'fake'}) : _id = id;

  /// Controls how the fake responds to calls.
  FakePlayerAdapterBehavior behavior;

  final String _id;

  final StreamController<PlayerAdapterEvent> _eventController = StreamController<PlayerAdapterEvent>.broadcast();

  /// Calls in invocation order.
  final List<String> calls = <String>[];

  /// Sources passed to [open].
  final List<PlayerSource> openedSources = <PlayerSource>[];

  /// Volumes passed to [setVolume].
  final List<double> volumes = <double>[];

  /// Rates passed to [setRate].
  final List<double> rates = <double>[];

  /// Audio-only values passed to [setAudioOnly].
  final List<bool> audioOnlyValues = <bool>[];

  /// Capture requests received by [captureFrame].
  final List<ScreenshotRequest> screenshotRequests = <ScreenshotRequest>[];

  /// Positions passed to [seek].
  final List<Duration> seeks = <Duration>[];

  bool _initialized = false;
  PlayerSource? _currentSource;
  PlayerAdapterStateMirror _mirror = PlayerAdapterStateMirror.initial();
  int _generation = 0;

  @override
  String get id => _id;

  @override
  PlayerAdapterCapabilities get capabilities => behavior.capabilities;

  @override
  PlayerState get state => _mirror.toPlayerState();

  @override
  PlayerAdapterMetrics get metrics => behavior.metrics;

  @override
  Stream<PlayerAdapterEvent> get events => _eventController.stream;

  @override
  bool get initialized => _initialized;

  /// Current source mirror exposed for assertions.
  PlayerSource? get currentSource => _currentSource;

  /// Whether [dispose] was called.
  bool get disposed => calls.contains('dispose');

  /// Number of emitted events.
  int get eventCount => _generation;

  // ---------------------------------------------------------------------------
  // PlayerAdapter contract
  // ---------------------------------------------------------------------------

  @override
  Future<void> initialize(PlayerAdapterContext context) async {
    calls.add('initialize');
    behavior.maybeFail('initialize');

    if (behavior.applyInitialConfig) {
      _mirror = _mirror.copyWith(volume: context.config.volume, rate: context.config.playbackRate);
    }

    _initialized = true;
    _mirror = _mirror.copyWith(initialized: true);
  }

  @override
  Future<void> open(PlayerSource source) async {
    calls.add('open');
    behavior.maybeFail('open');
    openedSources.add(source);
    _currentSource = source;
    _mirror = _mirror.copyWith(
      opened: true,
      completed: false,
      errorMessage: null,
      hasError: false,
      duration: behavior.openDuration,
      width: behavior.openWidth,
      height: behavior.openHeight,
    );

    _emit(PlayerAdapterEvent.opened(source: source.id.value));
    _emit(PlayerAdapterEvent.durationChanged(duration: behavior.openDuration));

    if (behavior.openWidth != null && behavior.openHeight != null) {
      _emit(PlayerAdapterEvent.videoSizeChanged(width: behavior.openWidth!, height: behavior.openHeight!));
    }
  }

  @override
  Future<void> play() async {
    calls.add('play');
    behavior.maybeFail('play');
    _mirror = _mirror.copyWith(playing: true, paused: false);
    _emit(const PlayerAdapterEvent.playing());
  }

  @override
  Future<void> pause() async {
    calls.add('pause');
    behavior.maybeFail('pause');
    _mirror = _mirror.copyWith(playing: false, paused: true);
    _emit(const PlayerAdapterEvent.paused());
  }

  @override
  Future<void> stop() async {
    calls.add('stop');
    behavior.maybeFail('stop');
    _mirror = _mirror.copyWith(playing: false, paused: false, completed: false, position: Duration.zero);
    _emit(const PlayerAdapterEvent.stopped());
  }

  @override
  Future<void> seek(Duration position) async {
    calls.add('seek');
    behavior.maybeFail('seek');
    seeks.add(position);
    _mirror = _mirror.copyWith(position: position);
    _emit(PlayerAdapterEvent.positionChanged(position: position));
  }

  @override
  Future<void> setVolume(double volume) async {
    calls.add('setVolume');
    behavior.maybeFail('setVolume');
    volumes.add(volume);
    _mirror = _mirror.copyWith(volume: volume.clamp(0.0, 1.0));
    _emit(PlayerAdapterEvent.volumeChanged(volume: _mirror.volume));
  }

  @override
  Future<void> setRate(double rate) async {
    calls.add('setRate');
    behavior.maybeFail('setRate');
    rates.add(rate);
    _mirror = _mirror.copyWith(rate: rate);
    _emit(PlayerAdapterEvent.rateChanged(rate: rate));
  }

  @override
  Future<void> setAudioOnly(bool audioOnly) async {
    calls.add('setAudioOnly');
    behavior.maybeFail('setAudioOnly');
    audioOnlyValues.add(audioOnly);
    _mirror = _mirror.copyWith(audioOnly: audioOnly);
  }

  @override
  Future<Uint8List?> captureFrame(ScreenshotRequest request) async {
    calls.add('captureFrame');
    behavior.maybeFail('captureFrame');

    if (!behavior.capabilities.supportsScreenshot) {
      return null;
    }

    screenshotRequests.add(request);

    return behavior.screenshotBytes;
  }

  @override
  Future<void> close() async {
    calls.add('close');
    behavior.maybeFail('close');
    _currentSource = null;
    _mirror = PlayerAdapterStateMirror.initial().copyWith(
      initialized: _initialized,
      volume: _mirror.volume,
      rate: _mirror.rate,
    );
    _emit(const PlayerAdapterEvent.stopped());
  }

  @override
  Future<void> dispose() async {
    calls.add('dispose');
    _initialized = false;
    _currentSource = null;
    _mirror = _mirror.copyWith(initialized: false, opened: false, playing: false);
    await _eventController.close();
  }

  // ---------------------------------------------------------------------------
  // Manual emit helpers
  //
  // These drive the downstream consumers directly, without going through
  // the command methods above. The two runtime bindings subscribe to the
  // same broadcast stream as higher layers, so a fake that emits
  // `videoSizeChanged` reaches `PlayerGeometryBinding`, and a fake that
  // emits `playing` reaches `PlayerPlaybackBinding`, exactly like a real
  // adapter would.
  // ---------------------------------------------------------------------------

  /// Emits a playing event without invoking [play].
  ///
  /// Used to simulate a backend transition the application did not
  /// initiate, such as a resume triggered by the platform.
  void emitPlaying() {
    _mirror = _mirror.copyWith(playing: true, paused: false);
    _emit(const PlayerAdapterEvent.playing());
  }

  /// Emits a paused event without invoking [pause].
  void emitPaused() {
    _mirror = _mirror.copyWith(playing: false, paused: true);
    _emit(const PlayerAdapterEvent.paused());
  }

  /// Emits a stopped event without invoking [stop].
  void emitStopped() {
    _mirror = _mirror.copyWith(playing: false, paused: false, completed: false, position: Duration.zero);
    _emit(const PlayerAdapterEvent.stopped());
  }

  /// Emits a buffering event.
  void emitBuffering({required bool buffering, double? progress}) {
    _mirror = _mirror.copyWith(buffering: buffering);
    _emit(PlayerAdapterEvent.buffering(buffering: buffering, progress: progress));
  }

  /// Emits a completion event.
  void emitCompleted() {
    _mirror = _mirror.copyWith(completed: true, playing: false);
    _emit(const PlayerAdapterEvent.completed());
  }

  /// Emits a decoded-video-frame heartbeat.
  ///
  /// Feeds the live frame watchdog exactly like a real adapter's
  /// frame-progress signal, which is why the fake declares
  /// [PlayerAdapterCapabilities.supportsVideoFrameProgress].
  void emitVideoFrameProgress() {
    _emit(const PlayerAdapterEvent.videoFrameProgress());
  }

  /// Emits a video size change without reopening the source.
  ///
  /// Feeds `PlayerGeometryBinding` directly; the controller recomputes
  /// aspect ratio and effective orientation from the new dimensions.
  void emitVideoSizeChanged({required int width, required int height}) {
    if (width <= 0 || height <= 0) return;
    _mirror = _mirror.copyWith(width: width, height: height);
    _emit(PlayerAdapterEvent.videoSizeChanged(width: width, height: height));
  }

  /// Emits a video-reconfigured event.
  ///
  /// No payload; `PlayerGeometryBinding` treats it as an invalidation
  /// hint and defers to the next `videoSizeChanged`.
  void emitVideoReconfigured() {
    _emit(const PlayerAdapterEvent.videoReconfigured());
  }

  /// Emits a volume change without invoking [setVolume].
  void emitVolumeChanged(double volume) {
    final clamped = volume.clamp(0.0, 1.0);
    _mirror = _mirror.copyWith(volume: clamped);
    _emit(PlayerAdapterEvent.volumeChanged(volume: clamped));
  }

  /// Emits a rate change without invoking [setRate].
  void emitRateChanged(double rate) {
    _mirror = _mirror.copyWith(rate: rate);
    _emit(PlayerAdapterEvent.rateChanged(rate: rate));
  }

  /// Emits an error event and marks the mirror as failed.
  void emitError(String message, {Object? error, StackTrace? stackTrace}) {
    _mirror = _mirror.copyWith(hasError: true, errorMessage: message, playing: false);
    _emit(PlayerAdapterEvent.error(message: message, error: error, stackTrace: stackTrace));
  }

  /// Updates the reported position.
  void updatePosition(Duration position) {
    _mirror = _mirror.copyWith(position: position);
    _emit(PlayerAdapterEvent.positionChanged(position: position));
  }

  /// Updates the reported duration.
  void updateDuration(Duration duration) {
    _mirror = _mirror.copyWith(duration: duration);
    _emit(PlayerAdapterEvent.durationChanged(duration: duration));
  }

  void _emit(PlayerAdapterEvent event) {
    _generation++;
    if (!_eventController.isClosed) {
      _eventController.add(event);
    }
  }

  @override
  Duration get position => _mirror.position;

  @override
  Duration? get duration => _mirror.duration;
}

/// Mutable mirror of adapter runtime state used by [FakePlayerAdapter].
final class PlayerAdapterStateMirror {
  const PlayerAdapterStateMirror({
    this.initialized = false,
    this.opened = false,
    this.playing = false,
    this.paused = false,
    this.buffering = false,
    this.completed = false,
    this.hasError = false,
    this.position = Duration.zero,
    this.duration,
    this.volume = 1.0,
    this.rate = 1.0,
    this.width,
    this.height,
    this.audioOnly = false,
    this.errorMessage,
  });

  const PlayerAdapterStateMirror.initial() : this();

  final bool initialized;
  final bool opened;
  final bool playing;
  final bool paused;
  final bool buffering;
  final bool completed;
  final bool hasError;
  final Duration position;
  final Duration? duration;
  final double volume;
  final double rate;
  final int? width;
  final int? height;

  /// Whether playback is restricted to the audio track.
  final bool audioOnly;
  final String? errorMessage;

  /// Maps the mirror onto the semantic core [PlayerState].
  PlayerState toPlayerState() {
    if (!initialized) {
      return PlayerState.idle;
    }

    final PlayerPlaybackState playback;
    if (hasError) {
      playback = PlayerPlaybackState.error;
    } else if (completed) {
      playback = PlayerPlaybackState.completed;
    } else if (buffering) {
      playback = PlayerPlaybackState.buffering;
    } else if (playing) {
      playback = PlayerPlaybackState.playing;
    } else if (paused) {
      playback = PlayerPlaybackState.paused;
    } else {
      playback = PlayerPlaybackState.stopped;
    }

    return PlayerState(
      lifecycle: PlayerLifecycleState.ready,
      playback: playback,
      hasSource: opened,
      audioEnabled: true,
      videoEnabled: width != null && height != null,
    );
  }

  /// Creates a copy with selected fields replaced.
  ///
  /// Nullable fields use [_unset] so that passing `null` explicitly
  /// clears the field, while omitting the parameter keeps the current
  /// value. Without this, `copyWith(duration: null)` would silently
  /// keep the previous duration.
  PlayerAdapterStateMirror copyWith({
    bool? initialized,
    bool? opened,
    bool? playing,
    bool? paused,
    bool? buffering,
    bool? completed,
    bool? hasError,
    Duration? position,
    Object? duration = _unset,
    double? volume,
    double? rate,
    Object? width = _unset,
    Object? height = _unset,
    bool? audioOnly,
    Object? errorMessage = _unset,
  }) {
    return PlayerAdapterStateMirror(
      initialized: initialized ?? this.initialized,
      opened: opened ?? this.opened,
      playing: playing ?? this.playing,
      paused: paused ?? this.paused,
      buffering: buffering ?? this.buffering,
      completed: completed ?? this.completed,
      hasError: hasError ?? this.hasError,
      position: position ?? this.position,
      duration: identical(duration, _unset) ? this.duration : duration as Duration?,
      volume: volume ?? this.volume,
      rate: rate ?? this.rate,
      width: identical(width, _unset) ? this.width : width as int?,
      height: identical(height, _unset) ? this.height : height as int?,
      audioOnly: audioOnly ?? this.audioOnly,
      errorMessage: identical(errorMessage, _unset) ? this.errorMessage : errorMessage as String?,
    );
  }
}

/// Failure injection and response data for [FakePlayerAdapter].
final class FakePlayerAdapterBehavior {
  /// Creates behavior.
  const FakePlayerAdapterBehavior({
    this.failOn = const {},
    this.capabilities = defaultCapabilities,
    this.metrics = const PlayerAdapterMetrics(),
    this.openDuration = const Duration(minutes: 3),
    this.openWidth,
    this.openHeight,
    this.applyInitialConfig = true,
    this.failureError,
    this.screenshotBytes,
  });

  /// Default capabilities advertised by the fake.
  static const PlayerAdapterCapabilities defaultCapabilities = PlayerAdapterCapabilities(
    // Core playback.
    supportsLive: true,
    supportsSeek: true,
    supportsPause: true,
    supportsStop: true,
    supportsRateControl: true,
    supportsVolumeControl: true,
    supportsMuteControl: false,
    supportsAudioOnly: true,

    // Video and rendering.
    supportsVideoFrameProgress: true,
    supportsVideoSizeChanged: true,
    supportsVideoReconfig: false,
    supportsHwdecInfo: false,
    supportsVideoFilters: false,
    supportsScreenshot: false,

    // Audio.
    supportsAudioReconfig: false,
    supportsAudioDeviceSelection: false,
    supportsAudioFilters: false,

    // Tracks and subtitles.
    supportsTrackSelection: false,
    supportsSubtitleTrack: false,
    supportsExternalSubtitle: false,

    // Playback state and buffering.
    supportsCacheState: false,
    supportsBufferingProgress: false,
    supportsChapterControl: false,
    supportsLoop: false,

    // Metadata and playlist.
    supportsMetadata: false,
    supportsPlaylist: false,
    supportsPlaylistControl: false,

    // Diagnostics and integration.
    supportsClientMessage: false,
    supportsLogMessages: false,

    // Decoders.
    supportsHardwareDecoder: true,
    supportsSoftwareDecoder: true,

    // Presentation.
    supportsPictureInPicture: false,
    supportsFullscreen: true,

    // Source matching.
    supportedProtocols: {'http', 'https', 'hls', 'dash', 'rtmp', 'rtsp', 'udp', 'file', 'asset'},
    supportedFormats: {
      'mp4',
      'mkv',
      'webm',
      'flv',
      'm3u8',
      'mpd',
      'mov',
      'avi',
      'ts',
      'mp3',
      'aac',
      'flac',
      'h265',
      'hevc',
    },
  );

  /// Method names that should throw when invoked.
  ///
  /// Example: `{'open', 'play'}`
  final Set<String> failOn;

  /// Capabilities reported by the adapter.
  final PlayerAdapterCapabilities capabilities;

  /// Metrics reported by the adapter.
  final PlayerAdapterMetrics metrics;

  /// Duration reported after [FakePlayerAdapter.open].
  final Duration openDuration;

  /// Video width reported after open.
  final int? openWidth;

  /// Video height reported after open.
  final int? openHeight;

  /// Whether [initialize] applies context config volume/rate.
  final bool applyInitialConfig;

  /// Error object thrown on failing methods.
  final Object? failureError;

  /// Bytes [FakePlayerAdapter.captureFrame] returns.
  ///
  /// Null (the default) means the fake cannot capture, which is what makes the
  /// caller fall back to capturing the rendered surface. Set it together with
  /// `capabilities.supportsScreenshot: true` to exercise the engine route, and
  /// leave it null to exercise the fallback.
  final Uint8List? screenshotBytes;

  /// Throws when [method] is configured to fail.
  void maybeFail(String method) {
    if (failOn.contains(method)) {
      throw failureError ?? StateError('FakePlayerAdapter failure on $method');
    }
  }

  /// Returns a copy failing on [methods].
  FakePlayerAdapterBehavior failingOn(Set<String> methods, {Object? error}) {
    return FakePlayerAdapterBehavior(
      failOn: methods,
      capabilities: capabilities,
      metrics: metrics,
      openDuration: openDuration,
      openWidth: openWidth,
      openHeight: openHeight,
      applyInitialConfig: applyInitialConfig,
      failureError: error ?? failureError,
    );
  }
}

/// Builds a configured [FakePlayerAdapter] for tests.
final class FakePlayerAdapterFactory {
  /// Creates the factory.
  FakePlayerAdapterFactory({this.behavior, this.prefix = 'fake'});

  /// Behavior applied to created adapters.
  final FakePlayerAdapterBehavior? behavior;

  /// Adapter id prefix.
  final String prefix;

  int _counter = 0;

  /// Creates a new fake adapter.
  FakePlayerAdapter create() {
    _counter++;
    return FakePlayerAdapter(id: '$prefix-$_counter', behavior: behavior ?? const FakePlayerAdapterBehavior());
  }
}
