import 'dart:async';
import 'package:media_core/geometry/video_size.dart';
import 'package:media_core/adapter/player_adapter.dart';
import 'package:media_core/adapter/player_adapter_event.dart';
import 'package:media_core/geometry/geometry_controller.dart';

/// Binds player adapter events to the geometry controller.
///
/// Responsibilities:
///
/// - listen to player adapter events
/// - convert video size events into [VideoSize]
/// - update [GeometryController]
///
/// It does not:
///
/// - calculate orientation
/// - calculate aspect ratio
/// - perform layout
/// - access platform APIs
/// - control playback
final class PlayerGeometryBinding {
  PlayerGeometryBinding({required PlayerAdapter adapter, required GeometryController geometry})
    : _adapter = adapter,
      _geometry = geometry {
    _subscription = _adapter.events.listen(_onEvent);
  }

  final PlayerAdapter _adapter;
  final GeometryController _geometry;

  late final StreamSubscription<PlayerAdapterEvent> _subscription;

  void _onEvent(PlayerAdapterEvent event) {
    switch (event) {
      case PlayerAdapterVideoSizeChanged():
        _geometry.updateVideoSize(VideoSize(width: event.width, height: event.height));

      case PlayerAdapterVideoReconfigured():
        // The adapter does not provide the new geometry with this event.
        // Wait for the next videoSizeChanged event.
        break;

      default:
        break;
    }
  }

  Future<void> dispose() async {
    await _subscription.cancel();
  }
}
