import 'package:equatable/equatable.dart';

import 'package:media_core/screenshot/screenshot_format.dart';

/// Frame-capture request handed to a backend adapter.
///
/// It carries only what an engine needs to produce an image. Player identity,
/// playback position and frame size are attached by the kernel when the bytes
/// come back, because the engine knows nothing about the surrounding player —
/// and because a captured frame is worth keeping even if the player is torn
/// down immediately afterwards.
///
/// Responsibilities:
///
/// - describe the wanted encoding
///
/// It does not:
///
/// - identify the player
/// - carry the resulting bytes
/// - decide which route is used
///
/// Those belong to:
///
/// - PlayerAdapter.captureFrame
/// - PlayerScreenshot
/// - ScreenshotManager
final class ScreenshotRequest extends Equatable {
  /// Creates a capture request.
  const ScreenshotRequest({required this.format, this.quality = 90, this.includeSubtitles = false});

  /// Requested image format.
  ///
  /// An implementation that cannot encode it must return null rather than
  /// mislabel bytes: the caller falls back to a surface capture, which does
  /// produce a different format and says so.
  final ScreenshotFormat format;

  /// JPEG quality in the 1–100 range; ignored for PNG.
  final int quality;

  /// Whether subtitles rendered by the engine should be included.
  final bool includeSubtitles;

  /// [format] as the MIME string engines are given.
  String get mimeType => format.mimeType;

  /// [quality] clamped to the range engines accept.
  int get effectiveQuality => quality.clamp(1, 100);

  /// Whether this request asks for a lossy encoding.
  bool get isLossy => format.isLossy;

  @override
  List<Object?> get props => [format, quality, includeSubtitles];

  @override
  String toString() {
    return 'ScreenshotRequest('
        'format: ${format.name}, '
        'quality: $quality, '
        'includeSubtitles: $includeSubtitles'
        ')';
  }
}
