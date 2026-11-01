/// Resolves the `http-proxy` property for the next open.
///
/// Empty string means DIRECT and the property is skipped.
typedef MediaKitProxyUrlResolver = String Function({required bool privateInput});

/// Open-time configuration for [MediaKitPlayerAdapter].
///
/// Every field is applied to libmpv before `open()` runs. Surface
/// concerns (fit, fill, controls, wakelock, subtitles, fullscreen) live
/// in `MediaKitVideoConfig` instead.
///
/// Two switches are meaningful on one platform only and are silently
/// ignored elsewhere, so a value persisted on one device cannot corrupt
/// the picture on another:
///
/// - [playerCompatMode] — Android only. Forces `vo=mediacodec_embed`
///   and `hwdec=mediacodec`, bypassing the SurfaceProducer path.
/// - [enableRtxVsr] — Windows only. Enables RTX Video Super Resolution
///   through `d3d11vpp`.
///
/// macOS unconditionally forces `hwdec=no` regardless of anything here.
final class MediaKitPlayerConfig {
  const MediaKitPlayerConfig({
    this.proxyUrlResolver,
    this.enableCodec = true,
    this.playerCompatMode = false,
    this.customPlayerOutput = false,
    this.videoHardwareDecoder = 'auto-safe',
    this.videoOutputDriver = 'auto',
    this.audioOutputDriver,
    this.enableRtxVsr = false,
    this.extraProperties = const <String, String>{},

    // VideoControllerConfiguration passthrough.
    this.videoScale = 1.0,
    this.videoOutputWidth,
    this.videoOutputHeight,
    this.enableAndroidSurfaceProducer = false,
    this.androidAttachSurfaceAfterVideoParameters = false,
  });

  /// Resolver for the `http-proxy` property; empty string = DIRECT.
  final MediaKitProxyUrlResolver? proxyUrlResolver;

  /// Master hardware-decoding switch when no expert output is selected.
  ///
  /// Ignored on macOS — the platform profile pins `hwdec=no`.
  final bool enableCodec;

  /// Android-only expert switch.
  ///
  /// Silently ignored on every other platform.
  final bool playerCompatMode;

  /// Uses [videoOutputDriver] / [videoHardwareDecoder] verbatim
  /// (still passed through the platform normaliser).
  final bool customPlayerOutput;

  /// User-picked hardware decoder (used when [customPlayerOutput]).
  ///
  /// Normalised per-platform; unsupported values fall back to `auto`.
  final String videoHardwareDecoder;

  /// User-picked video output driver (used when [customPlayerOutput]).
  ///
  /// Normalised per-platform; iOS is pinned to `libmpv`.
  final String videoOutputDriver;

  /// User-picked audio output driver; null leaves mpv's per-platform
  /// default.
  final String? audioOutputDriver;

  /// Windows-only expert switch.
  ///
  /// Silently ignored on every other platform.
  final bool enableRtxVsr;

  /// Escape hatch: additional native mpv properties applied after the
  /// built-in contract.
  ///
  /// Keys and values are passed straight to `setProperty`. Anything
  /// listed here wins over the adapter's own setting for the same key.
  final Map<String, String> extraProperties;

  // ---------------------------------------------------------------------------
  // VideoControllerConfiguration passthrough
  //
  // These map straight onto [mkv.VideoControllerConfiguration]. Values
  // are forwarded untouched except for the platform normalisation that
  // the adapter already applies to `vo` and `hwdec`.
  // ---------------------------------------------------------------------------

  /// Render scale factor for the video output.
  ///
  /// Useful for performance reasons. When non-1.0, libmpv ignores
  /// [videoOutputWidth] and [videoOutputHeight].
  ///
  /// Default: `1.0`.
  final double videoScale;

  /// Fixed width for the video output, in pixels.
  ///
  /// Useful for performance reasons.
  final int? videoOutputWidth;

  /// Fixed height for the video output, in pixels.
  ///
  /// Useful for performance reasons.
  final int? videoOutputHeight;

  /// Kept for source compatibility with the upstream adapter.
  ///
  /// The Android 5 distribution uses media_kit_video 1.3.0, whose Android
  /// implementation always uses SurfaceTexture. This flag has no effect.
  final bool enableAndroidSurfaceProducer;

  /// Whether to attach `android.view.Surface` after video parameters
  /// are known.
  ///
  /// libmpv's own default is `true` when `vo == gpu`, `false` otherwise.
  /// Set this only when you need to override that heuristic.
  ///
  /// Forced to `false` when [playerCompatMode] is on.
  final bool androidAttachSurfaceAfterVideoParameters;

  static const Object _noChange = Object();

  MediaKitPlayerConfig copyWith({
    Object? proxyUrlResolver = _noChange,
    bool? enableCodec,
    bool? playerCompatMode,
    bool? customPlayerOutput,
    String? videoHardwareDecoder,
    String? videoOutputDriver,
    Object? audioOutputDriver = _noChange,
    bool? enableRtxVsr,
    Map<String, String>? extraProperties,

    // VideoControllerConfiguration passthrough.
    double? videoScale,
    Object? videoOutputWidth = _noChange,
    Object? videoOutputHeight = _noChange,
    bool? enableAndroidSurfaceProducer,
    bool? androidAttachSurfaceAfterVideoParameters,
  }) {
    return MediaKitPlayerConfig(
      proxyUrlResolver: identical(proxyUrlResolver, _noChange)
          ? this.proxyUrlResolver
          : proxyUrlResolver as MediaKitProxyUrlResolver?,
      enableCodec: enableCodec ?? this.enableCodec,
      playerCompatMode: playerCompatMode ?? this.playerCompatMode,
      customPlayerOutput: customPlayerOutput ?? this.customPlayerOutput,
      videoHardwareDecoder: videoHardwareDecoder ?? this.videoHardwareDecoder,
      videoOutputDriver: videoOutputDriver ?? this.videoOutputDriver,
      audioOutputDriver: identical(audioOutputDriver, _noChange)
          ? this.audioOutputDriver
          : audioOutputDriver as String?,
      enableRtxVsr: enableRtxVsr ?? this.enableRtxVsr,
      extraProperties: extraProperties ?? this.extraProperties,

      videoScale: videoScale ?? this.videoScale,
      videoOutputWidth: identical(videoOutputWidth, _noChange) ? this.videoOutputWidth : videoOutputWidth as int?,
      videoOutputHeight: identical(videoOutputHeight, _noChange) ? this.videoOutputHeight : videoOutputHeight as int?,
      enableAndroidSurfaceProducer: enableAndroidSurfaceProducer ?? this.enableAndroidSurfaceProducer,
      androidAttachSurfaceAfterVideoParameters:
          androidAttachSurfaceAfterVideoParameters ?? this.androidAttachSurfaceAfterVideoParameters,
    );
  }
}
