import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_adapter_state.freezed.dart';

/// Runtime state of a player adapter.
///
/// [PlayerAdapterState] represents the current
/// playback backend state.
///
/// Responsibilities:
///
/// - expose adapter state snapshot
/// - provide immutable state updates
///
/// It does not:
///
/// - execute playback commands
/// - dispatch events
/// - collect metrics
///
/// Those belong to:
///
/// - PlayerAdapter
/// - PlayerAdapterEvent
/// - PlayerAdapterMetrics
@freezed
abstract class PlayerAdapterState with _$PlayerAdapterState {
  /// Creates adapter state.
  const factory PlayerAdapterState({
    /// Whether adapter is initialized.
    @Default(false) bool initialized,

    /// Whether a source is opened.
    @Default(false) bool opened,

    /// Whether playback is active.
    @Default(false) bool playing,

    /// Whether playback is paused.
    @Default(false) bool paused,

    /// Whether backend is buffering.
    @Default(false) bool buffering,

    /// Whether playback completed.
    @Default(false) bool completed,

    /// Whether adapter has error.
    @Default(false) bool hasError,

    /// Current playback position.
    @Default(Duration.zero) Duration position,

    /// Current duration.
    Duration? duration,

    /// Current volume.
    @Default(1.0) double volume,

    /// Current playback rate.
    @Default(1.0) double rate,

    /// Video width.
    int? width,

    /// Video height.
    int? height,

    /// Error message.
    String? errorMessage,
  }) = _PlayerAdapterState;

  /// Creates initial state.
  factory PlayerAdapterState.initial() {
    return const PlayerAdapterState();
  }
}

/// Extensions for adapter state.
extension PlayerAdapterStateExtension on PlayerAdapterState {
  /// Whether adapter is ready for playback.
  bool get ready {
    return initialized && opened && !hasError;
  }

  /// Whether video information exists.
  bool get hasVideoSize {
    return width != null && height != null;
  }

  /// Whether duration is available.
  bool get hasDuration {
    return duration != null;
  }

  /// Whether playback is active.
  bool get active {
    return playing && !hasError;
  }

  /// Whether state is terminal.
  bool get finished {
    return completed || hasError;
  }

  /// Video aspect ratio.
  double? get aspectRatio {
    if (!hasVideoSize) {
      return null;
    }

    return width! / height!;
  }
}
