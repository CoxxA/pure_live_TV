import 'package:equatable/equatable.dart';

/// Represents one measured performance sample.
///
/// A [PerformanceSample] records the elapsed time of one named operation
/// together with optional structured metadata.
///
/// Responsibilities:
///
/// - store the measured duration
/// - identify the measured operation
/// - record when the measurement was taken
/// - carry optional measurement metadata
///
/// It does not:
///
/// - measure execution time
/// - retain a history of samples
/// - decide performance thresholds
///
/// Those responsibilities belong to:
///
/// - PerformanceMonitor
/// - DiagnosticsManager
final class PerformanceSample extends Equatable {
  /// Creates a performance sample.
  const PerformanceSample({required this.timestamp, required this.duration, this.name = '', this.metadata = const {}});

  /// Time at which the measurement was recorded.
  final DateTime timestamp;

  /// Duration measured for the operation.
  final Duration duration;

  /// Name of the measured operation.
  final String name;

  /// Additional structured information associated with the measurement.
  final Map<String, Object?> metadata;

  /// Whether this sample exceeds the normal frame-time budget.
  ///
  /// The default threshold is one 60 Hz frame, approximately 16 milliseconds.
  bool get isSlow {
    return duration > const Duration(milliseconds: 16);
  }

  /// Creates a copy with selected values replaced.
  PerformanceSample copyWith({DateTime? timestamp, Duration? duration, String? name, Map<String, Object?>? metadata}) {
    return PerformanceSample(
      timestamp: timestamp ?? this.timestamp,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Converts this sample into a serializable map.
  Map<String, Object?> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'durationMicros': duration.inMicroseconds,
      'name': name,
      'metadata': metadata,
    };
  }

  @override
  List<Object?> get props => [timestamp, duration, name, metadata];

  @override
  String toString() {
    return 'PerformanceSample('
        'timestamp: $timestamp, '
        'duration: $duration, '
        'name: $name, '
        'metadata: $metadata'
        ')';
  }
}
