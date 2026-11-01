import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/session_id.dart';

/// Allocates players from pool.
///
/// [PlayerPoolAllocator] selects available players
/// for sessions.
///
/// It does not:
///
/// - create players
/// - destroy players
/// - control playback
///
/// Those belong to:
///
/// - PlayerFactory
/// - PlayerPoolRecycler
/// - PlayerPoolManager
final class PlayerPoolAllocator {
  /// Creates allocator.
  PlayerPoolAllocator();

  /// Allocates an available player.
  ///
  /// Returns null when no player is available.
  PlayerId? allocate({required List<PlayerId> availablePlayers, required SessionId sessionId}) {
    if (availablePlayers.isEmpty) {
      return null;
    }

    return availablePlayers.first;
  }

  /// Checks whether allocation is possible.
  bool canAllocate(List<PlayerId> availablePlayers) {
    return availablePlayers.isNotEmpty;
  }

  /// Selects best candidate.
  ///
  /// Override this method when implementing
  /// custom allocation strategies.
  PlayerId? selectCandidate(List<PlayerId> players) {
    if (players.isEmpty) {
      return null;
    }

    return players.first;
  }
}
