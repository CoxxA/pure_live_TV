import 'package:clock/clock.dart';

import 'package:media_core/core/player.dart';
import 'package:media_core/identity/player_id.dart';

/// Deterministic [Player] builder for tests.
///
/// Builds stable player identities from integer seeds so
/// assertions do not depend on generated identifiers.
final class FakePlayer {
  const FakePlayer._(this._seed);

  final int _seed;

  /// Builds a player from [seed].
  ///
  /// The same seed always produces the same [PlayerId].
  factory FakePlayer.fromSeed(int seed) => FakePlayer._(seed);

  /// Player identity for this fake.
  Player get player => Player(
        id: PlayerId('fake-player-$_seed'),
        createdAt: DateTime.fromMillisecondsSinceEpoch(_seed),
      );

  /// Generated player identity with a random id.
  static Player generate({DateTime? createdAt}) {
    return Player.create(createdAt: createdAt ?? clock.now());
  }

  /// Builds multiple players.
  static List<Player> seeds(Iterable<int> seeds) {
    return seeds.map((seed) => FakePlayer._(seed).player).toList(growable: false);
  }
}
