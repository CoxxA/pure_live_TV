import 'package:media_core/identity/slot_id.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/source_id.dart';
import 'package:media_core/identity/request_id.dart';
import 'package:media_core/identity/session_id.dart';
import 'package:media_core/identity/operation_id.dart';
import 'package:media_core/identity/generation_id.dart';
import 'package:equatable/equatable.dart';

/// Structured runtime context associated with a player error.
///
/// [ErrorContext] contains diagnostic information about where and when
/// an error occurred.
///
/// It intentionally does not contain:
/// - error classification;
/// - retry policy;
/// - fallback policy;
/// - recovery decisions;
/// - user-facing message formatting.
///
/// Those responsibilities belong to other layers of the architecture.
final class ErrorContext extends Equatable {
  const ErrorContext({
    this.playerId,
    this.sessionId,
    this.slotId,
    this.sourceId,
    this.requestId,
    this.operationId,
    this.generationId,
    this.operation,
    this.lineId,
    this.quality,
    this.uri,
    this.platform,
    this.backend,
    this.adapter,
    this.state,
    this.metadata = const <String, Object?>{},
  });

  /// Player instance associated with the failure.
  final PlayerId? playerId;

  /// Player session associated with the failure.
  final SessionId? sessionId;

  /// Player slot associated with the failure.
  final SlotId? slotId;

  /// Media source associated with the failure.
  final SourceId? sourceId;

  /// Request associated with the failure.
  final RequestId? requestId;

  /// High-level operation associated with the failure.
  final OperationId? operationId;

  /// Generation associated with the failure.
  ///
  /// This is useful for detecting stale asynchronous work.
  final GenerationId? generationId;

  /// Human-readable operation name.
  final String? operation;

  /// Optional source line identifier.
  final String? lineId;

  /// Optional requested quality identifier.
  final String? quality;

  /// Media URI associated with the operation.
  ///
  /// This should be treated as diagnostic data and may contain sensitive
  /// or credential-bearing information. Callers should sanitize it before
  /// displaying or persisting it externally.
  final String? uri;

  /// Platform identifier.
  final String? platform;

  /// Backend identifier.
  final String? backend;

  /// Adapter identifier.
  final String? adapter;

  /// Player state at the time of the failure.
  final String? state;

  /// Additional structured diagnostic metadata.
  final Map<String, Object?> metadata;

  // ===========================================================================
  // Presence
  // ===========================================================================

  bool get hasPlayerId => playerId != null;

  bool get hasSessionId => sessionId != null;

  bool get hasSlotId => slotId != null;

  bool get hasSourceId => sourceId != null;

  bool get hasRequestId => requestId != null;

  bool get hasOperationId => operationId != null;

  bool get hasGenerationId => generationId != null;

  bool get hasOperation => _hasText(operation);

  bool get hasLineId => _hasText(lineId);

  bool get hasQuality => _hasText(quality);

  bool get hasUri => _hasText(uri);

  bool get hasPlatform => _hasText(platform);

  bool get hasBackend => _hasText(backend);

  bool get hasAdapter => _hasText(adapter);

  bool get hasState => _hasText(state);

  bool get hasMetadata => metadata.isNotEmpty;

  /// Whether this context contains any diagnostic information.
  bool get isEmpty {
    return !hasPlayerId &&
        !hasSessionId &&
        !hasSlotId &&
        !hasSourceId &&
        !hasRequestId &&
        !hasOperationId &&
        !hasGenerationId &&
        !hasOperation &&
        !hasLineId &&
        !hasQuality &&
        !hasUri &&
        !hasPlatform &&
        !hasBackend &&
        !hasAdapter &&
        !hasState &&
        !hasMetadata;
  }

  bool get isNotEmpty => !isEmpty;

  // ===========================================================================
  // Metadata
  // ===========================================================================

  /// Returns an immutable copy of the metadata map.
  Map<String, Object?> get metadataView {
    return Map<String, Object?>.unmodifiable(metadata);
  }

  /// Returns whether [key] exists in metadata.
  bool containsMetadata(String key) {
    return metadata.containsKey(key);
  }

  /// Returns a metadata value.
  Object? metadataValue(String key) {
    return metadata[key];
  }

  /// Returns a typed metadata value when the stored value has the
  /// requested type.
  T? metadataAs<T>(String key) {
    final value = metadata[key];

    if (value is T) {
      return value;
    }

    return null;
  }

