/// Defines thermal management policies.
///
/// [ThermalPolicy] controls how the player
/// reacts to device thermal pressure.
///
/// Responsibilities:
///
/// - define thermal thresholds
/// - define quality reduction behavior
/// - define resource reduction strategy
///
/// It does not:
///
/// - read device temperature
/// - monitor thermal state
/// - control decoder directly
///
/// Those belong to:
///
/// - ThermalManager
/// - ResourceManager
/// - DecoderManager
final class ThermalPolicy {
  /// Creates thermal policy.
  const ThermalPolicy({
    this.enabled = true,

    this.warningLevel = 70,

    this.criticalLevel = 85,

    this.reduceQualityOnWarning = true,

    this.reduceFrameRateOnCritical = true,

    this.disablePreloadOnCritical = true,

    this.releaseIdlePlayersOnCritical = true,

    this.allowHardwareDecodeOnly = false,
  });

  /// Whether thermal management is enabled.
  final bool enabled;

  /// Temperature percentage where warning starts.
  ///
  /// Range:
  ///
  /// 0 - 100
  final int warningLevel;

  /// Temperature percentage considered critical.
  ///
  /// Range:
  ///
  /// 0 - 100
  final int criticalLevel;

  /// Whether playback quality should be reduced
  /// when warning level is reached.
  final bool reduceQualityOnWarning;

  /// Whether frame rate should be reduced
  /// under critical pressure.
  final bool reduceFrameRateOnCritical;

  /// Whether preload should be disabled
  /// under critical pressure.
  final bool disablePreloadOnCritical;

  /// Whether idle players should be released
  /// under critical pressure.
  final bool releaseIdlePlayersOnCritical;

  /// Whether only hardware decoding
  /// should be allowed.
  final bool allowHardwareDecodeOnly;

  /// Whether warning level is reached.
  bool isWarning(int thermalLevel) {
    if (!enabled) {
      return false;
    }

    return thermalLevel >= warningLevel && thermalLevel < criticalLevel;
  }

  /// Whether critical level is reached.
  bool isCritical(int thermalLevel) {
    if (!enabled) {
      return false;
    }

    return thermalLevel >= criticalLevel;
  }

  /// Creates modified policy.
  ThermalPolicy copyWith({
    bool? enabled,

    int? warningLevel,

    int? criticalLevel,

    bool? reduceQualityOnWarning,

    bool? reduceFrameRateOnCritical,

    bool? disablePreloadOnCritical,

    bool? releaseIdlePlayersOnCritical,

    bool? allowHardwareDecodeOnly,
  }) {
    return ThermalPolicy(
      enabled: enabled ?? this.enabled,

      warningLevel: warningLevel ?? this.warningLevel,

      criticalLevel: criticalLevel ?? this.criticalLevel,

      reduceQualityOnWarning: reduceQualityOnWarning ?? this.reduceQualityOnWarning,

      reduceFrameRateOnCritical: reduceFrameRateOnCritical ?? this.reduceFrameRateOnCritical,

      disablePreloadOnCritical: disablePreloadOnCritical ?? this.disablePreloadOnCritical,

      releaseIdlePlayersOnCritical: releaseIdlePlayersOnCritical ?? this.releaseIdlePlayersOnCritical,

      allowHardwareDecodeOnly: allowHardwareDecodeOnly ?? this.allowHardwareDecodeOnly,
    );
  }

  @override
  String toString() {
    return 'ThermalPolicy('
        'enabled=$enabled, '
        'warning=$warningLevel, '
        'critical=$criticalLevel'
        ')';
  }
}
