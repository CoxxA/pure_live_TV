/// Defines playback fallback policies.
///
/// [FallbackPolicy] controls how the player
/// switches to alternative playback options
/// after failures.
///
/// Responsibilities:
///
/// - backend fallback permission
/// - source line fallback permission
/// - quality downgrade rules
/// - fallback ordering
///
/// It does not:
///
/// - perform switching
/// - resolve sources
/// - recreate players
///
/// Those belong to:
///
/// - FallbackManager
/// - SourceResolver
/// - PlayerAdapter
final class FallbackPolicy {
  /// Creates fallback policy.
  const FallbackPolicy({
    this.enabled = true,

    this.allowBackendFallback = true,

    this.allowLineFallback = true,

    this.allowQualityFallback = true,

    this.maxFallbackAttempts = 3,

    this.preferBackendFallback = false,

    this.preferLineFallback = true,

    this.downgradeQualityOnFailure = true,

    this.stopAfterSuccessfulFallback = true,
  });

  /// Whether fallback is enabled.
  final bool enabled;

  /// Whether another backend can be tried.
  ///
  /// Example:
  ///
  /// media_kit -> native player
  final bool allowBackendFallback;

  /// Whether another stream line can be tried.
  ///
  /// Example:
  ///
  /// CDN A -> CDN B
  final bool allowLineFallback;

  /// Whether lower quality can be selected.
  final bool allowQualityFallback;

  /// Maximum fallback attempts.
  final int maxFallbackAttempts;

  /// Whether backend switch has priority.
  final bool preferBackendFallback;

  /// Whether line switch has priority.
  final bool preferLineFallback;

  /// Whether quality should downgrade
  /// after playback failure.
  final bool downgradeQualityOnFailure;

  /// Stop fallback chain after success.
  final bool stopAfterSuccessfulFallback;

  /// Whether fallback can start.
  bool canFallback() {
    return enabled && maxFallbackAttempts > 0;
  }

  /// Whether backend fallback is allowed.
  bool canFallbackBackend() {
    return enabled && allowBackendFallback;
  }

  /// Whether source line fallback is allowed.
  bool canFallbackLine() {
    return enabled && allowLineFallback;
  }

  /// Whether quality downgrade is allowed.
  bool canFallbackQuality() {
    return enabled && allowQualityFallback;
  }

  /// Returns fallback order.
  ///
  /// Smaller value means higher priority.
  List<FallbackType> get fallbackOrder {
    if (preferBackendFallback) {
      return const [FallbackType.backend, FallbackType.line, FallbackType.quality];
    }

    if (preferLineFallback) {
      return const [FallbackType.line, FallbackType.quality, FallbackType.backend];
    }

    return const [FallbackType.quality, FallbackType.line, FallbackType.backend];
  }

  /// Creates modified policy.
  FallbackPolicy copyWith({
    bool? enabled,

    bool? allowBackendFallback,

    bool? allowLineFallback,

    bool? allowQualityFallback,

    int? maxFallbackAttempts,

    bool? preferBackendFallback,

    bool? preferLineFallback,

    bool? downgradeQualityOnFailure,

    bool? stopAfterSuccessfulFallback,
  }) {
    return FallbackPolicy(
      enabled: enabled ?? this.enabled,

      allowBackendFallback: allowBackendFallback ?? this.allowBackendFallback,

      allowLineFallback: allowLineFallback ?? this.allowLineFallback,

      allowQualityFallback: allowQualityFallback ?? this.allowQualityFallback,

      maxFallbackAttempts: maxFallbackAttempts ?? this.maxFallbackAttempts,

      preferBackendFallback: preferBackendFallback ?? this.preferBackendFallback,

      preferLineFallback: preferLineFallback ?? this.preferLineFallback,

      downgradeQualityOnFailure: downgradeQualityOnFailure ?? this.downgradeQualityOnFailure,

      stopAfterSuccessfulFallback: stopAfterSuccessfulFallback ?? this.stopAfterSuccessfulFallback,
    );
  }

  @override
  String toString() {
    return 'FallbackPolicy('
        'enabled=$enabled, '
        'maxAttempts=$maxFallbackAttempts'
        ')';
  }
}

/// Types of fallback.
enum FallbackType {
  /// Switch playback backend.
  backend,

  /// Switch stream line/CDN.
  line,

  /// Switch stream quality.
  quality,
}
