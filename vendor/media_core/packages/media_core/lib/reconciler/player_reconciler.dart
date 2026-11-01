import 'package:media_core/reconciler/reconcile_plan.dart';
import 'package:media_core/reconciler/reconcile_action.dart';
import 'package:media_core/reconciler/reconcile_result.dart';
import 'package:media_core/reconciler/reconcile_context.dart';
import 'package:media_core/core/player_state.dart';
import 'package:media_core/core/player_status.dart';

/// Reconciles desired player state with current player state.
///
/// The reconciler compares semantic core state and produces a plan of
/// semantic actions. It does not execute player operations.
final class PlayerReconciler {
  const PlayerReconciler();

  ReconcilePlan reconcile({required PlayerState current, required PlayerState desired, ReconcileContext? context}) {
    final actions = <ReconcileAction>[];

    if (current == desired) {
      return ReconcilePlan.empty();
    }

    final currentStatus = _resolveStatus(current);
    final desiredStatus = _resolveStatus(desired);

    if (currentStatus != desiredStatus) {
      actions.add(ReconcileAction.changeState(from: currentStatus, to: desiredStatus));
    }

    return ReconcilePlan(actions: actions);
  }

  bool needsReconcile({required PlayerState current, required PlayerState desired}) {
    return current != desired;
  }

  ReconcileResult evaluate(ReconcilePlan plan) {
    if (plan.isEmpty) {
      return ReconcileResult.noop();
    }

    return ReconcileResult.pending(plan);
  }

  PlayerStatus _resolveStatus(PlayerState state) {
    if (state.disposed) {
      return PlayerStatus.disposed;
    }

    if (state.disposing) {
      return PlayerStatus.disposing;
    }

    if (state.opening) {
      return PlayerStatus.opening;
    }

    if (state.buffering) {
      return PlayerStatus.buffering;
    }

    if (state.seeking) {
      return PlayerStatus.seeking;
    }

    if (state.playing) {
      return PlayerStatus.playing;
    }

    if (state.paused) {
      return PlayerStatus.paused;
    }

    if (state.stopping) {
      return PlayerStatus.stopping;
    }

    if (state.completed) {
      return PlayerStatus.completed;
    }

    if (state.stopped) {
      return PlayerStatus.stopped;
    }

    if (state.playback == PlayerPlaybackState.error) {
      return PlayerStatus.error;
    }

    if (state.ready) {
      return PlayerStatus.ready;
    }

    return PlayerStatus.idle;
  }
}
