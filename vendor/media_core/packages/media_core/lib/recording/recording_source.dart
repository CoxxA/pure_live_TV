import 'package:equatable/equatable.dart';

/// Describes the media source used by a recording session.
///
/// A [RecordingSource] identifies where the media being recorded comes from.
/// It intentionally contains only backend-independent source information so
/// that recording implementations can decide how to obtain the actual media.
///
/// Responsibilities:
///
/// - identify the recording source
/// - provide a stable source identity
/// - describe the source kind
/// - carry the source location when applicable
///
/// It does not:
///
/// - open the media source
/// - resolve network URLs
/// - create player adapters
/// - capture or encode media
///
/// Those responsibilities belong to:
///
/// - SourceResolver
/// - PlayerAdapter
/// - RecordingBackend
final class RecordingSource extends Equatable {
  /// Creates a recording source.
  const RecordingSource({required this.type, required this.value, this.id});

  /// Creates a local file recording source.
  const RecordingSource.file(String path, {String? id}) : this(type: RecordingSourceType.file, value: path, id: id);

  /// Creates a network recording source.
  const RecordingSource.network(String url, {String? id}) : this(type: RecordingSourceType.network, value: url, id: id);

  /// Creates a stream recording source.
  const RecordingSource.stream(String streamId, {String? id})
    : this(type: RecordingSourceType.stream, value: streamId, id: id);

  /// Creates a custom recording source.
  const RecordingSource.custom(String value, {String? id})
    : this(type: RecordingSourceType.custom, value: value, id: id);

  /// Type of the recording source.
  final RecordingSourceType type;

  /// Source value.
  ///
  /// The interpretation depends on [type]. For example, a file source uses a
  /// file path while a network source uses a URL.
  final String value;

  /// Optional stable source identifier.
  final String? id;

  /// Whether this source has an explicit identifier.
  bool get hasId {
    return id != null && id!.isNotEmpty;
  }

  /// Whether the source value is non-empty.
  bool get isValid {
    return value.isNotEmpty;
  }

  @override
  List<Object?> get props => [type, value, id];

  @override
  String toString() {
    return 'RecordingSource('
        'type: $type, '
        'value: $value, '
        'id: $id'
        ')';
  }
}

/// Defines the supported kinds of recording sources.
///
/// The source type describes the semantic origin of the media without
/// coupling the recording layer to a concrete player or network library.
enum RecordingSourceType {
  /// Media originating from a local file.
  file,

  /// Media originating from a network URL.
  network,

  /// Media originating from an existing media stream.
  stream,

  /// Source supplied by a platform or application-specific integration.
  custom,
}

/// Provides common operations for [RecordingSourceType].
extension RecordingSourceTypeX on RecordingSourceType {
  /// Stable string representation of this source type.
  String get name {
    return switch (this) {
      RecordingSourceType.file => 'file',
      RecordingSourceType.network => 'network',
      RecordingSourceType.stream => 'stream',
      RecordingSourceType.custom => 'custom',
    };
  }
}
