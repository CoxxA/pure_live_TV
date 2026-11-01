import 'dart:async';
import 'package:media_core/event/event_filter.dart';
import 'package:media_core/event/player_event.dart';

/// Represents one active event subscription.
///
/// A subscription owns only delivery configuration. The event bus remains
/// responsible for event transport.
final class EventSubscription {
  EventSubscription({
    required StreamSubscription<PlayerEvent> subscription,
    EventFilter? filter,
    this.once = false,
    void Function(EventSubscription subscription)? onCancelled,
  }) : _subscription = subscription,
       _onCancelled = onCancelled,
       filter = filter ?? const AllowAllEventFilter();

  final StreamSubscription<PlayerEvent> _subscription;

  /// Notified once when this subscription is cancelled.
  ///
  /// A one-shot subscription cancels itself from inside a listener, so the
  /// owner cannot learn about it any other way and would keep a dead entry in
  /// its registry forever.
  final void Function(EventSubscription subscription)? _onCancelled;

  final EventFilter filter;

  final bool once;

  bool _cancelled = false;

  bool get isCancelled => _cancelled;

  void pause([Future<void>? resumeSignal]) {
    _subscription.pause(resumeSignal);
  }

  void resume() {
    _subscription.resume();
  }

  Future<void> cancel() async {
    if (_cancelled) {
      return;
    }

    _cancelled = true;

    _onCancelled?.call(this);

    await _subscription.cancel();
  }
}
