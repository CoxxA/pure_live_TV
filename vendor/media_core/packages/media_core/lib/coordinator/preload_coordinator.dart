import 'package:media_core/identity/player_id.dart';
import 'package:media_core/preload/preload_manager.dart';
import 'package:media_core/preload/preload_request.dart';

/// Coordinates preload operations.
///
/// [PreloadCoordinator] connects players with the preload subsystem.
///
/// Responsibilities:
///
/// - locate the preload manager for a player
/// - forward preload requests
/// - manage preload manager bindings
///
/// It does not:
///
/// - create players
/// - resolve media sources
/// - execute playback
/// - manage individual preload tasks
///
/// Those responsibilities belong to:
///
/// - PlayerFactory
/// - SourceResolver
/// - PreloadManager
/// - PlaybackController
final class PreloadCoordinator {
  /// Creates preload coordinator.
  PreloadCoordinator();

  final Map<PlayerId, PreloadManager> _managers = {};

  /// Registers preload manager.
  ///
  /// An existing manager registered for the same player is replaced.
  void register({required PlayerId playerId, required PreloadManager manager}) {
    _managers[playerId] = manager;
  }

  /// Removes preload manager.
  ///
  /// Returns `true` when a manager was removed.
  bool unregister(PlayerId playerId) {
    return _managers.remove(playerId) != null;
  }

  /// Gets preload manager.
  ///
  /// Returns `null` when no manager is registered.
  PreloadManager? managerOf(PlayerId playerId) {
    return _managers[playerId];
  }

  /// Adds a preload request.
  ///
  /// The actual preload task lifecycle is managed by [PreloadManager].
  ///
  /// Returns `false` when no manager is registered for [playerId] — the
  /// request was dropped, and a caller that needs to know cannot tell that
  /// apart from a successful hand-off otherwise.
  bool preload({required PlayerId playerId, required PreloadRequest request}) {
    final manager = _managers[playerId];

    if (manager == null) {
      return false;
    }

    manager.add(request);

    return true;
  }

  /// Clears all manager bindings.
  ///
  /// Registered managers are not disposed because the coordinator does not
  /// own their lifecycle.
  void clear() {
    _managers.clear();
  }

  /// Disposes coordinator.
  ///
  /// Registered managers are not disposed here because their lifecycle is
  /// owned by the corresponding player or preload subsystem.
  Future<void> dispose() async {
    clear();
  }
}
