/// Defines player visibility policies.
///
/// [VisibilityPolicy] controls player behavior
/// when visibility changes.
///
/// Responsibilities:
///
/// - invisible player handling
/// - auto pause rules
/// - resource optimization
/// - active player priority
///
/// It does not:
///
/// - calculate visibility percentage
/// - observe UI changes
/// - control playback directly
///
/// Those belong to:
///
/// - VisibilityController
/// - VisibilityObserver
final class VisibilityPolicy {
  /// Creates visibility policy.
  const VisibilityPolicy({
    this.enabled = true,

    this.pauseWhenInvisible = true,

    this.invisibleThreshold = 0.05,

    this.releaseWhenInvisible = false,

    this.releaseDelay = const Duration(seconds: 30),

    this.keepFirstVisibleActive = true,

    this.allowMultipleVisiblePlayers = true,

    this.maxActiveVisiblePlayers = 2,

    this.resumeWhenVisible = true,
  });

  /// Whether visibility management is enabled.
  final bool enabled;

  /// Pause playback when player becomes invisible.
  final bool pauseWhenInvisible;

  /// Visibility ratio threshold.
  ///
  /// Example:
  ///
  /// 0.05 means less than 5% visible.
  final double invisibleThreshold;

  /// Whether resources should be released
  /// when invisible.
  final bool releaseWhenInvisible;

  /// Delay before releasing invisible player.
  final Duration releaseDelay;

  /// Whether first visible player gets priority.
  final bool keepFirstVisibleActive;

  /// Whether multiple visible players
  /// are allowed.
  final bool allowMultipleVisiblePlayers;

  /// Maximum active visible players.
  final int maxActiveVisiblePlayers;

  /// Whether playback resumes when visible again.
  final bool resumeWhenVisible;

  /// Checks whether visibility is considered
  /// invisible.
  bool isInvisible(double ratio) {
    if (!enabled) {
      return false;
    }

    return ratio < invisibleThreshold;
  }

  /// Checks whether player can stay active.
  bool canRemainActive(int activeCount) {
    if (!enabled) {
      return true;
    }

    if (!allowMultipleVisiblePlayers) {
      return activeCount == 0;
    }

    return activeCount < maxActiveVisiblePlayers;
  }

  /// Whether invisible player should pause.
  bool shouldPauseInvisible() {
    return enabled && pauseWhenInvisible;
  }

  /// Whether invisible player should release.
  bool shouldReleaseInvisible() {
    return enabled && releaseWhenInvisible;
  }

  /// Creates modified policy.
  VisibilityPolicy copyWith({
    bool? enabled,

    bool? pauseWhenInvisible,

    double? invisibleThreshold,

    bool? releaseWhenInvisible,

    Duration? releaseDelay,

    bool? keepFirstVisibleActive,

    bool? allowMultipleVisiblePlayers,

    int? maxActiveVisiblePlayers,

    bool? resumeWhenVisible,
  }) {
    return VisibilityPolicy(
      enabled: enabled ?? this.enabled,

      pauseWhenInvisible: pauseWhenInvisible ?? this.pauseWhenInvisible,

      invisibleThreshold: invisibleThreshold ?? this.invisibleThreshold,

      releaseWhenInvisible: releaseWhenInvisible ?? this.releaseWhenInvisible,

      releaseDelay: releaseDelay ?? this.releaseDelay,

      keepFirstVisibleActive: keepFirstVisibleActive ?? this.keepFirstVisibleActive,

      allowMultipleVisiblePlayers: allowMultipleVisiblePlayers ?? this.allowMultipleVisiblePlayers,

      maxActiveVisiblePlayers: maxActiveVisiblePlayers ?? this.maxActiveVisiblePlayers,

      resumeWhenVisible: resumeWhenVisible ?? this.resumeWhenVisible,
    );
  }

  @override
  String toString() {
    return 'VisibilityPolicy('
        'pause=$pauseWhenInvisible, '
        'threshold=$invisibleThreshold, '
        'maxActive=$maxActiveVisiblePlayers'
        ')';
  }
}
