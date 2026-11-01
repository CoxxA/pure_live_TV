import 'package:media_core/reconciler/reconcile_plan.dart';
import 'package:equatable/equatable.dart';

enum ReconcileResultType { noop, pending, completed, failed }

final class ReconcileResult extends Equatable {
  const ReconcileResult._({required this.type, this.plan, this.error});

  factory ReconcileResult.noop() {
    return const ReconcileResult._(type: ReconcileResultType.noop);
  }

  factory ReconcileResult.pending(ReconcilePlan plan) {
    return ReconcileResult._(type: ReconcileResultType.pending, plan: plan);
  }

  factory ReconcileResult.completed() {
    return const ReconcileResult._(type: ReconcileResultType.completed);
  }

  factory ReconcileResult.failed(Object error) {
    return ReconcileResult._(type: ReconcileResultType.failed, error: error);
  }

  final ReconcileResultType type;

  final ReconcilePlan? plan;

  final Object? error;

  bool get isNoop => type == ReconcileResultType.noop;

  bool get isPending => type == ReconcileResultType.pending;

  bool get isCompleted => type == ReconcileResultType.completed;

  bool get isFailed => type == ReconcileResultType.failed;

  @override
  List<Object?> get props => [type, plan, error];
}
