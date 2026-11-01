/// How a video is fitted when it does not match the presentation surface.
///
/// The same video needs a different answer per orientation, which is why this
/// lives in the core model instead of one platform's driver: a portrait video
/// on a portrait phone fills the screen, the same video on a landscape monitor
/// is letterboxed, and a viewer holding a phone sideways sometimes wants the
/// portrait video rotated instead. Naming the strategies here lets a host, a
/// policy and a driver agree on them without re-deriving the rules.
enum FullscreenFitStrategy {
  /// Letterbox: the whole video is visible, bars fill the remainder.
  ///
  /// The safe default for long-form content.
  fit,

  /// Crop: the surface is filled, overflow is cut off.
  ///
  /// Standard for short vertical video.
  fill,

  /// Rotate the video 90° to use the surface's long axis.
  ///
  /// Only meaningful for the portrait-on-landscape case; a host that does not
  /// rotate must treat it as [fit] rather than fail.
  rotate;

  /// Whether this strategy crops the video.
  bool get crops => this == FullscreenFitStrategy.fill;

  /// Whether this strategy rotates the video.
  bool get rotates => this == FullscreenFitStrategy.rotate;
}
