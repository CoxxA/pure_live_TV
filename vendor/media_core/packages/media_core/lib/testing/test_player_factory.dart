import 'package:media_core/testing/fake_player.dart';
import 'package:media_core/testing/fake_player_adapter.dart';
import 'package:media_core/adapter/player_adapter_context.dart';
import 'package:media_core/adapter/player_adapter_factory.dart';
import 'package:media_core/core/player.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/session_id.dart';

/// Convenience builders for players and adapters in tests.
final class TestPlayerFactory {
  const TestPlayerFactory._();

  /// Builds a [Player] with a deterministic id from [seed].
  static Player player(int seed) => FakePlayer.fromSeed(seed).player;

  /// Builds [count] distinct players.
  static List<Player> players(int count) {
    return List<Player>.generate(count, TestPlayerFactory.player, growable: false);
  }

  /// Builds a [PlayerId] from a raw string.
  static PlayerId playerId(String value) => PlayerId(value);

  /// Builds a minimal adapter context for [playerId].
  static PlayerAdapterContext context({
    String? playerId,
    String? sessionId,
  }) {
    return PlayerAdapterContext.basic(
      playerId: PlayerId(playerId ?? 'test-player'),
      sessionId: SessionId(sessionId ?? 'test-session'),
    );
  }

  /// Builds a default fake adapter.
  static FakePlayerAdapter fakeAdapter() => FakePlayerAdapter();

  /// Builds a core [PlayerAdapterFactory] that creates fake adapters.
  static DefaultPlayerAdapterFactory fakeAdapterFactory() {
    final factory = DefaultPlayerAdapterFactory();
    factory.register('fake', FakePlayerAdapter.new);
    return factory;
  }
}
