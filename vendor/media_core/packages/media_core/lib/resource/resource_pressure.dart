import 'package:equatable/equatable.dart';

/// Represents resource pressure level.
///
/// [ResourcePressure] is a unified resource
/// pressure abstraction used by the media core.
///
/// It combines pressure concepts from:
///
/// - memory usage
/// - bandwidth usage
/// - thermal state
/// - decoder availability
///
/// It is consumed by:
///
/// - ResourceManager
/// - PreloadManager
/// - PlayerPool
/// - QualityController
///
/// It does not:
///
/// - measure resources
/// - release resources
/// - modify playback
/// - control system hardware
///
/// Those responsibilities belong to:
///
/// - MemoryManager
/// - BandwidthManager
/// - ThermalManager
/// - DecoderManager
///
/// Pressure flow:
///
/// ```text
/// MemoryManager
///        |
/// BandwidthManager
///        |
/// ThermalManager
///        |
/// DecoderManager
///        |
///        v
/// ResourcePressure
///        |
///        v
/// ResourceManager
/// ```
enum ResourcePressure {
  /// No resource pressure.
  ///
  /// System resources are healthy.
  none,

  /// Minor resource pressure.
  ///
  /// Recommended actions:
  ///
  /// - monitor usage
  /// - avoid increasing load
  warning,

  /// Significant resource pressure.
  ///
  /// Recommended actions:
  ///
  /// - stop unnecessary preload
  /// - reduce background work
  /// - lower quality if required
  critical,

  /// Emergency resource pressure.
  ///
  /// Recommended actions:
  ///
  /// - release resources immediately
  /// - stop optional workloads
  /// - reduce active players
  emergency;

  /// Returns human readable name.
  String get label {
    switch (this) {
      case ResourcePressure.none:
        return 'none';

      case ResourcePressure.warning:
        return 'warning';

      case ResourcePressure.critical:
        return 'critical';

      case ResourcePressure.emergency:
        return 'emergency';
    }
  }

  /// Whether any pressure exists.
  bool get hasPressure {
    return this != ResourcePressure.none;
  }

  /// Whether quality reduction should
  /// be considered.
  bool get shouldReduceQuality {
    return this == ResourcePressure.warning || this == ResourcePressure.critical || this == ResourcePressure.emergency;
  }

  /// Whether preload should stop.
  bool get shouldStopPreload {
    return this == ResourcePressure.critical || this == ResourcePressure.emergency;
  }

  /// Whether resources should be released.
  bool get shouldReleaseResources {
    return this == ResourcePressure.emergency;
  }

  /// Returns pressure priority.
  ///
  /// Higher values represent stronger pressure.
  int get priority {
    switch (this) {
      case ResourcePressure.none:
        return 0;

      case ResourcePressure.warning:
        return 1;

      case ResourcePressure.critical:
        return 2;

      case ResourcePressure.emergency:
        return 3;
    }
  }

  /// Compares pressure severity.
  bool isHigherThan(ResourcePressure other) {
    return priority > other.priority;
  }

  /// Returns stronger pressure.
  static ResourcePressure max(ResourcePressure a, ResourcePressure b) {
    return a.priority >= b.priority ? a : b;
  }

  @override
  String toString() {
    return label;
  }
}

/// Immutable resource pressure snapshot.
///
/// Used when resource pressure needs
/// to be passed between managers.
///
/// It does not:
///
/// - calculate pressure
/// - update pressure
/// - trigger actions
final class ResourcePressureSnapshot extends Equatable {
  /// Creates resource pressure snapshot.
  const ResourcePressureSnapshot({required this.pressure, required this.timestamp});

  /// Current pressure level.
  final ResourcePressure pressure;

  /// Snapshot timestamp.
  final DateTime timestamp;

  /// Whether pressure exists.
  bool get hasPressure {
    return pressure.hasPressure;
  }

  /// Whether emergency handling
  /// is required.
  bool get isEmergency {
    return pressure == ResourcePressure.emergency;
  }

  /// Creates modified snapshot.
  ResourcePressureSnapshot copyWith({ResourcePressure? pressure, DateTime? timestamp}) {
    return ResourcePressureSnapshot(pressure: pressure ?? this.pressure, timestamp: timestamp ?? this.timestamp);
  }

  @override
  List<Object?> get props => [pressure, timestamp];

  @override
  String toString() {
    return 'ResourcePressureSnapshot('
        'pressure=$pressure, '
        'timestamp=$timestamp'
        ')';
  }
}
