import 'package:media_core_ijk_player/src/flv_lzc_adapter.dart';
import 'package:media_core/media_core.dart';

export 'package:media_core_ijk_player/src/fijk_player_config.dart' show FijkPlayerConfig, FijkProxyUrlResolver;

const String kIjkPlayerBackendId = 'ijk';

/// [PlayerAdapterFactory] that creates [FlvLzcPlayerAdapter] instances.
final class IjkPlayerAdapterFactory implements PlayerAdapterFactory {
  /// [capabilities] and [config] are shared by every adapter this
  /// factory creates. [configure] runs once per instance after
  /// construction for per-instance customisation.
  const IjkPlayerAdapterFactory({
    this.capabilities = FlvLzcPlayerAdapter.defaultCapabilities,
    this.config = const FijkPlayerConfig(),
    this.configure,
  });

  final PlayerAdapterCapabilities capabilities;
  final FijkPlayerConfig config;
  final void Function(FlvLzcPlayerAdapter adapter)? configure;

  @override
  PlayerAdapter create(String id) {
    final adapter = FlvLzcPlayerAdapter(id: id, capabilities: capabilities, config: config);
    configure?.call(adapter);
    return adapter;
  }

  @override
  bool supports(String id) => id == kIjkPlayerBackendId;

  /// Builds a registration entry for `PlayerKernel.registerBackend`
  /// or a [PlayerAdapterRegistry]. That path carries [capabilities]
  /// on the registration entry itself, so capability-based selection
  /// works before an adapter is ever instantiated.
  PlayerAdapterRegistration registration({int priority = 90}) {
    return PlayerAdapterRegistration(
      id: kIjkPlayerBackendId,
      factory: this,
      capabilities: capabilities,
      priority: priority,
    );
  }
}

/// Registers the ijkplayer adapter in a [DefaultPlayerAdapterFactory].
void registerIjkFactory(
  DefaultPlayerAdapterFactory factory, {
  String id = kIjkPlayerBackendId,
  PlayerAdapterCapabilities capabilities = FlvLzcPlayerAdapter.defaultCapabilities,
  FijkPlayerConfig config = const FijkPlayerConfig(),
  void Function(FlvLzcPlayerAdapter adapter)? configure,
}) {
  factory.register(id, () {
    final adapter = FlvLzcPlayerAdapter(id: id, capabilities: capabilities, config: config);
    configure?.call(adapter);
    return adapter;
  });
}

/// Registers the ijkplayer adapter in a [PlayerAdapterRegistry].
void registerIjkRegistry(
  PlayerAdapterRegistry registry, {
  int priority = 90,
  PlayerAdapterCapabilities capabilities = FlvLzcPlayerAdapter.defaultCapabilities,
  FijkPlayerConfig config = const FijkPlayerConfig(),
  void Function(FlvLzcPlayerAdapter adapter)? configure,
}) {
  registry.register(
    IjkPlayerAdapterFactory(
      capabilities: capabilities,
      config: config,
      configure: configure,
    ).registration(priority: priority),
  );
}
