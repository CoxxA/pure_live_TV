import 'package:equatable/equatable.dart';

/// Describes video rendering capabilities.
///
/// [PlatformRenderer] defines how video frames
/// can be presented on the current platform.
///
/// Responsibilities:
///
/// - describe rendering backend
/// - describe hardware acceleration support
/// - describe texture/surface support
///
/// It does not:
///
/// - create renderer
/// - manage rendering lifecycle
///
/// Those belong to:
///
/// - VideoOutput
/// - Backend
final class PlatformRenderer extends Equatable {
  /// Creates renderer description.
  const PlatformRenderer({
    this.type = PlatformRendererType.texture,

    this.hardwareAcceleration = true,

    this.gpuRendering = true,

    this.supportsSurface = false,

    this.supportsTexture = true,

    this.supportsOverlay = false,
  });

  /// Renderer type.
  final PlatformRendererType type;

  /// Whether hardware acceleration is available.
  final bool hardwareAcceleration;

  /// Whether GPU rendering is supported.
  final bool gpuRendering;

  /// Whether native surface rendering is supported.
  ///
  /// Example:
  ///
  /// - Android SurfaceView
  /// - MediaCodec Surface
  final bool supportsSurface;

  /// Whether Flutter texture rendering is supported.
  ///
  /// Example:
  ///
  /// - Texture widget
  /// - media_kit_video
  final bool supportsTexture;

  /// Whether native overlay rendering is supported.
  ///
  /// Example:
  ///
  /// - Windows video overlay
  /// - Direct rendering
  final bool supportsOverlay;

  /// Whether renderer can display video.
  bool get canRender {
    return supportsSurface || supportsTexture || supportsOverlay;
  }

  /// Whether GPU rendering is preferred.
  bool get preferHardware {
    return hardwareAcceleration && gpuRendering;
  }

  /// Creates modified renderer.
  PlatformRenderer copyWith({
    PlatformRendererType? type,

    bool? hardwareAcceleration,

    bool? gpuRendering,

    bool? supportsSurface,

    bool? supportsTexture,

    bool? supportsOverlay,
  }) {
    return PlatformRenderer(
      type: type ?? this.type,

      hardwareAcceleration: hardwareAcceleration ?? this.hardwareAcceleration,

      gpuRendering: gpuRendering ?? this.gpuRendering,

      supportsSurface: supportsSurface ?? this.supportsSurface,

      supportsTexture: supportsTexture ?? this.supportsTexture,

      supportsOverlay: supportsOverlay ?? this.supportsOverlay,
    );
  }

  @override
  List<Object?> get props => [
    type,

    hardwareAcceleration,

    gpuRendering,

    supportsSurface,

    supportsTexture,

    supportsOverlay,
  ];

  @override
  String toString() {
    return 'PlatformRenderer('
        'type=$type, '
        'hardware=$hardwareAcceleration, '
        'texture=$supportsTexture'
        ')';
  }
}

/// Video rendering backend type.
enum PlatformRendererType {
  /// Flutter texture rendering.
  ///
  /// Used by:
  ///
  /// - media_kit_video
  /// - Texture widget
  texture,

  /// Native surface rendering.
  ///
  /// Used by:
  ///
  /// - Android Surface
  /// - hardware decoder output
  surface,

  /// Native overlay rendering.
  ///
  /// Used by:
  ///
  /// - desktop video overlay
  overlay,

  /// Software frame rendering.
  ///
  /// Used when GPU is unavailable.
  software,

  /// Unknown renderer.
  unknown,
}
