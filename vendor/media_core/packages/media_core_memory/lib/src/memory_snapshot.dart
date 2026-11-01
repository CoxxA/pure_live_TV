import 'package:equatable/equatable.dart';

/// One point-in-time measurement of device memory.
///
/// The measured counterpart to the framework's declared estimates: these numbers
/// come from the platform (or from whatever provider the host installed), so
/// they describe the whole process, not just the modules this framework knows
/// about.
///
/// Responsibilities:
///
/// - record the measurement time
/// - store used, available and external memory
/// - provide basic usage calculations
///
/// It does not:
///
/// - query platform memory APIs
/// - collect measurements periodically
/// - decide whether usage is a problem
final class MemorySnapshot extends Equatable {
  /// Creates a memory snapshot.
  const MemorySnapshot({
    required this.timestamp,
    required this.usedBytes,
    required this.availableBytes,
    this.externalBytes = 0,
  });

  /// Time at which the measurement was taken.
  final DateTime timestamp;

  /// Memory currently in use, in bytes.
  final int usedBytes;

  /// Memory currently available, in bytes.
  final int availableBytes;

  /// Externally allocated memory, in bytes.
  ///
  /// What counts as external depends on the platform and the provider; on
  /// Flutter it is typically the native allocations made outside the Dart heap.
  final int externalBytes;

  /// Total memory represented by [usedBytes] and [availableBytes].
  int get totalBytes => usedBytes + availableBytes;

  /// Ratio of used to total memory, or `null` when the total is unknown.
  double? get usageRatio {
    final total = totalBytes;
    if (total <= 0) {
      return null;
    }
    return usedBytes / total;
  }

  /// Creates a copy with selected values replaced.
  MemorySnapshot copyWith({DateTime? timestamp, int? usedBytes, int? availableBytes, int? externalBytes}) {
    return MemorySnapshot(
      timestamp: timestamp ?? this.timestamp,
      usedBytes: usedBytes ?? this.usedBytes,
      availableBytes: availableBytes ?? this.availableBytes,
      externalBytes: externalBytes ?? this.externalBytes,
    );
  }

  /// Serializes this snapshot.
  Map<String, Object?> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'usedBytes': usedBytes,
      'availableBytes': availableBytes,
      'externalBytes': externalBytes,
    };
  }

  @override
  List<Object?> get props => [timestamp, usedBytes, availableBytes, externalBytes];

  @override
  String toString() {
    return 'MemorySnapshot('
        'timestamp: $timestamp, '
        'usedBytes: $usedBytes, '
        'availableBytes: $availableBytes, '
        'externalBytes: $externalBytes'
        ')';
  }
}
