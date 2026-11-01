import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_pool_metrics.freezed.dart';

/// Metrics of player pool.
///
/// [PlayerPoolMetrics] contains runtime statistics
/// collected from player pool.
///
/// It is used for:
///
/// - diagnostics
/// - performance monitoring
/// - debugging
///
/// It does not:
///
/// - manage players
/// - change pool state
/// - allocate resources
///
/// Those belong to:
///
/// - PlayerPoolManager
/// - PlayerPoolAllocator
/// - PlayerPoolRecycler
@freezed
abstract class PlayerPoolMetrics with _$PlayerPoolMetrics {
  /// Creates pool metrics.
  const factory PlayerPoolMetrics({
    /// Total players created.
    @Default(0) int createdCount,

    /// Total players destroyed.
    @Default(0) int destroyedCount,

    /// Total player allocations.
    @Default(0) int allocationCount,

    /// Total allocation failures.
    @Default(0) int allocationFailureCount,

    /// Total recycle operations.
    @Default(0) int recycleCount,

    /// Total recycle failures.
    @Default(0) int recycleFailureCount,

    /// Current allocated players.
    @Default(0) int allocatedCount,

    /// Current idle players.
    @Default(0) int idleCount,

    /// Peak concurrent players.
    @Default(0) int peakCount,

    /// Average allocation latency.
    Duration? averageAllocationTime,

    /// Last update timestamp.
    DateTime? updatedAt,
  }) = _PlayerPoolMetrics;

  /// Creates empty metrics.
  factory PlayerPoolMetrics.empty() {
    return const PlayerPoolMetrics();
  }
}
