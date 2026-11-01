import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_adapter_config.freezed.dart';

/// Configuration for a player adapter.
///
/// [PlayerAdapterConfig] contains backend-independent
/// initialization options.
///
/// Different adapters may map these values to their
/// native backend options.
///
/// Responsibilities:
///
/// - describe adapter configuration
/// - provide playback preferences
///
/// It does not:
///
/// - store runtime state
/// - select backend
/// - manage lifecycle
///
/// Those belong to:
///
/// - PlayerAdapterState
/// - BackendSelector
/// - PlayerAdapterFactory
@freezed
abstract class PlayerAdapterConfig with _$PlayerAdapterConfig {
  /// Creates adapter configuration.
  const factory PlayerAdapterConfig({
    /// Enable hardware decoding.
    @Default(true) bool hardwareAcceleration,

    /// Enable audio output.
    @Default(true) bool audioEnabled,

    /// Initial volume.
    @Default(1.0) double volume,

    /// Initial playback rate.
    @Default(1.0) double playbackRate,

    /// Network timeout.
    @Default(Duration(seconds: 15)) Duration networkTimeout,

    /// Buffer duration target.
    @Default(Duration(seconds: 5)) Duration bufferDuration,

    /// Maximum buffer size in bytes.
    ///
    /// Null means backend default.
    int? maxBufferBytes,

    /// Preferred decoder name.
    ///
    /// Example:
    /// - h264
    /// - hevc
    String? preferredDecoder,

    /// Backend-specific options.
    @Default({}) Map<String, Object?> options,
  }) = _PlayerAdapterConfig;

  /// Creates default configuration.
  factory PlayerAdapterConfig.defaults() {
    return const PlayerAdapterConfig();
  }
}

/// Extensions for [PlayerAdapterConfig].
extension PlayerAdapterConfigExtension on PlayerAdapterConfig {
  /// Whether volume value is valid.
  bool get hasValidVolume {
    return volume >= 0 && volume <= 1;
  }

  /// Whether playback rate is valid.
  bool get hasValidRate {
    return playbackRate > 0;
  }

  /// Whether configuration is valid.
  bool get isValid {
    return hasValidVolume && hasValidRate && !networkTimeout.isNegative && !bufferDuration.isNegative;
  }
}
