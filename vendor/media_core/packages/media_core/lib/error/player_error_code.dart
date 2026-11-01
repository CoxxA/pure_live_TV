import 'package:equatable/equatable.dart';

/// Stable machine-readable error code used by the media player core.
///
/// Error codes represent specific failures. They are intentionally separated
/// from [PlayerErrorCategory], which represents a broader classification.
///
/// This class is implemented as a value type instead of an enum so that
/// applications and adapters can define custom error codes when necessary.
///
/// Error codes are:
///
/// - immutable;
/// - value-based;
/// - stable across serialization;
/// - independent from error classification;
/// - independent from retry/fallback policy.
final class PlayerErrorCode extends Equatable implements Comparable<PlayerErrorCode> {
  const PlayerErrorCode._(this.value, this.name);

  /// Creates a custom player error code.
  ///
  /// Custom codes are preserved after trimming and are considered
  /// non-built-in codes.
  factory PlayerErrorCode.custom(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Player error code cannot be empty.');
    }

    return PlayerErrorCode._(normalized, normalized);
  }

  // ===========================================================================
  // General
  // ===========================================================================

  static const PlayerErrorCode unknown = PlayerErrorCode._('PLAYER_UNKNOWN', 'unknown');

  static const PlayerErrorCode invalidArgument = PlayerErrorCode._('PLAYER_INVALID_ARGUMENT', 'invalidArgument');

  static const PlayerErrorCode invalidState = PlayerErrorCode._('PLAYER_INVALID_STATE', 'invalidState');

  static const PlayerErrorCode unsupported = PlayerErrorCode._('PLAYER_UNSUPPORTED', 'unsupported');

  static const PlayerErrorCode cancelled = PlayerErrorCode._('PLAYER_CANCELLED', 'cancelled');

  static const PlayerErrorCode timeout = PlayerErrorCode._('PLAYER_TIMEOUT', 'timeout');

  static const PlayerErrorCode staleGeneration = PlayerErrorCode._('PLAYER_STALE_GENERATION', 'staleGeneration');

  static const PlayerErrorCode superseded = PlayerErrorCode._('PLAYER_SUPERSEDED', 'superseded');

  static const PlayerErrorCode internal = PlayerErrorCode._('PLAYER_INTERNAL', 'internal');

  // ===========================================================================
  // Source
  // ===========================================================================

  static const PlayerErrorCode sourceMissing = PlayerErrorCode._('SOURCE_MISSING', 'sourceMissing');

  static const PlayerErrorCode sourceInvalid = PlayerErrorCode._('SOURCE_INVALID', 'sourceInvalid');

  static const PlayerErrorCode sourceResolveFailed = PlayerErrorCode._('SOURCE_RESOLVE_FAILED', 'sourceResolveFailed');

  static const PlayerErrorCode sourceInspectFailed = PlayerErrorCode._('SOURCE_INSPECT_FAILED', 'sourceInspectFailed');

  static const PlayerErrorCode sourceValidationFailed = PlayerErrorCode._(
    'SOURCE_VALIDATION_FAILED',
    'sourceValidationFailed',
  );

  static const PlayerErrorCode sourceProtocolUnsupported = PlayerErrorCode._(
    'SOURCE_PROTOCOL_UNSUPPORTED',
    'sourceProtocolUnsupported',
  );

  static const PlayerErrorCode sourceMediaTypeUnsupported = PlayerErrorCode._(
    'SOURCE_MEDIA_TYPE_UNSUPPORTED',
    'sourceMediaTypeUnsupported',
  );

  static const PlayerErrorCode sourceFormatUnsupported = PlayerErrorCode._(
    'SOURCE_FORMAT_UNSUPPORTED',
    'sourceFormatUnsupported',
  );

  // ===========================================================================
  // Network / HTTP / Authentication
  // ===========================================================================

  static const PlayerErrorCode network = PlayerErrorCode._('NETWORK_ERROR', 'network');

  static const PlayerErrorCode networkUnavailable = PlayerErrorCode._('NETWORK_UNAVAILABLE', 'networkUnavailable');

  static const PlayerErrorCode networkTimeout = PlayerErrorCode._('NETWORK_TIMEOUT', 'networkTimeout');

  static const PlayerErrorCode networkDnsFailed = PlayerErrorCode._('NETWORK_DNS_FAILED', 'networkDnsFailed');

  static const PlayerErrorCode networkConnectionFailed = PlayerErrorCode._(
    'NETWORK_CONNECTION_FAILED',
    'networkConnectionFailed',
  );

  static const PlayerErrorCode networkConnectionRefused = PlayerErrorCode._(
    'NETWORK_CONNECTION_REFUSED',
    'networkConnectionRefused',
  );

  static const PlayerErrorCode networkAborted = PlayerErrorCode._('NETWORK_ABORTED', 'networkAborted');

  static const PlayerErrorCode httpError = PlayerErrorCode._('HTTP_ERROR', 'httpError');

  static const PlayerErrorCode authenticationRequired = PlayerErrorCode._(
    'AUTHENTICATION_REQUIRED',
    'authenticationRequired',
  );

  static const PlayerErrorCode authenticationFailed = PlayerErrorCode._(
    'AUTHENTICATION_FAILED',
    'authenticationFailed',
  );

  static const PlayerErrorCode authorizationFailed = PlayerErrorCode._('AUTHORIZATION_FAILED', 'authorizationFailed');

  static const PlayerErrorCode tlsError = PlayerErrorCode._('TLS_ERROR', 'tlsError');

  // ===========================================================================
  // Adapter / Backend
  // ===========================================================================

  static const PlayerErrorCode adapterUnavailable = PlayerErrorCode._('ADAPTER_UNAVAILABLE', 'adapterUnavailable');

  static const PlayerErrorCode adapterUnsupported = PlayerErrorCode._('ADAPTER_UNSUPPORTED', 'adapterUnsupported');

  static const PlayerErrorCode adapterInitializationFailed = PlayerErrorCode._(
    'ADAPTER_INITIALIZATION_FAILED',
    'adapterInitializationFailed',
  );

  static const PlayerErrorCode adapterDisposed = PlayerErrorCode._('ADAPTER_DISPOSED', 'adapterDisposed');

  static const PlayerErrorCode backendUnavailable = PlayerErrorCode._('BACKEND_UNAVAILABLE', 'backendUnavailable');

  static const PlayerErrorCode backendInitializationFailed = PlayerErrorCode._(
    'BACKEND_INITIALIZATION_FAILED',
    'backendInitializationFailed',
  );

  static const PlayerErrorCode backendOpenFailed = PlayerErrorCode._('BACKEND_OPEN_FAILED', 'backendOpenFailed');

  static const PlayerErrorCode backendPlayFailed = PlayerErrorCode._('BACKEND_PLAY_FAILED', 'backendPlayFailed');

  static const PlayerErrorCode backendPauseFailed = PlayerErrorCode._('BACKEND_PAUSE_FAILED', 'backendPauseFailed');

  static const PlayerErrorCode backendStopFailed = PlayerErrorCode._('BACKEND_STOP_FAILED', 'backendStopFailed');

  static const PlayerErrorCode backendSeekFailed = PlayerErrorCode._('BACKEND_SEEK_FAILED', 'backendSeekFailed');

  static const PlayerErrorCode backendFatal = PlayerErrorCode._('BACKEND_FATAL', 'backendFatal');

  // ===========================================================================
  // Playback
  // ===========================================================================

  static const PlayerErrorCode playbackFailed = PlayerErrorCode._('PLAYBACK_FAILED', 'playbackFailed');

  static const PlayerErrorCode unexpectedStop = PlayerErrorCode._('UNEXPECTED_STOP', 'unexpectedStop');

  static const PlayerErrorCode playbackInvalidState = PlayerErrorCode._(
    'PLAYBACK_INVALID_STATE',
    'playbackInvalidState',
  );

  static const PlayerErrorCode invalidSeekPosition = PlayerErrorCode._('INVALID_SEEK_POSITION', 'invalidSeekPosition');

  static const PlayerErrorCode invalidPlaybackRate = PlayerErrorCode._('INVALID_PLAYBACK_RATE', 'invalidPlaybackRate');

  static const PlayerErrorCode invalidVolume = PlayerErrorCode._('INVALID_VOLUME', 'invalidVolume');

  // ===========================================================================
  // Decoder / Demuxer / Media
  // ===========================================================================

  static const PlayerErrorCode decoderError = PlayerErrorCode._('DECODER_ERROR', 'decoderError');

  static const PlayerErrorCode decoderUnavailable = PlayerErrorCode._('DECODER_UNAVAILABLE', 'decoderUnavailable');

  static const PlayerErrorCode codecUnsupported = PlayerErrorCode._('CODEC_UNSUPPORTED', 'codecUnsupported');

  static const PlayerErrorCode demuxerError = PlayerErrorCode._('DEMUXER_ERROR', 'demuxerError');

  static const PlayerErrorCode mediaCorrupted = PlayerErrorCode._('MEDIA_CORRUPTED', 'mediaCorrupted');

  static const PlayerErrorCode mediaMetadataInvalid = PlayerErrorCode._(
    'MEDIA_METADATA_INVALID',
    'mediaMetadataInvalid',
  );

  static const PlayerErrorCode noPlayableStream = PlayerErrorCode._('NO_PLAYABLE_STREAM', 'noPlayableStream');

  static const PlayerErrorCode streamEndedUnexpectedly = PlayerErrorCode._(
    'STREAM_ENDED_UNEXPECTEDLY',
    'streamEndedUnexpectedly',
  );

  // ===========================================================================
  // Resource
  // ===========================================================================

  static const PlayerErrorCode resourceUnavailable = PlayerErrorCode._('RESOURCE_UNAVAILABLE', 'resourceUnavailable');

  static const PlayerErrorCode resourceLimitExceeded = PlayerErrorCode._(
    'RESOURCE_LIMIT_EXCEEDED',
    'resourceLimitExceeded',
  );

  static const PlayerErrorCode memoryPressure = PlayerErrorCode._('MEMORY_PRESSURE', 'memoryPressure');

  static const PlayerErrorCode thermalPressure = PlayerErrorCode._('THERMAL_PRESSURE', 'thermalPressure');

  static const PlayerErrorCode insufficientBandwidth = PlayerErrorCode._(
    'INSUFFICIENT_BANDWIDTH',
    'insufficientBandwidth',
  );

  // ===========================================================================
  // Renderer / Presentation / Geometry
  // ===========================================================================

  static const PlayerErrorCode rendererInitializationFailed = PlayerErrorCode._(
    'RENDERER_INITIALIZATION_FAILED',
    'rendererInitializationFailed',
  );

  static const PlayerErrorCode rendererSurfaceFailed = PlayerErrorCode._(
    'RENDERER_SURFACE_FAILED',
    'rendererSurfaceFailed',
  );

  static const PlayerErrorCode rendererTextureFailed = PlayerErrorCode._(
    'RENDERER_TEXTURE_FAILED',
    'rendererTextureFailed',
  );

  static const PlayerErrorCode geometryInvalid = PlayerErrorCode._('GEOMETRY_INVALID', 'geometryInvalid');

  static const PlayerErrorCode presentationFailed = PlayerErrorCode._('PRESENTATION_FAILED', 'presentationFailed');

  static const PlayerErrorCode pipFailed = PlayerErrorCode._('PIP_FAILED', 'pipFailed');

  static const PlayerErrorCode fullscreenFailed = PlayerErrorCode._('FULLSCREEN_FAILED', 'fullscreenFailed');

  static const PlayerErrorCode floatingFailed = PlayerErrorCode._('FLOATING_FAILED', 'floatingFailed');

  // ===========================================================================
  // Audio
  // ===========================================================================

  static const PlayerErrorCode audioInitializationFailed = PlayerErrorCode._(
    'AUDIO_INITIALIZATION_FAILED',
    'audioInitializationFailed',
  );

  static const PlayerErrorCode audioFocusFailed = PlayerErrorCode._('AUDIO_FOCUS_FAILED', 'audioFocusFailed');

  static const PlayerErrorCode audioRouteFailed = PlayerErrorCode._('AUDIO_ROUTE_FAILED', 'audioRouteFailed');

  static const PlayerErrorCode audioUnsupported = PlayerErrorCode._('AUDIO_UNSUPPORTED', 'audioUnsupported');

  // ===========================================================================
  // Recording
  // ===========================================================================

  static const PlayerErrorCode recordingUnsupported = PlayerErrorCode._(
    'RECORDING_UNSUPPORTED',
    'recordingUnsupported',
  );

  static const PlayerErrorCode recordingInitializationFailed = PlayerErrorCode._(
    'RECORDING_INITIALIZATION_FAILED',
    'recordingInitializationFailed',
  );

  static const PlayerErrorCode recordingFailed = PlayerErrorCode._('RECORDING_FAILED', 'recordingFailed');

  static const PlayerErrorCode recordingOutputInvalid = PlayerErrorCode._(
    'RECORDING_OUTPUT_INVALID',
    'recordingOutputInvalid',
  );

  static const PlayerErrorCode recordingStorageUnavailable = PlayerErrorCode._(
    'RECORDING_STORAGE_UNAVAILABLE',
    'recordingStorageUnavailable',
  );

  // ===========================================================================
  // Cache
  // ===========================================================================

  static const PlayerErrorCode cacheError = PlayerErrorCode._('CACHE_ERROR', 'cacheError');

  static const PlayerErrorCode cacheStorageUnavailable = PlayerErrorCode._(
    'CACHE_STORAGE_UNAVAILABLE',
    'cacheStorageUnavailable',
  );

  static const PlayerErrorCode cacheEntryInvalid = PlayerErrorCode._('CACHE_ENTRY_INVALID', 'cacheEntryInvalid');

  static const PlayerErrorCode cacheLimitExceeded = PlayerErrorCode._('CACHE_LIMIT_EXCEEDED', 'cacheLimitExceeded');

  // ===========================================================================
  // Concurrency
  // ===========================================================================

  static const PlayerErrorCode concurrencyLimitExceeded = PlayerErrorCode._(
    'CONCURRENCY_LIMIT_EXCEEDED',
    'concurrencyLimitExceeded',
  );

  static const PlayerErrorCode lockUnavailable = PlayerErrorCode._('LOCK_UNAVAILABLE', 'lockUnavailable');

  // ===========================================================================
  // Lifecycle
  // ===========================================================================

  static const PlayerErrorCode disposed = PlayerErrorCode._('PLAYER_DISPOSED', 'disposed');

  static const PlayerErrorCode lifecycleInactive = PlayerErrorCode._('LIFECYCLE_INACTIVE', 'lifecycleInactive');

  static const PlayerErrorCode lifecycleTransitionFailed = PlayerErrorCode._(
    'LIFECYCLE_TRANSITION_FAILED',
    'lifecycleTransitionFailed',
  );

  // ===========================================================================
  // Fallback / Recovery
  // ===========================================================================

  static const PlayerErrorCode fallbackUnavailable = PlayerErrorCode._('FALLBACK_UNAVAILABLE', 'fallbackUnavailable');

  static const PlayerErrorCode fallbackSelectionFailed = PlayerErrorCode._(
    'FALLBACK_SELECTION_FAILED',
    'fallbackSelectionFailed',
  );

  static const PlayerErrorCode recoveryUnavailable = PlayerErrorCode._('RECOVERY_UNAVAILABLE', 'recoveryUnavailable');

  static const PlayerErrorCode recoveryFailed = PlayerErrorCode._('RECOVERY_FAILED', 'recoveryFailed');

  static const PlayerErrorCode recoveryExhausted = PlayerErrorCode._('RECOVERY_EXHAUSTED', 'recoveryExhausted');

  // ===========================================================================
  // Properties
  // ===========================================================================

  /// Stable machine-readable error code.
  final String value;

  /// Stable symbolic name intended for diagnostics and debugging.
  final String name;

  /// Whether this is one of the built-in player error codes.
  bool get isBuiltIn => _builtInCodes.contains(value);

  /// Whether this is a custom error code.
  bool get isCustom => !isBuiltIn;

  /// Whether this represents cancellation or invalidation of an operation.
  ///
  /// Value comparison is intentionally used instead of [identical] because
  /// [PlayerErrorCode] is a value object.
  bool get isCancellation {
    return _cancellationCodes.contains(value);
  }

  /// Whether this code belongs to the network-related family.
  bool get isNetworkRelated {
    return _networkCodes.contains(value);
  }

  /// Whether this code belongs to the source-related family.
  bool get isSourceRelated {
    return _sourceCodes.contains(value);
  }

  /// Whether this code belongs to the adapter/backend family.
  ///
  /// This includes both adapter-level and backend-level failures.
  bool get isAdapterOrBackendRelated {
    return _adapterOrBackendCodes.contains(value);
  }

  /// Whether this code belongs to the adapter/backend family.
  ///
  /// Kept as a compatibility-oriented alias.
  bool get isBackendRelated {
    return isAdapterOrBackendRelated;
  }

  /// Whether this code belongs to the playback family.
  bool get isPlaybackRelated {
    return _playbackCodes.contains(value);
  }

  /// Whether this code belongs to the media decoding/demuxing family.
  bool get isMediaPipelineRelated {
    return _mediaPipelineCodes.contains(value);
  }

  /// Whether this code belongs to the resource-pressure family.
  bool get isResourceRelated {
    return _resourceCodes.contains(value);
  }

  /// Whether this code belongs to the presentation/rendering family.
  bool get isPresentationRelated {
    return _presentationCodes.contains(value);
  }

  /// Whether this error may potentially be recoverable.
  ///
  /// This is only a classification hint.
  ///
  /// It does NOT determine whether the player should:
  ///
  /// - retry;
  /// - fallback;
  /// - recover;
  /// - stop playback.
  ///
  /// Those decisions belong to the policy layer.
  bool get isPotentiallyRecoverable {
    return _potentiallyRecoverableCodes.contains(value);
  }

  // ===========================================================================
  // Lookup
  // ===========================================================================

  /// Returns all built-in error codes.
  static List<PlayerErrorCode> get values {
    return List<PlayerErrorCode>.unmodifiable(_builtInValues);
  }

  /// Resolves a built-in error code from its stable value.
  ///
  /// Unknown values resolve to [unknown].
  ///
  /// Use [custom] when custom error-code preservation is required.
  static PlayerErrorCode fromValue(String value) {
    final normalized = value.trim();

    for (final code in _builtInValues) {
      if (code.value == normalized) {
        return code;
      }
    }

    return PlayerErrorCode.unknown;
  }

  /// Parses a built-in error code from a string.
  ///
  /// This is an alias for [fromValue].
  static PlayerErrorCode parse(String value) {
    return fromValue(value);
  }

  /// Creates an error code from its JSON representation.
  ///
  /// Unknown values resolve to [unknown].
  static PlayerErrorCode fromJson(Object? json) {
    if (json is! String) {
      throw FormatException('PlayerErrorCode JSON value must be a String.');
    }

    return fromValue(json);
  }

  /// Converts this error code to its JSON representation.
  String toJson() => value;

  /// Returns whether [value] is a built-in error code value.
  static bool isBuiltInValue(String value) {
    return _builtInCodes.contains(value.trim());
  }

  /// Returns whether [value] is one of the cancellation codes.
  static bool isCancellationValue(String value) {
    return _cancellationCodes.contains(value.trim());
  }

  /// Returns whether [value] is one of the network-related codes.
  static bool isNetworkRelatedValue(String value) {
    return _networkCodes.contains(value.trim());
  }

  /// Returns the built-in error code matching [value], or `null`.
  static PlayerErrorCode? tryFromValue(String value) {
    final normalized = value.trim();

    for (final code in _builtInValues) {
      if (code.value == normalized) {
        return code;
      }
    }

    return null;
  }

  /// Returns all built-in codes belonging to [predicate].
  static List<PlayerErrorCode> where(bool Function(PlayerErrorCode code) predicate) {
    return List<PlayerErrorCode>.unmodifiable(_builtInValues.where(predicate));
  }

  // ===========================================================================
  // Value helpers
  // ===========================================================================

  /// Returns a copy with optionally replaced fields.
  ///
  /// This method can create a custom value when [value] is not a built-in
  /// error code.
  PlayerErrorCode copyWith({String? value, String? name}) {
    final nextValue = (value ?? this.value).trim();
    final nextName = (name ?? this.name).trim();

    if (nextValue.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Player error code cannot be empty.');
    }

    if (nextName.isEmpty) {
      throw ArgumentError.value(name, 'name', 'Player error code name cannot be empty.');
    }

    return PlayerErrorCode._(nextValue, nextName);
  }

  /// Returns whether this code has the same stable value as [other].
  bool isSameAs(PlayerErrorCode other) {
    return value == other.value;
  }

  /// Returns whether this code has a different stable value from [other].
  bool isDifferentFrom(PlayerErrorCode other) {
    return value != other.value;
  }

  /// Returns the lexicographical comparison result against [other].
  @override
  int compareTo(PlayerErrorCode other) {
    return value.compareTo(other.value);
  }

  // ===========================================================================
  // Equatable
  // ===========================================================================

  @override
  List<Object?> get props => <Object?>[value];

  @override
  String toString() => value;
}

