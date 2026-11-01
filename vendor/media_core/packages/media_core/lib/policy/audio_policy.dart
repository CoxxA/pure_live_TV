/// Defines audio behavior policies.
///
/// [AudioPolicy] controls how the player
/// interacts with audio resources.
///
/// Responsibilities:
///
/// - audio focus behavior
/// - background audio behavior
/// - volume behavior
/// - mute behavior
///
/// It does not:
///
/// - request system audio focus
/// - control hardware volume
/// - manage audio session
///
/// Those belong to:
///
/// - AudioManager
/// - AudioFocus
/// - AudioSession
final class AudioPolicy {
  /// Creates audio policy.
  const AudioPolicy({
    this.enableAudioFocus = true,

    this.pauseOnAudioLoss = true,

    this.duckOnAudioLoss = false,

    this.allowBackgroundPlayback = false,

    this.restoreVolume = true,

    this.defaultVolume = 1.0,

    this.startMuted = false,

    this.keepAudioWhenVideoHidden = false,
  });

  /// Whether audio focus management is enabled.
  final bool enableAudioFocus;

  /// Whether playback pauses when
  /// audio focus is lost.
  final bool pauseOnAudioLoss;

  /// Whether volume should be reduced
  /// instead of pausing when audio focus is lost.
  final bool duckOnAudioLoss;

  /// Whether playback can continue
  /// while application is in background.
  final bool allowBackgroundPlayback;

  /// Whether previous volume should be restored.
  final bool restoreVolume;

  /// Default playback volume.
  ///
  /// Range:
  ///
  /// 0.0 - 1.0
  final double defaultVolume;

  /// Whether player starts muted.
  final bool startMuted;

  /// Whether audio should continue when
  /// video surface is hidden.
  ///
  /// Useful for:
  ///
  /// - audio-only playback
  /// - background radio
  final bool keepAudioWhenVideoHidden;

  /// Whether audio focus loss should pause.
  bool shouldPauseOnFocusLoss() {
    return enableAudioFocus && pauseOnAudioLoss;
  }

  /// Whether audio focus loss should duck.
  bool shouldDuckOnFocusLoss() {
    return enableAudioFocus && duckOnAudioLoss && !pauseOnAudioLoss;
  }

  /// Creates modified policy.
  AudioPolicy copyWith({
    bool? enableAudioFocus,

    bool? pauseOnAudioLoss,

    bool? duckOnAudioLoss,

    bool? allowBackgroundPlayback,

    bool? restoreVolume,

    double? defaultVolume,

    bool? startMuted,

    bool? keepAudioWhenVideoHidden,
  }) {
    return AudioPolicy(
      enableAudioFocus: enableAudioFocus ?? this.enableAudioFocus,

      pauseOnAudioLoss: pauseOnAudioLoss ?? this.pauseOnAudioLoss,

      duckOnAudioLoss: duckOnAudioLoss ?? this.duckOnAudioLoss,

      allowBackgroundPlayback: allowBackgroundPlayback ?? this.allowBackgroundPlayback,

      restoreVolume: restoreVolume ?? this.restoreVolume,

      defaultVolume: defaultVolume ?? this.defaultVolume,

      startMuted: startMuted ?? this.startMuted,

      keepAudioWhenVideoHidden: keepAudioWhenVideoHidden ?? this.keepAudioWhenVideoHidden,
    );
  }

  @override
  String toString() {
    return 'AudioPolicy('
        'focus=$enableAudioFocus, '
        'background=$allowBackgroundPlayback, '
        'volume=$defaultVolume'
        ')';
  }
}
