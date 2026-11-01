import 'package:equatable/equatable.dart';

/// Defines network bandwidth limitations.
///
/// [BandwidthBudget] describes the maximum network
/// bandwidth that the media core should consume.
///
/// It is a configuration object used by:
///
/// - BandwidthManager
/// - ResourceManager
///
/// It does not:
///
/// - measure network speed
/// - monitor active connections
/// - throttle network traffic
/// - change player quality directly
///
/// Those responsibilities belong to:
///
/// - BandwidthManager
/// - NetworkMonitor
/// - QualityController
///
/// Bandwidth flow:
///
/// ```text
/// BandwidthBudget
///        |
///        | defines limits
///        v
///
/// BandwidthManager
///        |
///        | runtime monitoring
///        v
///
/// ResourceManager
///        |
///        +--> reduce quality
///        +--> stop preload
///        +--> switch stream
/// ```
final class BandwidthBudget extends Equatable {
  /// Creates bandwidth budget.
  const BandwidthBudget({
    /// Maximum total bandwidth.
    ///
    /// Unit:
    ///
    /// Mbps
    this.maxMbps = 20.0,

    /// Warning threshold.
    ///
    /// When bandwidth exceeds this value,
    /// quality reduction may be considered.
    ///
    /// Unit:
    ///
    /// Mbps
    this.warningMbps = 15.0,

    /// Critical threshold.
    ///
    /// When bandwidth exceeds this value,
    /// aggressive reduction may be required.
    ///
    /// Unit:
    ///
    /// Mbps
    this.criticalMbps = 18.0,

    /// Whether bandwidth management
    /// is enabled.
    this.enabled = true,
  });

  /// Maximum allowed bandwidth.
  final double maxMbps;

  /// Warning bandwidth threshold.
  final double warningMbps;

  /// Critical bandwidth threshold.
  final double criticalMbps;

  /// Whether bandwidth limitation
  /// is enabled.
  final bool enabled;

  /// Whether bandwidth usage is above
  /// warning level.
  bool isWarning(double currentMbps) {
    if (!enabled) {
      return false;
    }

    return currentMbps >= warningMbps;
  }

  /// Whether bandwidth usage is critical.
  bool isCritical(double currentMbps) {
    if (!enabled) {
      return false;
    }

    return currentMbps >= criticalMbps;
  }

  /// Whether bandwidth limit is exceeded.
  bool isExceeded(double currentMbps) {
    if (!enabled) {
      return false;
    }

    return currentMbps >= maxMbps;
  }

  /// Returns remaining bandwidth.
  double remainingMbps(double currentMbps) {
    final remaining = maxMbps - currentMbps;

    if (remaining < 0) {
      return 0;
    }

    return remaining;
  }

  /// Creates modified bandwidth budget.
  BandwidthBudget copyWith({double? maxMbps, double? warningMbps, double? criticalMbps, bool? enabled}) {
    return BandwidthBudget(
      maxMbps: maxMbps ?? this.maxMbps,

      warningMbps: warningMbps ?? this.warningMbps,

      criticalMbps: criticalMbps ?? this.criticalMbps,

      enabled: enabled ?? this.enabled,
    );
  }

  @override
  List<Object?> get props => [maxMbps, warningMbps, criticalMbps, enabled];

  @override
  String toString() {
    return 'BandwidthBudget('
        'max=${maxMbps}Mbps, '
        'warning=${warningMbps}Mbps, '
        'critical=${criticalMbps}Mbps, '
        'enabled=$enabled'
        ')';
  }
}
