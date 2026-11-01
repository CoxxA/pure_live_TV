import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';

/// Visibility event types.
enum VisibilityEventType { appeared, disappeared, visible, hidden, changed }

/// Visibility event.
final class VisibilityEvent extends Equatable {
  const VisibilityEvent({required this.type, required this.visibility, this.timestamp});

  final VisibilityEventType type;

  /// Value from 0.0 to 1.0.
  final double visibility;

  final DateTime? timestamp;

  factory VisibilityEvent.now(VisibilityEventType type, double visibility) {
    return VisibilityEvent(type: type, visibility: visibility, timestamp: clock.now());
  }

  @override
  List<Object?> get props => [type, visibility, timestamp];
}
