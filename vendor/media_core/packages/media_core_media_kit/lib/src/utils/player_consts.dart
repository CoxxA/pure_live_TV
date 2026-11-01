/// Static MPV option catalogs used by the platform normaliser.
///
/// These catalogs intentionally contain option names rather than platform
/// selection logic. Platform-specific filtering and default selection should
/// remain in the MPV platform profile / normaliser.
///
/// MPV references:
/// - Video output: `--vo`
/// - Audio output: `--ao`
/// - Hardware decoding: `--hwdec`
abstract final class PlayerConsts {
  // ---------------------------------------------------------------------------
  // Video output drivers
  // ---------------------------------------------------------------------------

  /// MPV video output drivers.
  ///
  /// These values correspond to MPV's `--vo` option.
  ///
  /// MPV currently recommends `gpu-next` as the general-purpose video
  /// renderer. Other drivers are mainly compatibility, embedding, or
  /// platform-specific outputs.
  static const Map<String, String> videoOutputDrivers = {
    /// Modern GPU renderer based on libplacebo.
    ///
    /// This is the current recommended general-purpose renderer in MPV.
    'gpu-next': 'gpu-next',

    /// GPU renderer based on MPV's traditional GPU rendering path.
    ///
    /// Still widely supported and useful as a compatibility fallback.
    'gpu': 'gpu',

    /// XVideo output.
    ///
    /// X11 only. Primarily intended for compatibility with older systems.
    /// Not normally recommended for modern MPV configurations.
    'xv': 'xv (X11 only)',

    /// X11 video output.
    ///
    /// X11 only. Mainly intended for compatibility.
    'x11': 'x11 (X11 only)',

    /// VDPAU video output.
    ///
    /// X11 only. Legacy compatibility output.
    ///
    /// For modern NVIDIA hardware, MPV recommends using `vo=gpu` or
    /// `vo=gpu-next` together with an appropriate hardware decoder instead.
    'vdpau': 'vdpau (X11 only)',

    /// Direct3D video output.
    ///
    /// Windows only. Legacy/compatibility output compared with the
    /// modern GPU rendering path.
    'direct3d': 'direct3d (Windows only)',

    /// SDL 2 video output.
    ///
    /// Cross-platform compatibility renderer.
    ///
    /// Depending on the system, SDL may use hardware or software rendering.
    'sdl': 'sdl',

    /// Direct DMA-BUF output for Wayland.
    ///
    /// Intended for Linux/Wayland systems, especially together with
    /// DRM stateless or VA-API hardware decoding.
    ///
    /// This output is primarily focused on avoiding unnecessary GPU/CPU
    /// copies and using fixed-function scaling where available.
    ///
    /// MPV notes that `gpu`/`gpu-next` are generally preferred when possible.
    'dmabuf-wayland': 'dmabuf-wayland',

    /// VA-API video output.
    ///
    /// Primarily Linux/Intel compatibility output.
    ///
    /// MPV recommends using `vo=gpu` or `vo=gpu-next` together with
    /// `hwdec=vaapi` instead of using the VA-API VO directly.
    'vaapi': 'vaapi',

    /// Disables video output.
    ///
    /// Useful for audio-only or headless playback.
    'null': 'null',

    /// Video output intended for applications embedding libmpv.
    ///
    /// Mainly useful when MPV is integrated through the libmpv rendering API.
    'libmpv': 'libmpv',

    /// Android MediaCodec surface output.
    ///
    /// Android only.
    ///
    /// Renders MediaCodec frames directly to an Android `Surface`.
    /// Requires `hwdec=mediacodec` and is intended for native Android
    /// surface rendering.
    ///
    /// This path has fewer MPV rendering features than `gpu`/`gpu-next`,
    /// including limitations around subtitles, OSD and video filters.
    'mediacodec_embed': 'mediacodec_embed (Android only)',

    /// Direct Rendering Manager output.
    ///
    /// Linux only.
    ///
    /// Useful for systems without a full graphical desktop environment.
    /// Hardware acceleration should normally be handled through the
    /// GPU VO's DRM backend instead.
    'drm': 'drm (Linux only)',

    /// Wayland shared-memory output.
    ///
    /// Wayland only. Software rendering fallback intended primarily
    /// for compatibility.
    'wlshm': 'wlshm (Wayland only)',
  };

  // ---------------------------------------------------------------------------
  // Audio output drivers
  // ---------------------------------------------------------------------------

