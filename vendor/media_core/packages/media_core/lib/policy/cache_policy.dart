/// Defines player cache policies.
///
/// [CachePolicy] controls how playback
/// cache is stored and managed.
///
/// Responsibilities:
///
/// - memory cache limits
/// - disk cache limits
/// - eviction behavior
/// - live cache behavior
///
/// It does not:
///
/// - write cache data
/// - delete cache files
/// - manage storage
///
/// Those belong to:
///
/// - CacheManager
/// - MemoryCache
/// - DiskCache
final class CachePolicy {
  /// Creates cache policy.
  const CachePolicy({
    this.enabled = true,

    this.enableMemoryCache = true,

    this.enableDiskCache = false,

    this.maxMemoryCacheBytes = 64 * 1024 * 1024,

    this.maxDiskCacheBytes = 1024 * 1024 * 1024,

    this.maxCacheAge = const Duration(days: 7),

    this.evictionStrategy = CacheEvictionStrategy.lru,

    this.cacheLiveStream = false,

    this.maxLiveCacheDuration = const Duration(seconds: 30),

    this.clearCacheOnDispose = false,
  });

  /// Whether cache system is enabled.
  final bool enabled;

  /// Enable memory cache.
  final bool enableMemoryCache;

  /// Enable disk cache.
  final bool enableDiskCache;

  /// Maximum memory cache size.
  ///
  /// Unit:
  ///
  /// bytes
  final int maxMemoryCacheBytes;

  /// Maximum disk cache size.
  ///
  /// Unit:
  ///
  /// bytes
  final int maxDiskCacheBytes;

  /// Maximum cache age.
  final Duration maxCacheAge;

  /// Cache eviction strategy.
  final CacheEvictionStrategy evictionStrategy;

  /// Whether live streams should cache.
  final bool cacheLiveStream;

  /// Maximum live stream cache duration.
  final Duration maxLiveCacheDuration;

  /// Clear cache when player disposed.
  final bool clearCacheOnDispose;

  /// Whether memory cache can be used.
  bool canUseMemoryCache() {
    return enabled && enableMemoryCache && maxMemoryCacheBytes > 0;
  }

  /// Whether disk cache can be used.
  bool canUseDiskCache() {
    return enabled && enableDiskCache && maxDiskCacheBytes > 0;
  }

  /// Whether live stream cache is allowed.
  bool canCacheLiveStream() {
    return enabled && cacheLiveStream;
  }

  /// Checks whether cache exceeds limit.
  bool exceedsMemoryLimit(int currentBytes) {
    return currentBytes > maxMemoryCacheBytes;
  }

  /// Checks whether disk cache exceeds limit.
  bool exceedsDiskLimit(int currentBytes) {
    return currentBytes > maxDiskCacheBytes;
  }

  /// Creates modified policy.
  CachePolicy copyWith({
    bool? enabled,

    bool? enableMemoryCache,

    bool? enableDiskCache,

    int? maxMemoryCacheBytes,

    int? maxDiskCacheBytes,

    Duration? maxCacheAge,

    CacheEvictionStrategy? evictionStrategy,

    bool? cacheLiveStream,

    Duration? maxLiveCacheDuration,

    bool? clearCacheOnDispose,
  }) {
    return CachePolicy(
      enabled: enabled ?? this.enabled,

      enableMemoryCache: enableMemoryCache ?? this.enableMemoryCache,

      enableDiskCache: enableDiskCache ?? this.enableDiskCache,

      maxMemoryCacheBytes: maxMemoryCacheBytes ?? this.maxMemoryCacheBytes,

      maxDiskCacheBytes: maxDiskCacheBytes ?? this.maxDiskCacheBytes,

      maxCacheAge: maxCacheAge ?? this.maxCacheAge,

      evictionStrategy: evictionStrategy ?? this.evictionStrategy,

      cacheLiveStream: cacheLiveStream ?? this.cacheLiveStream,

      maxLiveCacheDuration: maxLiveCacheDuration ?? this.maxLiveCacheDuration,

      clearCacheOnDispose: clearCacheOnDispose ?? this.clearCacheOnDispose,
    );
  }

  @override
  String toString() {
    return 'CachePolicy('
        'memory=$enableMemoryCache, '
        'disk=$enableDiskCache, '
        'strategy=$evictionStrategy'
        ')';
  }
}

/// Cache eviction strategy.
enum CacheEvictionStrategy {
  /// Remove least recently used entries.
  lru,

  /// Remove oldest entries first.
  fifo,

  /// Remove largest entries first.
  largest,

  /// Remove expired entries only.
  expire,
}
