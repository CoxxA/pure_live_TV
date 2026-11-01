import 'package:media_core/event/event_context.dart';
import 'package:media_core/event/event_priority.dart';
import 'package:media_core/event/player_event_type.dart';
import 'package:equatable/equatable.dart';


/// Base type for all events emitted by the media core.
///
/// Events are immutable values. The event bus and dispatcher are responsible
/// for transport only; event subclasses describe what happened.
sealed class PlayerEvent extends Equatable {
  const PlayerEvent({required this.type, this.context, this.priority = EventPriority.normal});

  final PlayerEventType type;

  final EventContext? context;

  final EventPriority priority;

  bool get isCritical => priority == EventPriority.critical;

  bool get hasContext => context != null;

  PlayerEvent copyWithContext(EventContext? context);

  Map<String, dynamic> toMap();

  @override
  List<Object?> get props => <Object?>[type, context, priority];
}

/// Generic player event.
///
/// This is useful for event categories that do not yet require a dedicated
/// strongly typed event class.
final class GenericPlayerEvent extends PlayerEvent {
  const GenericPlayerEvent({required super.type, this.data = const <String, Object?>{}, super.context, super.priority});

  final Map<String, Object?> data;

  @override
  GenericPlayerEvent copyWithContext(EventContext? context) {
    return GenericPlayerEvent(type: type, data: data, context: context, priority: priority);
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'type': type.name, 'priority': priority.name, 'context': context?.toMap(), 'data': data};
  }

  @override
  List<Object?> get props => <Object?>[...super.props, data];

  @override
  String toString() {
    return 'GenericPlayerEvent('
        'type: $type, '
        'priority: $priority, '
        'data: $data'
        ')';
  }
}

/// Error event.
///
/// Error payload is kept as Object so the event layer does not depend on a
/// particular error hierarchy.
final class PlayerErrorEvent extends PlayerEvent {
  const PlayerErrorEvent({required this.error, this.stackTrace, super.context, super.priority = EventPriority.high})
    : super(type: PlayerEventType.error);

  final Object error;

  final StackTrace? stackTrace;

  bool get hasStackTrace => stackTrace != null;

  @override
  PlayerErrorEvent copyWithContext(EventContext? context) {
    return PlayerErrorEvent(error: error, stackTrace: stackTrace, context: context, priority: priority);
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'priority': priority.name,
      'context': context?.toMap(),
      'error': error.toString(),
      'stackTrace': stackTrace?.toString(),
    };
  }

  @override
  List<Object?> get props => <Object?>[...super.props, error, stackTrace];

  @override
  String toString() {
    return 'PlayerErrorEvent('
        'error: $error, '
        'stackTrace: $stackTrace'
        ')';
  }
}

/// Lifecycle event.
///
/// This event is intentionally generic and uses a string action so the event
/// layer does not duplicate lifecycle state definitions.
final class PlayerLifecycleEvent extends PlayerEvent {
  const PlayerLifecycleEvent({
    required this.action,
    this.data = const <String, Object?>{},
    super.context,
    super.priority = EventPriority.normal,
  }) : super(type: PlayerEventType.lifecycle);

  final String action;

  final Map<String, Object?> data;

  @override
  PlayerLifecycleEvent copyWithContext(EventContext? context) {
    return PlayerLifecycleEvent(action: action, data: data, context: context, priority: priority);
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'priority': priority.name,
      'context': context?.toMap(),
      'action': action,
      'data': data,
    };
  }

  @override
  List<Object?> get props => <Object?>[...super.props, action, data];

  @override
  String toString() {
    return 'PlayerLifecycleEvent('
        'action: $action, '
        'data: $data'
        ')';
  }
}
