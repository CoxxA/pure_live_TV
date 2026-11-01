import 'package:equatable/equatable.dart';

/// Broad classification of errors produced by the media player core.
///
/// A [PlayerErrorCode] identifies a specific failure, while
/// [PlayerErrorCategory] identifies the subsystem or failure domain involved.
///
/// Categories are implemented as value objects instead of enums so that
/// applications and adapters can define custom categories when necessary.
///
/// This class is responsible only for error classification semantics.
///
/// It does not:
/// - decide whether an error should be retried;
/// - decide whether fallback should be used;
/// - decide whether recovery should be performed;
/// - inspect runtime error context.
final class PlayerErrorCategory extends Equatable implements Comparable<PlayerErrorCategory> {
  const PlayerErrorCategory._(this.value, this.name);

  /// Creates a custom player error category.
  ///
  /// Custom category values are preserved after trimming.
  factory PlayerErrorCategory.custom(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Player error category cannot be empty.');
    }

    return PlayerErrorCategory._(normalized, normalized);
  }

  // ===========================================================================
  // General
  // ===========================================================================

  static const PlayerErrorCategory unknown = PlayerErrorCategory._('unknown', 'unknown');

  static const PlayerErrorCategory invalidArgument = PlayerErrorCategory._('invalidArgument', 'invalidArgument');

  /// The requested operation or capability is not supported.
  ///
  /// This is intentionally different from [invalidArgument]:
  ///
  /// - [invalidArgument] means the supplied argument itself is invalid.
  /// - [unsupported] means the argument may be valid, but the current
  ///   player, platform, adapter, backend, or capability does not support it.
  static const PlayerErrorCategory unsupported = PlayerErrorCategory._('unsupported', 'unsupported');

  static const PlayerErrorCategory state = PlayerErrorCategory._('state', 'state');

  static const PlayerErrorCategory cancellation = PlayerErrorCategory._('cancellation', 'cancellation');

  static const PlayerErrorCategory timeout = PlayerErrorCategory._('timeout', 'timeout');

  static const PlayerErrorCategory internal = PlayerErrorCategory._('internal', 'internal');

  // ===========================================================================
  // Source / Network
  // ===========================================================================

  static const PlayerErrorCategory source = PlayerErrorCategory._('source', 'source');

  static const PlayerErrorCategory network = PlayerErrorCategory._('network', 'network');

  static const PlayerErrorCategory http = PlayerErrorCategory._('http', 'http');

  static const PlayerErrorCategory authentication = PlayerErrorCategory._('authentication', 'authentication');

  static const PlayerErrorCategory security = PlayerErrorCategory._('security', 'security');

  // ===========================================================================
  // Playback backend
  // ===========================================================================

  static const PlayerErrorCategory adapter = PlayerErrorCategory._('adapter', 'adapter');

  static const PlayerErrorCategory backend = PlayerErrorCategory._('backend', 'backend');

  static const PlayerErrorCategory decoder = PlayerErrorCategory._('decoder', 'decoder');

  static const PlayerErrorCategory demuxer = PlayerErrorCategory._('demuxer', 'demuxer');

  static const PlayerErrorCategory media = PlayerErrorCategory._('media', 'media');

  static const PlayerErrorCategory playback = PlayerErrorCategory._('playback', 'playback');

  // ===========================================================================
  // Resource
  // ===========================================================================

  static const PlayerErrorCategory resource = PlayerErrorCategory._('resource', 'resource');

  static const PlayerErrorCategory memory = PlayerErrorCategory._('memory', 'memory');

  static const PlayerErrorCategory thermal = PlayerErrorCategory._('thermal', 'thermal');

  static const PlayerErrorCategory bandwidth = PlayerErrorCategory._('bandwidth', 'bandwidth');

  static const PlayerErrorCategory concurrency = PlayerErrorCategory._('concurrency', 'concurrency');

  // ===========================================================================
  // Presentation
  // ===========================================================================

  static const PlayerErrorCategory renderer = PlayerErrorCategory._('renderer', 'renderer');

  static const PlayerErrorCategory geometry = PlayerErrorCategory._('geometry', 'geometry');

  static const PlayerErrorCategory presentation = PlayerErrorCategory._('presentation', 'presentation');

  // ===========================================================================
  // Features
  // ===========================================================================

  static const PlayerErrorCategory audio = PlayerErrorCategory._('audio', 'audio');

  static const PlayerErrorCategory recording = PlayerErrorCategory._('recording', 'recording');

  static const PlayerErrorCategory cache = PlayerErrorCategory._('cache', 'cache');

  // ===========================================================================
  // Lifecycle / Recovery
  // ===========================================================================

  static const PlayerErrorCategory lifecycle = PlayerErrorCategory._('lifecycle', 'lifecycle');

  static const PlayerErrorCategory recovery = PlayerErrorCategory._('recovery', 'recovery');

  static const PlayerErrorCategory fallback = PlayerErrorCategory._('fallback', 'fallback');

  // ===========================================================================
  // Properties
  // ===========================================================================

  /// Stable machine-readable category value.
  final String value;

  /// Stable symbolic category name.
  final String name;

  /// Whether this category is one of the built-in categories.
  bool get isBuiltIn {
    return _builtInCategories.contains(value);
  }

  /// Whether this category is custom.
  bool get isCustom => !isBuiltIn;

  /// Whether this is the unknown category.
  bool get isUnknown => value == unknown.value;

  /// Whether this category represents an invalid argument.
  bool get isInvalidArgument {
    return value == invalidArgument.value;
  }

  /// Whether this category represents an unsupported capability.
  bool get isUnsupported {
    return value == unsupported.value;
  }

  /// Whether this category represents a state error.
  bool get isState {
    return value == state.value;
  }

  /// Whether this category represents cancellation.
  bool get isCancellation {
    return value == cancellation.value;
  }

  /// Whether this category represents a timeout.
  bool get isTimeout {
    return value == timeout.value;
  }

  /// Whether this category represents an internal error.
  bool get isInternal {
    return value == internal.value;
  }

  /// Whether this category is related to networking, HTTP,
  /// authentication, or transport security.
  ///
  /// Value comparison is intentionally used instead of [identical].
  bool get isNetworkRelated {
    return _networkRelatedCategories.contains(value);
  }

  /// Whether this category is related to media source processing,
  /// decoding, demuxing, or media validation.
  bool get isMediaRelated {
    return _mediaRelatedCategories.contains(value);
  }

  /// Whether this category is related to playback execution,
  /// adapters, or playback backends.
  bool get isPlaybackRelated {
    return _playbackRelatedCategories.contains(value);
  }

  /// Whether this category is related to player resource constraints.
  bool get isResourceRelated {
    return _resourceRelatedCategories.contains(value);
  }

  /// Whether this category is related to rendering or presentation.
  bool get isPresentationRelated {
    return _presentationRelatedCategories.contains(value);
  }

  /// Whether this category represents cancellation.
  bool get isCancellationRelated {
    return value == cancellation.value;
  }

  /// Whether this category represents a player feature.
  bool get isFeatureRelated {
    return _featureRelatedCategories.contains(value);
  }

  /// Whether this category represents lifecycle management.
  bool get isLifecycleRelated {
    return value == lifecycle.value;
  }

  /// Whether this category represents recovery or fallback processing.
  bool get isRecoveryRelated {
    return value == recovery.value || value == fallback.value;
  }

  // ===========================================================================
  // Lookup
  // ===========================================================================

  /// Returns all built-in categories.
  static List<PlayerErrorCategory> get values {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues);
  }

  /// Resolves a built-in category from its stable value.
  ///
  /// Unknown values resolve to [unknown].
  ///
  /// Use [custom] when custom category preservation is required.
  static PlayerErrorCategory fromValue(String value) {
    final normalized = value.trim();

    for (final category in _builtInValues) {
      if (category.value == normalized) {
        return category;
      }
    }

    return PlayerErrorCategory.unknown;
  }

  /// Parses a built-in category from a string.
  ///
  /// This is an alias for [fromValue].
  static PlayerErrorCategory parse(String value) {
    return fromValue(value);
  }

  /// Creates a category from its JSON representation.
  ///
  /// Unknown values resolve to [unknown].
  static PlayerErrorCategory fromJson(Object? json) {
    if (json is! String) {
      throw FormatException('PlayerErrorCategory JSON value must be a String.');
    }

    return fromValue(json);
  }

  /// Converts this category to its JSON representation.
  String toJson() => value;

  /// Returns whether [value] represents a built-in category.
  static bool isBuiltInValue(String value) {
    return _builtInCategories.contains(value.trim());
  }

  /// Returns the built-in category matching [value], or `null`.
  static PlayerErrorCategory? tryFromValue(String value) {
    final normalized = value.trim();

    for (final category in _builtInValues) {
      if (category.value == normalized) {
        return category;
      }
    }

    return null;
  }

  /// Returns all built-in categories matching [predicate].
  static List<PlayerErrorCategory> where(bool Function(PlayerErrorCategory category) predicate) {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where(predicate));
  }

  // ===========================================================================
  // Category groups
  // ===========================================================================

  /// Returns all built-in categories related to networking.
  static List<PlayerErrorCategory> get networkRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isNetworkRelated));
  }

  /// Returns all built-in categories related to media processing.
  static List<PlayerErrorCategory> get mediaRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isMediaRelated));
  }

  /// Returns all built-in categories related to playback.
  static List<PlayerErrorCategory> get playbackRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isPlaybackRelated));
  }

  /// Returns all built-in categories related to resources.
  static List<PlayerErrorCategory> get resourceRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isResourceRelated));
  }

  /// Returns all built-in categories related to presentation.
  static List<PlayerErrorCategory> get presentationRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isPresentationRelated));
  }

  /// Returns all built-in categories related to player features.
  static List<PlayerErrorCategory> get featureRelatedCategories {
    return List<PlayerErrorCategory>.unmodifiable(_builtInValues.where((category) => category.isFeatureRelated));
  }

  // ===========================================================================
  // Value helpers
  // ===========================================================================

  /// Returns a copy with optionally replaced fields.
  ///
  /// This method can create a custom category when [value] is not a
  /// built-in category.
  PlayerErrorCategory copyWith({String? value, String? name}) {
    final nextValue = (value ?? this.value).trim();
    final nextName = (name ?? this.name).trim();

    if (nextValue.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Player error category cannot be empty.');
    }

    if (nextName.isEmpty) {
      throw ArgumentError.value(name, 'name', 'Player error category name cannot be empty.');
    }

    return PlayerErrorCategory._(nextValue, nextName);
  }

  /// Returns whether this category has the same stable value as [other].
  bool isSameAs(PlayerErrorCategory other) {
    return value == other.value;
  }

  /// Returns whether this category has a different stable value from [other].
  bool isDifferentFrom(PlayerErrorCategory other) {
    return value != other.value;
  }

  /// Compares this category with [other] by stable value.
  @override
  int compareTo(PlayerErrorCategory other) {
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

const List<PlayerErrorCategory> _builtInValues = <PlayerErrorCategory>[
  // General
  PlayerErrorCategory.unknown,
  PlayerErrorCategory.invalidArgument,
  PlayerErrorCategory.unsupported,
  PlayerErrorCategory.state,
  PlayerErrorCategory.cancellation,
  PlayerErrorCategory.timeout,
  PlayerErrorCategory.internal,

  // Source / Network
  PlayerErrorCategory.source,
  PlayerErrorCategory.network,
  PlayerErrorCategory.http,
  PlayerErrorCategory.authentication,
  PlayerErrorCategory.security,

  // Playback backend
  PlayerErrorCategory.adapter,
  PlayerErrorCategory.backend,
  PlayerErrorCategory.decoder,
  PlayerErrorCategory.demuxer,
  PlayerErrorCategory.media,
  PlayerErrorCategory.playback,

  // Resource
  PlayerErrorCategory.resource,
  PlayerErrorCategory.memory,
  PlayerErrorCategory.thermal,
  PlayerErrorCategory.bandwidth,
  PlayerErrorCategory.concurrency,

  // Presentation
  PlayerErrorCategory.renderer,
  PlayerErrorCategory.geometry,
  PlayerErrorCategory.presentation,

  // Features
  PlayerErrorCategory.audio,
  PlayerErrorCategory.recording,
  PlayerErrorCategory.cache,

  // Lifecycle / Recovery
  PlayerErrorCategory.lifecycle,
  PlayerErrorCategory.recovery,
  PlayerErrorCategory.fallback,
];

// =============================================================================
// Category groups
// =============================================================================

final Set<String> _builtInCategories = <String>{for (final category in _builtInValues) category.value};

const Set<String> _networkRelatedCategories = <String>{'network', 'http', 'authentication', 'security'};

const Set<String> _mediaRelatedCategories = <String>{'source', 'decoder', 'demuxer', 'media'};

const Set<String> _playbackRelatedCategories = <String>{'playback', 'backend', 'adapter'};

const Set<String> _resourceRelatedCategories = <String>{'resource', 'memory', 'thermal', 'bandwidth', 'concurrency'};

const Set<String> _presentationRelatedCategories = <String>{'renderer', 'geometry', 'presentation'};

const Set<String> _featureRelatedCategories = <String>{'audio', 'recording', 'cache'};
