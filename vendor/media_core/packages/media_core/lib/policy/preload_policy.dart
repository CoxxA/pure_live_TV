/// Defines player preload behavior.
///
/// [PreloadPolicy] controls how media resources
/// are prepared before actual playback.
///
/// Responsibilities:
///
/// - enable/disable preload
/// - limit preload count
/// - control preload timing
/// - control warmup behavior
///
/// It does not:
///
/// - execute preload tasks
/// - create players
/// - manage preload lifecycle
///
/// Those belong to:
///
/// - PreloadManager
/// - PreloadScheduler
final class PreloadPolicy {
  /// Creates preload policy.
  const PreloadPolicy({
    this.enabled = true,

    this.maxPreloadedPlayers = 2,

    this.preloadDuration = const Duration(seconds: 5),

    this.warmup = true,

    this.preloadAudio = true,

    this.preloadVideo = true,

    this.allowBackgroundPreload = false,
  });

  /// Whether preload is enabled.
  final bool enabled;

  /// Maximum number of preloaded players.
  ///
  /// Prevents excessive decoder/resource usage.
  final int maxPreloadedPlayers;

  /// Amount of media prepared ahead.
  final Duration preloadDuration;

  /// Whether decoder warmup is enabled.
  ///
  /// Warmup may create decoder resources
  /// before playback starts.
  final bool warmup;

  /// Whether audio track should be preloaded.
  final bool preloadAudio;

  /// Whether video frames should be preloaded.
  final bool preloadVideo;

  /// Whether preload is allowed when app
  /// is in background.
  final bool allowBackgroundPreload;

  /// Whether more preload slots are available.
  bool canPreload(int currentCount) {
    if (!enabled) {
      return false;
    }

    return currentCount < maxPreloadedPlayers;
  }

  /// Creates modified policy.
  PreloadPolicy copyWith({
    bool? enabled,

    int? maxPreloadedPlayers,

    Duration? preloadDuration,

    bool? warmup,

    bool? preloadAudio,

    bool? preloadVideo,

    bool? allowBackgroundPreload,
  }) {
    return PreloadPolicy(
      enabled: enabled ?? this.enabled,

      maxPreloadedPlayers: maxPreloadedPlayers ?? this.maxPreloadedPlayers,

      preloadDuration: preloadDuration ?? this.preloadDuration,

      warmup: warmup ?? this.warmup,

      preloadAudio: preloadAudio ?? this.preloadAudio,

      preloadVideo: preloadVideo ?? this.preloadVideo,

      allowBackgroundPreload: allowBackgroundPreload ?? this.allowBackgroundPreload,
    );
  }

  @override
  String toString() {
    return 'PreloadPolicy('
        'enabled=$enabled, '
        'max=$maxPreloadedPlayers, '
        'warmup=$warmup'
        ')';
  }
}
