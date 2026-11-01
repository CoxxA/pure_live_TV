import 'package:mime/mime.dart';

/// MIME type utilities.
abstract final class MimeUtils {
  MimeUtils._();

  /// Returns MIME type from file path.
  static String? lookup(String path) {
    return lookupMimeType(path);
  }

  /// Returns MIME type from file name.
  static String? fromFileName(String fileName) {
    return lookupMimeType(fileName);
  }

  /// Returns whether the file is a video.
  static bool isVideo(String path) {
    final mime = lookup(path);

    return mime?.startsWith('video/') ?? false;
  }

  /// Returns whether the file is an audio file.
  static bool isAudio(String path) {
    final mime = lookup(path);

    return mime?.startsWith('audio/') ?? false;
  }

  /// Returns whether the file is an image.
  static bool isImage(String path) {
    final mime = lookup(path);

    return mime?.startsWith('image/') ?? false;
  }

  /// Returns whether the file is an application type.
  static bool isApplication(String path) {
    final mime = lookup(path);

    return mime?.startsWith('application/') ?? false;
  }

  /// Returns whether MIME type is a media type.
  static bool isMedia(String? mime) {
    if (mime == null) {
      return false;
    }

    return mime.startsWith('video/') || mime.startsWith('audio/') || mime.startsWith('image/');
  }

  /// Returns file extension from MIME type.
  static String? extension(String mimeType) {
    switch (mimeType.toLowerCase()) {
      case 'video/mp4':
        return '.mp4';

      case 'video/x-flv':
      case 'video/flv':
        return '.flv';

      case 'video/webm':
        return '.webm';

      case 'video/x-matroska':
      case 'video/mkv':
        return '.mkv';

      case 'audio/mpeg':
        return '.mp3';

      case 'audio/mp4':
        return '.m4a';

      case 'audio/aac':
        return '.aac';

      case 'image/jpeg':
        return '.jpg';

      case 'image/png':
        return '.png';

      case 'application/json':
        return '.json';

      case 'application/xml':
        return '.xml';

      case 'text/plain':
        return '.txt';

      default:
        return null;
    }
  }

  /// Returns common MIME type for extension.
  static String? fromExtension(String extension) {
    final ext = extension.toLowerCase().replaceFirst('.', '');

    switch (ext) {
      case 'mp4':
        return 'video/mp4';

      case 'flv':
        return 'video/x-flv';

      case 'webm':
        return 'video/webm';

      case 'mkv':
        return 'video/x-matroska';

      case 'mp3':
        return 'audio/mpeg';

      case 'm4a':
        return 'audio/mp4';

      case 'aac':
        return 'audio/aac';

      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';

      case 'png':
        return 'image/png';

      case 'gif':
        return 'image/gif';

      case 'json':
        return 'application/json';

      case 'xml':
        return 'application/xml';

      case 'txt':
        return 'text/plain';

      case 'm3u':
      case 'm3u8':
        return 'application/vnd.apple.mpegurl';

      default:
        return null;
    }
  }

  /// Returns whether MIME type can be played by media player.
  static bool isPlayable(String? mimeType) {
    if (mimeType == null) {
      return false;
    }

    return mimeType.startsWith('video/') || mimeType.startsWith('audio/');
  }

  /// Normalizes MIME type.
  static String normalize(String mimeType) {
    return mimeType.split(';').first.trim().toLowerCase();
  }

  /// Checks if two MIME types are equal.
  static bool equals(String? a, String? b) {
    if (a == null || b == null) {
      return false;
    }

    return normalize(a) == normalize(b);
  }

  /// Returns default MIME type.
  static String defaultType(String? path) {
    return lookup(path!) ?? 'application/octet-stream';
  }
}
