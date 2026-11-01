/// Defines how the player presentation is displayed.
///
/// Presentation mode describes the visual presentation
/// layer of the player.
///
/// It is independent from:
///
/// - media playback state
/// - buffering state
/// - player lifecycle
///
/// A player can continue playing while switching
/// between different presentation modes.
///
/// Example:
///
/// playing video:
/// normal
///      ↓
/// fullscreen
///      ↓
/// pip
///
/// Playback is not affected by these changes.
enum PresentationMode {
  /// Normal in-page presentation.
  ///
  /// The player is rendered inside
  /// the application's normal layout.
  ///
  /// Example:
  ///
  /// - video page
  /// - live room page
  /// - embedded player
  normal,

  /// Fullscreen presentation.
  ///
  /// The player occupies the
  /// fullscreen area.
  ///
  /// The actual fullscreen behavior
  /// is handled by platform adapters.
  ///
  /// Examples:
  ///
  /// - Android immersive fullscreen
  /// - Windows fullscreen window
  /// - macOS fullscreen space
  fullscreen,

  /// Window-level fullscreen presentation.
  ///
  /// The player fills the application's own window while the window itself
  /// stays a window: no OS fullscreen, no taskbar hidden, no window bounds
  /// changed. Chrome around the video (app bars, lists, tab bars) is hidden,
  /// and the video is laid out against the window's edges.
  ///
  /// It is a separate mode rather than a flag on [fullscreen] because the two
  /// are independent capabilities: a desktop window can fill without going
  /// fullscreen, a phone has no OS fullscreen at all yet fills the screen, and
  /// a host may offer both as distinct buttons. Collapsing them would force a
  /// platform that supports only one to lie about the other.
  ///
  /// The actual layout is handled by the host; the mode is what the host, the
  /// presentation state and the PiP/floating drivers agree on so that entering
  /// one fullscreen variant reliably leaves the other.
  windowFullscreen,

  /// Picture-in-picture presentation.
  ///
  /// The player is displayed in
  /// a system PiP window.
  ///
  /// The native implementation is
  /// handled by platform adapters.
  ///
  /// Examples:
  ///
  /// - Android PictureInPicture API
  /// - iOS AVPictureInPictureController
  pip,

  /// Floating window presentation.
  ///
  /// The player is displayed above
  /// normal application content.
  ///
  /// Examples:
  ///
  /// - desktop floating player
  /// - overlay player window
  floating,
}

/// Extension helpers for [PresentationMode].
///
/// This extension provides convenient
/// checks and metadata.
///
/// It only describes logical presentation
/// information.
///
/// It does not:
///
/// - call platform APIs
/// - create windows
/// - change system UI
extension PresentationModeExtension on PresentationMode {
  /// Whether this mode is fullscreen.
  ///
  /// Returns true when the player
  /// occupies the fullscreen area.
  ///
  /// System fullscreen only: a window that fills the app is
  /// [isWindowFullscreen]. Use [isAnyFullscreen] when either counts.
  bool get isFullscreen => this == PresentationMode.fullscreen;

  /// Whether this mode is window-level fullscreen.
  bool get isWindowFullscreen => this == PresentationMode.windowFullscreen;

  /// Whether this mode is any fullscreen variant.
  ///
  /// Both variants hide the surrounding chrome; they differ in what they take
  /// over — the screen or only the window.
  bool get isAnyFullscreen => isFullscreen || isWindowFullscreen;

  /// Whether this mode is picture-in-picture.
  ///
  /// PiP usually means the player
  /// is displayed outside the application
  /// main layout.
  bool get isPip => this == PresentationMode.pip;

  /// Whether this mode is floating window.
  ///
  /// Floating mode represents a player
  /// displayed above normal content.
  bool get isFloating => this == PresentationMode.floating;

  /// Whether this mode is normal inline mode.
  ///
  /// Normal mode means the player
  /// belongs to the current application layout.
  bool get isNormal => this == PresentationMode.normal;

  /// Whether this mode is an overlay mode.
  ///
  /// Overlay modes are displayed above
  /// the normal application content.
  ///
  /// Includes:
  ///
  /// - PiP
  /// - floating window
  ///
  /// Does not include:
  ///
  /// - normal mode
  /// - fullscreen mode
  bool get isOverlay {
    switch (this) {
      case PresentationMode.normal:
      case PresentationMode.fullscreen:
      case PresentationMode.windowFullscreen:
        return false;

      case PresentationMode.pip:
      case PresentationMode.floating:
        return true;
    }
  }

  /// Whether this mode changes the
  /// application presentation layer.
  ///
  /// Used by UI layer to decide
  /// whether layout handling is required.
  bool get requiresPresentationLayer {
    switch (this) {
      case PresentationMode.normal:
        return false;

      case PresentationMode.fullscreen:
      case PresentationMode.windowFullscreen:
      case PresentationMode.pip:
      case PresentationMode.floating:
        return true;
    }
  }

  /// Human readable mode name.
  ///
  /// Useful for:
  ///
  /// - logging
  /// - debugging
  /// - analytics
  String get name {
    switch (this) {
      case PresentationMode.normal:
        return 'normal';

      case PresentationMode.fullscreen:
        return 'fullscreen';

      case PresentationMode.windowFullscreen:
        return 'windowFullscreen';

      case PresentationMode.pip:
        return 'pip';

      case PresentationMode.floating:
        return 'floating';
    }
  }

  /// Whether this mode is a temporary
  /// presentation state.
  ///
  /// Temporary modes are usually entered
  /// and exited by user/system actions.
  bool get isTemporary {
    switch (this) {
      case PresentationMode.normal:
        return false;

      case PresentationMode.fullscreen:
      case PresentationMode.windowFullscreen:
      case PresentationMode.pip:
      case PresentationMode.floating:
        return true;
    }
  }
}