// =============================================================================
// Built-in values
// =============================================================================

const List<PlayerErrorCode> _builtInValues = <PlayerErrorCode>[
  // General
  PlayerErrorCode.unknown,
  PlayerErrorCode.invalidArgument,
  PlayerErrorCode.invalidState,
  PlayerErrorCode.unsupported,
  PlayerErrorCode.cancelled,
  PlayerErrorCode.timeout,
  PlayerErrorCode.staleGeneration,
  PlayerErrorCode.superseded,
  PlayerErrorCode.internal,

  // Source
  PlayerErrorCode.sourceMissing,
  PlayerErrorCode.sourceInvalid,
  PlayerErrorCode.sourceResolveFailed,
  PlayerErrorCode.sourceInspectFailed,
  PlayerErrorCode.sourceValidationFailed,
  PlayerErrorCode.sourceProtocolUnsupported,
  PlayerErrorCode.sourceMediaTypeUnsupported,
  PlayerErrorCode.sourceFormatUnsupported,

  // Network / HTTP / Authentication
  PlayerErrorCode.network,
  PlayerErrorCode.networkUnavailable,
  PlayerErrorCode.networkTimeout,
  PlayerErrorCode.networkDnsFailed,
  PlayerErrorCode.networkConnectionFailed,
  PlayerErrorCode.networkConnectionRefused,
  PlayerErrorCode.networkAborted,
  PlayerErrorCode.httpError,
  PlayerErrorCode.authenticationRequired,
  PlayerErrorCode.authenticationFailed,
  PlayerErrorCode.authorizationFailed,
  PlayerErrorCode.tlsError,

  // Adapter / Backend
  PlayerErrorCode.adapterUnavailable,
  PlayerErrorCode.adapterUnsupported,
  PlayerErrorCode.adapterInitializationFailed,
  PlayerErrorCode.adapterDisposed,
  PlayerErrorCode.backendUnavailable,
  PlayerErrorCode.backendInitializationFailed,
  PlayerErrorCode.backendOpenFailed,
  PlayerErrorCode.backendPlayFailed,
  PlayerErrorCode.backendPauseFailed,
  PlayerErrorCode.backendStopFailed,
  PlayerErrorCode.backendSeekFailed,
  PlayerErrorCode.backendFatal,

  // Playback
  PlayerErrorCode.playbackFailed,
  PlayerErrorCode.unexpectedStop,
  PlayerErrorCode.playbackInvalidState,
  PlayerErrorCode.invalidSeekPosition,
  PlayerErrorCode.invalidPlaybackRate,
  PlayerErrorCode.invalidVolume,

  // Decoder / Demuxer / Media
  PlayerErrorCode.decoderError,
  PlayerErrorCode.decoderUnavailable,
  PlayerErrorCode.codecUnsupported,
  PlayerErrorCode.demuxerError,
  PlayerErrorCode.mediaCorrupted,
  PlayerErrorCode.mediaMetadataInvalid,
  PlayerErrorCode.noPlayableStream,
  PlayerErrorCode.streamEndedUnexpectedly,

  // Resource
  PlayerErrorCode.resourceUnavailable,
  PlayerErrorCode.resourceLimitExceeded,
  PlayerErrorCode.memoryPressure,
  PlayerErrorCode.thermalPressure,
  PlayerErrorCode.insufficientBandwidth,

  // Renderer / Presentation / Geometry
  PlayerErrorCode.rendererInitializationFailed,
  PlayerErrorCode.rendererSurfaceFailed,
  PlayerErrorCode.rendererTextureFailed,
  PlayerErrorCode.geometryInvalid,
  PlayerErrorCode.presentationFailed,
  PlayerErrorCode.pipFailed,
  PlayerErrorCode.fullscreenFailed,
  PlayerErrorCode.floatingFailed,

  // Audio
  PlayerErrorCode.audioInitializationFailed,
  PlayerErrorCode.audioFocusFailed,
  PlayerErrorCode.audioRouteFailed,
  PlayerErrorCode.audioUnsupported,

  // Recording
  PlayerErrorCode.recordingUnsupported,
  PlayerErrorCode.recordingInitializationFailed,
  PlayerErrorCode.recordingFailed,
  PlayerErrorCode.recordingOutputInvalid,
  PlayerErrorCode.recordingStorageUnavailable,

  // Cache
  PlayerErrorCode.cacheError,
  PlayerErrorCode.cacheStorageUnavailable,
  PlayerErrorCode.cacheEntryInvalid,
  PlayerErrorCode.cacheLimitExceeded,

  // Concurrency
  PlayerErrorCode.concurrencyLimitExceeded,
  PlayerErrorCode.lockUnavailable,

  // Lifecycle
  PlayerErrorCode.disposed,
  PlayerErrorCode.lifecycleInactive,
  PlayerErrorCode.lifecycleTransitionFailed,

  // Fallback / Recovery
  PlayerErrorCode.fallbackUnavailable,
  PlayerErrorCode.fallbackSelectionFailed,
  PlayerErrorCode.recoveryUnavailable,
  PlayerErrorCode.recoveryFailed,
  PlayerErrorCode.recoveryExhausted,
];

