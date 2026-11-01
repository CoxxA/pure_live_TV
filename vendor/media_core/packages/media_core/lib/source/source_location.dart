import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_location.freezed.dart';

/// Represents the location of a media source.
///
/// [SourceLocation] abstracts where media data
/// can be accessed from.
///
/// Supported locations:
///
/// - network URL
/// - local file path
/// - application asset
/// - custom locator
///
/// Responsibilities:
///
/// - store source address
/// - describe location type
///
/// It does not:
///
/// - check file existence
/// - open connections
/// - resolve redirects
///
/// Those belong to:
///
/// - SourceResolver
/// - Network layer
@freezed
abstract class SourceLocation with _$SourceLocation {
  /// Creates a source location.
  const factory SourceLocation({
    /// Resource URI.
    Uri? uri,

    /// Local filesystem path.
    String? path,

    /// Asset identifier.
    String? asset,

    /// Custom location value.
    String? custom,

    /// Location scheme.
    @Default(SourceLocationType.unknown) SourceLocationType type,
  }) = _SourceLocation;

  /// Creates an empty location.
  factory SourceLocation.empty() {
    return const SourceLocation();
  }

  /// Creates a network location.
  factory SourceLocation.network(Uri uri) {
    return SourceLocation(uri: uri, type: SourceLocationType.network);
  }

  /// Creates a local file location.
  factory SourceLocation.file(String path) {
    return SourceLocation(path: path, type: SourceLocationType.file);
  }

  /// Creates an asset location.
  factory SourceLocation.asset(String asset) {
    return SourceLocation(asset: asset, type: SourceLocationType.asset);
  }
}

/// Location category.
enum SourceLocationType {
  /// Unknown location.
  unknown,

  /// Network resource.
  network,

  /// Local file.
  file,

  /// Application asset.
  asset,

  /// Custom location.
  custom,
}

/// Extensions for [SourceLocation].
extension SourceLocationExtension on SourceLocation {
  /// Whether location is valid.
  /// Whether location is valid.
  bool get isValid {
    switch (type) {
      case SourceLocationType.network:
        return uri != null;

      case SourceLocationType.file:
        return path != null && path!.isNotEmpty;

      case SourceLocationType.asset:
        return asset != null && asset!.isNotEmpty;

      case SourceLocationType.custom:
        return custom != null && custom!.isNotEmpty;

      case SourceLocationType.unknown:
        return false;
    }
  }

  /// Whether this is network based.
  bool get isNetwork {
    return type == SourceLocationType.network;
  }

  /// Whether this is local.
  bool get isLocal {
    return type == SourceLocationType.file || type == SourceLocationType.asset;
  }

  /// Returns string representation.
  String? get value {
    switch (type) {
      case SourceLocationType.network:
        return uri?.toString();

      case SourceLocationType.file:
        return path;

      case SourceLocationType.asset:
        return asset;

      case SourceLocationType.custom:
        return custom;

      case SourceLocationType.unknown:
        return null;
    }
  }
}
