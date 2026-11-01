import 'package:equatable/equatable.dart';

/// Base abstraction for state machine states.
///
/// A state represents a stable logical condition of a component.
///
/// StateMachine itself does not understand the meaning of a state.
/// Domain modules define concrete states by extending this class.
///
/// Responsibilities:
///
/// - provide stable state identity
/// - provide diagnostic information
/// - describe lifecycle limitations
///
/// Does not:
///
/// - execute transitions
/// - manage events
/// - store mutable runtime data
/// - perform side effects
abstract class StateMachineState extends Equatable {
  /// Creates a state machine state.
  const StateMachineState();

  /// Stable identifier of this state.
  ///
  /// Used internally for:
  ///
  /// - transition matching
  /// - diagnostics
  /// - logging
  String get id;

  /// Human readable state name.
  ///
  /// Defaults to [id].
  String get name => id;

  /// Whether this state is terminal.
  ///
  /// Terminal states normally cannot transition
  /// to another state.
  bool get isTerminal => false;

  /// Whether this state accepts incoming events.
  ///
  /// States may reject events when:
  ///
  /// - lifecycle has ended
  /// - component is shutting down
  /// - state is frozen
  bool get acceptsEvents => true;

  /// Optional diagnostic metadata.
  ///
  /// Domain states may override this
  /// to expose additional information.
  Map<String, Object?> get metadata => const {};

  @override
  List<Object?> get props => [id, metadata];

  @override
  String toString() {
    return '$runtimeType('
        'id=$id, '
        'name=$name'
        ')';
  }
}
