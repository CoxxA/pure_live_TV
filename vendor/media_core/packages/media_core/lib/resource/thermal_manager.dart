import 'package:media_core/resource/thermal_state.dart';
import 'package:media_core/resource/resource_pressure.dart';

/// Manages device thermal resource state.
///
/// [ThermalManager] represents thermal information
/// inside the media core resource layer.
///
/// It does not directly access platform thermal APIs.
///
/// Responsibilities:
///
/// - store current thermal state
/// - evaluate thermal pressure
/// - expose thermal information
/// - convert thermal state into resource pressure
///
/// It does not:
///
/// - read hardware temperature
/// - control CPU frequency
/// - control GPU frequency
/// - modify decoder configuration
/// - change playback state
///
/// Those responsibilities belong to:
///
/// - Platform thermal APIs
/// - Platform integration layer
/// - ResourceManager
///
/// Thermal flow:
///
/// ```text
///
/// Platform Thermal API
///          |
///          v
///   ThermalManager.update()
///          |
///          v
///    ThermalState
///          |
///          v
/// ResourcePressure
///          |
///          v
/// ResourceManager
///
/// ```
final class ThermalManager {
  /// Creates thermal manager.
  ThermalManager({this.initialState = ThermalState.normal}) : _state = initialState;

  /// Initial thermal state.
  final ThermalState initialState;

  /// Current thermal state.
  ThermalState _state;

  /// Current thermal state.
  ThermalState get state {
    return _state;
  }

  /// Current thermal resource pressure.
  ///
  /// Converts thermal state into
  /// unified resource pressure.
  ResourcePressure get pressure {
    switch (_state) {
      case ThermalState.normal:
        return ResourcePressure.none;

      case ThermalState.warm:
        return ResourcePressure.warning;

      case ThermalState.hot:
        return ResourcePressure.critical;

      case ThermalState.critical:
        return ResourcePressure.emergency;
    }
  }

  /// Whether thermal limitation exists.
  bool get hasPressure {
    return pressure != ResourcePressure.none;
  }

  /// Whether device requires reduction.
  bool get requiresReduction {
    return _state.requiresReduction;
  }

  /// Whether emergency thermal handling
  /// is required.
  bool get isCritical {
    return _state.isCritical;
  }

  /// Updates thermal state.
  ///
  /// This only updates internal state.
  ///
  /// It does not:
  ///
  /// - read sensors
  /// - throttle hardware
  /// - change playback
  void update(ThermalState value) {
    _state = value;
  }

  /// Resets thermal state.
  void reset() {
    _state = ThermalState.normal;
  }

  /// Creates thermal snapshot.
  ThermalSnapshot snapshot() {
    return ThermalSnapshot(state: _state, pressure: pressure);
  }

  @override
  String toString() {
    return 'ThermalManager('
        'state=$_state, '
        'pressure=$pressure'
        ')';
  }
}

/// Immutable thermal state snapshot.
///
/// This object only represents
/// thermal information.
///
/// It does not manage resources.
final class ThermalSnapshot {
  /// Creates thermal snapshot.
  const ThermalSnapshot({required this.state, required this.pressure});

  /// Current thermal state.
  final ThermalState state;

  /// Current resource pressure.
  final ResourcePressure pressure;

  /// Whether thermal pressure exists.
  bool get hasPressure {
    return pressure != ResourcePressure.none;
  }

  /// Whether emergency state exists.
  bool get isCritical {
    return state.isCritical;
  }

  @override
  String toString() {
    return 'ThermalSnapshot('
        'state=$state, '
        'pressure=$pressure'
        ')';
  }
}
