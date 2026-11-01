import 'package:equatable/equatable.dart';

/// Playback speed value object.
///
/// Represents playback speed multiplier.
///
/// Examples:
///
/// 0.5  -> half speed
/// 1.0  -> normal speed
/// 2.0  -> double speed
///
/// Does not:
///
/// - control player backend
/// - change playback state
final class PlaybackRate extends Equatable {
  const PlaybackRate({required this.value});

  /// Normal playback speed.
  const PlaybackRate.normal() : value = 1.0;

  /// Slow playback.
  const PlaybackRate.slow() : value = 0.5;

  /// Fast playback.
  const PlaybackRate.fast() : value = 2.0;

  /// Creates from double.
  factory PlaybackRate.from(double value) {
    return PlaybackRate(value: value);
  }

  /// Speed multiplier.
  final double value;

  /// Minimum supported rate.
  static const double min = 0.25;

  /// Maximum supported rate.
  static const double max = 4.0;

  /// Whether rate is valid.
  bool get isValid {
    return value >= min && value <= max;
  }

  /// Whether normal speed.
  bool get isNormal {
    return value == 1.0;
  }

  /// Whether slower than normal.
  bool get isSlow {
    return value < 1.0;
  }

  /// Whether faster than normal.
  bool get isFast {
    return value > 1.0;
  }

  /// Safe normalized value.
  double get normalized {
    if (value < min) {
      return min;
    }

    if (value > max) {
      return max;
    }

    return value;
  }

  /// Creates copy.
  PlaybackRate copyWith(double value) {
    return PlaybackRate(value: value);
  }

  Map<String, dynamic> toMap() {
    return {'value': value};
  }

  factory PlaybackRate.fromMap(Map<String, dynamic> map) {
    return PlaybackRate(value: map['value'] as double? ?? 1.0);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return 'PlaybackRate(${value}x)';
  }
}
