import 'package:flutter/widgets.dart';
import 'package:media_core_media_kit/src/media_kit_player_adapter.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

/// Renders the surface owned by [MediaKitPlayerAdapter].
///
/// This is the reference implementation of a *custom* surface: it does
/// not call `adapter.build()`, it reads `adapter.videoController` and
/// `adapter.fitListenable` directly. That keeps the adapter as the
/// single owner of the mpv surface while letting the app own the widget
/// tree, controls and fullscreen behaviour.
///
/// ```dart
/// MediaKitVideoView(adapter: myAdapter)
/// ```
class MediaKitVideoView extends StatelessWidget {
  const MediaKitVideoView({super.key, required this.adapter, this.controls});

  /// The adapter whose surface is rendered.
  final MediaKitPlayerAdapter adapter;

  /// Controls builder. `null` falls back to the adapter config's own
  /// controls (which is "no controls" unless configured otherwise).
  final mkv.VideoControlsBuilder? controls;

  @override
  Widget build(BuildContext context) {
    final controller = adapter.videoController;

    // The adapter owns the controller; before onInitialize there is no
    // surface to render, so collapse to nothing.
    if (controller == null) {
      return const SizedBox.shrink();
    }

    final cfg = adapter.videoConfig;

    // fitListenable is the exact same notifier that `adapter.build()`
    // uses, so `adapter.setVideoFit(...)` re-renders this widget too.
    return ValueListenableBuilder<BoxFit>(
      valueListenable: adapter.fitListenable,
      builder: (context, fit, _) {
        return mkv.Video(
          controller: controller,

          // fit is adapter-driven (setVideoFit writes the notifier).
          fit: fit,

          // controls: prefer the widget's own override, else the
          // adapter config, else the plugin default.
          controls: controls ?? cfg.controls ?? mkv.NoVideoControls,

          // Everything else reads straight from the adapter's
          // MediaKitVideoConfig so the call site keeps one place to
          // configure the surface.
          width: cfg.width,
          height: cfg.height,
          fill: cfg.fill,
          alignment: cfg.alignment,
          aspectRatio: cfg.aspectRatio,
          filterQuality: cfg.filterQuality,
          wakelock: cfg.wakelock,
          pauseUponEnteringBackgroundMode: cfg.pauseUponEnteringBackgroundMode,
          resumeUponEnteringForegroundMode: cfg.resumeUponEnteringForegroundMode,
          subtitleViewConfiguration: cfg.subtitleViewConfiguration,
          onEnterFullscreen: cfg.onEnterFullscreen ?? mkv.defaultEnterNativeFullscreen,
          onExitFullscreen: cfg.onExitFullscreen ?? mkv.defaultExitNativeFullscreen,
        );
      },
    );
  }
}
