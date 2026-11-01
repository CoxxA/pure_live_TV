import 'package:equatable/equatable.dart';

/// Describes network playback capabilities.
///
/// [PlatformNetwork] represents what network
/// features are available on current platform.
///
/// Responsibilities:
///
/// - supported protocols
/// - network feature flags
/// - connection capability
///
/// It does not:
///
/// - open connections
/// - download media
///
/// Those belong to:
///
/// - NetworkClient
/// - SourceResolver
final class PlatformNetwork extends Equatable {
  /// Creates network capabilities.
  const PlatformNetwork({
    this.enabled = true,

    this.http = true,

    this.https = true,

    this.hls = true,

    this.dash = true,

    this.rtmp = false,

    this.websocket = false,

    this.proxy = true,

    this.tls = true,

    this.maxConnections = 6,
  });

  /// Whether network playback is enabled.
  final bool enabled;

  /// HTTP support.
  final bool http;

  /// HTTPS support.
  final bool https;

  /// HLS support.
  ///
  /// Example:
  ///
  /// - m3u8
  final bool hls;

  /// MPEG-DASH support.
  ///
  /// Example:
  ///
  /// - mpd
  final bool dash;

  /// RTMP support.
  ///
  /// Example:
  ///
  /// - live streaming
  final bool rtmp;

  /// WebSocket support.
  final bool websocket;

  /// Proxy support.
  final bool proxy;

  /// TLS/SSL support.
  final bool tls;

  /// Maximum parallel connections.
  final int maxConnections;

  /// Whether live streaming protocols are supported.
  bool get supportsLiveStream {
    return hls || rtmp || websocket;
  }

  /// Whether secure network is supported.
  bool get supportsSecureConnection {
    return https && tls;
  }

  /// Whether any network playback is possible.
  bool get canPlayback {
    return enabled && (http || https);
  }

  /// Creates modified network capability.
  PlatformNetwork copyWith({
    bool? enabled,

    bool? http,

    bool? https,

    bool? hls,

    bool? dash,

    bool? rtmp,

    bool? websocket,

    bool? proxy,

    bool? tls,

    int? maxConnections,
  }) {
    return PlatformNetwork(
      enabled: enabled ?? this.enabled,

      http: http ?? this.http,

      https: https ?? this.https,

      hls: hls ?? this.hls,

      dash: dash ?? this.dash,

      rtmp: rtmp ?? this.rtmp,

      websocket: websocket ?? this.websocket,

      proxy: proxy ?? this.proxy,

      tls: tls ?? this.tls,

      maxConnections: maxConnections ?? this.maxConnections,
    );
  }

  @override
  List<Object?> get props => [enabled, http, https, hls, dash, rtmp, websocket, proxy, tls, maxConnections];

  @override
  String toString() {
    return 'PlatformNetwork('
        'enabled=$enabled, '
        'hls=$hls, '
        'dash=$dash, '
        'proxy=$proxy'
        ')';
  }
}
