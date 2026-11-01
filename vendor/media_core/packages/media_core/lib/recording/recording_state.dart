import 'package:equatable/equatable.dart';

/// Represents the current state of a recording session.
///
/// A [RecordingState] describes the lifecycle phase and runtime progress of
/// one recording operation.
///
/// Responsibilities:
///
/// - represent the current recording lifecycle
/// - track elapsed recording duration
/// - track bytes written
/// - expose the current recording error
///
/// It does not:
///
/// - start or stop recording
/// - write encoded media
/// - manage recording resources
/// - select a recording backend
///
/// Those responsibilities belong to:
///
/// - RecordingSession
/// - RecordingBackend
/// - RecordingManager
final class RecordingState extends Equatable {
  /// Creates a recording state.
  const RecordingState({
    this.status = RecordingStatus.idle,
    this.duration = Duration.zero,
    this.bytesWritten = 0,
    this.error,
  });

  /// Current recording lifecycle status.
  final RecordingStatus status;

  /// Duration of the current recording.
  final Duration duration;

  /// Number of bytes written by the current recording.
  final int bytesWritten;

  /// Error associated with the current recording.
  final Object? error;

  /// Whether recording is currently active.
  bool get isRecording {
    return status == RecordingStatus.recording;
  }

  /// Whether recording has completed successfully.
  bool get isCompleted {
    return status == RecordingStatus.completed;
  }

  /// Whether recording is currently stopping.
  bool get isStopping {
    return status == RecordingStatus.stopping;
  }

  /// Whether recording is currently starting.
  bool get isStarting {
    return status == RecordingStatus.starting;
  }

  /// Whether recording has failed.
  bool get hasError {
    return status == RecordingStatus.error || error != null;
  }

  /// Creates a copy with selected values replaced.
  RecordingState copyWith({RecordingStatus? status, Duration? duration, int? bytesWritten, Object? error}) {
    return RecordingState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
      bytesWritten: bytesWritten ?? this.bytesWritten,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, duration, bytesWritten, error];

  @override
  String toString() {
    return 'RecordingState('
        'status: $status, '
        'duration: $duration, '
        'bytesWritten: $bytesWritten, '
        'error: $error'
        ')';
  }
}

/// Defines the lifecycle status of a recording session.
///
/// The status represents the state of the recording lifecycle rather than
/// the implementation state of a concrete recording backend.
enum RecordingStatus {
  /// No recording has been started.
  idle,

  /// Recording is being initialized.
  starting,

  /// Media is currently being recorded.
  recording,

  /// Recording is being finalized.
  stopping,

  /// Recording completed successfully.
  completed,

  /// Recording failed.
  error,

  /// Recording was cancelled.
  cancelled,
}

/// Provides common operations for [RecordingStatus].
extension RecordingStatusX on RecordingStatus {
  /// Whether the status represents an active recording lifecycle.
  bool get isActive {
    return this == RecordingStatus.starting || this == RecordingStatus.recording || this == RecordingStatus.stopping;
  }

  /// Whether the status represents a terminal state.
  bool get isTerminal {
    return this == RecordingStatus.completed || this == RecordingStatus.error || this == RecordingStatus.cancelled;
  }
}
