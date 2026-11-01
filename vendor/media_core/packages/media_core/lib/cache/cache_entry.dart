import 'package:media_core/cache/cache_key.dart';
import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';

/// Immutable cache entry.
///
/// A cache entry contains the cached value and metadata required by cache
/// management policies.
///
/// The cache entry does not know where it is stored. The same entry can be
/// used by memory or disk storage.
final class CacheEntry<T> extends Equatable {
  CacheEntry({
    required this.key,
    required this.value,
    DateTime? createdAt,
    DateTime? accessedAt,
    this.expiresAt,
    this.sizeBytes = 0,
    this.metadata = const <String, Object?>{},
  }) : createdAt = createdAt ?? clock.now(),
       accessedAt = accessedAt ?? createdAt ?? clock.now();

  final CacheKey key;

  final T value;

  final DateTime createdAt;

  final DateTime accessedAt;

  final DateTime? expiresAt;

  final int sizeBytes;

  final Map<String, Object?> metadata;

  bool get hasExpiration => expiresAt != null;

  bool get isExpired {
    final DateTime? expiration = expiresAt;

    if (expiration == null) {
      return false;
    }

    return !clock.now().isBefore(expiration);
  }

  bool get isValid => !isExpired;

  Duration get age => clock.now().difference(createdAt);

  Duration get idleDuration => clock.now().difference(accessedAt);

  CacheEntry<T> touch({DateTime? accessedAt}) {
    return CacheEntry<T>(
      key: key,
      value: value,
      createdAt: createdAt,
      accessedAt: accessedAt ?? clock.now(),
      expiresAt: expiresAt,
      sizeBytes: sizeBytes,
      metadata: metadata,
    );
  }

  CacheEntry<T> copyWith({
    CacheKey? key,
    T? value,
    DateTime? createdAt,
    DateTime? accessedAt,
    DateTime? expiresAt,
    int? sizeBytes,
    Map<String, Object?>? metadata,
  }) {
    return CacheEntry<T>(
      key: key ?? this.key,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      accessedAt: accessedAt ?? this.accessedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap({Object? Function(T value)? valueEncoder}) {
    return <String, dynamic>{
      'key': key.value,
      'value': valueEncoder?.call(value) ?? value,
      'createdAt': createdAt.toIso8601String(),
      'accessedAt': accessedAt.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
      'sizeBytes': sizeBytes,
      'metadata': Map<String, dynamic>.from(metadata),
    };
  }

  @override
  List<Object?> get props => <Object?>[key, value, createdAt, accessedAt, expiresAt, sizeBytes, metadata];

  @override
  String toString() {
    return 'CacheEntry('
        'key: $key, '
        'createdAt: $createdAt, '
        'accessedAt: $accessedAt, '
        'expiresAt: $expiresAt, '
        'sizeBytes: $sizeBytes, '
        'metadata: $metadata'
        ')';
  }
}