// =============================================================================
// Code groups
// =============================================================================

final Set<String> _builtInCodes = <String>{for (final code in _builtInValues) code.value};

const Set<String> _cancellationCodes = <String>{'PLAYER_CANCELLED', 'PLAYER_STALE_GENERATION', 'PLAYER_SUPERSEDED'};

const Set<String> _networkCodes = <String>{
  'NETWORK_ERROR',
  'NETWORK_UNAVAILABLE',
  'NETWORK_TIMEOUT',
  'NETWORK_DNS_FAILED',
  'NETWORK_CONNECTION_FAILED',
  'NETWORK_CONNECTION_REFUSED',
  'NETWORK_ABORTED',
  'HTTP_ERROR',
  'AUTHENTICATION_REQUIRED',
  'AUTHENTICATION_FAILED',
  'AUTHORIZATION_FAILED',
  'TLS_ERROR',
};

const Set<String> _sourceCodes = <String>{
  'SOURCE_MISSING',
  'SOURCE_INVALID',
  'SOURCE_RESOLVE_FAILED',
  'SOURCE_INSPECT_FAILED',
  'SOURCE_VALIDATION_FAILED',
  'SOURCE_PROTOCOL_UNSUPPORTED',
  'SOURCE_MEDIA_TYPE_UNSUPPORTED',
  'SOURCE_FORMAT_UNSUPPORTED',
};

