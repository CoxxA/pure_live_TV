import 'package:clock/clock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_adapter_metrics.freezed.dart';

/// Runtime metrics reported by a player adapter.
///
/// [PlayerAdapterMetrics] contains performance and
/// playback statistics collected from a backend.
///
/// Responsibilities:
///
/// - expose playback metrics
/// - provide diagnostics data
///
/// It does not:
///
/// - collect metrics itself
/// - store history
/// - make policy decisions
///
/// Those belong to:
///
/// - PlayerAdapter implementation
/// - DiagnosticsManager
/// - PlayerPolicy
@freezed
abstract class PlayerAdapterMetrics with _$PlayerAdapterMetrics {
  /// Creates adapter metrics.
  const factory PlayerAdapterMetrics({
    /// Current bitrate in bits per second.
    int? bitrate,

    /// Current network throughput.
    int? bandwidth,

    /// Buffered duration.
    @Default(Duration.zero) Duration buffered,

    /// Current playback latency.
    Duration? latency,

    /// Total decoded video frames.
    @Default(0) int decodedFrames,

    /// Dropped video frames.
    @Default(0) int droppedFrames,

    /// Rendered frames.
    @Default(0) int renderedFrames,

    /// Audio buffer level.
    Duration? audioBuffered,

    /// Video buffer level.
    Duration? videoBuffered,

    /// Decoder name.
    String? decoder,

    /// Renderer name.
    String? renderer,

    /// Current CPU usage percentage.
    double? cpuUsage,

    /// Current memory usage in bytes.
    int? memoryUsage,

    /// Timestamp of this sample.
    DateTime? timestamp,
  }) = _PlayerAdapterMetrics;

  /// Creates empty metrics.
  factory PlayerAdapterMetrics.empty() {
    return const PlayerAdapterMetrics();
  }
}

/// Extensions for metrics.
extension PlayerAdapterMetricsExtension on PlayerAdapterMetrics {
  /// Whether frame information exists.
  bool get hasFrameInfo {
    return decodedFrames > 0 || renderedFrames > 0;
  }

  /// Frame drop ratio.
  double get dropRatio {
    if (renderedFrames <= 0) {
      return 0;
    }

    return droppedFrames / renderedFrames;
  }

  /// Whether playback quality is degraded.
  bool get degraded {
    return dropRatio > 0.05 || (latency?.inMilliseconds ?? 0) > 3000;
  }

  /// Creates metrics with new timestamp.
  PlayerAdapterMetrics touch() {
    return copyWith(timestamp: clock.now());
  }
}
