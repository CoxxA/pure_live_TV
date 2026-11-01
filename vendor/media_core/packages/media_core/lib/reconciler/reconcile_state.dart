import 'package:equatable/equatable.dart';

/// Runtime state of reconciliation process.
final class ReconcileState extends Equatable {
  const ReconcileState({this.running = false, this.completed = false, this.failed = false, this.pendingActions = 0});

  /// Whether reconciliation is running.
  final bool running;

  /// Whether reconciliation completed.
  final bool completed;

  /// Whether reconciliation failed.
  final bool failed;

  /// Number of pending actions.
  final int pendingActions;

  bool get isIdle {
    return !running && !completed && !failed && pendingActions == 0;
  }

  bool get isProcessing {
    return running;
  }

  bool get hasFailure {
    return failed;
  }

  ReconcileState copyWith({bool? running, bool? completed, bool? failed, int? pendingActions}) {
    return ReconcileState(
      running: running ?? this.running,
      completed: completed ?? this.completed,
      failed: failed ?? this.failed,
      pendingActions: pendingActions ?? this.pendingActions,
    );
  }

  ReconcileState start(int count) {
    return ReconcileState(running: true, completed: false, failed: false, pendingActions: count);
  }

  ReconcileState finish() {
    return ReconcileState(running: false, completed: true, failed: false, pendingActions: 0);
  }

  ReconcileState fail() {
    return ReconcileState(running: false, completed: false, failed: true, pendingActions: 0);
  }

  @override
  List<Object?> get props => [running, completed, failed, pendingActions];
}
