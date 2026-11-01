import 'package:media_core/identity/player_id.dart';
import 'package:media_core/resource/resource_manager.dart';
import 'package:media_core/resource/resource_pressure.dart';

/// Coordinates player resources.
///
/// [ResourceCoordinator] coordinates resource
/// related operations between players and
/// resource subsystem.
///
/// Responsibilities:
///
/// - locate the resource manager for a player
/// - apply resource pressure decisions
/// - forward resource release operations
/// - manage resource manager bindings
///
/// It does not:
///
/// - manage memory directly
/// - manage decoder directly
/// - calculate resource pressure
/// - control playback
///
/// Those responsibilities belong to:
///
/// - ResourceManager
/// - MemoryManager
/// - DecoderManager
final class ResourceCoordinator {
  /// Creates resource coordinator.
  ResourceCoordinator();

  final Map<PlayerId, ResourceManager> _managers = {};

  /// Registers resource manager.
  ///
  /// An existing manager registered for the same player is replaced.
  void register({required PlayerId playerId, required ResourceManager manager}) {
    _managers[playerId] = manager;
  }

  /// Removes resource manager.
  ///
  /// Returns `true` when a manager was removed.
  bool unregister(PlayerId playerId) {
    return _managers.remove(playerId) != null;
  }

  /// Gets resource manager.
  ///
  /// Returns `null` when no manager is registered.
  ResourceManager? managerOf(PlayerId playerId) {
    return _managers[playerId];
  }

  /// Applies resource pressure.
  ///
  /// Resource pressure is a decision result produced by the resource
  /// subsystem. The coordinator translates that result into the degraded
  /// mode operation exposed by [ResourceManager].
  ///
  /// Returns `false` when no manager is registered for [playerId].
  bool applyPressure({required PlayerId playerId, required ResourcePressure pressure}) {
    final manager = _managers[playerId];

    if (manager == null) {
      return false;
    }

    if (pressure.shouldReduceQuality) {
      manager.enterDegradedMode();
    } else {
      manager.leaveDegradedMode();
    }

    return true;
  }

  /// Releases player resources.
  ///
  /// Resource cleanup remains delegated to [ResourceManager].
  ///
  /// Returns `false` when no manager is registered for [playerId].
  Future<bool> release(PlayerId playerId) async {
    final manager = _managers[playerId];

    if (manager == null) {
      return false;
    }

    await manager.release();

    return true;
  }

  /// Clears resource manager bindings.
  ///
  /// Registered managers are not disposed because the coordinator does not
  /// own their lifecycle.
  void clear() {
    _managers.clear();
  }

  /// Disposes coordinator.
  ///
  /// Registered managers are not disposed here because their lifecycle is
  /// owned by their creator.
  Future<void> dispose() async {
    clear();
  }
}
