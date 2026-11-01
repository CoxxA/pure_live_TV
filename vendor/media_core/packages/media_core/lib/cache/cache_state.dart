import 'package:media_core/cache/cache_metrics.dart';
import 'package:equatable/equatable.dart';

/// Immutable cache state.
///
/// Tracks cache lifecycle and aggregate cache statistics.
///
/// This state does not contain individual cache entries.
final class CacheState extends Equatable {
  const CacheState({required this.initialized, required this.size, required this.sizeBytes, required this.metrics});

  const CacheState.initial() : initialized = false, size = 0, sizeBytes = 0, metrics = const CacheMetrics();

  final bool initialized;

  final int size;

  final int sizeBytes;

  final CacheMetrics metrics;

  bool get isEmpty => size == 0;

  bool get isNotEmpty => size > 0;

  CacheState initialize({int size = 0, int sizeBytes = 0, CacheMetrics metrics = const CacheMetrics()}) {
    return CacheState(initialized: true, size: size, sizeBytes: sizeBytes, metrics: metrics);
  }

  CacheState update({int? size, int? sizeBytes, CacheMetrics? metrics}) {
    return CacheState(
      initialized: initialized,
      size: size ?? this.size,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      metrics: metrics ?? this.metrics,
    );
  }

  CacheState reset() {
    return const CacheState.initial();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'initialized': initialized,
      'size': size,
      'sizeBytes': sizeBytes,
      'metrics': metrics.toMap(),
    };
  }

  @override
  List<Object?> get props => <Object?>[initialized, size, sizeBytes, metrics];

  @override
  String toString() {
    return 'CacheState('
        'initialized: $initialized, '
        'size: $size, '
        'sizeBytes: $sizeBytes, '
        'metrics: $metrics'
        ')';
  }
}
