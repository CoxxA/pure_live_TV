/// Defines player lifecycle policies.
///
/// [LifecyclePolicy] controls how player
/// instances behave during lifecycle changes.
///
/// Responsibilities:
///
/// - background behavior
/// - inactive behavior
/// - visibility lifecycle rules
/// - resource release timing
///
/// It does not:
///
/// - observe lifecycle events
/// - pause/resume players
/// - dispose resources
///
/// Those belong to:
///
/// - LifecycleController
/// - PlayerSession
/// - ResourceManager
final class LifecyclePolicy {
  /// Creates lifecycle policy.
  const LifecyclePolicy({
    this.pauseWhenBackground = true,

    this.pauseWhenInactive = true,

    this.keepAliveInBackground = false,

    this.releaseWhenBackground = false,

    this.backgroundReleaseDelay = const Duration(minutes: 2),

    this.disposeWhenPageClosed = true,

    this.keepAudioInBackground = false,

    this.resumeAfterForeground = true,
  });

  /// Whether playback pauses when app
  /// enters background.
  final bool pauseWhenBackground;

  /// Whether playback pauses when app
  /// becomes inactive.
  final bool pauseWhenInactive;

  /// Whether player instance remains alive
  /// while application is backgrounded.
  final bool keepAliveInBackground;

  /// Whether player resources should be released
  /// when app enters background.
  final bool releaseWhenBackground;

  /// Delay before releasing background resources.
  final Duration backgroundReleaseDelay;

  /// Whether player should be disposed
  /// when page is closed.
  final bool disposeWhenPageClosed;

  /// Whether audio can continue
  /// in background.
  final bool keepAudioInBackground;

  /// Whether playback resumes after
  /// returning foreground.
  final bool resumeAfterForeground;

  /// Whether player should pause on background.
  bool shouldPauseForBackground() {
    return pauseWhenBackground;
  }

  /// Whether player should release resources.
  bool shouldReleaseForBackground() {
    return releaseWhenBackground;
  }

  /// Whether player should resume.
  bool shouldResumeAfterForeground() {
    return resumeAfterForeground;
  }

  /// Creates modified policy.
  LifecyclePolicy copyWith({
    bool? pauseWhenBackground,

    bool? pauseWhenInactive,

    bool? keepAliveInBackground,

    bool? releaseWhenBackground,

    Duration? backgroundReleaseDelay,

    bool? disposeWhenPageClosed,

    bool? keepAudioInBackground,

    bool? resumeAfterForeground,
  }) {
    return LifecyclePolicy(
      pauseWhenBackground: pauseWhenBackground ?? this.pauseWhenBackground,

      pauseWhenInactive: pauseWhenInactive ?? this.pauseWhenInactive,

      keepAliveInBackground: keepAliveInBackground ?? this.keepAliveInBackground,

      releaseWhenBackground: releaseWhenBackground ?? this.releaseWhenBackground,

      backgroundReleaseDelay: backgroundReleaseDelay ?? this.backgroundReleaseDelay,

      disposeWhenPageClosed: disposeWhenPageClosed ?? this.disposeWhenPageClosed,

      keepAudioInBackground: keepAudioInBackground ?? this.keepAudioInBackground,

      resumeAfterForeground: resumeAfterForeground ?? this.resumeAfterForeground,
    );
  }

  @override
  String toString() {
    return 'LifecyclePolicy('
        'pauseBackground=$pauseWhenBackground, '
        'releaseBackground=$releaseWhenBackground, '
        'resume=$resumeAfterForeground'
        ')';
  }
}
