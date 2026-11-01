import 'package:equatable/equatable.dart';

/// Playback duration value object.
///
/// Represents total media duration.
///
/// Does not:
///
/// - control playback
/// - perform seeking
/// - calculate renderer layout
final class PlaybackDuration extends Equatable {
  const PlaybackDuration({required this.value});

  /// Zero duration.
  const PlaybackDuration.zero() : value = Duration.zero;

  /// Creates from milliseconds.
  factory PlaybackDuration.fromMilliseconds(int milliseconds) {
    return PlaybackDuration(value: Duration(milliseconds: milliseconds));
  }

  /// Total duration.
  final Duration value;

  /// Milliseconds.
  int get milliseconds => value.inMilliseconds;

  /// Seconds.
  double get seconds => value.inMilliseconds / 1000;

  /// Whether duration exists.
  bool get isValid => milliseconds > 0;

  /// Whether unknown duration.
  bool get isUnknown => value == Duration.zero;

  /// Compare.
  bool operator <(PlaybackDuration other) {
    return value < other.value;
  }

  bool operator >(PlaybackDuration other) {
    return value > other.value;
  }

  /// Creates remaining duration.
  Duration remaining(Duration position) {
    final result = value - position;

    if (result < Duration.zero) {
      return Duration.zero;
    }

    return result;
  }

  /// Calculates progress.
  double progress(Duration position) {
    if (!isValid) {
      return 0;
    }

    final result = position.inMilliseconds / milliseconds;

    if (result < 0) {
      return 0;
    }

    if (result > 1) {
      return 1;
    }

    return result;
  }

  Map<String, dynamic> toMap() {
    return {'milliseconds': milliseconds};
  }

  factory PlaybackDuration.fromMap(Map<String, dynamic> map) {
    return PlaybackDuration.fromMilliseconds(map['milliseconds'] as int? ?? 0);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return 'PlaybackDuration('
        '${value.inMilliseconds}ms)';
  }
}
