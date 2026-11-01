import 'package:equatable/equatable.dart';

/// Preload statistics.
final class PreloadMetrics extends Equatable {
  const PreloadMetrics({this.total = 0, this.completed = 0, this.failed = 0, this.cancelled = 0});

  final int total;

  final int completed;

  final int failed;

  final int cancelled;

  double get successRate {
    if (total == 0) {
      return 0;
    }

    return completed / total;
  }

  PreloadMetrics copyWith({int? total, int? completed, int? failed, int? cancelled}) {
    return PreloadMetrics(
      total: total ?? this.total,
      completed: completed ?? this.completed,
      failed: failed ?? this.failed,
      cancelled: cancelled ?? this.cancelled,
    );
  }

  @override
  List<Object?> get props => [total, completed, failed, cancelled];
}
