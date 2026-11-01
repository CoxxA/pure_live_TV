import 'package:equatable/equatable.dart';

/// Represents the result of a recording lifecycle.
///
/// A [RecordingResult] contains the information produced when a recording
/// session finishes. It is independent of the concrete recording backend.
///
/// Responsibilities:
///
/// - identify whether the recording completed successfully
/// - describe the generated output
/// - record the final recording duration
/// - record the number of bytes written
/// - expose a recording error when applicable
///
/// It does not:
///
/// - perform the recording
/// - finalize backend resources
/// - create output files
/// - decide how recording failures are recovered
///
/// Those responsibilities belong to:
///
/// - RecordingSession
/// - RecordingBackend
/// - RecordingManager
final class RecordingResult extends Equatable {
  /// Creates a recording result.
  const RecordingResult({
    required this.success,
    this.outputPath,
    this.duration = Duration.zero,
    this.bytesWritten = 0,
    this.error,
  });

  /// Creates a successful recording result.
  const RecordingResult.success({required String outputPath, Duration duration = Duration.zero, int bytesWritten = 0})
    : this(success: true, outputPath: outputPath, duration: duration, bytesWritten: bytesWritten);

  /// Creates a failed recording result.
  const RecordingResult.failure({
    required Object error,
    String? outputPath,
    Duration duration = Duration.zero,
    int bytesWritten = 0,
  }) : this(success: false, outputPath: outputPath, duration: duration, bytesWritten: bytesWritten, error: error);

  /// Whether the recording completed successfully.
  final bool success;

  /// Path of the generated recording output.
  final String? outputPath;

  /// Final duration of the recording.
  final Duration duration;

  /// Number of bytes written to the output.
  final int bytesWritten;

  /// Error associated with an unsuccessful recording.
  final Object? error;

  /// Whether an output path is available.
  bool get hasOutput {
    return outputPath != null && outputPath!.isNotEmpty;
  }

  /// Whether this result contains an error.
  bool get hasError {
    return error != null;
  }

  @override
  List<Object?> get props => [success, outputPath, duration, bytesWritten, error];

  @override
  String toString() {
    return 'RecordingResult('
        'success: $success, '
        'outputPath: $outputPath, '
        'duration: $duration, '
        'bytesWritten: $bytesWritten, '
        'error: $error'
        ')';
  }
}
