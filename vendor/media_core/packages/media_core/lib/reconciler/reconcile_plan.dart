import 'package:media_core/reconciler/reconcile_action.dart';
import 'package:equatable/equatable.dart';

/// Describes a set of actions required
/// to reach desired state.
final class ReconcilePlan extends Equatable {
  const ReconcilePlan({required this.actions});

  final List<ReconcileAction> actions;

  factory ReconcilePlan.empty() {
    return const ReconcilePlan(actions: []);
  }

  bool get isEmpty {
    return actions.isEmpty;
  }

  bool get isNotEmpty {
    return actions.isNotEmpty;
  }

  int get length {
    return actions.length;
  }

  ReconcileAction operator [](int index) {
    return actions[index];
  }

  @override
  List<Object?> get props => [actions];

  @override
  String toString() {
    return 'ReconcilePlan(actions: $actions)';
  }
}
