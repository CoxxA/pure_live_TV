import 'package:equatable/equatable.dart';

/// Describes an error produced during a recording lifecycle.
///
/// A [RecordingError] provides a backend-independent representation of a
/// recording failure so higher-level components do not need to depend on
/// platform-specific exception types.
///
/// Responsibilities:
///
/// - identify the recording failure category
/// - describe the failure
/// - optionally retain the original cause
/// - optionally retain the original stack trace
/// - provide stable error information to higher layers
///
/// It does not:
///
/// - recover from recording failures
/// - retry recording operations
/// - decide whether a recording should be stopped
/// - implement backend-specific error handling
///
/// Those responsibilities belong to:
///
/// - RecordingSession
/// - RecordingManager
/// - RecordingBackend
final class RecordingError extends Equatable {
  /// Creates a recording error.
  const RecordingError({required this.code, required this.message, this.cause, this.stackTrace});

  /// Creates an error indicating that the recording configuration is invalid.
  const RecordingError.invalidConfiguration({required String message, Object? cause, StackTrace? stackTrace})
    : this(code: RecordingErrorCode.invalidConfiguration, message: message, cause: cause, stackTrace: stackTrace);

  /// Creates an error indicating that recording is already active.
  const RecordingError.alreadyRecording({String message = 'A recording is already active.'})
    : this(code: RecordingErrorCode.alreadyRecording, message: message);

  /// Creates an error indicating that no recording is active.
  const RecordingError.notRecording({String message = 'No recording is active.'})
    : this(code: RecordingErrorCode.notRecording, message: message);

  /// Creates an error indicating that the requested backend is unavailable.
  const RecordingError.backendUnavailable({required String message, Object? cause, StackTrace? stackTrace})
    : this(code: RecordingErrorCode.backendUnavailable, message: message, cause: cause, stackTrace: stackTrace);

  /// Creates an error indicating that the recording source is unavailable.
  const RecordingError.sourceUnavailable({required String message, Object? cause, StackTrace? stackTrace})
    : this(code: RecordingErrorCode.sourceUnavailable, message: message, cause: cause, stackTrace: stackTrace);

  /// Creates an error indicating that the output cannot be created.
  const RecordingError.outputUnavailable({required String message, Object? cause, StackTrace? stackTrace})
    : this(code: RecordingErrorCode.outputUnavailable, message: message, cause: cause, stackTrace: stackTrace);

  /// Creates an error indicating that recording has failed.
  const RecordingError.failed({required String message, Object? cause, StackTrace? stackTrace})
    : this(code: RecordingErrorCode.failed, message: message, cause: cause, stackTrace: stackTrace);

  /// Creates an error indicating that recording was cancelled.
  const RecordingError.cancelled({String message = 'Recording was cancelled.'})
    : this(code: RecordingErrorCode.cancelled, message: message);

  /// Stable recording error code.
  final RecordingErrorCode code;

  /// Human-readable description of the failure.
  final String message;

  /// Original exception or error that caused the failure.
  final Object? cause;

  /// Stack trace associated with [cause].
  final StackTrace? stackTrace;

  /// Whether an underlying cause is available.
  bool get hasCause {
    return cause != null;
  }

  /// Whether a stack trace is available.
  bool get hasStackTrace {
    return stackTrace != null;
  }

  @override
  List<Object?> get props => [code, message, cause, stackTrace];

  @override
  String toString() {
    return 'RecordingError('
        'code: $code, '
        'message: $message, '
        'cause: $cause'
        ')';
  }
}

/// Defines stable categories of recording errors.
///
/// Error codes are intentionally independent of platform-specific exception
/// classes so callers can implement consistent recording behavior across
/// different backends and platforms.
enum RecordingErrorCode {
  /// Recording configuration is invalid or unsupported.
  invalidConfiguration,

  /// A recording is already active.
  alreadyRecording,

  /// No recording is currently active.
  notRecording,

  /// No suitable recording backend is available.
  backendUnavailable,

  /// The recording source is unavailable.
  sourceUnavailable,

  /// The requested recording output cannot be created or opened.
  outputUnavailable,

  /// Recording failed during execution.
  failed,

  /// Recording was explicitly cancelled.
  cancelled,
}

/// Provides common operations for [RecordingErrorCode].
extension RecordingErrorCodeX on RecordingErrorCode {
  /// Stable string representation of this error code.
  String get name {
    return switch (this) {
      RecordingErrorCode.invalidConfiguration => 'invalid_configuration',
      RecordingErrorCode.alreadyRecording => 'already_recording',
      RecordingErrorCode.notRecording => 'not_recording',
      RecordingErrorCode.backendUnavailable => 'backend_unavailable',
      RecordingErrorCode.sourceUnavailable => 'source_unavailable',
      RecordingErrorCode.outputUnavailable => 'output_unavailable',
      RecordingErrorCode.failed => 'failed',
      RecordingErrorCode.cancelled => 'cancelled',
    };
  }

  /// Whether this error indicates an expected cancellation rather than a
  /// recording failure.
  bool get isCancellation {
    return this == RecordingErrorCode.cancelled;
  }
}
