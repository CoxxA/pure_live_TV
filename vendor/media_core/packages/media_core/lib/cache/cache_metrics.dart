import 'package:equatable/equatable.dart';

/// Immutable cache metrics.
///
/// Metrics are descriptive statistics only. They do not perform cache
/// operations.
final class CacheMetrics extends Equatable {
  const CacheMetrics({
    this.hits = 0,
    this.misses = 0,
    this.writes = 0,
    this.removals = 0,
    this.evictions = 0,
    this.expirations = 0,
    this.bytesRead = 0,
    this.bytesWritten = 0,
  });

  final int hits;

  final int misses;

  final int writes;

  final int removals;

  final int evictions;

  final int expirations;

  final int bytesRead;

  final int bytesWritten;

  int get lookups => hits + misses;

  int get operations => lookups + writes + removals;

  double get hitRate {
    final int total = lookups;

    if (total == 0) {
      return 0;
    }

    return hits / total;
  }

  double get missRate {
    final int total = lookups;

    if (total == 0) {
      return 0;
    }

    return misses / total;
  }

  CacheMetrics recordHit({int bytes = 0}) {
    return copyWith(hits: hits + 1, bytesRead: bytesRead + bytes);
  }

  CacheMetrics recordMiss() {
    return copyWith(misses: misses + 1);
  }

  CacheMetrics recordWrite({int bytes = 0}) {
    return copyWith(writes: writes + 1, bytesWritten: bytesWritten + bytes);
  }

  CacheMetrics recordRemoval() {
    return copyWith(removals: removals + 1);
  }

  CacheMetrics recordEviction() {
    return copyWith(evictions: evictions + 1);
  }

  CacheMetrics recordExpiration() {
    return copyWith(expirations: expirations + 1);
  }

  CacheMetrics copyWith({
    int? hits,
    int? misses,
    int? writes,
    int? removals,
    int? evictions,
    int? expirations,
    int? bytesRead,
    int? bytesWritten,
  }) {
    return CacheMetrics(
      hits: hits ?? this.hits,
      misses: misses ?? this.misses,
      writes: writes ?? this.writes,
      removals: removals ?? this.removals,
      evictions: evictions ?? this.evictions,
      expirations: expirations ?? this.expirations,
      bytesRead: bytesRead ?? this.bytesRead,
      bytesWritten: bytesWritten ?? this.bytesWritten,
    );
  }

  CacheMetrics reset() {
    return const CacheMetrics();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hits': hits,
      'misses': misses,
      'writes': writes,
      'removals': removals,
      'evictions': evictions,
      'expirations': expirations,
      'bytesRead': bytesRead,
      'bytesWritten': bytesWritten,
      'lookups': lookups,
      'hitRate': hitRate,
      'missRate': missRate,
    };
  }

  @override
  List<Object?> get props => <Object?>[hits, misses, writes, removals, evictions, expirations, bytesRead, bytesWritten];

  @override
  String toString() {
    return 'CacheMetrics('
        'hits: $hits, '
        'misses: $misses, '
        'writes: $writes, '
        'removals: $removals, '
        'evictions: $evictions, '
        'expirations: $expirations, '
        'bytesRead: $bytesRead, '
        'bytesWritten: $bytesWritten, '
        'hitRate: $hitRate'
        ')';
  }
}
