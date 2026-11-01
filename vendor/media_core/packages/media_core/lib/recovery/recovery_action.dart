import 'package:equatable/equatable.dart';

/// Describes an action that the recovery system may perform.
///
/// A recovery action is a decision value, not an execution request.
/// It describes what should happen after a playback or resource failure.
///
/// Execution belongs to the recovery manager or the corresponding
/// subsystem. This keeps recovery policy separate from side effects.
sealed class RecoveryAction extends Equatable {
  const RecoveryAction();

  /// Do nothing and leave the current operation unchanged.
  const factory RecoveryAction.none() = RecoveryActionNone;

  /// Retry the current operation.
  const factory RecoveryAction.retry() = RecoveryActionRetry;

  /// Retry after restarting the current operation.
  const factory RecoveryAction.restart() = RecoveryActionRestart;

  /// Reinitialize the affected subsystem before retrying.
  const factory RecoveryAction.reinitialize() = RecoveryActionReinitialize;

  /// Stop the current operation and give up recovery.
  const factory RecoveryAction.stop() = RecoveryActionStop;

  bool get isNone => this is RecoveryActionNone;

  bool get isRetry => this is RecoveryActionRetry;

  bool get isRestart => this is RecoveryActionRestart;

  bool get isReinitialize => this is RecoveryActionReinitialize;

  bool get isStop => this is RecoveryActionStop;

  /// Whether this action requires another attempt.
  bool get requiresRetry => isRetry || isRestart || isReinitialize;

  /// Whether this action terminates recovery.
  bool get isTerminal => isNone || isStop;

  @override
  List<Object?> get props => [];
}

/// No recovery action.
final class RecoveryActionNone extends RecoveryAction {
  const RecoveryActionNone();

  @override
  String toString() => 'RecoveryActionNone';
}

/// Retry the current operation.
final class RecoveryActionRetry extends RecoveryAction {
  const RecoveryActionRetry();

  @override
  String toString() => 'RecoveryActionRetry';
}

/// Restart the current operation before retrying.
final class RecoveryActionRestart extends RecoveryAction {
  const RecoveryActionRestart();

  @override
  String toString() => 'RecoveryActionRestart';
}

/// Reinitialize the affected subsystem before retrying.
final class RecoveryActionReinitialize extends RecoveryAction {
  const RecoveryActionReinitialize();

  @override
  String toString() => 'RecoveryActionReinitialize';
}

/// Stop recovery and terminate the affected operation.
final class RecoveryActionStop extends RecoveryAction {
  const RecoveryActionStop();

  @override
  String toString() => 'RecoveryActionStop';
}
