import 'package:media_core/identity/slot_id.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/source_id.dart';
import 'package:media_core/identity/request_id.dart';
import 'package:media_core/identity/session_id.dart';
import 'package:media_core/identity/operation_id.dart';
import 'package:media_core/identity/generation_id.dart';
import 'package:equatable/equatable.dart';

/// Provides contextual information associated with an operation.
///
/// [OperationContext] contains business and execution context that may be
/// required while performing an operation.
///
/// It is intentionally separate from [ErrorContext]:
///
/// ```text
/// OperationContext
///     ↓
/// describes operation input/execution context
///
/// ErrorContext
///     ↓
/// describes diagnostic/error context
/// ```
///
/// This class does not contain operation lifecycle state, timeout policy,
/// cancellation state, retry policy, or error information.
///
/// The object is immutable. Metadata and parameters are copied and exposed
/// through unmodifiable views.
final class OperationContext extends Equatable {
  /// Creates an operation context.
  OperationContext({
    this.playerId,
    this.sessionId,
    this.slotId,
    this.sourceId,
    this.requestId,
    this.operationId,
    this.generationId,
    this.lineId,
    this.quality,
    this.uri,
    this.platform,
    this.backend,
    this.adapter,
    this.description,
    this.reason,
    Map<String, Object?> parameters = const <String, Object?>{},
    Map<String, Object?> metadata = const <String, Object?>{},
  }) : parameters = Map<String, Object?>.unmodifiable(parameters),
       metadata = Map<String, Object?>.unmodifiable(metadata);

  /// Creates an [OperationContext] from JSON.
  factory OperationContext.fromJson(Map<String, dynamic> json) {
    return OperationContext(
      playerId: _readPlayerId(json['playerId']),
      sessionId: _readSessionId(json['sessionId']),
      slotId: _readSlotId(json['slotId']),
      sourceId: _readSourceId(json['sourceId']),
      requestId: _readRequestId(json['requestId']),
      operationId: _readOperationId(json['operationId']),
      generationId: _readGenerationId(json['generationId']),
      lineId: _readNullableString(json['lineId'], 'lineId'),
      quality: _readNullableString(json['quality'], 'quality'),
      uri: _readNullableString(json['uri'], 'uri'),
      platform: _readNullableString(json['platform'], 'platform'),
      backend: _readNullableString(json['backend'], 'backend'),
      adapter: _readNullableString(json['adapter'], 'adapter'),
      description: _readNullableString(json['description'], 'description'),
      reason: _readNullableString(json['reason'], 'reason'),
      parameters: _readMap(json['parameters'], 'parameters'),
      metadata: _readMap(json['metadata'], 'metadata'),
    );
  }

  /// Player associated with the operation.
  final PlayerId? playerId;

  /// Session associated with the operation.
  final SessionId? sessionId;

  /// Slot associated with the operation.
  final SlotId? slotId;

  /// Source associated with the operation.
  final SourceId? sourceId;

  /// Request associated with the operation.
  final RequestId? requestId;

  /// Operation identity associated with this context.
  final OperationId? operationId;

  /// Generation associated with the operation.
  ///
  /// Useful for detecting stale or superseded operations.
  final GenerationId? generationId;

  /// Optional source line identifier.
  final String? lineId;

  /// Optional requested quality.
  final String? quality;

  /// Optional source URI.
  final String? uri;

  /// Platform associated with the operation.
  final String? platform;

  /// Backend associated with the operation.
  final String? backend;

  /// Adapter associated with the operation.
  final String? adapter;

  /// Human-readable operation description.
  final String? description;

  /// Business reason for creating the operation.
  final String? reason;

  /// Parameters consumed by the operation.
  ///
  /// Parameters describe operation inputs rather than diagnostic metadata.
  final Map<String, Object?> parameters;

  /// Additional operation metadata.
  ///
  /// Metadata is intentionally generic and should not be used as a replacement
  /// for strongly typed fields.
  final Map<String, Object?> metadata;

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------

