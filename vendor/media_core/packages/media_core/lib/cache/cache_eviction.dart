import 'package:media_core/cache/cache_entry.dart';

/// Cache eviction policy.
///
/// Eviction is responsible only for deciding which entries should be removed
/// when a cache exceeds its configured limits.
abstract interface class CacheEviction<T> {
  const CacheEviction();

  /// Returns entries that should be evicted.
  ///
  /// The returned entries must be a subset of [entries].
  List<CacheEntry<T>> select(List<CacheEntry<T>> entries, {required int maxEntries, required int maxBytes});
}

/// Least-recently-used eviction policy.
///
/// Entries that have not been accessed for the longest time are removed
/// first.
final class LruCacheEviction<T> implements CacheEviction<T> {
  const LruCacheEviction();

  @override
  List<CacheEntry<T>> select(List<CacheEntry<T>> entries, {required int maxEntries, required int maxBytes}) {
    if (entries.isEmpty) {
      return <CacheEntry<T>>[];
    }

    final List<CacheEntry<T>> sorted = List<CacheEntry<T>>.from(entries)
      ..sort((CacheEntry<T> a, CacheEntry<T> b) => a.accessedAt.compareTo(b.accessedAt));

    final List<CacheEntry<T>> evicted = <CacheEntry<T>>[];
    int remainingEntries = entries.length;
    int remainingBytes = entries.fold<int>(0, (int total, CacheEntry<T> entry) => total + entry.sizeBytes);

    for (final CacheEntry<T> entry in sorted) {
      final bool exceedsEntries = maxEntries > 0 && remainingEntries > maxEntries;
      final bool exceedsBytes = maxBytes > 0 && remainingBytes > maxBytes;

      if (!exceedsEntries && !exceedsBytes) {
        break;
      }

      evicted.add(entry);
      remainingEntries--;
      remainingBytes -= entry.sizeBytes;
    }

    return evicted;
  }
}

/// FIFO eviction policy.
///
/// Entries created earliest are removed first.
final class FifoCacheEviction<T> implements CacheEviction<T> {
  const FifoCacheEviction();

  @override
  List<CacheEntry<T>> select(List<CacheEntry<T>> entries, {required int maxEntries, required int maxBytes}) {
    if (entries.isEmpty) {
      return <CacheEntry<T>>[];
    }

    final List<CacheEntry<T>> sorted = List<CacheEntry<T>>.from(entries)
      ..sort((CacheEntry<T> a, CacheEntry<T> b) => a.createdAt.compareTo(b.createdAt));

    final List<CacheEntry<T>> evicted = <CacheEntry<T>>[];
    int remainingEntries = entries.length;
    int remainingBytes = entries.fold<int>(0, (int total, CacheEntry<T> entry) => total + entry.sizeBytes);

    for (final CacheEntry<T> entry in sorted) {
      final bool exceedsEntries = maxEntries > 0 && remainingEntries > maxEntries;
      final bool exceedsBytes = maxBytes > 0 && remainingBytes > maxBytes;

      if (!exceedsEntries && !exceedsBytes) {
        break;
      }

      evicted.add(entry);
      remainingEntries--;
      remainingBytes -= entry.sizeBytes;
    }

    return evicted;
  }
}