  /// MPV audio output drivers.
  ///
  /// These values correspond to MPV's `--ao` option.
  ///
  /// MPV treats `--ao` as a priority list. The actual drivers available
  /// depend on how the MPV build was compiled and on the host platform.
  static const Map<String, String> audioOutputDrivers = {
    /// Disables audio output completely.
    ///
    /// Useful for video-only playback or when audio is intentionally
    /// suppressed.
    'null': 'null (No audio output)',

    /// PulseAudio output.
    ///
    /// Linux systems using PulseAudio.
    'pulse': 'pulse (Linux, PulseAudio)',

    /// PipeWire output.
    ///
    /// Modern Linux audio server. Can also provide PulseAudio compatibility.
    'pipewire': 'pipewire (Linux, PipeWire)',

    /// ALSA output.
    ///
    /// Linux only. Low-level Linux audio API.
    'alsa': 'alsa (Linux only)',

    /// Open Sound System output.
    ///
    /// Legacy Unix/Linux audio API.
    'oss': 'oss (Linux/Unix legacy)',

    /// JACK output.
    ///
    /// Used primarily for professional and low-latency audio workflows.
    'jack': 'jack (Linux/macOS, low-latency audio)',

    /// Windows DirectSound output.
    ///
    /// Legacy Windows audio API.
    'directsound': 'directsound (Windows only)',

    /// Windows WASAPI output.
    ///
    /// Modern Windows audio API.
    ///
    /// Supports features such as exclusive mode when supported by
    /// the underlying audio device.
    'wasapi': 'wasapi (Windows only)',

    /// Windows Multimedia Extensions output.
    ///
    /// Legacy Windows audio API.
    'winmm': 'winmm (Windows only, legacy API)',

    /// Apple Audio Unit output.
    ///
    /// Used on Apple platforms where Audio Unit output is available.
    'audiounit': 'audiounit (Apple platforms)',

    /// Apple CoreAudio output.
    ///
    /// macOS audio backend.
    'coreaudio': 'coreaudio (macOS only)',

    /// Android OpenSL ES output.
    ///
    /// Legacy Android audio backend.
    'opensles': 'opensles (Android only)',

    /// Android AudioTrack output.
    ///
    /// Common Android audio backend.
    'audiotrack': 'audiotrack (Android only)',

    /// Android AAudio output.
    ///
    /// Modern Android audio API available on supported Android versions.
    'aaudio': 'aaudio (Android only)',

    /// Raw PCM output.
    ///
    /// Low-level output intended for integrations that consume PCM data.
    'pcm': 'pcm (Cross-platform)',

    /// SDL audio output.
    ///
    /// Cross-platform output through SDL.
    'sdl': 'sdl (Cross-platform, SDL)',

    /// OpenAL audio output.
    ///
    /// Requires OpenAL support in the MPV build.
    'openal': 'openal (Cross-platform, OpenAL)',

    /// libao audio output.
    ///
    /// Requires libao support in the MPV build.
    'libao': 'libao (Cross-platform, libao)',

    /// Automatically select an available audio output.
    ///
    /// Usually the safest choice when the application does not need
    /// a specific audio backend.
    'auto': 'auto (Automatic selection)',
  };

  // ---------------------------------------------------------------------------
  // Hardware decoder
  // ---------------------------------------------------------------------------

