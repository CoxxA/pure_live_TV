import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';

/// Lifecycle events.
enum LifecycleEventType { created, initialized, activated, paused, resumed, inactive, detached, disposing, disposed }

/// Lifecycle event.
final class LifecycleEvent extends Equatable {
  const LifecycleEvent({required this.type, this.timestamp});

  final LifecycleEventType type;

  final DateTime? timestamp;

  factory LifecycleEvent.now(LifecycleEventType type) {
    return LifecycleEvent(type: type, timestamp: clock.now());
  }

  @override
  List<Object?> get props => [type, timestamp];
}