  /// Returns a copy with one metadata entry added or replaced.
  ErrorContext withMetadata(String key, Object? value) {
    final normalizedKey = key.trim();

    if (normalizedKey.isEmpty) {
      throw ArgumentError.value(key, 'key', 'Metadata key cannot be empty.');
    }

    final nextMetadata = <String, Object?>{...metadata, normalizedKey: value};

    return copyWith(metadata: nextMetadata);
  }

  /// Returns a copy with multiple metadata entries added or replaced.
  ErrorContext withMetadataMap(Map<String, Object?> values) {
    final nextMetadata = <String, Object?>{...metadata};

    for (final entry in values.entries) {
      final normalizedKey = entry.key.trim();

      if (normalizedKey.isEmpty) {
        throw ArgumentError.value(entry.key, 'values', 'Metadata keys cannot be empty.');
      }

      nextMetadata[normalizedKey] = entry.value;
    }

    return copyWith(metadata: nextMetadata);
  }

  /// Returns a copy without the specified metadata key.
  ErrorContext withoutMetadata(String key) {
    final nextMetadata = <String, Object?>{...metadata};

    nextMetadata.remove(key);

    return copyWith(metadata: nextMetadata);
  }

  /// Returns a copy without any metadata.
  ErrorContext clearMetadata() {
    return copyWith(metadata: const <String, Object?>{});
  }

  // ===========================================================================
  // Copy helpers
  // ===========================================================================

