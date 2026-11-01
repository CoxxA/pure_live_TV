import 'package:media_core/resource/bandwidth_budget.dart';
import 'package:media_core/resource/resource_pressure.dart';

/// Manages runtime network bandwidth usage.
///
/// [BandwidthManager] tracks bandwidth consumption
/// inside the media core resource layer.
///
/// Responsibilities:
///
/// - track current bandwidth usage
/// - evaluate bandwidth pressure
/// - enforce bandwidth budget
/// - provide bandwidth statistics
///
/// It does not:
///
/// - control network connections
/// - throttle streams directly
/// - change media quality
/// - manage player lifecycle
///
/// Those responsibilities belong to:
///
/// - PlayerController
/// - QualityController
/// - NetworkLayer
///
/// Bandwidth flow:
///
/// ```text
/// Runtime Components
///          |
///          v
/// BandwidthManager
///          |
///          v
/// BandwidthBudget
///          |
///          v
/// ResourcePressure
///          |
///          v
/// ResourceManager
/// ```
final class BandwidthManager {
  /// Creates bandwidth manager.
  BandwidthManager({required this.budget});

  /// Bandwidth limitation policy.
  final BandwidthBudget budget;

  /// Current bandwidth usage.
  ///
  /// Unit:
  ///
  /// Mbps
  double _currentMbps = 0;

  /// Current bandwidth usage.
  double get currentMbps {
    return _currentMbps;
  }

  /// Whether bandwidth pressure exists.
  bool get hasPressure {
    return pressure != ResourcePressure.none;
  }

  /// Current bandwidth pressure.
  ///
  /// Converts bandwidth usage into
  /// resource pressure.
  ResourcePressure get pressure {
    if (!budget.enabled) {
      return ResourcePressure.none;
    }

    if (budget.isExceeded(_currentMbps)) {
      return ResourcePressure.emergency;
    }

    if (budget.isCritical(_currentMbps)) {
      return ResourcePressure.critical;
    }

    if (budget.isWarning(_currentMbps)) {
      return ResourcePressure.warning;
    }

    return ResourcePressure.none;
  }

  /// Whether bandwidth limit is exceeded.
  bool get exceeded {
    return pressure == ResourcePressure.emergency;
  }

  /// Updates current bandwidth usage.
  ///
  /// This only updates accounting.
  ///
  /// It does not:
  ///
  /// - stop network requests
  /// - modify streams
  void updateUsage(double mbps) {
    _currentMbps = mbps < 0 ? 0 : mbps;
  }

  /// Adds bandwidth usage.
  ///
  /// Used when a component reports
  /// additional network consumption.
  void addUsage(double mbps) {
    if (mbps <= 0) {
      return;
    }

    _currentMbps += mbps;
  }

  /// Removes bandwidth usage.
  void removeUsage(double mbps) {
    if (mbps <= 0) {
      return;
    }

    _currentMbps -= mbps;

    if (_currentMbps < 0) {
      _currentMbps = 0;
    }
  }

  /// Returns remaining bandwidth capacity.
  double get remainingMbps {
    return budget.remainingMbps(_currentMbps);
  }

  /// Whether quality reduction is recommended.
  bool get shouldReduceQuality {
    return pressure == ResourcePressure.critical || pressure == ResourcePressure.emergency;
  }

  /// Creates bandwidth snapshot.
  BandwidthUsageSnapshot snapshot() {
    return BandwidthUsageSnapshot(bandwidthMbps: _currentMbps, pressure: pressure);
  }

  /// Resets bandwidth accounting.
  void clear() {
    _currentMbps = 0;
  }

  @override
  String toString() {
    return 'BandwidthManager('
        'bandwidth=${_currentMbps}Mbps, '
        'pressure=$pressure'
        ')';
  }
}

/// Immutable bandwidth usage snapshot.
///
/// This object is only a read-only view.
///
/// It does not perform resource operations.
final class BandwidthUsageSnapshot {
  /// Creates bandwidth snapshot.
  const BandwidthUsageSnapshot({required this.bandwidthMbps, required this.pressure});

  /// Current bandwidth usage.
  final double bandwidthMbps;

  /// Current resource pressure.
  final ResourcePressure pressure;

  /// Whether pressure exists.
  bool get hasPressure {
    return pressure != ResourcePressure.none;
  }

  @override
  String toString() {
    return 'BandwidthUsageSnapshot('
        'bandwidth=${bandwidthMbps}Mbps, '
        'pressure=$pressure'
        ')';
  }
}
