import 'package:equatable/equatable.dart';

/// Playback command.
///
/// Represents a playback state mutation.
///
/// Commands are consumed by:
///
/// - PlaybackController
///
/// Does not:
///
/// - call player backend
/// - perform async operations
/// - control platform APIs
sealed class PlaybackCommand extends Equatable {
  const PlaybackCommand();

  /// Idle state.
  const factory PlaybackCommand.idle() = PlaybackCommandIdle;

  /// Start playback.
  const factory PlaybackCommand.play() = PlaybackCommandPlay;

  /// Pause playback.
  const factory PlaybackCommand.pause() = PlaybackCommandPause;

  /// Stop playback.
  const factory PlaybackCommand.stop() = PlaybackCommandStop;

  /// Buffering state.
  const factory PlaybackCommand.buffering(bool value) = PlaybackCommandBuffering;

  /// Update position.
  const factory PlaybackCommand.position(Duration position) = PlaybackCommandPosition;

  /// Update duration.
  const factory PlaybackCommand.duration(Duration duration) = PlaybackCommandDuration;

  /// Seek position.
  const factory PlaybackCommand.seek(Duration position) = PlaybackCommandSeek;

  /// Update volume.
  const factory PlaybackCommand.volume(double volume) = PlaybackCommandVolume;

  /// Update playback speed.
  const factory PlaybackCommand.rate(double rate) = PlaybackCommandRate;

  // ---------------------------------------------------------------------------
  // Status
  // ---------------------------------------------------------------------------

  bool get isIdle => this is PlaybackCommandIdle;

  bool get isLoading => this is PlaybackCommandLoading;

  bool get isPlaying => this is PlaybackCommandPlay;

  bool get isPaused => this is PlaybackCommandPause;

  bool get isStopped => this is PlaybackCommandStop;

  bool get isBuffering => this is PlaybackCommandBuffering;

  /// Whether command represents a completed state.
  ///
  /// Commands themselves are not async operations.
  /// This exists only for state compatibility.
  bool get isCompleted => false;

  /// Whether command is timeline-related.
  bool get isTimeline =>
      this is PlaybackCommandPosition || this is PlaybackCommandDuration || this is PlaybackCommandSeek;

  /// Whether command is a value change.
  bool get isValueChange => this is PlaybackCommandVolume || this is PlaybackCommandRate;

  @override
  List<Object?> get props => [];
}

/// Idle command.
final class PlaybackCommandIdle extends PlaybackCommand {
  const PlaybackCommandIdle();

  @override
  String toString() => 'PlaybackCommandIdle';
}

/// Loading command.
///
/// Reserved for future async loading state.
final class PlaybackCommandLoading extends PlaybackCommand {
  const PlaybackCommandLoading();

  @override
  String toString() => 'PlaybackCommandLoading';
}

/// Play command.
final class PlaybackCommandPlay extends PlaybackCommand {
  const PlaybackCommandPlay();

  @override
  String toString() => 'PlaybackCommandPlay';
}

/// Pause command.
final class PlaybackCommandPause extends PlaybackCommand {
  const PlaybackCommandPause();

  @override
  String toString() => 'PlaybackCommandPause';
}

/// Stop command.
final class PlaybackCommandStop extends PlaybackCommand {
  const PlaybackCommandStop();

  @override
  String toString() => 'PlaybackCommandStop';
}

/// Buffering command.
final class PlaybackCommandBuffering extends PlaybackCommand {
  const PlaybackCommandBuffering(this.value);

  final bool value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PlaybackCommandBuffering($value)';
}

/// Position update command.
final class PlaybackCommandPosition extends PlaybackCommand {
  const PlaybackCommandPosition(this.position);

  final Duration position;

  @override
  List<Object?> get props => [position];
}

/// Duration update command.
final class PlaybackCommandDuration extends PlaybackCommand {
  const PlaybackCommandDuration(this.duration);

  final Duration duration;

  @override
  List<Object?> get props => [duration];
}

/// Seek command.
final class PlaybackCommandSeek extends PlaybackCommand {
  const PlaybackCommandSeek(this.position);

  final Duration position;

  @override
  List<Object?> get props => [position];
}

/// Volume command.
final class PlaybackCommandVolume extends PlaybackCommand {
  const PlaybackCommandVolume(this.volume);

  final double volume;

  @override
  List<Object?> get props => [volume];
}

/// Rate command.
final class PlaybackCommandRate extends PlaybackCommand {
  const PlaybackCommandRate(this.rate);

  final double rate;

  @override
  List<Object?> get props => [rate];
}
