import 'dart:async';
import 'package:media_core/core/player.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/session/player_session.dart';

/// Coordinates player level operations.
///
/// [PlayerCoordinator] connects high-level
/// player workflows between modules.
///
/// It does not:
///
/// - create players
/// - manage backend
/// - execute playback commands
///
/// Those belong to:
///
/// - PlayerFactory
/// - PlayerAdapter
/// - PlaybackController
final class PlayerCoordinator {
  /// Creates coordinator.
  PlayerCoordinator();

  final Map<PlayerId, Player> _players = {};

  final Map<PlayerId, PlayerSession> _sessions = {};

  /// Registered players.
  List<Player> get players {
    return _players.values.toList(growable: false);
  }

  /// Number of players.
  int get count {
    return _players.length;
  }

  /// Registers player.
  void register(Player player) {
    _players[player.id] = player;
  }

  /// Unregisters player.
  bool unregister(PlayerId playerId) {
    _sessions.remove(playerId);

    return _players.remove(playerId) != null;
  }

  /// Gets player.
  Player? get(PlayerId playerId) {
    return _players[playerId];
  }

  /// Attaches session.
  void attachSession({required PlayerId playerId, required PlayerSession session}) {
    _sessions[playerId] = session;
  }

  /// Gets session.
  PlayerSession? sessionOf(PlayerId playerId) {
    return _sessions[playerId];
  }

  /// Detaches session.
  PlayerSession? detachSession(PlayerId playerId) {
    return _sessions.remove(playerId);
  }

  /// Clears all registrations.
  void clear() {
    _sessions.clear();

    _players.clear();
  }

  /// Disposes coordinator.
  Future<void> dispose() async {
    clear();
  }
}
