import 'package:media_core/adapter/player_adapter.dart';

/// Factory for creating player adapters.
///
/// [PlayerAdapterFactory] creates concrete playback
/// backend adapters.
///
/// Examples:
///
/// - media_kit adapter
/// - native adapter
/// - ffmpeg adapter
///
/// Responsibilities:
///
/// - create adapter instances
/// - hide implementation details
///
/// It does not:
///
/// - select backend
/// - maintain registrations
/// - evaluate capabilities
///
/// Those belong to:
///
/// - BackendSelector
/// - PlayerAdapterRegistry
/// - PlayerAdapterCapabilities
abstract interface class PlayerAdapterFactory {
  /// Creates an adapter.
  ///
  /// [id] identifies the backend implementation.
  ///
  /// Example:
  ///
  /// - media_kit
  /// - native
  /// - ffmpeg
  PlayerAdapter create(String id);

  /// Whether this factory can create adapter.
  bool supports(String id);
}

/// Default adapter factory implementation.
///
/// Uses registered creators.
///
/// This keeps adapter construction decoupled
/// from concrete implementations.
final class DefaultPlayerAdapterFactory implements PlayerAdapterFactory {
  /// Creates factory.
  DefaultPlayerAdapterFactory();

  final Map<String, PlayerAdapter Function()> _creators = {};

  /// Registers an adapter creator.
  void register(String id, PlayerAdapter Function() creator) {
    _creators[id] = creator;
  }

  @override
  PlayerAdapter create(String id) {
    final creator = _creators[id];

    if (creator == null) {
      throw StateError('No player adapter registered for: $id');
    }

    return creator();
  }

  @override
  bool supports(String id) {
    return _creators.containsKey(id);
  }

  /// Removes adapter creator.
  void unregister(String id) {
    _creators.remove(id);
  }

  /// Clears all creators.
  void clear() {
    _creators.clear();
  }

  /// Registered adapter count.
  int get count {
    return _creators.length;
  }
}
