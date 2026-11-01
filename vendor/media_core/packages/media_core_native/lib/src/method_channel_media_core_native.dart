import 'package:flutter/services.dart';

import 'package:media_core_native/src/media_core_native_platform.dart';
import 'package:media_core_native/src/platform_probe_report.dart';

/// Channel the platform side answers on.
///
/// Kept in sync with the Android `MediaCoreNativePlugin` and the Windows
/// `media_core_native_plugin`.
const String kMediaCoreNativeChannel = 'media_core_native';

/// [MediaCoreNativePlatform] over a method channel.
///
/// One channel, one method ([kProbeMethod]): the probe is a single question, so
/// a single round trip answers it. Splitting it into a method per capability
/// would mean a dozen cross-platform calls per player creation for data that
/// never changes during a process.
final class MethodChannelMediaCoreNative extends MediaCoreNativePlatform {
  /// Creates the implementation.
  ///
  /// [channel] exists for tests, which answer the probe themselves through
  /// `TestDefaultBinaryMessengerBinding` rather than by faking this class.
  MethodChannelMediaCoreNative({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel(kMediaCoreNativeChannel);

  final MethodChannel _channel;

  /// The channel this implementation speaks on.
  MethodChannel get channel => _channel;

  @override
  Future<T?> invoke<T>(String method, [Object? arguments]) {
    return _channel.invokeMethod<T>(method, arguments);
  }
}

/// Reads the probe from [channel] without touching the singleton.
///
/// The lower-level entry point: it exists so the parser and the payload
/// contract can be exercised against a mock messenger.
Future<PlatformProbeReport> probeOverChannel(MethodChannel channel) {
  return readPlatformReport(MethodChannelMediaCoreNative(channel: channel));
}
