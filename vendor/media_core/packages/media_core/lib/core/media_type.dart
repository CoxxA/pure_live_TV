import 'package:equatable/equatable.dart';

/// Describes the media type currently represented by a player.
///
/// [MediaType] is a small immutable value object used by the core player
/// model. It describes the capabilities of the current media itself,
/// rather than the transport protocol or source declaration.
///
/// Source-level media information belongs to `SourceMediaType`.
final class MediaType extends Equatable implements Comparable<MediaType> {
  /// Creates a media type from a raw value.
  ///
  /// Empty values are not allowed.
  factory MediaType(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Media type must not be empty.');
    }

    return MediaType._(normalized);
  }

  /// Creates a custom media type.
  factory MediaType.custom(String value) {
    return MediaType(value);
  }

  /// Creates a media type from a JSON value.
  factory MediaType.fromJson(Object? json) {
    if (json is! String) {
      throw FormatException('MediaType JSON value must be a String.');
    }

    return MediaType(json);
  }

  /// Parses a media type from a string.
  static MediaType parse(String value) {
    return MediaType(value);
  }

  /// Attempts to parse a media type.
  ///
  /// Returns `null` when [value] is empty or invalid.
  static MediaType? tryParse(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    try {
      return MediaType(value);
    } on ArgumentError {
      return null;
    }
  }

  const MediaType._(this.value);

  /// Represents an unknown media type.
  static const MediaType unknown = MediaType._('unknown');

  /// Represents audio-only media.
  static const MediaType audio = MediaType._('audio');

  /// Represents video-only media.
  static const MediaType video = MediaType._('video');

  /// Represents media containing both audio and video.
  static const MediaType audioVideo = MediaType._('audio_video');

  /// Returns the raw media type value.
  final String value;

  /// Returns the raw string representation.
  String get rawValue => value;

  /// Returns the serialized value.
  String get toValue => value;

  /// Returns the JSON representation.
  String toJson() => value;

  /// Returns whether this is a built-in media type.
  bool get isBuiltIn {
    return this == unknown || this == audio || this == video || this == audioVideo;
  }

  /// Returns whether this is a custom media type.
  bool get isCustom => !isBuiltIn;

  /// Returns whether this represents an unknown media type.
  bool get isUnknown => value == unknown.value;

  /// Returns whether this represents audio-only media.
  bool get isAudio => value == audio.value;

  /// Returns whether this represents video media.
  bool get isVideo => value == video.value;

  /// Returns whether this contains both audio and video.
  bool get isAudioVideo => value == audioVideo.value;

  /// Returns whether the media contains an audio component.
  bool get hasAudio {
    return isAudio || isAudioVideo;
  }

  /// Returns whether the media contains a video component.
  bool get hasVideo {
    return isVideo || isAudioVideo;
  }

  /// Returns whether the media can be played through an audio output.
  bool get supportsAudioPlayback => hasAudio;

  /// Returns whether the media requires video playback support.
  bool get supportsVideoPlayback => hasVideo;

  /// Returns whether the media requires a video renderer.
  bool get requiresVideoRenderer => hasVideo;

  /// Returns whether the media is audio-only.
  bool get isAudioOnly => isAudio;

  /// Returns whether the media is video-only.
  bool get isVideoOnly => isVideo;

  /// Returns whether the media combines audio and video.
  bool get isCombined => isAudioVideo;

  /// Returns whether the media type is known and playable.
  bool get isPlayable {
    return isAudio || isVideo || isAudioVideo;
  }

  /// Returns whether the media type is one of the known built-in types.
  bool get isKnown => isBuiltIn && !isUnknown;

  /// Returns whether the value is a valid media type.
  static bool isValid(String value) {
    return value.trim().isNotEmpty;
  }

  /// Returns all built-in media types.
  static const List<MediaType> builtIns = <MediaType>[unknown, audio, video, audioVideo];

  /// Returns all playable built-in media types.
  static const List<MediaType> builtIn = <MediaType>[audio, video, audioVideo];

  /// Returns whether [value] is a built-in media type.
  static bool isBuiltInValue(String value) {
    final normalized = value.trim();

    return builtIns.any((MediaType type) => type.value == normalized);
  }

  /// Returns the corresponding built-in type for [value].
  ///
  /// Unknown values are represented by [unknown].
  static MediaType builtInFor(String value) {
    final normalized = value.trim();

    for (final type in builtIns) {
      if (type.value == normalized) {
        return type;
      }
    }

    return unknown;
  }

  /// Creates a copy with a different raw value.
  MediaType copyWith({String? value}) {
    return MediaType(value ?? this.value);
  }

  /// Returns whether this type is equal to [other].
  bool isSameAs(MediaType other) {
    return this == other;
  }

  /// Returns whether this type differs from [other].
  bool isDifferentFrom(MediaType other) {
    return this != other;
  }

  /// Returns whether this type has the same audio/video capabilities
  /// as [other].
  bool hasSameCapabilitiesAs(MediaType other) {
    return hasAudio == other.hasAudio && hasVideo == other.hasVideo;
  }

  @override
  int compareTo(MediaType other) {
    return value.compareTo(other.value);
  }

  @override
  List<Object?> get props => <Object?>[value];

  @override
  String toString() {
    return value;
  }
}
