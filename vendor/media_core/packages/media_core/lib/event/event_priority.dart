import 'package:equatable/equatable.dart';

/// Priority used by the event dispatcher.
///
/// Higher priority events are dispatched before lower priority events when
/// they are queued in the same dispatch cycle.
enum EventPriority { low, normal, high, critical }

/// Immutable priority value with ordering helpers.
final class EventPriorityValue extends Equatable {
  const EventPriorityValue(this.value);

  final EventPriority value;

  int get weight {
    switch (value) {
      case EventPriority.low:
        return 0;
      case EventPriority.normal:
        return 1;
      case EventPriority.high:
        return 2;
      case EventPriority.critical:
        return 3;
    }
  }

  bool operator <(EventPriorityValue other) {
    return weight < other.weight;
  }

  bool operator >(EventPriorityValue other) {
    return weight > other.weight;
  }

  bool operator <=(EventPriorityValue other) {
    return weight <= other.weight;
  }

  bool operator >=(EventPriorityValue other) {
    return weight >= other.weight;
  }

  @override
  List<Object?> get props => <Object?>[value];

  @override
  String toString() => 'EventPriorityValue($value)';
}
