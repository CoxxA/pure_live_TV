import 'package:equatable/equatable.dart';

/// Describes platform lifecycle capabilities.
///
/// [PlatformLifecycle] represents what lifecycle
/// behaviors are supported by the current platform.
///
/// Responsibilities:
///
/// - background playback capability
/// - suspend/resume capability
/// - lifecycle transition support
///
/// It does not:
///
/// - observe lifecycle events
/// - control player state
///
/// Those belong to:
///
/// - LifecycleManager
/// - PlayerSession
final class PlatformLifecycle extends Equatable {
  /// Creates lifecycle capabilities.
  const PlatformLifecycle({
    this.backgroundPlayback = false,

    this.pauseOnInactive = true,

    this.pauseOnBackground = true,

    this.resumeOnForeground = true,

    this.keepAudioAlive = false,

    this.suspendAllowed = true,

    this.restoreAfterSuspend = true,
  });

  /// Whether playback can continue in background.
  ///
  /// Example:
  ///
  /// - mobile audio playback
  /// - desktop background playback
  final bool backgroundPlayback;

  /// Whether player should pause when app becomes inactive.
  final bool pauseOnInactive;

  /// Whether player should pause when app enters background.
  final bool pauseOnBackground;

  /// Whether playback should resume after foreground.
  final bool resumeOnForeground;

  /// Whether audio can continue when UI disappears.
  final bool keepAudioAlive;

  /// Whether player resources can be suspended.
  final bool suspendAllowed;

  /// Whether player can restore after suspension.
  final bool restoreAfterSuspend;

  /// Whether background playback is supported.
  bool get canBackgroundPlay {
    return backgroundPlayback;
  }

  /// Whether automatic resume is supported.
  bool get canAutoResume {
    return resumeOnForeground && restoreAfterSuspend;
  }

  /// Whether app lifecycle control is available.
  bool get canControlLifecycle {
    return pauseOnInactive || pauseOnBackground;
  }

  /// Creates modified lifecycle capability.
  PlatformLifecycle copyWith({
    bool? backgroundPlayback,

    bool? pauseOnInactive,

    bool? pauseOnBackground,

    bool? resumeOnForeground,

    bool? keepAudioAlive,

    bool? suspendAllowed,

    bool? restoreAfterSuspend,
  }) {
    return PlatformLifecycle(
      backgroundPlayback: backgroundPlayback ?? this.backgroundPlayback,

      pauseOnInactive: pauseOnInactive ?? this.pauseOnInactive,

      pauseOnBackground: pauseOnBackground ?? this.pauseOnBackground,

      resumeOnForeground: resumeOnForeground ?? this.resumeOnForeground,

      keepAudioAlive: keepAudioAlive ?? this.keepAudioAlive,

      suspendAllowed: suspendAllowed ?? this.suspendAllowed,

      restoreAfterSuspend: restoreAfterSuspend ?? this.restoreAfterSuspend,
    );
  }

  @override
  List<Object?> get props => [
    backgroundPlayback,

    pauseOnInactive,

    pauseOnBackground,

    resumeOnForeground,

    keepAudioAlive,

    suspendAllowed,

    restoreAfterSuspend,
  ];

  @override
  String toString() {
    return 'PlatformLifecycle('
        'background=$backgroundPlayback, '
        'resume=$resumeOnForeground, '
        'suspend=$suspendAllowed'
        ')';
  }
}
