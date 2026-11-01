import 'package:equatable/equatable.dart';

/// Playback position value object.
///
/// Represents current playback timestamp.
///
/// Does not:
///
/// - perform seeking
/// - control player backend
/// - update playback state
final class PlaybackPosition extends Equatable {
  const PlaybackPosition({required this.value});

  /// Creates zero position.
  const PlaybackPosition.zero() : value = Duration.zero;

  /// Creates from milliseconds.
  factory PlaybackPosition.fromMilliseconds(int milliseconds) {
    return PlaybackPosition(value: Duration(milliseconds: milliseconds));
  }

  /// Current timestamp.
  final Duration value;

  /// Milliseconds.
  int get milliseconds => value.inMilliseconds;

  /// Seconds.
  double get seconds => value.inMilliseconds / 1000;

  /// Whether position is zero.
  bool get isZero => value == Duration.zero;

  /// Whether position is valid.
  bool get isValid => milliseconds >= 0;

  /// Adds offset.
  PlaybackPosition operator +(Duration offset) {
    return PlaybackPosition(value: value + offset);
  }

  /// Subtracts offset.
  PlaybackPosition operator -(Duration offset) {
    final result = value - offset;

    return PlaybackPosition(value: result < Duration.zero ? Duration.zero : result);
  }

  /// Compare.
  bool operator <(PlaybackPosition other) {
    return value < other.value;
  }

  bool operator >(PlaybackPosition other) {
    return value > other.value;
  }

  /// Convert map.
  Map<String, dynamic> toMap() {
    return {'milliseconds': milliseconds};
  }

  factory PlaybackPosition.fromMap(Map<String, dynamic> map) {
    return PlaybackPosition.fromMilliseconds(map['milliseconds'] as int? ?? 0);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return 'PlaybackPosition('
        '${value.inMilliseconds}ms)';
  }
}
