import 'package:media_core/event/player_event.dart';
import 'package:media_core/event/event_priority.dart';
import 'package:media_core/event/player_event_type.dart';

/// Predicate used to decide whether an event should be delivered.
///
/// Filters are intentionally composable and stateless.
abstract interface class EventFilter {
  const EventFilter();

  bool accepts(PlayerEvent event);
}

/// Accepts every event.
final class AllowAllEventFilter implements EventFilter {
  const AllowAllEventFilter();

  @override
  bool accepts(PlayerEvent event) => true;
}

/// Filters by event type.
final class EventTypeFilter implements EventFilter {
  const EventTypeFilter(this.types, {this.includeUnknown = true});

  final Set<PlayerEventType> types;

  final bool includeUnknown;

  @override
  bool accepts(PlayerEvent event) {
    if (types.contains(event.type)) {
      return true;
    }

    return includeUnknown && event.type == PlayerEventType.unknown;
  }
}

/// Filters by minimum priority.
final class EventPriorityFilter implements EventFilter {
  const EventPriorityFilter(this.minimum);

  final EventPriority minimum;

  @override
  bool accepts(PlayerEvent event) {
    return _weight(event.priority) >= _weight(minimum);
  }

  int _weight(EventPriority value) {
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
}

/// Filters events using player/session/source correlation.
final class EventContextFilter implements EventFilter {
  const EventContextFilter({this.playerId, this.sessionId, this.sourceId});

  final Object? playerId;

  final Object? sessionId;

  final Object? sourceId;

  @override
  bool accepts(PlayerEvent event) {
    final context = event.context;

    if (context == null) {
      return false;
    }

    if (playerId != null && context.playerId != playerId) {
      return false;
    }

    if (sessionId != null && context.sessionId != sessionId) {
      return false;
    }

    if (sourceId != null && context.sourceId != sourceId) {
      return false;
    }

    return true;
  }
}

/// Combines multiple filters.
///
/// All configured filters must accept the event.
final class CompositeEventFilter implements EventFilter {
  const CompositeEventFilter(this.filters);

  final List<EventFilter> filters;

  @override
  bool accepts(PlayerEvent event) {
    for (final EventFilter filter in filters) {
      if (!filter.accepts(event)) {
        return false;
      }
    }

    return true;
  }
}
