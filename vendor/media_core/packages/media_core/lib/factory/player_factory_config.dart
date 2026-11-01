import 'package:media_core/policy/player_policy.dart';

/// Configuration used when creating a player.
///
/// [PlayerFactoryConfig] contains creation-time
/// options shared by the player runtime.
///
/// Responsibilities:
///
/// - define player creation options
/// - provide backend preferences
/// - provide runtime policies
///
/// It does not:
///
/// - create player
/// - select backend
/// - manage lifecycle
///
/// Those belong to:
///
/// - PlayerFactory
/// - BackendSelector
/// - PlayerSession
final class PlayerFactoryConfig {
  /// Creates player factory configuration.
  const PlayerFactoryConfig({
    this.preferredBackend,

    this.platform,

    this.autoInitialize = true,

    this.enableDiagnostics = false,

    this.enableHardwareDecode = true,

    this.enableFallback = true,

    this.policy,
  });

  /// Preferred backend id.
  ///
  /// Example:
  ///
  /// media_kit
  /// vlc
  final String? preferredBackend;

  /// Runtime platform.
  ///
  /// Example:
  ///
  /// android
  /// windows
  /// macos
  final String? platform;

  /// Whether player should initialize
  /// immediately after creation.
  final bool autoInitialize;

  /// Enables diagnostics collection.
  final bool enableDiagnostics;

  /// Enables hardware decoding preference.
  final bool enableHardwareDecode;

  /// Enables backend fallback.
  final bool enableFallback;

  /// Optional player policy.
  ///
  /// Policies control:
  ///
  /// - playback behavior
  /// - resource usage
  /// - recovery
  final PlayerPolicy? policy;

  /// Whether a backend was explicitly selected.
  bool get hasPreferredBackend {
    return preferredBackend != null && preferredBackend!.isNotEmpty;
  }

  /// Creates a copy with changed values.
  PlayerFactoryConfig copyWith({
    String? preferredBackend,

    String? platform,

    bool? autoInitialize,

    bool? enableDiagnostics,

    bool? enableHardwareDecode,

    bool? enableFallback,

    PlayerPolicy? policy,
  }) {
    return PlayerFactoryConfig(
      preferredBackend: preferredBackend ?? this.preferredBackend,

      platform: platform ?? this.platform,

      autoInitialize: autoInitialize ?? this.autoInitialize,

      enableDiagnostics: enableDiagnostics ?? this.enableDiagnostics,

      enableHardwareDecode: enableHardwareDecode ?? this.enableHardwareDecode,

      enableFallback: enableFallback ?? this.enableFallback,

      policy: policy ?? this.policy,
    );
  }

  @override
  String toString() {
    return 'PlayerFactoryConfig('
        'backend=$preferredBackend, '
        'platform=$platform, '
        'diagnostics=$enableDiagnostics'
        ')';
  }
}
