import 'package:media_core/identity/player_id.dart';
import 'package:media_core/lifecycle/lifecycle_event.dart';
import 'package:media_core/lifecycle/player_lifecycle.dart';

/// Coordinates player lifecycle operations.
///
/// [LifecycleCoordinator] connects players with the lifecycle subsystem.
///
/// Responsibilities:
///
/// - register lifecycle handlers
/// - associate players with lifecycle instances
/// - dispatch lifecycle events
/// - expose explicit lifecycle operations
/// - manage lifecycle bindings
///
/// It does not:
///
/// - listen to Flutter lifecycle directly
/// - create players
/// - execute playback commands
/// - implement lifecycle state transitions
///
/// Those responsibilities belong to:
///
/// - Platform lifecycle layer
/// - PlayerFactory
/// - PlayerLifecycle
/// - PlaybackController
final class LifecycleCoordinator {
  /// Creates a lifecycle coordinator.
  LifecycleCoordinator();

  final Map<PlayerId, PlayerLifecycle> _lifecycles = {};

  /// Registers a lifecycle handler for [playerId].
  ///
  /// An existing lifecycle registered for the same player is replaced.
  void register({required PlayerId playerId, required PlayerLifecycle lifecycle}) {
    _lifecycles[playerId] = lifecycle;
  }

  /// Removes the lifecycle handler associated with [playerId].
  ///
  /// Returns `true` when a lifecycle was removed.
  bool unregister(PlayerId playerId) {
    return _lifecycles.remove(playerId) != null;
  }

  /// Gets the lifecycle handler associated with [playerId].
  ///
  /// Returns `null` when no lifecycle is registered.
  PlayerLifecycle? lifecycleOf(PlayerId playerId) {
    return _lifecycles[playerId];
  }

  /// Dispatches a lifecycle event to the registered player lifecycle.
  ///
  /// The coordinator translates [LifecycleEventType] into the corresponding
  /// explicit operation exposed by [PlayerLifecycle].
  void dispatch({required PlayerId playerId, required LifecycleEvent event}) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    switch (event.type) {
      case LifecycleEventType.created:
        lifecycle.create();
      case LifecycleEventType.initialized:
        lifecycle.initialize();
      case LifecycleEventType.activated:
        lifecycle.activate();
      case LifecycleEventType.paused:
        lifecycle.pause();
      case LifecycleEventType.resumed:
        lifecycle.resume();
      case LifecycleEventType.inactive:
        lifecycle.deactivate();
      case LifecycleEventType.detached:
        lifecycle.detach();
      case LifecycleEventType.disposing:
        lifecycle.dispose();
      case LifecycleEventType.disposed:
        break;
    }
  }

  /// Creates the lifecycle associated with [playerId].
  void create(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.create();
  }

  /// Initializes the lifecycle associated with [playerId].
  void initialize(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.initialize();
  }

  /// Activates the lifecycle associated with [playerId].
  void activate(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.activate();
  }

  /// Pauses the lifecycle associated with [playerId].
  void pause(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.pause();
  }

  /// Resumes the lifecycle associated with [playerId].
  void resume(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.resume();
  }

  /// Deactivates the lifecycle associated with [playerId].
  void deactivate(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.deactivate();
  }

  /// Detaches the lifecycle associated with [playerId].
  void detach(PlayerId playerId) {
    final lifecycle = _lifecycles[playerId];

    if (lifecycle == null) {
      return;
    }

    lifecycle.detach();
  }

  /// Disposes the lifecycle associated with [playerId].
  ///
  /// The lifecycle binding is removed after disposal.
  void disposeLifecycle(PlayerId playerId) {
    final lifecycle = _lifecycles.remove(playerId);

    if (lifecycle == null) {
      return;
    }

    lifecycle.dispose();
  }

  /// Clears all lifecycle bindings.
  void clear() {
    _lifecycles.clear();
  }

  /// Disposes the coordinator.
  ///
  /// The coordinator only owns lifecycle bindings and does not own the
  /// lifecycle instances themselves. Registered lifecycles are therefore not
  /// disposed here.
  Future<void> dispose() async {
    clear();
  }
}
