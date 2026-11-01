import 'package:media_core_media_kit/src/media_kit_player_adapter.dart';
import 'package:media_core/media_core.dart';

export 'package:media_core_media_kit/src/media_kit_player_config.dart' show MediaKitPlayerConfig, MediaKitProxyUrlResolver;
export 'package:media_core_media_kit/src/media_kit_video_config.dart' show MediaKitVideoConfig, MediaKitVideoControls;

const String kMediaKitPlayerBackendId = 'mpv';

/// [PlayerAdapterFactory] that creates [MediaKitPlayerAdapter] instances.
final class MediaKitAdapterFactory implements PlayerAdapterFactory {
  /// [capabilities], [config] and [videoConfig] are shared by every
  /// adapter this factory creates. [configure] runs once per instance
  /// after construction for per-instance customisation.
  const MediaKitAdapterFactory({
    this.capabilities = MediaKitPlayerAdapter.defaultCapabilities,
    this.config = const MediaKitPlayerConfig(),
    this.videoConfig = const MediaKitVideoConfig(),
    this.configure,
  });

  final PlayerAdapterCapabilities capabilities;
  final MediaKitPlayerConfig config;
  final MediaKitVideoConfig videoConfig;
  final void Function(MediaKitPlayerAdapter adapter)? configure;

  @override
  PlayerAdapter create(String id) {
    final adapter = MediaKitPlayerAdapter(id: id, capabilities: capabilities, config: config, videoConfig: videoConfig);
    configure?.call(adapter);
    return adapter;
  }

  @override
  bool supports(String id) => id == kMediaKitPlayerBackendId;

  /// Builds a registration entry for `PlayerKernel.registerBackend` or
  /// a [PlayerAdapterRegistry]. That path carries [capabilities] on the
  /// registration entry itself, so capability-based selection works
  /// before an adapter is ever instantiated.
  PlayerAdapterRegistration registration({int priority = 100}) {
    return PlayerAdapterRegistration(
      id: kMediaKitPlayerBackendId,
      factory: this,
      capabilities: capabilities,
      priority: priority,
    );
  }
}

/// Registers the media_kit adapter in a [DefaultPlayerAdapterFactory].
void registerMediaKitFactory(
  DefaultPlayerAdapterFactory factory, {
  String id = kMediaKitPlayerBackendId,
  PlayerAdapterCapabilities capabilities = MediaKitPlayerAdapter.defaultCapabilities,
  MediaKitPlayerConfig config = const MediaKitPlayerConfig(),
  MediaKitVideoConfig videoConfig = const MediaKitVideoConfig(),
  void Function(MediaKitPlayerAdapter adapter)? configure,
}) {
  factory.register(id, () {
    final adapter = MediaKitPlayerAdapter(id: id, capabilities: capabilities, config: config, videoConfig: videoConfig);
    configure?.call(adapter);
    return adapter;
  });
}

/// Registers the media_kit adapter in a [PlayerAdapterRegistry].
void registerMediaKitRegistry(
  PlayerAdapterRegistry registry, {
  int priority = 100,
  PlayerAdapterCapabilities capabilities = MediaKitPlayerAdapter.defaultCapabilities,
  MediaKitPlayerConfig config = const MediaKitPlayerConfig(),
  MediaKitVideoConfig videoConfig = const MediaKitVideoConfig(),
  void Function(MediaKitPlayerAdapter adapter)? configure,
}) {
  registry.register(
    MediaKitAdapterFactory(
      capabilities: capabilities,
      config: config,
      videoConfig: videoConfig,
      configure: configure,
    ).registration(priority: priority),
  );
}
