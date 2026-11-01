import 'package:media_core/core/player.dart';
import 'package:media_core/factory/player_factory.dart';
import 'package:media_core/factory/player_factory_config.dart';

/// Default [PlayerFactory] implementation.
///
/// Creates logical [Player] identities. Adapter creation and
/// wiring belong to the kernel layer (`PlayerKernel.create`).
final class DefaultPlayerFactory implements PlayerFactory {
  /// Creates the factory.
  const DefaultPlayerFactory();

  @override
  Player create({PlayerFactoryConfig? config}) {
    return Player.create();
  }
}
