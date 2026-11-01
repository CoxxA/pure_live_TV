import 'package:media_core/geometry/video_geometry.dart';

/// Geometry lifecycle event.
sealed class GeometryEvent {
  const GeometryEvent({required this.generation});

  /// Event generation.
  final int generation;

  /// Geometry changed.
  const factory GeometryEvent.changed(VideoGeometry geometry, int generation) = GeometryChanged;

  /// Geometry reset.
  const factory GeometryEvent.reset(int generation) = GeometryReset;
}

/// Geometry update event.
final class GeometryChanged extends GeometryEvent {
  const GeometryChanged(this.geometry, int generation) : super(generation: generation);

  final VideoGeometry geometry;
}

/// Geometry clear event.
final class GeometryReset extends GeometryEvent {
  const GeometryReset(int generation) : super(generation: generation);
}
