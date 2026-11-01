import 'package:equatable/equatable.dart';

/// Represents one point-in-time network diagnostic snapshot.
///
/// A [NetworkSnapshot] contains the network activity and throughput
/// information available to the diagnostics layer at a specific point in
/// time.
///
/// Responsibilities:
///
/// - record the snapshot timestamp
/// - track active network requests
/// - track received and sent bytes
/// - store the latest latency measurement
/// - store the latest transfer rates
/// - record the current connection state
///
/// It does not:
///
/// - perform network requests
/// - query network connectivity APIs
/// - calculate measurements from raw network traffic
/// - periodically collect snapshots
///
/// Those responsibilities belong to:
///
/// - NetworkMonitor
/// - platform-specific network providers
/// - the network layer
final class NetworkSnapshot extends Equatable {
  /// Creates a network snapshot.
  const NetworkSnapshot({
    required this.timestamp,
    this.activeRequests = 0,
    this.bytesReceived = 0,
    this.bytesSent = 0,
    this.latency,
    this.downloadRateBytesPerSecond,
    this.uploadRateBytesPerSecond,
    this.connected = false,
  });

  /// Time at which this snapshot was created.
  final DateTime timestamp;

  /// Number of currently active network requests.
  final int activeRequests;

  /// Total number of bytes received.
  final int bytesReceived;

  /// Total number of bytes sent.
  final int bytesSent;

  /// Most recently measured network latency.
  final Duration? latency;

  /// Current or most recently measured download rate in bytes per second.
  final double? downloadRateBytesPerSecond;

  /// Current or most recently measured upload rate in bytes per second.
  final double? uploadRateBytesPerSecond;

  /// Whether the network is currently considered connected.
  final bool connected;

  /// Creates a copy with selected values replaced.
  NetworkSnapshot copyWith({
    DateTime? timestamp,
    int? activeRequests,
    int? bytesReceived,
    int? bytesSent,
    Duration? latency,
    double? downloadRateBytesPerSecond,
    double? uploadRateBytesPerSecond,
    bool? connected,
  }) {
    return NetworkSnapshot(
      timestamp: timestamp ?? this.timestamp,
      activeRequests: activeRequests ?? this.activeRequests,
      bytesReceived: bytesReceived ?? this.bytesReceived,
      bytesSent: bytesSent ?? this.bytesSent,
      latency: latency ?? this.latency,
      downloadRateBytesPerSecond: downloadRateBytesPerSecond ?? this.downloadRateBytesPerSecond,
      uploadRateBytesPerSecond: uploadRateBytesPerSecond ?? this.uploadRateBytesPerSecond,
      connected: connected ?? this.connected,
    );
  }

  /// Converts this snapshot into a serializable map.
  Map<String, Object?> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'activeRequests': activeRequests,
      'bytesReceived': bytesReceived,
      'bytesSent': bytesSent,
      'latencyMicros': latency?.inMicroseconds,
      'downloadRateBytesPerSecond': downloadRateBytesPerSecond,
      'uploadRateBytesPerSecond': uploadRateBytesPerSecond,
      'connected': connected,
    };
  }

  @override
  List<Object?> get props => [
    timestamp,
    activeRequests,
    bytesReceived,
    bytesSent,
    latency,
    downloadRateBytesPerSecond,
    uploadRateBytesPerSecond,
    connected,
  ];

  @override
  String toString() {
    return 'NetworkSnapshot('
        'timestamp: $timestamp, '
        'activeRequests: $activeRequests, '
        'bytesReceived: $bytesReceived, '
        'bytesSent: $bytesSent, '
        'latency: $latency, '
        'downloadRateBytesPerSecond: $downloadRateBytesPerSecond, '
        'uploadRateBytesPerSecond: $uploadRateBytesPerSecond, '
        'connected: $connected'
        ')';
  }
}
