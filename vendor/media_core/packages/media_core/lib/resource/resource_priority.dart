/// Resource allocation priority.
enum ResourcePriority {
  /// Background resources.
  background,

  /// Normal playback.
  normal,

  /// Current visible player.
  foreground,

  /// User interacting player.
  interactive,
}
