import 'dart:async';
import 'package:media_core/reconciler/reconcile_plan.dart';
import 'package:media_core/reconciler/reconcile_queue.dart';
import 'package:media_core/reconciler/reconcile_state.dart';
import 'package:rxdart/rxdart.dart';

/// Schedules reconciliation plans.
///
/// [ReconcileScheduler] only manages execution order.
/// It does not execute reconciliation actions.
///
/// Responsibilities:
///
/// - queue reconciliation plans
/// - provide plans in execution order
/// - track scheduler state
/// - track pending plan count
/// - report reconciliation progress
///
/// It does not:
///
/// - execute reconciliation actions
/// - modify player state
/// - manage sessions
/// - coordinate platform resources
///
/// Those responsibilities belong to:
///
/// - Coordinator
/// - Controller
/// - SessionManager
final class ReconcileScheduler {
  /// Creates a reconcile scheduler.
  ReconcileScheduler();

  final ReconcileQueue _queue = ReconcileQueue();

  final BehaviorSubject<ReconcileState> _stateSubject = BehaviorSubject<ReconcileState>.seeded(const ReconcileState());

  /// Current scheduler state stream.
  ///
  /// This is a hot, replaying stream whose latest value is available to
  /// subscribers.
  Stream<ReconcileState> get state {
    return _stateSubject.stream;
  }

  /// Current scheduler state.
  ReconcileState get currentState {
    return _stateSubject.value;
  }

  /// Number of queued reconciliation plans.
  int get length {
    return _queue.length;
  }

  /// Whether the scheduler has pending plans.
  bool get hasPending {
    return _queue.isNotEmpty;
  }

  /// Adds a reconciliation plan to the queue.
  ///
  /// Empty plans are ignored because they contain no work to schedule.
  void schedule(ReconcilePlan plan) {
    if (plan.isEmpty) {
      return;
    }

    _queue.add(plan);

    _update(currentState.copyWith(pendingActions: _queue.length));
  }

  /// Takes the next reconciliation plan from the queue.
  ///
  /// Returns `null` when there are no pending plans.
  ReconcilePlan? next() {
    final plan = _queue.poll();

    _update(currentState.copyWith(pendingActions: _queue.length));

    return plan;
  }

  /// Marks reconciliation as started.
  ///
  /// [plan] provides the number of actions being processed.
  void start(ReconcilePlan plan) {
    _update(currentState.start(plan.length));
  }

  /// Marks the current reconciliation as completed.
  void complete() {
    _update(currentState.finish());
  }

  /// Marks the current reconciliation as failed.
  void fail() {
    _update(currentState.fail());
  }

  /// Clears all pending reconciliation plans.
  void clear() {
    _queue.clear();

    _update(const ReconcileState());
  }

  /// Updates the scheduler state.
  void _update(ReconcileState value) {
    if (_stateSubject.isClosed) {
      return;
    }

    _stateSubject.add(value);
  }

  /// Releases scheduler resources.
  ///
  /// The scheduler owns the reconciliation queue and its state stream, so
  /// those resources are released during disposal.
  Future<void> dispose() async {
    _queue.clear();

    await _stateSubject.close();
  }
}