const Set<String> _adapterOrBackendCodes = <String>{
  'ADAPTER_UNAVAILABLE',
  'ADAPTER_UNSUPPORTED',
  'ADAPTER_INITIALIZATION_FAILED',
  'ADAPTER_DISPOSED',
  'BACKEND_UNAVAILABLE',
  'BACKEND_INITIALIZATION_FAILED',
  'BACKEND_OPEN_FAILED',
  'BACKEND_PLAY_FAILED',
  'BACKEND_PAUSE_FAILED',
  'BACKEND_STOP_FAILED',
  'BACKEND_SEEK_FAILED',
  'BACKEND_FATAL',
};

const Set<String> _playbackCodes = <String>{
  'PLAYBACK_FAILED',
  'UNEXPECTED_STOP',
  'PLAYBACK_INVALID_STATE',
  'INVALID_SEEK_POSITION',
  'INVALID_PLAYBACK_RATE',
  'INVALID_VOLUME',
};

const Set<String> _mediaPipelineCodes = <String>{
  'DECODER_ERROR',
  'DECODER_UNAVAILABLE',
  'CODEC_UNSUPPORTED',
  'DEMUXER_ERROR',
  'MEDIA_CORRUPTED',
  'MEDIA_METADATA_INVALID',
  'NO_PLAYABLE_STREAM',
  'STREAM_ENDED_UNEXPECTEDLY',
};

