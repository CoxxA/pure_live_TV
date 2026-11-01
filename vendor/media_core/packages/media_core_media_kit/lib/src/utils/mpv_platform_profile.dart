import 'package:flutter/foundation.dart';
import 'package:media_core_media_kit/src/utils/player_consts.dart';

const Map<String, String> _iosVideoOutputDrivers = {'libmpv': 'libmpv'};

const Map<String, String> _iosAudioOutputDrivers = {
  'auto': 'auto',
  'audiounit': 'audiounit (iOS only)',
  'null': 'null (No audio output)',
};

const Map<String, String> _androidAudioOutputDrivers = {
  'auto': 'auto (Automatic fallback)',
  'audiotrack': 'audiotrack (Android AudioTrack)',
  'aaudio': 'aaudio (Android 8.0+)',
  'opensles': 'opensles (Legacy fallback)',
  'null': 'null (No audio output)',
};

const Map<String, String> _iosHardwareDecoders = {
  'auto': 'auto',
  'auto-safe': 'auto-safe',
  'auto-copy': 'auto-copy',
  'no': 'no',
  'videotoolbox': 'videotoolbox',
  'videotoolbox-copy': 'videotoolbox-copy',
};

/// Platform contract for MPV drivers and decoders.
///
/// Every choice is normalised here before it reaches libmpv, so a value
/// persisted on one platform cannot leak a broken driver into another.
abstract final class MpvPlatformProfile {
  static Map<String, String> videoOutputDriversForPlatform(TargetPlatform platform) =>
      platform == TargetPlatform.iOS ? _iosVideoOutputDrivers : PlayerConsts.videoOutputDrivers;

  static Map<String, String> audioOutputDriversForPlatform(TargetPlatform platform) => switch (platform) {
    TargetPlatform.android => _androidAudioOutputDrivers,
    TargetPlatform.iOS => _iosAudioOutputDrivers,
    _ => PlayerConsts.audioOutputDrivers,
  };

  static Map<String, String> hardwareDecodersForPlatform(TargetPlatform platform) =>
      platform == TargetPlatform.iOS ? _iosHardwareDecoders : PlayerConsts.hardwareDecoder;

  static String defaultVideoOutputDriverForPlatform(TargetPlatform platform) =>
      platform == TargetPlatform.iOS ? 'libmpv' : 'gpu';

  /// Native audio preference applied when expert output overrides are
  /// disabled.
  static String? defaultAudioOutputDriverForPlatform(TargetPlatform platform) => switch (platform) {
    TargetPlatform.android => 'audiotrack,aaudio,opensles,',
    TargetPlatform.linux => 'alsa',
    _ => null,
  };

  static String normalizeVideoOutputDriverForPlatform(String value, TargetPlatform platform) =>
      _normalize(value, videoOutputDriversForPlatform(platform), defaultVideoOutputDriverForPlatform(platform));

  static String normalizeAudioOutputDriverForPlatform(String value, TargetPlatform platform) =>
      _normalize(value, audioOutputDriversForPlatform(platform), 'auto');

  static String normalizeHardwareDecoderForPlatform(String value, TargetPlatform platform) =>
      _normalize(value, hardwareDecodersForPlatform(platform), 'auto');

  /// Resolves the value sent to libmpv after applying the platform
  /// contract.
  ///
  /// On Android, `auto` is rewritten to the same ordered fallback chain
  /// used by the safe default instead of being passed as a pseudo-driver.
  static String? effectiveAudioOutputDriverForPlatform({
    required bool customOutput,
    required String configuredDriver,
    required TargetPlatform platform,
  }) {
    if (!customOutput) return defaultAudioOutputDriverForPlatform(platform);

    final normalized = normalizeAudioOutputDriverForPlatform(configuredDriver, platform);

    if (platform == TargetPlatform.android && normalized == 'auto') {
      return defaultAudioOutputDriverForPlatform(platform);
    }

    return normalized;
  }

  static bool isAudioOutputDisabledForPlatform({
    required bool customOutput,
    required String configuredDriver,
    required TargetPlatform platform,
  }) => customOutput && normalizeAudioOutputDriverForPlatform(configuredDriver, platform) == 'null';

  static String _normalize(String value, Map<String, String> available, String fallback) =>
      available.containsKey(value) ? value : fallback;
}
