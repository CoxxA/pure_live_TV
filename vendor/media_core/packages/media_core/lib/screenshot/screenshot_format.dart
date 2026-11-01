/// Encoded image format of a captured frame.
///
/// The format belongs to the *result* as much as to the request: a backend
/// that cannot encode the requested format returns nothing instead of a
/// different one, and a surface capture can only encode PNG. A caller that
/// needs a specific format therefore has to look at
/// `PlayerScreenshot.format`, not only at the options it passed.
enum ScreenshotFormat {
  /// Lossless PNG (`image/png`).
  png('image/png', 'png'),

  /// Lossy JPEG (`image/jpeg`).
  jpeg('image/jpeg', 'jpg');

  const ScreenshotFormat(this.mimeType, this.fileExtension);

  /// MIME type of the encoded bytes.
  ///
  /// Engines that take the format as a string are handed exactly this value
  /// (mpv's `screenshot` accepts `image/png` and `image/jpeg`).
  final String mimeType;

  /// File extension without the leading dot.
  final String fileExtension;

  /// Whether encoding loses information.
  bool get isLossy => this == ScreenshotFormat.jpeg;

  /// Whether the encoded bytes are compressed.
  bool get isEncoded => true;

  /// Format for [mimeType], or null when it is not one of these.
  static ScreenshotFormat? fromMimeType(String? mimeType) {
    if (mimeType == null) {
      return null;
    }

    final normalized = mimeType.trim().toLowerCase();

    for (final format in ScreenshotFormat.values) {
      if (format.mimeType == normalized) {
        return format;
      }
    }

    return null;
  }

  /// Format for a file extension, with or without the leading dot.
  static ScreenshotFormat? fromFileExtension(String? extension) {
    if (extension == null) {
      return null;
    }

    final normalized = extension.trim().toLowerCase().replaceFirst('.', '');

    for (final format in ScreenshotFormat.values) {
      if (format.fileExtension == normalized) {
        return format;
      }
    }

    return null;
  }

  @override
  String toString() => 'ScreenshotFormat($name)';
}