const Set<String> _resourceCodes = <String>{
  'RESOURCE_UNAVAILABLE',
  'RESOURCE_LIMIT_EXCEEDED',
  'MEMORY_PRESSURE',
  'THERMAL_PRESSURE',
  'INSUFFICIENT_BANDWIDTH',
};

const Set<String> _presentationCodes = <String>{
  'RENDERER_INITIALIZATION_FAILED',
  'RENDERER_SURFACE_FAILED',
  'RENDERER_TEXTURE_FAILED',
  'GEOMETRY_INVALID',
  'PRESENTATION_FAILED',
  'PIP_FAILED',
  'FULLSCREEN_FAILED',
  'FLOATING_FAILED',
};

/// Classification hints only.
///
/// This set deliberately does not contain every technically recoverable
/// error. The actual retry/recovery decision belongs to ErrorPolicy.
const Set<String> _potentiallyRecoverableCodes = <String>{
  // Network.
  'NETWORK_ERROR',
  'NETWORK_UNAVAILABLE',
  'NETWORK_TIMEOUT',
  'NETWORK_DNS_FAILED',
  'NETWORK_CONNECTION_FAILED',
  'NETWORK_CONNECTION_REFUSED',
  'NETWORK_ABORTED',

  // HTTP.
  'HTTP_ERROR',

  // Security.
  'TLS_ERROR',

  // Backend.
  'BACKEND_UNAVAILABLE',
  'BACKEND_INITIALIZATION_FAILED',
  'BACKEND_OPEN_FAILED',
  'BACKEND_PLAY_FAILED',
  'BACKEND_FATAL',

  // Decoder.
  'DECODER_ERROR',
  'DECODER_UNAVAILABLE',

  // Media.
  'STREAM_ENDED_UNEXPECTEDLY',

  // Resource.
  'RESOURCE_UNAVAILABLE',
  'MEMORY_PRESSURE',
  'THERMAL_PRESSURE',
  'INSUFFICIENT_BANDWIDTH',

  // Renderer.
  'RENDERER_INITIALIZATION_FAILED',
  'RENDERER_SURFACE_FAILED',

  // Audio.
  'AUDIO_INITIALIZATION_FAILED',

  // Fallback / Recovery.
  'FALLBACK_UNAVAILABLE',
  'RECOVERY_FAILED',
};
