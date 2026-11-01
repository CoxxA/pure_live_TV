import 'package:equatable/equatable.dart';

/// Describes video output surface.
///
/// [PlatformSurface] represents the rendering
/// surface requirements and capabilities.
///
/// Responsibilities:
///
/// - describe surface type
/// - describe texture support
/// - describe lifecycle behavior
///
/// It does not:
///
/// - create surface
/// - own native resources
///
/// Those belong to:
///
/// - VideoOutput
/// - Renderer implementation
final class PlatformSurface extends Equatable {
  /// Creates surface description.
  const PlatformSurface({
    this.type = PlatformSurfaceType.texture,

    this.supportsResize = true,

    this.supportsRotation = true,

    this.requiresRecreationOnSizeChange = false,

    this.persistent = true,

    this.id,
  });

  /// Surface type.
  final PlatformSurfaceType type;

  /// Runtime surface identifier.
  ///
  /// Example:
  ///
  /// - Flutter texture id
  /// - native surface handle
  final int? id;

  /// Whether surface supports resize.
  final bool supportsResize;

  /// Whether surface supports rotation changes.
  final bool supportsRotation;

  /// Whether surface must be recreated
  /// when video size changes.
  ///
  /// Some Android rendering pipelines require
  /// recreation when switching:
  ///
  /// - portrait video
  /// - landscape video
  final bool requiresRecreationOnSizeChange;

  /// Whether surface can survive source changes.
  final bool persistent;

  /// Whether this is a texture surface.
  bool get isTexture {
    return type == PlatformSurfaceType.texture;
  }

  /// Whether this is native surface.
  bool get isNative {
    return type == PlatformSurfaceType.surface;
  }

  /// Whether surface can be reused.
  bool get canReuse {
    return persistent && !requiresRecreationOnSizeChange;
  }

  /// Creates modified surface.
  PlatformSurface copyWith({
    PlatformSurfaceType? type,

    int? id,

    bool? supportsResize,

    bool? supportsRotation,

    bool? requiresRecreationOnSizeChange,

    bool? persistent,
  }) {
    return PlatformSurface(
      type: type ?? this.type,

      id: id ?? this.id,

      supportsResize: supportsResize ?? this.supportsResize,

      supportsRotation: supportsRotation ?? this.supportsRotation,

      requiresRecreationOnSizeChange: requiresRecreationOnSizeChange ?? this.requiresRecreationOnSizeChange,

      persistent: persistent ?? this.persistent,
    );
  }

  @override
  List<Object?> get props => [type, id, supportsResize, supportsRotation, requiresRecreationOnSizeChange, persistent];

  @override
  String toString() {
    return 'PlatformSurface('
        'type=$type, '
        'id=$id, '
        'persistent=$persistent'
        ')';
  }
}

/// Video output surface type.
enum PlatformSurfaceType {
  /// Flutter texture based output.
  ///
  /// Example:
  ///
  /// - media_kit_video
  /// - Texture widget
  texture,

  /// Native surface output.
  ///
  /// Example:
  ///
  /// - Android SurfaceTexture
  /// - MediaCodec Surface
  surface,

  /// Window/native handle output.
  ///
  /// Example:
  ///
  /// - desktop overlay
  window,

  /// Software frame output.
  frame,

  /// Unknown surface.
  unknown,
}
