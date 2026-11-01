/// Runtime status of a player slot.
///
/// A slot status only describes the lifecycle phase
/// of a slot.
///
/// It does not contain:
///
/// - slot identity
/// - player identity
/// - session identity
///
/// Those belong to:
///
/// - PlayerSlotState
/// - PlayerSlot
enum PlayerSlotStatus {
  /// Slot has no assigned player.
  empty,

  /// Player has been assigned to slot.
  ///
  /// The player may not have started playback yet.
  assigned,

  /// Slot is currently active.
  ///
  /// Player and session are running.
  active,

  /// Slot is being released.
  ///
  /// Resources are being cleaned up.
  releasing,
}
