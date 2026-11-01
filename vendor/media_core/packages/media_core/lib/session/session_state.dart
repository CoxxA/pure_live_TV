import 'package:equatable/equatable.dart';

/// Represents the lifecycle state of a player session.
///
/// A session state describes where a playback session
/// currently is during its lifetime.
///
/// It does not:
///
/// - execute commands
/// - manage backend state
/// - store playback position
///
/// Those belong to:
///
/// - PlayerSession
/// - PlayerAdapter
/// - PlaybackState
final class SessionState extends Equatable {
  /// Creates a session state.
  const SessionState(this.status);

  /// Creates idle state.
  const SessionState.idle() : this(SessionStatus.idle);

  /// Creates opening state.
  const SessionState.opening() : this(SessionStatus.opening);

  /// Creates ready state.
  const SessionState.ready() : this(SessionStatus.ready);

  /// Creates playing state.
  const SessionState.playing() : this(SessionStatus.playing);

  /// Creates paused state.
  const SessionState.paused() : this(SessionStatus.paused);

  /// Creates buffering state.
  const SessionState.buffering() : this(SessionStatus.buffering);

  /// Creates stopped state.
  const SessionState.stopped() : this(SessionStatus.stopped);

  /// Creates completed state.
  const SessionState.completed() : this(SessionStatus.completed);

  /// Creates error state.
  const SessionState.error() : this(SessionStatus.error);

  /// Creates disposed state.
  const SessionState.disposed() : this(SessionStatus.disposed);

  /// Current session lifecycle status.
  final SessionStatus status;

  /// Whether session is active.
  ///
  /// Active sessions can continue lifecycle transitions.
  bool get active {
    return status != SessionStatus.disposed && status != SessionStatus.idle;
  }

  /// Whether session can accept playback commands.
  bool get playable {
    switch (status) {
      case SessionStatus.ready:
      case SessionStatus.playing:
      case SessionStatus.paused:
      case SessionStatus.buffering:
        return true;

      case SessionStatus.idle:
      case SessionStatus.opening:
      case SessionStatus.stopped:
      case SessionStatus.completed:
      case SessionStatus.error:
      case SessionStatus.disposed:
        return false;
    }
  }

  /// Whether session reached a terminal state.
  bool get finished {
    switch (status) {
      case SessionStatus.stopped:
      case SessionStatus.completed:
      case SessionStatus.disposed:
        return true;

      case SessionStatus.idle:
      case SessionStatus.opening:
      case SessionStatus.ready:
      case SessionStatus.playing:
      case SessionStatus.paused:
      case SessionStatus.buffering:
      case SessionStatus.error:
        return false;
    }
  }

  /// Whether session is currently loading.
  bool get loading {
    return status == SessionStatus.opening || status == SessionStatus.buffering;
  }

  /// Whether session failed.
  bool get hasError {
    return status == SessionStatus.error;
  }

  /// Creates a new state with another status.
  SessionState copyWith(SessionStatus status) {
    return SessionState(status);
  }

  @override
  List<Object?> get props => [status];

  @override
  String toString() {
    return 'SessionState($status)';
  }
}

/// Session lifecycle status.
enum SessionStatus {
  /// No source attached.
  idle,

  /// Opening source.
  opening,

  /// Source is ready.
  ready,

  /// Playing.
  playing,

  /// Temporarily paused.
  paused,

  /// Waiting for buffer.
  buffering,

  /// Stopped manually.
  stopped,

  /// Playback completed.
  completed,

  /// Session failed.
  error,

  /// Session released.
  disposed,
}
