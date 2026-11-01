import 'package:equatable/equatable.dart';

/// Describes the lifecycle state of an audio session.
enum AudioSessionStatus {
  /// The session has not been activated.
  inactive,

  /// The session is currently being activated.
  activating,

  /// The session is active and configured for media playback.
  active,

  /// The session is currently being deactivated.
  deactivating,

  /// The session was interrupted by the platform.
  interrupted,

  /// The session encountered an error.
  error,

  /// The session has been permanently disposed.
  disposed,
}

/// Immutable snapshot of the audio-session lifecycle.
///
/// This type describes only the lifecycle of the audio session. It does not
/// contain focus, volume, mute, or route information; those concerns are
/// represented by their respective audio abstractions.
///
/// The [generation] value identifies the lifecycle generation to which the
/// state belongs. Higher-level coordinators can use it to reject stale
/// asynchronous callbacks from an older session lifecycle.
final class AudioSessionState extends Equatable {
  /// Creates an audio-session state.
  const AudioSessionState({this.status = AudioSessionStatus.inactive, this.generation = 0});

  /// Creates the initial inactive state.
  const AudioSessionState.inactive({int generation = 0})
    : this(status: AudioSessionStatus.inactive, generation: generation);

  /// Creates an activating state.
  const AudioSessionState.activating({int generation = 0})
    : this(status: AudioSessionStatus.activating, generation: generation);

  /// Creates an active state.
  const AudioSessionState.active({int generation = 0})
    : this(status: AudioSessionStatus.active, generation: generation);

  /// Creates a deactivating state.
  const AudioSessionState.deactivating({int generation = 0})
    : this(status: AudioSessionStatus.deactivating, generation: generation);

  /// Creates an interrupted state.
  const AudioSessionState.interrupted({int generation = 0})
    : this(status: AudioSessionStatus.interrupted, generation: generation);

  /// Creates an error state.
  const AudioSessionState.error({int generation = 0}) : this(status: AudioSessionStatus.error, generation: generation);

  /// Creates a disposed state.
  const AudioSessionState.disposed({int generation = 0})
    : this(status: AudioSessionStatus.disposed, generation: generation);

  /// Current session lifecycle status.
  final AudioSessionStatus status;

  /// Monotonically increasing session lifecycle generation.
  ///
  /// Higher-level coordinators can use this value to ignore asynchronous
  /// callbacks belonging to an older session lifecycle.
  final int generation;

  /// Whether the session is currently active.
  bool get isActive => status == AudioSessionStatus.active;

  /// Whether the session is currently inactive.
  bool get isInactive => status == AudioSessionStatus.inactive;

  /// Whether activation is in progress.
  bool get isActivating => status == AudioSessionStatus.activating;

  /// Whether deactivation is in progress.
  bool get isDeactivating => status == AudioSessionStatus.deactivating;

  /// Whether the session has been interrupted.
  bool get isInterrupted => status == AudioSessionStatus.interrupted;

  /// Whether the session encountered an error.
  bool get hasError => status == AudioSessionStatus.error;

  /// Whether the session has been disposed.
  bool get isDisposed => status == AudioSessionStatus.disposed;

  /// Whether the session is in a transitional lifecycle state.
  bool get isTransitioning => status == AudioSessionStatus.activating || status == AudioSessionStatus.deactivating;

  /// Creates a copy with selected fields replaced.
  AudioSessionState copyWith({AudioSessionStatus? status, int? generation}) {
    return AudioSessionState(status: status ?? this.status, generation: generation ?? this.generation);
  }

  @override
  List<Object?> get props => <Object?>[status, generation];

  @override
  String toString() {
    return 'AudioSessionState('
        'status: $status, '
        'generation: $generation'
        ')';
  }
}
