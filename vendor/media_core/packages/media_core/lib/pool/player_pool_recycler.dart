import 'package:media_core/identity/player_id.dart';

/// Recycles players from pool.
///
/// [PlayerPoolRecycler] decides which players
/// should be returned to idle state.
///
/// It does not:
///
/// - destroy players
/// - create players
/// - manage sessions
///
/// Those belong to:
///
/// - PlayerFactory
/// - PlayerPoolManager
/// - SessionManager
final class PlayerPoolRecycler {
  /// Creates recycler.
  PlayerPoolRecycler();

  /// Finds players that can be recycled.
  ///
  /// Returns player ids that are safe to recycle.
  List<PlayerId> findCandidates({required List<PlayerId> idlePlayers, int maxCount = 1}) {
    if (idlePlayers.isEmpty) {
      return const [];
    }

    if (maxCount <= 0) {
      return const [];
    }

    if (idlePlayers.length <= maxCount) {
      return List<PlayerId>.unmodifiable(idlePlayers);
    }

    return List<PlayerId>.unmodifiable(idlePlayers.take(maxCount));
  }

  /// Checks whether a player can be recycled.
  bool canRecycle(PlayerId playerId) {
    return true;
  }

  /// Selects a single recycle target.
  PlayerId? selectCandidate(List<PlayerId> players) {
    if (players.isEmpty) {
      return null;
    }

    return players.first;
  }
}
