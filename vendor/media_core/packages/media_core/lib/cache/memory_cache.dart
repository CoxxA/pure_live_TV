import 'package:media_core/cache/cache_key.dart';
import 'package:media_core_memory/media_core_memory.dart';
import 'package:media_core/cache/cache_entry.dart';
import 'package:media_core/cache/cache_storage.dart';
import 'package:media_core/cache/cache_eviction.dart';

/// In-memory cache storage.
///
/// [MemoryCache] provides a fast process-local cache and uses an eviction
/// policy when configured limits are exceeded.
///
/// It does not persist data across process restarts.
final class MemoryCache<T> implements CacheStorage<T> {
  MemoryCache({this.maxEntries = 0, this.maxBytes = 0, CacheEviction<T>? eviction})
    : eviction = eviction ?? LruCacheEviction<T>();

  final int maxEntries;

  final int maxBytes;

  final CacheEviction<T> eviction;

  final Map<CacheKey, CacheEntry<T>> _entries = <CacheKey, CacheEntry<T>>{};

  /// Ledger of the entries held in memory.
  ///
  /// Unlike most modules this one reports measured bytes: [CacheEntry.sizeBytes]
  /// knows what it holds, so the cache is the one consumer whose report is a
  /// real number rather than an estimate.
  /// This instance's key in the shared account.
  late final String _memoryKey = memoryContributorKey(this);

  final MemoryAccount _memory = MediaCoreMemory.of(MemoryModule.cache);

  bool _initialized = false;
  bool _disposed = false;

  @override
  Future<void> initialize() async {
    _ensureNotDisposed();

    _initialized = true;
  }

  @override
  Future<CacheEntry<T>?> read(CacheKey key) async {
    _ensureReady();

    final CacheEntry<T>? entry = _entries[key];

    if (entry == null) {
      return null;
    }

    if (entry.isExpired) {
      _entries.remove(key);
      _reportMemory();
      return null;
    }

    final CacheEntry<T> touched = entry.touch();
    _entries[key] = touched;

    return touched;
  }

  @override
  Future<void> write(CacheEntry<T> entry) async {
    _ensureReady();

    _entries[entry.key] = entry;
    _evictIfNeeded();
    _reportMemory();
  }

  @override
  Future<bool> remove(CacheKey key) async {
    _ensureReady();

    final bool removed = _entries.remove(key) != null;
    _reportMemory();

    return removed;
  }

  @override
  Future<void> clear() async {
    _ensureReady();

    _entries.clear();
    _reportMemory();
  }

  @override
  Future<bool> contains(CacheKey key) async {
    _ensureReady();

    final CacheEntry<T>? entry = _entries[key];

    if (entry == null) {
      return false;
    }

    if (entry.isExpired) {
      _entries.remove(key);
      return false;
    }

    return true;
  }

  @override
  Future<List<CacheEntry<T>>> entries() async {
    _ensureReady();

    final List<CacheEntry<T>> result = <CacheEntry<T>>[];

    final List<CacheKey> expired = <CacheKey>[];

    for (final MapEntry<CacheKey, CacheEntry<T>> item in _entries.entries) {
      if (item.value.isExpired) {
        expired.add(item.key);
      } else {
        result.add(item.value);
      }
    }

    for (final CacheKey key in expired) {
      _entries.remove(key);
    }

    return List<CacheEntry<T>>.unmodifiable(result);
  }

  /// Removes entries selected by the configured eviction policy.
  List<CacheEntry<T>> evict() {
    _ensureReady();

    final List<CacheEntry<T>> current = _entries.values.toList(growable: false);

    final List<CacheEntry<T>> selected = eviction.select(current, maxEntries: maxEntries, maxBytes: maxBytes);

    for (final CacheEntry<T> entry in selected) {
      _entries.remove(entry.key);
    }

    return List<CacheEntry<T>>.unmodifiable(selected);
  }

  int get length => _entries.length;

  int get sizeBytes {
    return _entries.values.fold<int>(0, (int total, CacheEntry<T> entry) => total + entry.sizeBytes);
  }

  /// Reports the entries and their measured size.
  void _reportMemory() {
    _memory.report(_memoryKey, 
      items: _entries.length,
      bytes: sizeBytes,
      note: '${_entries.length} entr(y|ies)${maxBytes == 0 ? '' : ', limit ${maxBytes ~/ 1024}KB'}',
    );
  }

  @override
  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;
    _entries.clear();
    _memory.withdraw(_memoryKey);
  }

  void _evictIfNeeded() {
    final List<CacheEntry<T>> current = _entries.values.toList(growable: false);

    final List<CacheEntry<T>> selected = eviction.select(current, maxEntries: maxEntries, maxBytes: maxBytes);

    for (final CacheEntry<T> entry in selected) {
      _entries.remove(entry.key);
    }
  }

  void _ensureReady() {
    _ensureNotDisposed();

    if (!_initialized) {
      throw StateError('MemoryCache has not been initialized.');
    }
  }

  void _ensureNotDisposed() {
    if (_disposed) {
      throw StateError('MemoryCache has been disposed.');
    }
  }
}
