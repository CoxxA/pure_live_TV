import 'package:media_core/reconciler/reconcile_plan.dart';

/// Queue of reconcile plans.
final class ReconcileQueue {
  final List<ReconcilePlan> _queue = [];

  bool get isEmpty => _queue.isEmpty;

  bool get isNotEmpty => _queue.isNotEmpty;

  int get length => _queue.length;

  void add(ReconcilePlan plan) {
    if (plan.isEmpty) {
      return;
    }

    _queue.add(plan);
  }

  ReconcilePlan? poll() {
    if (_queue.isEmpty) {
      return null;
    }

    return _queue.removeAt(0);
  }

  void clear() {
    _queue.clear();
  }
}
