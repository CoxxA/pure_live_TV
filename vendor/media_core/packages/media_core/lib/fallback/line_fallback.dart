import 'package:media_core/fallback/line_fallback_state.dart';

/// Coordinates fallback between playback lines.
///
/// The fallback object only manages candidate selection.
///
/// It does not resolve, open, validate, or play a line.
final class LineFallback {
  LineFallback({LineFallbackState initialState = const LineFallbackState.initial()}) : _state = initialState;

  LineFallbackState _state;

  bool _disposed = false;

  LineFallbackState get state => _state;

  String? get currentLine => _state.currentLine;

  List<String> get candidates => _state.candidates;

  bool get canFallback => _state.canFallback;

  /// Starts a line fallback lifecycle.
  void start(List<String> lines, {String? currentLine}) {
    _ensureNotDisposed();

    _state = _state.start(candidates: lines, currentLine: currentLine);
  }

  /// Selects the next available line.
  String? next() {
    _ensureNotDisposed();

    final String? line = _state.nextLine;

    if (line == null) {
      _state = _state.exhaust();
      return null;
    }

    _state = _state.select(line);

    return line;
  }

  /// Marks the current line attempt as failed.
  void markFailed() {
    _ensureNotDisposed();

    _state = _state.markFailed();
  }

  /// Marks the current line as successful.
  void complete() {
    _ensureNotDisposed();

    _state = _state.complete();
  }

  /// Marks line fallback as exhausted.
  void exhaust() {
    _ensureNotDisposed();

    _state = _state.exhaust();
  }

  /// Resets line fallback.
  void reset() {
    _ensureNotDisposed();

    _state = _state.reset();
  }

  /// Releases this fallback coordinator.
  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;
  }

  void _ensureNotDisposed() {
    if (_disposed) {
      throw StateError('LineFallback has been disposed.');
    }
  }
}
