import 'package:media_core/fallback/quality_fallback_state.dart';

/// Coordinates fallback between playback quality candidates.
///
/// This class only manages quality candidate selection and lifecycle state.
///
/// It does not:
///
/// - select a source
/// - modify a media backend
/// - change decoder settings
/// - perform playback
final class QualityFallback {
  QualityFallback({QualityFallbackState initialState = const QualityFallbackState.initial()}) : _state = initialState;

  QualityFallbackState _state;

  bool _disposed = false;

  QualityFallbackState get state => _state;

  String? get currentQuality => _state.currentQuality;

  List<String> get candidates => _state.candidates;

  bool get canFallback => _state.canFallback;

  /// Starts a quality fallback lifecycle.
  void start(List<String> qualities, {String? currentQuality}) {
    _ensureNotDisposed();

    _state = _state.start(candidates: qualities, currentQuality: currentQuality);
  }

  /// Selects the next available quality.
  String? next() {
    _ensureNotDisposed();

    final String? quality = _state.nextQuality;

    if (quality == null) {
      _state = _state.exhaust();
      return null;
    }

    _state = _state.select(quality);

    return quality;
  }

  /// Marks the current quality attempt as failed.
  void markFailed() {
    _ensureNotDisposed();

    _state = _state.markFailed();
  }

  /// Marks the current quality as successful.
  void complete() {
    _ensureNotDisposed();

    _state = _state.complete();
  }

  /// Marks quality fallback as exhausted.
  void exhaust() {
    _ensureNotDisposed();

    _state = _state.exhaust();
  }

  /// Resets quality fallback.
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
      throw StateError('QualityFallback has been disposed.');
    }
  }
}