  /// Converts this context to JSON.
  ///
  /// Nullable fields are explicitly included as `null` so the serialized
  /// structure remains stable.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'playerId': playerId?.toJson(),
      'sessionId': sessionId?.toJson(),
      'slotId': slotId?.toJson(),
      'sourceId': sourceId?.toJson(),
      'requestId': requestId?.toJson(),
      'operationId': operationId?.toJson(),
      'generationId': generationId?.toJson(),
      'lineId': lineId,
      'quality': quality,
      'uri': uri,
      'platform': platform,
      'backend': backend,
      'adapter': adapter,
      'description': description,
      'reason': reason,
      'parameters': Map<String, Object?>.from(parameters),
      'metadata': Map<String, Object?>.from(metadata),
    };
  }

  // ---------------------------------------------------------------------------
  // Presence
  // ---------------------------------------------------------------------------

  bool get hasPlayerId => playerId != null;

  bool get hasSessionId => sessionId != null;

  bool get hasSlotId => slotId != null;

  bool get hasSourceId => sourceId != null;

  bool get hasRequestId => requestId != null;

  bool get hasOperationId => operationId != null;

  bool get hasGenerationId => generationId != null;

  bool get hasLineId => _hasText(lineId);

  bool get hasQuality => _hasText(quality);

  bool get hasUri => _hasText(uri);

  bool get hasPlatform => _hasText(platform);

  bool get hasBackend => _hasText(backend);

  bool get hasAdapter => _hasText(adapter);

  bool get hasDescription => _hasText(description);

  bool get hasReason => _hasText(reason);

  bool get hasParameters => parameters.isNotEmpty;

  bool get hasMetadata => metadata.isNotEmpty;

  /// Whether this context contains no information.
  bool get isEmpty {
    return !hasPlayerId &&
        !hasSessionId &&
        !hasSlotId &&
        !hasSourceId &&
        !hasRequestId &&
        !hasOperationId &&
        !hasGenerationId &&
        !hasLineId &&
        !hasQuality &&
        !hasUri &&
        !hasPlatform &&
        !hasBackend &&
        !hasAdapter &&
        !hasDescription &&
        !hasReason &&
        !hasParameters &&
        !hasMetadata;
  }

  /// Whether this context contains any information.
  bool get isNotEmpty => !isEmpty;

  // ---------------------------------------------------------------------------
  // Parameter helpers
  // ---------------------------------------------------------------------------

  /// Returns an unmodifiable view of operation parameters.
  Map<String, Object?> get parametersView => parameters;

  /// Returns whether [key] exists in operation parameters.
  bool containsParameter(String key) {
    return parameters.containsKey(key);
  }

  /// Returns a parameter value.
  Object? parameterValue(String key) {
    return parameters[key];
  }

  /// Returns a typed parameter value.
  T? parameterAs<T>(String key) {
    final value = parameters[key];

    if (value is T) {
      return value;
    }

    return null;
  }

  /// Adds or replaces one operation parameter.
  OperationContext withParameter(String key, Object? value) {
    _requireKey(key, 'Parameter key');

    final next = <String, Object?>{...parameters, key: value};

    return copyWith(parameters: next);
  }

  /// Adds multiple operation parameters.
  OperationContext withParameters(Map<String, Object?> values) {
    if (values.isEmpty) {
      return this;
    }

    final next = <String, Object?>{...parameters, ...values};

    return copyWith(parameters: next);
  }

  /// Removes an operation parameter.
  OperationContext withoutParameter(String key) {
    if (!parameters.containsKey(key)) {
      return this;
    }

    final next = <String, Object?>{...parameters}..remove(key);

    return copyWith(parameters: next);
  }

  /// Removes all operation parameters.
  OperationContext clearParameters() {
    if (parameters.isEmpty) {
      return this;
    }

    return copyWith(parameters: const <String, Object?>{});
  }

  // ---------------------------------------------------------------------------
  // Metadata helpers
  // ---------------------------------------------------------------------------

  /// Returns an unmodifiable view of metadata.
  Map<String, Object?> get metadataView => metadata;

  /// Returns whether [key] exists in metadata.
  bool containsMetadata(String key) {
    return metadata.containsKey(key);
  }

  /// Returns a metadata value.
  Object? metadataValue(String key) {
    return metadata[key];
  }

  /// Returns a typed metadata value.
  T? metadataAs<T>(String key) {
    final value = metadata[key];

    if (value is T) {
      return value;
    }

    return null;
  }

  /// Adds or replaces one metadata value.
  OperationContext withMetadata(String key, Object? value) {
    _requireKey(key, 'Metadata key');

    final next = <String, Object?>{...metadata, key: value};

    return copyWith(metadata: next);
  }

  /// Adds multiple metadata values.
  OperationContext withMetadataMap(Map<String, Object?> values) {
    if (values.isEmpty) {
      return this;
    }

    final next = <String, Object?>{...metadata, ...values};

    return copyWith(metadata: next);
  }

  /// Removes one metadata value.
  OperationContext withoutMetadata(String key) {
    if (!metadata.containsKey(key)) {
      return this;
    }

    final next = <String, Object?>{...metadata}..remove(key);

    return copyWith(metadata: next);
  }

  /// Removes all metadata.
  OperationContext clearMetadata() {
    if (metadata.isEmpty) {
      return this;
    }

    return copyWith(metadata: const <String, Object?>{});
  }

  // ---------------------------------------------------------------------------
  // Identity helpers
  // ---------------------------------------------------------------------------

  OperationContext withPlayerId(PlayerId value) {
    return copyWith(playerId: value);
  }

  OperationContext withoutPlayerId() {
    return copyWith(playerId: null);
  }

  OperationContext withSessionId(SessionId value) {
    return copyWith(sessionId: value);
  }

  OperationContext withoutSessionId() {
    return copyWith(sessionId: null);
  }

  OperationContext withSlotId(SlotId value) {
    return copyWith(slotId: value);
  }

  OperationContext withoutSlotId() {
    return copyWith(slotId: null);
  }

  OperationContext withSourceId(SourceId value) {
    return copyWith(sourceId: value);
  }

  OperationContext withoutSourceId() {
    return copyWith(sourceId: null);
  }

  OperationContext withRequestId(RequestId value) {
    return copyWith(requestId: value);
  }

  OperationContext withoutRequestId() {
    return copyWith(requestId: null);
  }

  OperationContext withOperationId(OperationId value) {
    return copyWith(operationId: value);
  }

  OperationContext withoutOperationId() {
    return copyWith(operationId: null);
  }

  OperationContext withGenerationId(GenerationId value) {
    return copyWith(generationId: value);
  }

  OperationContext withoutGenerationId() {
    return copyWith(generationId: null);
  }

  // ---------------------------------------------------------------------------
  // Text helpers
  // ---------------------------------------------------------------------------

  OperationContext withLineId(String value) {
    return copyWith(lineId: _normalizeText(value));
  }

  OperationContext withoutLineId() {
    return copyWith(lineId: null);
  }

  OperationContext withQuality(String value) {
    return copyWith(quality: _normalizeText(value));
  }

  OperationContext withoutQuality() {
    return copyWith(quality: null);
  }

  OperationContext withUri(String value) {
    return copyWith(uri: _normalizeText(value));
  }

  OperationContext withoutUri() {
    return copyWith(uri: null);
  }

  OperationContext withPlatform(String value) {
    return copyWith(platform: _normalizeText(value));
  }

  OperationContext withoutPlatform() {
    return copyWith(platform: null);
  }

  OperationContext withBackend(String value) {
    return copyWith(backend: _normalizeText(value));
  }

  OperationContext withoutBackend() {
    return copyWith(backend: null);
  }

  OperationContext withAdapter(String value) {
    return copyWith(adapter: _normalizeText(value));
  }

  OperationContext withoutAdapter() {
    return copyWith(adapter: null);
  }

  OperationContext withDescription(String value) {
    return copyWith(description: _normalizeText(value));
  }

  OperationContext withoutDescription() {
    return copyWith(description: null);
  }

  OperationContext withReason(String value) {
    return copyWith(reason: _normalizeText(value));
  }

  OperationContext withoutReason() {
    return copyWith(reason: null);
  }

  // ---------------------------------------------------------------------------
  // Copy
  // ---------------------------------------------------------------------------

  /// Creates a copy with the supplied values replaced.
  ///
  /// Because nullable fields use `null` as the "keep existing value" marker,
  /// the explicit `withoutX()` methods should be used when a nullable value
  /// needs to be cleared.
  OperationContext copyWith({
    PlayerId? playerId,
    SessionId? sessionId,
    SlotId? slotId,
    SourceId? sourceId,
    RequestId? requestId,
    OperationId? operationId,
    GenerationId? generationId,
    String? lineId,
    String? quality,
    String? uri,
    String? platform,
    String? backend,
    String? adapter,
    String? description,
    String? reason,
    Map<String, Object?>? parameters,
    Map<String, Object?>? metadata,
  }) {
    return OperationContext(
      playerId: playerId ?? this.playerId,
      sessionId: sessionId ?? this.sessionId,
      slotId: slotId ?? this.slotId,
      sourceId: sourceId ?? this.sourceId,
      requestId: requestId ?? this.requestId,
      operationId: operationId ?? this.operationId,
      generationId: generationId ?? this.generationId,
      lineId: lineId ?? this.lineId,
      quality: quality ?? this.quality,
      uri: uri ?? this.uri,
      platform: platform ?? this.platform,
      backend: backend ?? this.backend,
      adapter: adapter ?? this.adapter,
      description: description ?? this.description,
      reason: reason ?? this.reason,
      parameters: parameters ?? this.parameters,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Removes all context information.
  OperationContext clear() {
    return OperationContext();
  }

  // ---------------------------------------------------------------------------
  // Equality
  // ---------------------------------------------------------------------------

  @override
  List<Object?> get props => <Object?>[
    playerId,
    sessionId,
    slotId,
    sourceId,
    requestId,
    operationId,
    generationId,
    lineId,
    quality,
    uri,
    platform,
    backend,
    adapter,
    description,
    reason,
    parameters,
    metadata,
  ];

  @override
  String toString() {
    if (isEmpty) {
      return 'OperationContext()';
    }

    final parts = <String>[];

    void addValue(String name, Object? value) {
      if (value != null) {
        parts.add('$name: $value');
      }
    }

    addValue('playerId', playerId);
    addValue('sessionId', sessionId);
    addValue('slotId', slotId);
    addValue('sourceId', sourceId);
    addValue('requestId', requestId);
    addValue('operationId', operationId);
    addValue('generationId', generationId);
    addValue('lineId', lineId);
    addValue('quality', quality);
    addValue('uri', uri);
    addValue('platform', platform);
    addValue('backend', backend);
    addValue('adapter', adapter);
    addValue('description', description);
    addValue('reason', reason);

    if (parameters.isNotEmpty) {
      parts.add('parameters: $parameters');
    }

    if (metadata.isNotEmpty) {
      parts.add('metadata: $metadata');
    }

    return 'OperationContext(${parts.join(', ')})';
  }

  // ---------------------------------------------------------------------------
  // JSON helpers
  // ---------------------------------------------------------------------------

  static PlayerId? _readPlayerId(Object? value) {
    if (value == null) {
      return null;
    }

    return PlayerId.fromJson(value);
  }

  static SessionId? _readSessionId(Object? value) {
    if (value == null) {
      return null;
    }

    return SessionId.fromJson(value);
  }

  static SlotId? _readSlotId(Object? value) {
    if (value == null) {
      return null;
    }

    return SlotId.fromJson(value);
  }

  static SourceId? _readSourceId(Object? value) {
    if (value == null) {
      return null;
    }

    return SourceId.fromJson(value);
  }

  static RequestId? _readRequestId(Object? value) {
    if (value == null) {
      return null;
    }

    return RequestId.fromJson(value);
  }

  static OperationId? _readOperationId(Object? value) {
    if (value == null) {
      return null;
    }

    return OperationId.fromJson(value);
  }

  static GenerationId? _readGenerationId(Object? value) {
    if (value == null) {
      return null;
    }

    return GenerationId.fromJson(value);
  }

  static String? _readNullableString(Object? value, String fieldName) {
    if (value == null) {
      return null;
    }

    if (value is! String) {
      throw FormatException('$fieldName must be a String or null.');
    }

    final normalized = value.trim();

    if (normalized.isEmpty) {
      return null;
    }

    return normalized;
  }

  static Map<String, Object?> _readMap(Object? value, String fieldName) {
    if (value == null) {
      return const <String, Object?>{};
    }

    if (value is! Map) {
      throw FormatException('$fieldName must be a JSON object.');
    }

    final result = <String, Object?>{};

    for (final entry in value.entries) {
      if (entry.key is! String) {
        throw FormatException('$fieldName keys must be Strings.');
      }

      result[entry.key as String] = entry.value;
    }

    return result;
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  static bool _hasText(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static String? _normalizeText(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      return null;
    }

    return normalized;
  }

  static void _requireKey(String key, String label) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(key, 'key', '$label cannot be empty.');
    }
  }
}