  /// MPV hardware video decoder modes and APIs.
  ///
  /// These values correspond to MPV's `--hwdec` option.
  ///
  /// Important:
  ///
  /// - `no` disables hardware decoding.
  /// - `auto` enables MPV's supported/whitelisted hardware decoders.
  /// - `auto-safe` is currently equivalent to `auto`.
  /// - `yes` is currently equivalent to `auto`.
  /// - `auto-unsafe` attempts hardware decoders that are not necessarily
  ///   considered safe by MPV.
  /// - Specific API names force a particular hardware decoding backend.
  ///
  /// MPV recommends starting with `hwdec=auto` rather than immediately
  /// forcing a specific decoder.
  static const Map<String, String> hardwareDecoder = {
    /// Disable hardware decoding.
    ///
    /// Always use software decoding.
    'no': 'no',

    /// Automatically select an MPV-supported hardware decoder.
    ///
    /// This is the recommended starting point when enabling hardware
    /// decoding without knowing the exact hardware backend.
    'auto': 'auto (Recommended automatic selection)',

    /// Automatically select a hardware decoder using MPV's safe set.
    ///
    /// Currently equivalent to `auto`.
    'auto-safe': 'auto-safe (Same as auto)',

    /// Automatically probe hardware decoders outside the normal safe set.
    ///
    /// Intended mainly for testing and troubleshooting.
    'auto-unsafe': 'auto-unsafe (Testing / troubleshooting)',

    /// Enable hardware decoding using the normal automatic selection logic.
    ///
    /// Currently equivalent to `auto`.
    'yes': 'yes (Same as auto)',

    /// Automatically select a hardware decoder while copying decoded
    /// frames back to system memory.
    'auto-copy': 'auto-copy',

    /// Windows Direct3D 11 Video Acceleration.
    ///
    /// Windows 8+.
    ///
    /// Normally requires `vo=gpu` or `vo=gpu-next` with a compatible
    /// D3D11/ANGLE GPU context.
    'd3d11va': 'd3d11va (Windows)',

    /// D3D11VA with decoded frames copied back to system memory.
    ///
    /// Useful when direct hardware-frame interop is not suitable.
    'd3d11va-copy': 'd3d11va-copy (Windows, copy-back)',

    /// Apple VideoToolbox hardware decoding.
    ///
    /// Primarily used on macOS and supported Apple platforms.
    'videotoolbox': 'videotoolbox (Apple)',

    /// VideoToolbox with decoded frames copied back to system memory.
    'videotoolbox-copy': 'videotoolbox-copy (Apple, copy-back)',

    /// Linux VA-API hardware decoding.
    ///
    /// Common on Intel and other VA-API capable hardware.
    'vaapi': 'vaapi (Linux)',

    /// VA-API with decoded frames copied back to system memory.
    'vaapi-copy': 'vaapi-copy (Linux, copy-back)',

    /// NVIDIA NVDEC hardware decoding.
    ///
    /// NVIDIA GPU hardware decoder.
    ///
    /// MPV generally recommends NVDEC over CUDA for NVIDIA hardware
    /// decoding when both are applicable.
    'nvdec': 'nvdec (NVIDIA)',

    /// NVDEC with decoded frames copied back to system memory.
    'nvdec-copy': 'nvdec-copy (NVIDIA, copy-back)',

    /// Linux DRM hardware decoding.
    ///
    /// Intended for systems using Direct Rendering Manager.
    'drm': 'drm (Linux)',

    /// DRM hardware decoding with copy-back.
    'drm-copy': 'drm-copy (Linux, copy-back)',

    /// Vulkan hardware decoding.
    ///
    /// Uses Vulkan-based hardware decoding where supported.
    'vulkan': 'vulkan (Vulkan)',

    /// Vulkan hardware decoding with copy-back.
    'vulkan-copy': 'vulkan-copy (Vulkan, copy-back)',

    /// DXVA2 hardware decoding.
    ///
    /// Legacy Windows hardware decoder.
    ///
    /// MPV documents this backend as unsafe compared with newer
    /// hardware decoding paths.
    'dxva2': 'dxva2 (Windows legacy)',

    /// DXVA2 hardware decoding with copy-back.
    'dxva2-copy': 'dxva2-copy (Windows legacy, copy-back)',

    /// VDPAU hardware decoding.
    ///
    /// Primarily Linux/X11.
    ///
    /// Legacy compatibility path; modern NVIDIA systems should normally
    /// prefer NVDEC with a GPU-based video output.
    'vdpau': 'vdpau (Linux/X11 legacy)',

    /// VDPAU hardware decoding with copy-back.
    'vdpau-copy': 'vdpau-copy (Linux/X11 legacy, copy-back)',

    /// Android MediaCodec hardware decoding.
    ///
    /// Android only.
    ///
    /// Common choice for Android hardware decoding. With
    /// `vo=mediacodec_embed`, decoded frames can be rendered directly
    /// to an Android Surface.
    'mediacodec': 'mediacodec (Android)',

    /// Android MediaCodec hardware decoding with copy-back.
    ///
    /// Decoded frames are copied back instead of remaining in the
    /// native MediaCodec surface representation.
    'mediacodec-copy': 'mediacodec-copy (Android, copy-back)',

    /// CUDA hardware decoding.
    ///
    /// NVIDIA CUDA-based decoder.
    ///
    /// MPV notes that NVDEC should generally be preferred when available.
    'cuda': 'cuda (NVIDIA, legacy/compatibility)',

    /// CUDA hardware decoding with copy-back.
    'cuda-copy': 'cuda-copy (NVIDIA, copy-back)',

    /// Broadcom CrystalHD hardware decoding.
    ///
    /// Legacy hardware decoder.
    'crystalhd': 'crystalhd (Legacy)',

    /// Rockchip Media Processing Platform hardware decoding.
    ///
    /// Intended for supported Rockchip SoCs.
    'rkmpp': 'rkmpp (Rockchip)',
  };
}
