/// Platform-independent audio focus abstraction.
///
/// Audio focus represents the application's right to use the system audio
/// channel. The actual focus mechanism is platform-specific and must be
/// implemented outside the media core.
///
/// Examples of platform behavior that may be hidden behind this abstraction:
/// - Android audio focus.
/// - iOS/macOS audio-session interruptions.
/// - Windows application audio focus.
/// - Other platform-specific audio interruption mechanisms.
///
/// The media core only needs to know whether focus can be requested or
/// abandoned. Focus-change notifications and platform-specific policies can
/// be layered on top of this abstraction.
abstract interface class AudioFocus {
  /// Requests audio focus for the current media session.
  ///
  /// Implementations should complete normally when focus has been granted.
  /// They should throw when the platform rejects the request or the operation
  /// cannot be completed.
  Future<void> request();

  /// Abandons previously acquired audio focus.
  ///
  /// This operation should be idempotent at the implementation level where
  /// possible, because lifecycle cleanup may call it after an interrupted or
  /// partially completed focus request.
  Future<void> abandon();
}
