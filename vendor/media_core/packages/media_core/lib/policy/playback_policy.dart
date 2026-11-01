/// Defines playback behavior policies.
///
/// [PlaybackPolicy] controls how playback
/// should behave during runtime.
///
/// Responsibilities:
///
/// - autoplay behavior
/// - seek behavior
/// - looping behavior
/// - buffering behavior
///
/// It does not:
///
/// - execute playback commands
/// - store playback state
///
/// Those belong to:
///
/// - PlaybackController
/// - PlaybackState
/// - PlayerSession
final class PlaybackPolicy {
  /// Creates playback policy.
  const PlaybackPolicy({
    this.autoPlay = true,

    this.allowSeek = true,

    this.allowBackwardSeek = true,

    this.loop = false,

    this.pauseOnBuffering = false,

    this.resumeAfterBuffering = true,

    this.startPosition,

    this.maxSeekSeconds = const Duration(seconds: 30),
  });

  /// Whether playback starts automatically.
  final bool autoPlay;

  /// Whether seeking is allowed.
  final bool allowSeek;

  /// Whether backward seeking is allowed.
  final bool allowBackwardSeek;

  /// Whether playback should repeat.
  final bool loop;

  /// Whether player pauses when buffering.
  final bool pauseOnBuffering;

  /// Whether playback resumes after buffering.
  final bool resumeAfterBuffering;

  /// Default start position in seconds.
  final Duration? startPosition;

  /// Maximum seek step.
  final Duration maxSeekSeconds;

  /// Whether seeking forward is supported.
  bool get canSeekForward {
    return allowSeek;
  }

  /// Whether seeking backward is supported.
  bool get canSeekBackward {
    return allowSeek && allowBackwardSeek;
  }

  /// Creates modified policy.
  PlaybackPolicy copyWith({
    bool? autoPlay,

    bool? allowSeek,

    bool? allowBackwardSeek,

    bool? loop,

    bool? pauseOnBuffering,

    bool? resumeAfterBuffering,

    Duration? startPosition,

    Duration? maxSeekSeconds,
  }) {
    return PlaybackPolicy(
      autoPlay: autoPlay ?? this.autoPlay,

      allowSeek: allowSeek ?? this.allowSeek,

      allowBackwardSeek: allowBackwardSeek ?? this.allowBackwardSeek,

      loop: loop ?? this.loop,

      pauseOnBuffering: pauseOnBuffering ?? this.pauseOnBuffering,

      resumeAfterBuffering: resumeAfterBuffering ?? this.resumeAfterBuffering,

      startPosition: startPosition ?? this.startPosition,

      maxSeekSeconds: maxSeekSeconds ?? this.maxSeekSeconds,
    );
  }

  @override
  String toString() {
    return 'PlaybackPolicy('
        'autoPlay=$autoPlay, '
        'seek=$allowSeek, '
        'loop=$loop'
        ')';
  }
}
