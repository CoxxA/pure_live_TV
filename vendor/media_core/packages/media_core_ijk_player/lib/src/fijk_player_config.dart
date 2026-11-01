/// Resolves the `http_proxy` format option for the next open.
///
/// An empty string means DIRECT.
typedef FijkProxyUrlResolver = String Function({required bool privateInput});

/// Complete configuration surface for [FlvLzcPlayerAdapter] /
/// fijkplayer.
///
/// - Every field has a safe default equivalent to the pre-refactor
///   behaviour.
/// - [extraPlayerOptions] / [extraHostOptions] / [extraFormatOptions]
///   are applied after the named options, so they can override any
///   built-in key or add IJK options this class does not wrap yet
///   (`ijkio`, `dns_cache`, `rtmp_live`, ...).
/// - The whole object can be assigned to `adapter.config` or injected
///   through [IjkPlayerAdapterFactory].
final class FijkPlayerConfig {
  const FijkPlayerConfig({
    // player category
    this.enableCodec = true,
    this.disableAudioOutput = false,
    this.accurateSeek = true,
    this.soundtouch = true,
    this.subtitle = true,

    // host category
    this.requestAudioFocus = true,
    this.requestScreenOn = true,

    // format category
    this.reconnect = true,
    this.timeout = const Duration(seconds: 30),
    this.fflags = 'fastseek',
    this.rtspTransport = 'tcp',

    // proxy
    /// Static proxy; used when [proxyUrlResolver] is null.
    /// Empty string means DIRECT.
    this.proxyUrl = '',

    /// Per-open dynamic proxy resolution; takes precedence over
    /// [proxyUrl] when provided.
    this.proxyUrlResolver,

    // headers
    this.headers = const <String, String>{},

    // escape hatch
    this.extraPlayerOptions = const <String, Object>{},
    this.extraHostOptions = const <String, Object>{},
    this.extraFormatOptions = const <String, Object>{},
  });

  // player
  final bool enableCodec;
  final bool disableAudioOutput;
  final bool accurateSeek;
  final bool soundtouch;
  final bool subtitle;

  // host
  final bool requestAudioFocus;
  final bool requestScreenOn;

  // format
  final bool reconnect;
  final Duration timeout;
  final String fflags;
  final String rtspTransport;

  // proxy
  final String proxyUrl;
  final FijkProxyUrlResolver? proxyUrlResolver;

  // headers
  final Map<String, String> headers;

  // escape hatch — these maps override same-named options above
  final Map<String, Object> extraPlayerOptions;
  final Map<String, Object> extraHostOptions;
  final Map<String, Object> extraFormatOptions;

  static const Object _noChange = Object();

  FijkPlayerConfig copyWith({
    bool? enableCodec,
    bool? disableAudioOutput,
    bool? accurateSeek,
    bool? soundtouch,
    bool? subtitle,
    bool? requestAudioFocus,
    bool? requestScreenOn,
    bool? reconnect,
    Duration? timeout,
    String? fflags,
    String? rtspTransport,
    String? proxyUrl,
    Object? proxyUrlResolver = _noChange,
    Map<String, String>? headers,
    Map<String, Object>? extraPlayerOptions,
    Map<String, Object>? extraHostOptions,
    Map<String, Object>? extraFormatOptions,
  }) {
    return FijkPlayerConfig(
      enableCodec: enableCodec ?? this.enableCodec,
      disableAudioOutput: disableAudioOutput ?? this.disableAudioOutput,
      accurateSeek: accurateSeek ?? this.accurateSeek,
      soundtouch: soundtouch ?? this.soundtouch,
      subtitle: subtitle ?? this.subtitle,
      requestAudioFocus: requestAudioFocus ?? this.requestAudioFocus,
      requestScreenOn: requestScreenOn ?? this.requestScreenOn,
      reconnect: reconnect ?? this.reconnect,
      timeout: timeout ?? this.timeout,
      fflags: fflags ?? this.fflags,
      rtspTransport: rtspTransport ?? this.rtspTransport,
      proxyUrl: proxyUrl ?? this.proxyUrl,
      proxyUrlResolver: identical(proxyUrlResolver, _noChange)
          ? this.proxyUrlResolver
          : proxyUrlResolver as FijkProxyUrlResolver?,
      headers: headers ?? this.headers,
      extraPlayerOptions: extraPlayerOptions ?? this.extraPlayerOptions,
      extraHostOptions: extraHostOptions ?? this.extraHostOptions,
      extraFormatOptions: extraFormatOptions ?? this.extraFormatOptions,
    );
  }
}
