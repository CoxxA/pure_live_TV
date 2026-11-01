import 'dart:async';
import 'package:media_core/event/event_filter.dart';
import 'package:media_core/event/player_event.dart';
import 'package:media_core/event/event_priority.dart';
import 'package:media_core/event/event_dispatcher.dart';
import 'package:media_core/event/event_subscription.dart';


/// Central event bus for the media core.
///
/// The bus is intentionally small:
///
/// - publish events
/// - expose a read-only stream
/// - create filtered subscriptions
/// - dispose resources
///
/// Business logic must remain outside the event bus.
final class PlayerEventBus {
  PlayerEventBus({bool sync = false}) : _controller = StreamController<PlayerEvent>.broadcast(sync: sync) {
    _dispatcher = EventDispatcher(source: _controller.stream);
  }

  final StreamController<PlayerEvent> _controller;

  late final EventDispatcher _dispatcher;

  bool _disposed = false;

  /// Read-only event stream.
  Stream<PlayerEvent> get stream => _controller.stream;

  EventDispatcher get dispatcher => _dispatcher;

  bool get isDisposed => _disposed;

  /// Publishes one event.
  ///
  /// Events published after disposal are rejected.
  void publish(PlayerEvent event) {
    _ensureNotDisposed();

    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  /// Publishes an iterable of events in order.
  void publishAll(Iterable<PlayerEvent> events) {
    _ensureNotDisposed();

    for (final PlayerEvent event in events) {
      publish(event);
    }
  }

  /// Subscribes to the bus.
  EventSubscription subscribe(
    void Function(PlayerEvent event) listener, {
    EventFilter? filter,
    EventPriority? minimumPriority,
  }) {
    _ensureNotDisposed();

    return _dispatcher.subscribe(listener, filter: filter, minimumPriority: minimumPriority);
  }

  /// Subscribes for a single matching event.
  EventSubscription subscribeOnce(
    void Function(PlayerEvent event) listener, {
    EventFilter? filter,
    EventPriority? minimumPriority,
  }) {
    _ensureNotDisposed();

    return _dispatcher.subscribeOnce(listener, filter: filter, minimumPriority: minimumPriority);
  }

  /// Waits for the next event matching [filter].
  Future<PlayerEvent> next({EventFilter? filter}) {
    _ensureNotDisposed();

    final EventFilter effectiveFilter = filter ?? const AllowAllEventFilter();

    return stream.firstWhere(effectiveFilter.accepts);
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;

    await _dispatcher.dispose();
    await _controller.close();
  }

  void _ensureNotDisposed() {
    if (_disposed) {
      throw StateError('PlayerEventBus has been disposed.');
    }
  }
}
