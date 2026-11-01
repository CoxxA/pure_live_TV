/// Describes the general category of a media source.
///
/// [SourceType] identifies where or how a source is conceptually provided.
/// It does not describe the backend used to play the source.
enum SourceType {
  /// Unknown or not yet determined.
  unknown,

  /// A local file.
  file,

  /// An application or bundled asset.
  asset,

  /// A remote media resource.
  remote,

  /// A live media source.
  live,

  /// A stream-oriented media source.
  stream,

  /// A custom source handled by an application-defined resolver.
  custom,
}

/// Extensions for [SourceType].
extension SourceTypeX on SourceType {
  /// Whether this type is unknown.
  bool get isUnknown => this == SourceType.unknown;

  /// Whether this is a local source.
  bool get isLocal {
    return this == SourceType.file || this == SourceType.asset;
  }

  /// Whether this is a remote source.
  bool get isRemote {
    return this == SourceType.remote || this == SourceType.live || this == SourceType.stream;
  }

  /// Whether this represents a live source.
  bool get isLive => this == SourceType.live;

  /// Whether this represents a stream source.
  bool get isStream => this == SourceType.stream;

  /// Whether this is a file source.
  bool get isFile => this == SourceType.file;

  /// Whether this is an application asset.
  bool get isAsset => this == SourceType.asset;

  /// Whether this is a custom source.
  bool get isCustom => this == SourceType.custom;

  /// Whether this source type represents a playable source category.
  bool get isKnown => this != SourceType.unknown;

  /// Whether this source type represents a network-oriented source.
  ///
  /// This is only a classification of the source type. It does not imply
  /// that the source can actually be reached over a network.
  bool get isNetwork {
    return this == SourceType.remote || this == SourceType.live || this == SourceType.stream;
  }

  /// Returns the stable string representation of this source type.
  String get value => name;
}
