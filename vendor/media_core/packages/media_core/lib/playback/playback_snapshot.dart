import 'package:media_core/playback/playback_state.dart';
import 'package:equatable/equatable.dart';

/// Immutable playback snapshot.
///
/// Represents a read-only playback state view.
///
/// Used by:
///
/// - Player API
/// - UI layer
/// - Diagnostics
///
/// Does not:
///
/// - execute commands
/// - modify playback
/// - control backend
final class PlaybackSnapshot extends Equatable {
  const PlaybackSnapshot({
    required this.command,
    required this.position,
    required this.duration,
    required this.volume,
    required this.rate,
    required this.initialized,
    required this.updatedAt,
  });

  /// Creates snapshot from state.
  factory PlaybackSnapshot.fromState(PlaybackState state) {
    return PlaybackSnapshot(
      command: state.command,
      position: state.position,
      duration: state.duration,
      volume: state.volume,
      rate: state.rate,
      initialized: state.initialized,
      updatedAt: state.updatedAt,
    );
  }

  /// Current command.
  final Object command;

  /// Current position.
  final Duration position;

  /// Media duration.
  final Duration duration;

  /// Current volume.
  final double volume;

  /// Current playback rate.
  final double rate;

  /// Whether initialized.
  final bool initialized;

  /// Last update timestamp.
  final DateTime? updatedAt;

  /// Whether playing.
  bool get isPlaying {
    return command.runtimeType.toString().contains('Play');
  }

  /// Whether paused.
  bool get isPaused {
    return command.runtimeType.toString().contains('Pause');
  }

  /// Whether stopped.
  bool get isStopped {
    return command.runtimeType.toString().contains('Stop');
  }

  /// Whether buffering.
  bool get isBuffering {
    return command.runtimeType.toString().contains('Buffering');
  }

  /// Progress 0-1.
  double get progress {
    if (duration <= Duration.zero) {
      return 0;
    }

    final value = position.inMilliseconds / duration.inMilliseconds;

    if (value < 0) {
      return 0;
    }

    if (value > 1) {
      return 1;
    }

    return value;
  }

  /// Remaining duration.
  Duration get remaining {
    final value = duration - position;

    if (value < Duration.zero) {
      return Duration.zero;
    }

    return value;
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position.inMilliseconds,

      'duration': duration.inMilliseconds,

      'volume': volume,

      'rate': rate,

      'initialized': initialized,

      'updatedAt': updatedAt?.toIso8601String(),

      'command': command.runtimeType.toString(),
    };
  }

  @override
  List<Object?> get props => [command, position, duration, volume, rate, initialized, updatedAt];

  @override
  String toString() {
    return 'PlaybackSnapshot('
        'position=$position, '
        'duration=$duration, '
        'volume=$volume, '
        'rate=$rate)';
  }
}
