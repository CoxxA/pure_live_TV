import 'package:equatable/equatable.dart';

/// Describes the lifecycle state of audio focus.
///
/// This is deliberately independent from any platform audio-focus API.
/// Platform adapters translate their native focus/interruption callbacks into
/// these states.
enum AudioFocusStatus {
  /// No focus has been requested or the focus lifecycle is idle.
  idle,

  /// A focus request is currently being processed.
  requesting,

  /// Focus has been granted.
  focused,

  /// Focus has been lost without enough information to classify the loss.
  lost,

  /// Focus was temporarily lost but may be recovered automatically.
  transientLoss,

  /// Focus has been permanently lost and must be requested again.
  permanentLoss,

  /// Focus has been abandoned by the application.
  abandoned,

  /// The focus subsystem encountered an error.
  error,

  /// The focus abstraction has been permanently disposed.
  disposed,
}

/// Immutable snapshot of the current audio-focus state.
///
/// The snapshot is intentionally small. Platform-specific information such as
/// native focus constants, interruption reasons, or route-change metadata
/// should remain outside the core abstraction.
final class AudioFocusState extends Equatable {
  /// Creates an audio-focus state.
  const AudioFocusState({this.status = AudioFocusStatus.idle, this.generation = 0});

  /// Creates an idle state.
  const AudioFocusState.idle({int generation = 0}) : this(status: AudioFocusStatus.idle, generation: generation);

  /// Creates a state indicating that a focus request is in progress.
  const AudioFocusState.requesting({int generation = 0})
    : this(status: AudioFocusStatus.requesting, generation: generation);

  /// Creates a focused state.
  const AudioFocusState.focused({int generation = 0}) : this(status: AudioFocusStatus.focused, generation: generation);

  /// Creates a generic lost-focus state.
  const AudioFocusState.lost({int generation = 0}) : this(status: AudioFocusStatus.lost, generation: generation);

  /// Creates a temporarily lost-focus state.
  const AudioFocusState.transientLoss({int generation = 0})
    : this(status: AudioFocusStatus.transientLoss, generation: generation);

  /// Creates a permanently lost-focus state.
  const AudioFocusState.permanentLoss({int generation = 0})
    : this(status: AudioFocusStatus.permanentLoss, generation: generation);

  /// Creates an abandoned-focus state.
  const AudioFocusState.abandoned({int generation = 0})
    : this(status: AudioFocusStatus.abandoned, generation: generation);

  /// Creates an error state.
  const AudioFocusState.error({int generation = 0}) : this(status: AudioFocusStatus.error, generation: generation);

  /// Creates a disposed state.
  const AudioFocusState.disposed({int generation = 0})
    : this(status: AudioFocusStatus.disposed, generation: generation);

  /// Current focus status.
  final AudioFocusStatus status;

  /// Monotonically increasing generation associated with the focus lifecycle.
  ///
  /// A generation allows higher-level coordinators to distinguish callbacks
  /// belonging to an older focus lifecycle from callbacks belonging to the
  /// current one.
  final int generation;

  /// Whether focus is currently held.
  bool get hasFocus => status == AudioFocusStatus.focused;

  /// Whether focus has been lost.
  bool get isLost =>
      status == AudioFocusStatus.lost ||
      status == AudioFocusStatus.transientLoss ||
      status == AudioFocusStatus.permanentLoss;

  /// Whether focus is temporarily unavailable.
  bool get isTemporarilyLost => status == AudioFocusStatus.transientLoss || status == AudioFocusStatus.lost;

  /// Whether focus must be requested again explicitly.
  bool get requiresRequest => status == AudioFocusStatus.permanentLoss || status == AudioFocusStatus.abandoned;

  /// Whether a focus request is currently in progress.
  bool get isRequesting => status == AudioFocusStatus.requesting;

  /// Whether the focus subsystem encountered an error.
  bool get hasError => status == AudioFocusStatus.error;

  /// Whether the focus lifecycle is inactive.
  bool get isInactive => status == AudioFocusStatus.idle || status == AudioFocusStatus.abandoned;

  /// Whether the focus lifecycle has been permanently disposed.
  bool get isDisposed => status == AudioFocusStatus.disposed;

  /// Whether the focus lifecycle is transitioning.
  bool get isTransitioning => status == AudioFocusStatus.requesting;

  /// Creates a copy with selected fields replaced.
  AudioFocusState copyWith({AudioFocusStatus? status, int? generation}) {
    return AudioFocusState(status: status ?? this.status, generation: generation ?? this.generation);
  }

  /// Equatable value properties.
  ///
  /// Both status and generation participate in equality because two identical
  /// focus states belonging to different lifecycle generations must be
  /// distinguishable by higher-level coordinators.
  @override
  List<Object?> get props => <Object?>[status, generation];

  @override
  String toString() {
    return 'AudioFocusState('
        'status: $status, '
        'generation: $generation'
        ')';
  }
}
