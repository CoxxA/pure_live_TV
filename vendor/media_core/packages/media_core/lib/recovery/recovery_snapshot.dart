import 'package:media_core/recovery/recovery_state.dart';
import 'package:media_core/recovery/recovery_action.dart';
import 'package:media_core/recovery/recovery_context.dart';
import 'package:equatable/equatable.dart';

/// Immutable snapshot of the complete recovery state.
///
/// A snapshot combines the state machine state with the context that caused
/// the recovery.
///
/// Snapshots are suitable for:
///
/// - diagnostics
/// - logging
/// - state observation
/// - persistence
/// - debugging
///
/// A snapshot does not execute recovery.
final class RecoverySnapshot extends Equatable {
  const RecoverySnapshot({required this.state, required this.context});

  final RecoveryState state;
  final RecoveryContext? context;

  RecoveryAction get action => state.action;

  int get attempt => state.attempt;

  bool get active => state.active;

  bool get completed => state.completed;

  bool get exhausted => state.exhausted;

  bool get hasContext => context != null;

  bool get isIdle => state.isIdle;

  bool get isTerminal => state.isTerminal;

  factory RecoverySnapshot.fromState(RecoveryState state, {RecoveryContext? context}) {
    return RecoverySnapshot(state: state, context: context);
  }

  RecoverySnapshot copyWith({RecoveryState? state, RecoveryContext? context}) {
    return RecoverySnapshot(state: state ?? this.state, context: context ?? this.context);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'state': state.toMap(), 'context': context?.toMap()};
  }

  @override
  List<Object?> get props => <Object?>[state, context];

  @override
  String toString() {
    return 'RecoverySnapshot('
        'state: $state, '
        'context: $context'
        ')';
  }
}
