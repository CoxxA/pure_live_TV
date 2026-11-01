import 'package:media_core/platform/platform_capabilities.dart';
import 'package:media_core/platform/platform_codec_capabilities.dart';
import 'package:media_core/platform/platform_device_profile.dart';
import 'package:media_core/platform/platform_info.dart';
import 'package:media_core/platform/platform_provider.dart';
import 'package:media_core/platform/platform_type.dart';

/// Scriptable [PlatformProvider] for tests.
final class FakePlatformProvider implements PlatformProvider {
  /// Creates a fake provider.
  FakePlatformProvider({
    PlatformType? type,
    PlatformInfo? info,
    PlatformCapabilities? capabilities,
    PlatformDeviceProfile? device,
    PlatformCodecCapabilities? codecs,
  })  : _type = type ?? PlatformType.unknown,
        _info = info ??
            PlatformInfo(
              type: type ?? PlatformType.unknown,
              name: 'FakeDevice',
              version: '1.0.0',
            ),
        _capabilities = capabilities ?? const PlatformCapabilities(),
        _device = device ?? PlatformDeviceProfile.unknown,
        _codecs = codecs ?? PlatformCodecCapabilities.unknown;

  PlatformType _type;
  PlatformInfo _info;
  PlatformCapabilities _capabilities;
  PlatformDeviceProfile _device;
  PlatformCodecCapabilities _codecs;
  bool _ready = false;

  @override
  PlatformType get type => _type;

  @override
  PlatformInfo get info => _info;

  @override
  PlatformCapabilities get capabilities => _capabilities;

  @override
  PlatformDeviceProfile get device => _device;

  @override
  PlatformCodecCapabilities get codecs => _codecs;

  @override
  bool get isReady => _ready;

  /// Marks the provider as ready.
  void markReady() => _ready = true;

  /// Replaces the platform type.
  void updateType(PlatformType type) => _type = type;

  /// Replaces the platform info.
  void updateInfo(PlatformInfo info) => _info = info;

  /// Replaces the capabilities.
  void updateCapabilities(PlatformCapabilities capabilities) => _capabilities = capabilities;

  /// Replaces the device profile.
  void updateDevice(PlatformDeviceProfile device) => _device = device;

  /// Replaces the codec capabilities.
  void updateCodecs(PlatformCodecCapabilities codecs) => _codecs = codecs;
}
