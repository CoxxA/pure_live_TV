import 'dart:async';
import 'package:media_core/playback/playback_state.dart';
import 'package:media_core/playback/playback_command.dart';
import 'package:media_core/playback/playback_request.dart';
import 'package:media_core/playback/playback_snapshot.dart';
import 'package:rxdart/rxdart.dart';

/// Controls playback lifecycle.
///
/// Responsibilities:
///
/// - own playback state
/// - receive playback commands
/// - update playback state
/// - expose snapshots
/// - serialize playback operations
///
/// Does not:
///
/// - decode media
/// - control backend player
/// - call platform APIs
/// - render video
final class PlaybackController {
  PlaybackController({PlaybackState initialState = const PlaybackState.initial()})
    : _stateSubject = BehaviorSubject<PlaybackState>.seeded(initialState);

  final BehaviorSubject<PlaybackState> _stateSubject;

  bool _disposed = false;

  Future<void> _operation = Future<void>.value();

  /// Current state stream.
  ValueStream<PlaybackState> get state => _stateSubject.stream;

  /// Current state.
  PlaybackState get current => _stateSubject.value;

  /// Current snapshot.
  PlaybackSnapshot get snapshot => PlaybackSnapshot.fromState(current);

  /// Whether playing.
  bool get isPlaying => current.isPlaying;

  /// Whether paused.
  bool get isPaused => current.isPaused;

  /// Whether buffering.
  bool get isBuffering => current.isBuffering;

  /// Sends playback request.
  Future<void> request(PlaybackRequest request) {
    return _enqueue(() async {
      _ensureNotDisposed();

      apply(request.command);
    });
  }

  /// Applies playback command.
  void apply(PlaybackCommand command) {
    _ensureNotDisposed();

    final next = current.reduce(command);

    if (next != current) {
      _stateSubject.add(next);
    }
  }

  /// Play.
  Future<void> play() {
    return request(PlaybackRequest.play());
  }

  /// Pause.
  Future<void> pause() {
    return request(PlaybackRequest.pause());
  }

  /// Stop.
  Future<void> stop() {
    return request(PlaybackRequest.stop());
  }

  /// Seek.
  Future<void> seek(Duration position) {
    return request(PlaybackRequest.seek(position));
  }

  /// Update buffering state.
  void setBuffering(bool buffering) {
    apply(PlaybackCommand.buffering(buffering));
  }

  /// Update position.
  void updatePosition(Duration position) {
    apply(PlaybackCommand.position(position));
  }

  /// Update duration.
  void updateDuration(Duration duration) {
    apply(PlaybackCommand.duration(duration));
  }

  Future<void> _enqueue(Future<void> Function() action) {
    final next = _operation.then((_) => action());

    _operation = next.catchError((_) {});

    return next;
  }

  void _ensureNotDisposed() {
    if (_disposed) {
      throw StateError('PlaybackController has already been disposed.');
    }
  }

  /// Dispose.
  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;

    await _operation;

    await _stateSubject.close();
  }
}
