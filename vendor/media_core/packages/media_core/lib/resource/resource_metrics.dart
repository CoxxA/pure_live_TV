import 'package:equatable/equatable.dart';

/// Represents runtime resource metrics.
///
/// [ResourceMetrics] is a read-only data model
/// describing the current resource consumption
/// of the media core runtime.
///
/// It aggregates information from:
///
/// - decoder usage
/// - memory usage
/// - bandwidth usage
/// - thermal state
/// - active player count
///
/// It is used by:
///
/// - ResourceManager
/// - Monitoring systems
/// - Debug tools
/// - Performance analyzers
///
/// It does not:
///
/// - collect metrics
/// - calculate hardware usage
/// - release resources
/// - control playback
///
/// Those responsibilities belong to:
///
/// - DecoderManager
/// - MemoryManager
/// - BandwidthManager
/// - ThermalManager
///
/// Metrics flow:
///
/// ```text
/// DecoderManager
///        |
/// MemoryManager
///        |
/// BandwidthManager
///        |
/// ThermalManager
///        |
///        v
/// ResourceMetrics
///        |
///        v
/// ResourceSnapshot
/// ```
final class ResourceMetrics extends Equatable {
  /// Creates resource metrics.
  const ResourceMetrics({
    this.decoderCount = 0,

    this.hardwareDecoderCount = 0,

    this.memoryBytes = 0,

    this.bandwidthMbps = 0,

    this.activePlayers = 0,

    this.preloadingPlayers = 0,

    this.thermalState = 'normal',

    this.timestamp,
  });

  /// Number of active decoders.
  final int decoderCount;

  /// Number of hardware decoders.
  final int hardwareDecoderCount;

  /// Current memory usage.
  ///
  /// Unit:
  ///
  /// bytes
  final int memoryBytes;

  /// Current bandwidth usage.
  ///
  /// Unit:
  ///
  /// Mbps
  final double bandwidthMbps;

  /// Number of active players.
  final int activePlayers;

  /// Number of players currently preloading.
  final int preloadingPlayers;

  /// Current thermal state.
  ///
  /// Stored as string because
  /// metrics may be serialized externally.
  final String thermalState;

  /// Metric collection timestamp.
  final DateTime? timestamp;

  /// Memory usage in megabytes.
  double get memoryMB {
    return memoryBytes / 1024 / 1024;
  }

  /// Whether hardware decoding is active.
  bool get hasHardwareDecoder {
    return hardwareDecoderCount > 0;
  }

  /// Whether any decoder exists.
  bool get hasDecoder {
    return decoderCount > 0;
  }

  /// Whether players are active.
  bool get hasActivePlayers {
    return activePlayers > 0;
  }

  /// Whether preload is running.
  bool get hasPreload {
    return preloadingPlayers > 0;
  }

  /// Creates metrics with updated values.
  ResourceMetrics copyWith({
    int? decoderCount,

    int? hardwareDecoderCount,

    int? memoryBytes,

    double? bandwidthMbps,

    int? activePlayers,

    int? preloadingPlayers,

    String? thermalState,

    DateTime? timestamp,
  }) {
    return ResourceMetrics(
      decoderCount: decoderCount ?? this.decoderCount,

      hardwareDecoderCount: hardwareDecoderCount ?? this.hardwareDecoderCount,

      memoryBytes: memoryBytes ?? this.memoryBytes,

      bandwidthMbps: bandwidthMbps ?? this.bandwidthMbps,

      activePlayers: activePlayers ?? this.activePlayers,

      preloadingPlayers: preloadingPlayers ?? this.preloadingPlayers,

      thermalState: thermalState ?? this.thermalState,

      timestamp: timestamp ?? this.timestamp,
    );
  }

  /// Returns an empty metrics object.
  static const ResourceMetrics empty = ResourceMetrics();

  @override
  List<Object?> get props => [
    decoderCount,

    hardwareDecoderCount,

    memoryBytes,

    bandwidthMbps,

    activePlayers,

    preloadingPlayers,

    thermalState,

    timestamp,
  ];

  @override
  String toString() {
    return 'ResourceMetrics('
        'decoder=$decoderCount, '
        'hwDecoder=$hardwareDecoderCount, '
        'memory=${memoryMB.toStringAsFixed(1)}MB, '
        'bandwidth=${bandwidthMbps.toStringAsFixed(2)}Mbps, '
        'players=$activePlayers, '
        'preload=$preloadingPlayers, '
        'thermal=$thermalState'
        ')';
  }
}
