/// Defines memory usage policies.
///
/// [MemoryPolicy] controls how much memory
/// the player runtime is allowed to consume.
///
/// Responsibilities:
///
/// - memory budget definition
/// - cache limits
/// - preload memory limits
/// - cleanup behavior
///
/// It does not:
///
/// - allocate memory
/// - release resources
/// - monitor system memory
///
/// Those belong to:
///
/// - MemoryManager
/// - ResourceManager
/// - CacheManager
final class MemoryPolicy {
  /// Creates memory policy.
  const MemoryPolicy({
    this.maxPlayerMemoryMB = 512,

    this.maxCacheMemoryMB = 256,

    this.maxPreloadMemoryMB = 128,

    this.enableMemoryLimit = true,

    this.clearCacheOnPressure = true,

    this.releaseIdlePlayers = true,

    this.idleReleaseDelay = const Duration(minutes: 5),
  });

  /// Maximum memory allowed for player runtime.
  ///
  /// Unit: MB
  final int maxPlayerMemoryMB;

  /// Maximum memory used by media cache.
  ///
  /// Unit: MB
  final int maxCacheMemoryMB;

  /// Maximum memory used by preload resources.
  ///
  /// Unit: MB
  final int maxPreloadMemoryMB;

  /// Whether memory limits are enabled.
  final bool enableMemoryLimit;

  /// Whether cache should be cleared
  /// under memory pressure.
  final bool clearCacheOnPressure;

  /// Whether idle players can be released.
  final bool releaseIdlePlayers;

  /// Time before an idle player can be released.
  final Duration idleReleaseDelay;

  /// Whether memory usage is exceeded.
  bool isExceeded({required int currentMemoryMB}) {
    if (!enableMemoryLimit) {
      return false;
    }

    return currentMemoryMB > maxPlayerMemoryMB;
  }

  /// Whether cache cleanup is required.
  bool shouldClearCache({required int cacheMemoryMB}) {
    if (!enableMemoryLimit) {
      return false;
    }

    if (!clearCacheOnPressure) {
      return false;
    }

    return cacheMemoryMB > maxCacheMemoryMB;
  }

  /// Creates modified policy.
  MemoryPolicy copyWith({
    int? maxPlayerMemoryMB,

    int? maxCacheMemoryMB,

    int? maxPreloadMemoryMB,

    bool? enableMemoryLimit,

    bool? clearCacheOnPressure,

    bool? releaseIdlePlayers,

    Duration? idleReleaseDelay,
  }) {
    return MemoryPolicy(
      maxPlayerMemoryMB: maxPlayerMemoryMB ?? this.maxPlayerMemoryMB,

      maxCacheMemoryMB: maxCacheMemoryMB ?? this.maxCacheMemoryMB,

      maxPreloadMemoryMB: maxPreloadMemoryMB ?? this.maxPreloadMemoryMB,

      enableMemoryLimit: enableMemoryLimit ?? this.enableMemoryLimit,

      clearCacheOnPressure: clearCacheOnPressure ?? this.clearCacheOnPressure,

      releaseIdlePlayers: releaseIdlePlayers ?? this.releaseIdlePlayers,

      idleReleaseDelay: idleReleaseDelay ?? this.idleReleaseDelay,
    );
  }

  @override
  String toString() {
    return 'MemoryPolicy('
        'player=${maxPlayerMemoryMB}MB, '
        'cache=${maxCacheMemoryMB}MB, '
        'preload=${maxPreloadMemoryMB}MB'
        ')';
  }
}
