import 'package:media_core/core/player.dart';
import 'package:media_core/factory/player_factory_config.dart';

/// Creates player instances.
///
/// PlayerFactory is the public creation entry
/// of media_core.
///
/// Responsibilities:
///
/// - create Player
/// - apply factory configuration
///
/// It does not:
///
/// - select backend
/// - manage backend registry
/// - control playback
abstract interface class PlayerFactory {
  /// Creates a player instance.
  Player create({PlayerFactoryConfig? config});
}
