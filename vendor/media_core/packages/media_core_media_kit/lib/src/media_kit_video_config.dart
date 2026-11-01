import 'package:flutter/widgets.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:media_kit_video/media_kit_video_controls/media_kit_video_controls.dart' as mkv_controls;

/// Complete configuration surface for the media_kit `Video` widget.
///
/// Mirrors [mkv.Video]'s constructor 1:1, minus `controller` (owned by
/// the adapter). Defaults match media_kit's except for the two lifecycle
/// switches, which the adapter pins to `false` so the app's own
/// lifecycle coordinator stays the single authority.
@immutable
final class MediaKitVideoConfig {
  const MediaKitVideoConfig({
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.fill = const Color(0xFF000000),
    this.alignment = Alignment.center,
    this.aspectRatio,
    this.filterQuality = FilterQuality.low,
    this.controls,
    this.wakelock = true,
    this.pauseUponEnteringBackgroundMode = false,
    this.resumeUponEnteringForegroundMode = false,
    this.subtitleViewConfiguration = const mkv.SubtitleViewConfiguration(),
    this.onEnterFullscreen,
    this.onExitFullscreen,
  });

  /// Fixed width of the viewport.
  final double? width;

  /// Fixed height of the viewport.
  final double? height;

  /// How frames are inscribed into the allocated space.
  final BoxFit fit;

  /// Background color behind the video.
  final Color fill;

  /// Alignment of the viewport.
  final Alignment alignment;

  /// Preferred aspect ratio of the viewport.
  final double? aspectRatio;

  /// Filter quality of the video texture.
  final FilterQuality filterQuality;

  /// Controls builder.
  ///
  /// `null` mounts no controls. Pass [MediaKitVideoControls.adaptive]
  /// for the plugin default, or supply your own builder.
  final mkv.VideoControlsBuilder? controls;

  /// Whether to acquire a wake lock while playing.
  final bool wakelock;

  /// Whether the widget should pause the player on background.
  ///
  /// Defaults to `false`: the app's lifecycle coordinator owns this and
  /// a second policy here paused audio-only rooms on Home / lock.
  final bool pauseUponEnteringBackgroundMode;

  /// Whether the widget should resume the player on foreground.
  ///
  /// Only meaningful when [pauseUponEnteringBackgroundMode] is `true`.
  final bool resumeUponEnteringForegroundMode;

  /// Subtitle rendering configuration.
  final mkv.SubtitleViewConfiguration subtitleViewConfiguration;

  /// Fullscreen-enter callback; null uses media_kit's native default.
  final Future<void> Function()? onEnterFullscreen;

  /// Fullscreen-exit callback; null uses media_kit's native default.
  final Future<void> Function()? onExitFullscreen;

  static const Object _noChange = Object();

  MediaKitVideoConfig copyWith({
    Object? width = _noChange,
    Object? height = _noChange,
    BoxFit? fit,
    Color? fill,
    Alignment? alignment,
    Object? aspectRatio = _noChange,
    FilterQuality? filterQuality,
    Object? controls = _noChange,
    bool? wakelock,
    bool? pauseUponEnteringBackgroundMode,
    bool? resumeUponEnteringForegroundMode,
    mkv.SubtitleViewConfiguration? subtitleViewConfiguration,
    Object? onEnterFullscreen = _noChange,
    Object? onExitFullscreen = _noChange,
  }) {
    return MediaKitVideoConfig(
      width: identical(width, _noChange) ? this.width : width as double?,
      height: identical(height, _noChange) ? this.height : height as double?,
      fit: fit ?? this.fit,
      fill: fill ?? this.fill,
      alignment: alignment ?? this.alignment,
      aspectRatio: identical(aspectRatio, _noChange) ? this.aspectRatio : aspectRatio as double?,
      filterQuality: filterQuality ?? this.filterQuality,
      controls: identical(controls, _noChange) ? this.controls : controls as mkv.VideoControlsBuilder?,
      wakelock: wakelock ?? this.wakelock,
      pauseUponEnteringBackgroundMode: pauseUponEnteringBackgroundMode ?? this.pauseUponEnteringBackgroundMode,
      resumeUponEnteringForegroundMode: resumeUponEnteringForegroundMode ?? this.resumeUponEnteringForegroundMode,
      subtitleViewConfiguration: subtitleViewConfiguration ?? this.subtitleViewConfiguration,
      onEnterFullscreen: identical(onEnterFullscreen, _noChange)
          ? this.onEnterFullscreen
          : onEnterFullscreen as Future<void> Function()?,
      onExitFullscreen: identical(onExitFullscreen, _noChange)
          ? this.onExitFullscreen
          : onExitFullscreen as Future<void> Function()?,
    );
  }
}

/// Ready-made control builders so callers do not need to import
/// `media_kit_video_controls` to pick one.
final class MediaKitVideoControls {
  const MediaKitVideoControls._();

  /// No controls mounted.
  static Widget none(mkv.VideoState state) => const SizedBox.shrink();

  /// The plugin's adaptive control overlay.
  static mkv.VideoControlsBuilder get adaptive => mkv_controls.AdaptiveVideoControls;
}
