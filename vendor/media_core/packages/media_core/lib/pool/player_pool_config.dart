import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_pool_config.freezed.dart';

/// Configuration for player pool.
///
/// [PlayerPoolConfig] defines how the player pool
/// should allocate and recycle players.
///
/// It does not:
///
/// - create players
/// - manage player lifecycle
/// - store runtime state
///
/// Those belong to:
///
/// - PlayerPool
/// - PlayerPoolManager
/// - PlayerPoolAllocator
@freezed
abstract class PlayerPoolConfig with _$PlayerPoolConfig {
  /// Creates pool configuration.
  const factory PlayerPoolConfig({
    /// Maximum number of players in pool.
    ///
    /// 0 means unlimited.
    @Default(0) int maxPlayers,

    /// Initial number of pre-created players.
    @Default(0) int initialSize,

    /// Whether pool can create players lazily.
    @Default(true) bool lazyCreate,

    /// Whether unused players should be recycled.
    @Default(true) bool enableRecycle,

    /// Maximum idle duration before recycle.
    Duration? idleTimeout,

    /// Whether pool should keep at least one warm player.
    @Default(false) bool keepWarm,

    /// Number of warm players.
    @Default(0) int warmSize,

    /// Maximum concurrent active sessions.
    @Default(1) int maxActivePlayers,

    /// How many neighbours on each side of the active item are kept warm.
    ///
    /// A list or feed pre-opens the items a swipe can reach, so the swipe is a
    /// source swap on an already-open player rather than a cold start. One is
    /// the smallest useful value (the next item only) and the default; zero
    /// turns preloading off.
    @Default(1) int preloadCount,

    /// Visibility ratio at which an item is allowed to play.
    ///
    /// Above this the item becomes the active one. Between this and
    /// [pauseVisibilityThreshold] nothing changes, which is what stops a
    /// partially visible item from flapping between play and pause mid-scroll.
    @Default(0.6) double playVisibilityThreshold,

    /// Visibility ratio below which the active item is paused.
    @Default(0.4) double pauseVisibilityThreshold,

    /// How long a warm item may stay open without becoming active.
    ///
    /// A warm player holds a decoder, so one that never becomes active is
    /// released rather than kept forever. Null means no timeout.
    Duration? preloadTimeout,

    /// Whether an idle player may be re-pointed at another item instead of
    /// being released and replaced.
    ///
    /// This is the difference between "one player per swipe" and "three players
    /// for an endless list": with reuse on, an idle player takes the next
    /// item's source, so decoder setup happens once per pool slot rather than
    /// once per item. Turn it off when every item needs to keep its own player
    /// (its own playback state, its own session).
    @Default(true) bool reuseIdlePlayers,
  }) = _PlayerPoolConfig;
}
