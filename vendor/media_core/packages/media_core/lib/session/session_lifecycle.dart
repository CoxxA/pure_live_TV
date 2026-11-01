import 'package:equatable/equatable.dart';

/// Represents lifecycle information of a player session.
///
/// [SessionLifecycle] describes the lifetime progression
/// of a session.
///
/// It does not:
///
/// - store playback state
/// - execute commands
/// - manage adapters
///
/// Those belong to:
///
/// - SessionState
/// - SessionController
/// - PlayerAdapter
final class SessionLifecycle extends Equatable {
  /// Creates lifecycle state.
  const SessionLifecycle({required this.phase});

  /// Creates initial lifecycle.
  const SessionLifecycle.created() : phase = SessionLifecyclePhase.created;

  /// Creates attached lifecycle.
  const SessionLifecycle.attached() : phase = SessionLifecyclePhase.attached;

  /// Creates opening lifecycle.
  const SessionLifecycle.opening() : phase = SessionLifecyclePhase.opening;

  /// Creates active lifecycle.
  const SessionLifecycle.active() : phase = SessionLifecyclePhase.active;

  /// Creates stopping lifecycle.
  const SessionLifecycle.stopping() : phase = SessionLifecyclePhase.stopping;

  /// Creates released lifecycle.
  const SessionLifecycle.released() : phase = SessionLifecyclePhase.released;

  /// Current lifecycle phase.
  final SessionLifecyclePhase phase;

  /// Whether session has been created.
  bool get created {
    return phase != SessionLifecyclePhase.released;
  }

  /// Whether session is attached.
  bool get attached {
    return phase == SessionLifecyclePhase.attached || active;
  }

  /// Whether session is running.
  bool get active {
    return phase == SessionLifecyclePhase.active;
  }

  /// Whether session has been released.
  bool get disposed {
    return phase == SessionLifecyclePhase.released;
  }

  /// Creates next lifecycle.
  SessionLifecycle transition(SessionLifecyclePhase next) {
    return SessionLifecycle(phase: next);
  }

  @override
  List<Object?> get props => [phase];

  @override
  String toString() {
    return 'SessionLifecycle($phase)';
  }
}

/// Lifecycle phases of a session.
enum SessionLifecyclePhase {
  /// Session object created.
  created,

  /// Session attached to player.
  attached,

  /// Opening media.
  opening,

  /// Session is running.
  active,

  /// Session stopping.
  stopping,

  /// Session released.
  released,
}