  /// Returns a copy with selected values replaced.
  ErrorContext copyWith({
    PlayerId? playerId,
    SessionId? sessionId,
    SlotId? slotId,
    SourceId? sourceId,
    RequestId? requestId,
    OperationId? operationId,
    GenerationId? generationId,
    String? operation,
    String? lineId,
    String? quality,
    String? uri,
    String? platform,
    String? backend,
    String? adapter,
    String? state,
    Map<String, Object?>? metadata,
  }) {
    return ErrorContext(
      playerId: playerId ?? this.playerId,
      sessionId: sessionId ?? this.sessionId,
      slotId: slotId ?? this.slotId,
      sourceId: sourceId ?? this.sourceId,
      requestId: requestId ?? this.requestId,
      operationId: operationId ?? this.operationId,
      generationId: generationId ?? this.generationId,
      operation: operation ?? this.operation,
      lineId: lineId ?? this.lineId,
      quality: quality ?? this.quality,
      uri: uri ?? this.uri,
      platform: platform ?? this.platform,
      backend: backend ?? this.backend,
      adapter: adapter ?? this.adapter,
      state: state ?? this.state,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Returns a copy with all optional context fields cleared.
  ErrorContext clear({
    bool playerId = false,
    bool sessionId = false,
    bool slotId = false,
    bool sourceId = false,
    bool requestId = false,
    bool operationId = false,
    bool generationId = false,
    bool operation = false,
    bool lineId = false,
    bool quality = false,
    bool uri = false,
    bool platform = false,
    bool backend = false,
    bool adapter = false,
    bool state = false,
    bool metadata = false,
  }) {
    return ErrorContext(
      playerId: playerId ? null : this.playerId,
      sessionId: sessionId ? null : this.sessionId,
      slotId: slotId ? null : this.slotId,
      sourceId: sourceId ? null : this.sourceId,
      requestId: requestId ? null : this.requestId,
      operationId: operationId ? null : this.operationId,
      generationId: generationId ? null : this.generationId,
      operation: operation ? null : this.operation,
      lineId: lineId ? null : this.lineId,
      quality: quality ? null : this.quality,
      uri: uri ? null : this.uri,
      platform: platform ? null : this.platform,
      backend: backend ? null : this.backend,
      adapter: adapter ? null : this.adapter,
      state: state ? null : this.state,
      metadata: metadata ? const <String, Object?>{} : this.metadata,
    );
  }

  // ===========================================================================
  // Identity helpers
  // ===========================================================================

  ErrorContext withPlayerId(PlayerId playerId) {
    return copyWith(playerId: playerId);
  }

  ErrorContext withoutPlayerId() {
    return ErrorContext(
      playerId: null,
      sessionId: sessionId,
      slotId: slotId,
      sourceId: sourceId,
      requestId: requestId,
      operationId: operationId,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withSessionId(SessionId sessionId) {
    return copyWith(sessionId: sessionId);
  }

  ErrorContext withoutSessionId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: null,
      slotId: slotId,
      sourceId: sourceId,
      requestId: requestId,
      operationId: operationId,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withSlotId(SlotId slotId) {
    return copyWith(slotId: slotId);
  }

  ErrorContext withoutSlotId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: sessionId,
      slotId: null,
      sourceId: sourceId,
      requestId: requestId,
      operationId: operationId,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withSourceId(SourceId sourceId) {
    return copyWith(sourceId: sourceId);
  }

  ErrorContext withoutSourceId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: sessionId,
      slotId: slotId,
      sourceId: null,
      requestId: requestId,
      operationId: operationId,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withRequestId(RequestId requestId) {
    return copyWith(requestId: requestId);
  }

  ErrorContext withoutRequestId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: sessionId,
      slotId: slotId,
      sourceId: sourceId,
      requestId: null,
      operationId: operationId,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withOperationId(OperationId operationId) {
    return copyWith(operationId: operationId);
  }

  ErrorContext withoutOperationId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: sessionId,
      slotId: slotId,
      sourceId: sourceId,
      requestId: requestId,
      operationId: null,
      generationId: generationId,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  ErrorContext withGenerationId(GenerationId generationId) {
    return copyWith(generationId: generationId);
  }

  ErrorContext withoutGenerationId() {
    return ErrorContext(
      playerId: playerId,
      sessionId: sessionId,
      slotId: slotId,
      sourceId: sourceId,
      requestId: requestId,
      operationId: operationId,
      generationId: null,
      operation: operation,
      lineId: lineId,
      quality: quality,
      uri: uri,
      platform: platform,
      backend: backend,
      adapter: adapter,
      state: state,
      metadata: metadata,
    );
  }

  // ===========================================================================
  // Text helpers
  // ===========================================================================

  ErrorContext withOperation(String operation) {
    return copyWith(operation: _requireText(operation, 'operation'));
  }

  ErrorContext withLineId(String lineId) {
    return copyWith(lineId: _requireText(lineId, 'lineId'));
  }

  ErrorContext withQuality(String quality) {
    return copyWith(quality: _requireText(quality, 'quality'));
  }

  ErrorContext withUri(String uri) {
    return copyWith(uri: _requireText(uri, 'uri'));
  }

  ErrorContext withPlatform(String platform) {
    return copyWith(platform: _requireText(platform, 'platform'));
  }

  ErrorContext withBackend(String backend) {
    return copyWith(backend: _requireText(backend, 'backend'));
  }

  ErrorContext withAdapter(String adapter) {
    return copyWith(adapter: _requireText(adapter, 'adapter'));
  }

  ErrorContext withState(String state) {
    return copyWith(state: _requireText(state, 'state'));
  }

  // ===========================================================================
  // Equatable
  // ===========================================================================

  @override
  List<Object?> get props => <Object?>[
    playerId,
    sessionId,
    slotId,
    sourceId,
    requestId,
    operationId,
    generationId,
    operation,
    lineId,
    quality,
    uri,
    platform,
    backend,
    adapter,
    state,
    metadata,
  ];

  @override
  String toString() {
    final buffer = StringBuffer('ErrorContext(');

    var hasValue = false;

    void writeValue(String name, Object? value) {
      if (value == null) {
        return;
      }

      if (value is String && value.trim().isEmpty) {
        return;
      }

      if (hasValue) {
        buffer.write(', ');
      }

      buffer
        ..write(name)
        ..write(': ')
        ..write(value);

      hasValue = true;
    }

    writeValue('playerId', playerId);
    writeValue('sessionId', sessionId);
    writeValue('slotId', slotId);
    writeValue('sourceId', sourceId);
    writeValue('requestId', requestId);
    writeValue('operationId', operationId);
    writeValue('generationId', generationId);
    writeValue('operation', operation);
    writeValue('lineId', lineId);
    writeValue('quality', quality);
    writeValue('uri', uri);
    writeValue('platform', platform);
    writeValue('backend', backend);
    writeValue('adapter', adapter);
    writeValue('state', state);

    if (metadata.isNotEmpty) {
      writeValue('metadata', metadata);
    }

    buffer.write(')');

    return buffer.toString();
  }
}

// =============================================================================
// Helpers
// =============================================================================

bool _hasText(String? value) {
  return value != null && value.trim().isNotEmpty;
}

String _requireText(String value, String parameterName) {
  final normalized = value.trim();

  if (normalized.isEmpty) {
    throw ArgumentError.value(value, parameterName, '$parameterName cannot be empty.');
  }

  return normalized;
}
