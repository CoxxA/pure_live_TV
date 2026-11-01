import 'package:equatable/equatable.dart';

/// Playback configuration options.
///
/// Defines playback behavior before starting playback.
///
/// Does not:
///
/// - represent runtime state
/// - control player backend
/// - perform playback operations
final class PlaybackOptions extends Equatable {
  const PlaybackOptions({
    this.autoPlay = false,
    this.loop = false,
    this.muted = false,
    this.startPosition = Duration.zero,
    this.volume = 1.0,
    this.rate = 1.0,
    this.allowBackgroundPlayback = false,
  });

  /// Default options.
  const PlaybackOptions.defaults()
    : autoPlay = false,
      loop = false,
      muted = false,
      startPosition = Duration.zero,
      volume = 1.0,
      rate = 1.0,
      allowBackgroundPlayback = false;

  /// Automatically start playback.
  final bool autoPlay;

  /// Loop playback.
  final bool loop;

  /// Start muted.
  final bool muted;

  /// Initial seek position.
  final Duration startPosition;

  /// Initial volume.
  ///
  /// Range:
  ///
  /// 0.0 - 1.0
  final double volume;

  /// Initial playback speed.
  final double rate;

  /// Allow background playback.
  final bool allowBackgroundPlayback;

  /// Whether volume is valid.
  bool get hasValidVolume => volume >= 0 && volume <= 1;

  /// Whether rate is valid.
  bool get hasValidRate => rate > 0;

  /// Creates copy.
  PlaybackOptions copyWith({
    bool? autoPlay,
    bool? loop,
    bool? muted,
    Duration? startPosition,
    double? volume,
    double? rate,
    bool? allowBackgroundPlayback,
  }) {
    return PlaybackOptions(
      autoPlay: autoPlay ?? this.autoPlay,

      loop: loop ?? this.loop,

      muted: muted ?? this.muted,

      startPosition: startPosition ?? this.startPosition,

      volume: volume ?? this.volume,

      rate: rate ?? this.rate,

      allowBackgroundPlayback: allowBackgroundPlayback ?? this.allowBackgroundPlayback,
    );
  }

  /// Convert to map.
  Map<String, dynamic> toMap() {
    return {
      'autoPlay': autoPlay,
      'loop': loop,
      'muted': muted,
      'startPosition': startPosition.inMilliseconds,
      'volume': volume,
      'rate': rate,
      'allowBackgroundPlayback': allowBackgroundPlayback,
    };
  }

  factory PlaybackOptions.fromMap(Map<String, dynamic> map) {
    return PlaybackOptions(
      autoPlay: map['autoPlay'] as bool? ?? false,

      loop: map['loop'] as bool? ?? false,

      muted: map['muted'] as bool? ?? false,

      startPosition: Duration(milliseconds: map['startPosition'] as int? ?? 0),

      volume: map['volume'] as double? ?? 1.0,

      rate: map['rate'] as double? ?? 1.0,

      allowBackgroundPlayback: map['allowBackgroundPlayback'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [autoPlay, loop, muted, startPosition, volume, rate, allowBackgroundPlayback];

  @override
  String toString() {
    return 'PlaybackOptions('
        'autoPlay=$autoPlay, '
        'loop=$loop, '
        'muted=$muted, '
        'volume=$volume, '
        'rate=$rate)';
  }
}
