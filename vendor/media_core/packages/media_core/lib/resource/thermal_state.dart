/// Represents thermal condition of the device.
///
/// [ThermalState] describes the current thermal
/// status that may affect media playback performance.
///
/// Thermal state is used by:
///
/// - ThermalManager
/// - ResourceManager
/// - QualityController
///
/// It does not:
///
/// - read device temperature
/// - control CPU frequency
/// - change decoder configuration
/// - modify playback directly
///
/// Those responsibilities belong to:
///
/// - Platform thermal APIs
/// - ThermalManager
/// - ResourceManager
///
/// Thermal flow:
///
/// ```text
/// Platform Thermal API
///          |
///          v
/// ThermalManager
///          |
///          v
/// ThermalState
///          |
///          +--> ResourceManager
///          +--> QualityController
/// ```
enum ThermalState {
  /// Device temperature is normal.
  ///
  /// No resource reduction is required.
  normal,

  /// Device is becoming warm.
  ///
  /// Resource monitoring should increase.
  warm,

  /// Device is hot.
  ///
  /// Resource reduction may be required.
  hot,

  /// Device temperature is critical.
  ///
  /// Aggressive resource reduction may
  /// be required to maintain stability.
  critical;

  /// Creates a display name.
  String get label {
    switch (this) {
      case ThermalState.normal:
        return 'normal';

      case ThermalState.warm:
        return 'warm';

      case ThermalState.hot:
        return 'hot';

      case ThermalState.critical:
        return 'critical';
    }
  }

  /// Whether thermal limitation exists.
  bool get isLimited {
    return this != ThermalState.normal;
  }

  /// Whether aggressive throttling is required.
  bool get requiresReduction {
    return this == ThermalState.hot || this == ThermalState.critical;
  }

  /// Whether emergency handling is required.
  bool get isCritical {
    return this == ThermalState.critical;
  }

  @override
  String toString() {
    return label;
  }
}
