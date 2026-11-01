import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// Provides debounce helpers for reactive streams.
///
/// Debouncing delays emissions until the source stream has remained quiet
/// for the specified duration.
abstract final class ReactiveDebounce {
  /// Debounces [source] by [duration].
  ///
  /// Only the most recent value within a debounce window is emitted.
  static Stream<T> apply<T>(Stream<T> source, Duration duration) {
    _validateDuration(duration);

    return source.debounceTime(duration);
  }

  /// Debounces [source] using a duration calculated from each value.
  static Stream<T> applyWithSelector<T>(Stream<T> source, Duration Function(T value) selector) {
    return source.debounce((value) => TimerStream<void>(null, selector(value)));
  }

  /// Emits the latest value only after [duration] has elapsed without
  /// another source event.
  static Stream<T> latest<T>(Stream<T> source, Duration duration) {
    return apply(source, duration);
  }

  /// Creates a debounced stream that emits at most one value after a quiet
  /// period.
  static Stream<T> trailing<T>(Stream<T> source, Duration duration) {
    return apply(source, duration);
  }

  static void _validateDuration(Duration duration) {
    if (duration.isNegative) {
      throw ArgumentError.value(duration, 'duration', 'Debounce duration must not be negative.');
    }
  }
}

/// Extensions for debouncing streams.
extension ReactiveDebounceStreamExtensions<T> on Stream<T> {
  /// Debounces this stream by [duration].
  Stream<T> debounceValues(Duration duration) {
    if (duration.isNegative) {
      throw ArgumentError.value(duration, 'duration', 'Debounce duration must not be negative.');
    }

    return debounceTime(duration);
  }

  /// Debounces this stream using a duration calculated from each value.
  Stream<T> debounceValuesWithSelector(Duration Function(T value) selector) {
    return debounce((value) => TimerStream<void>(null, selector(value)));
  }

  /// Debounces this stream with a duration expressed in milliseconds.
  Stream<T> debounceMilliseconds(int milliseconds) {
    if (milliseconds < 0) {
      throw ArgumentError.value(milliseconds, 'milliseconds', 'Debounce duration must not be negative.');
    }

    return debounceTime(Duration(milliseconds: milliseconds));
  }

  /// Debounces this stream with a duration expressed in seconds.
  Stream<T> debounceSeconds(int seconds) {
    if (seconds < 0) {
      throw ArgumentError.value(seconds, 'seconds', 'Debounce duration must not be negative.');
    }

    return debounceTime(Duration(seconds: seconds));
  }
}

/// Provides a debounced value controller.
class ReactiveDebouncer<T> {
  /// Creates a debouncer.
  ReactiveDebouncer({required this.duration}) : _controller = StreamController<T>.broadcast();

  /// The debounce duration.
  final Duration duration;

  final StreamController<T> _controller;

  Timer? _timer;
  T? _pendingValue;
  bool _hasPendingValue = false;
  bool _disposed = false;

  /// Whether this debouncer has been disposed.
  bool get isDisposed => _disposed;

  /// Whether this debouncer currently has a pending value.
  bool get hasPendingValue => _hasPendingValue;

  /// The output stream.
  Stream<T> get stream => _controller.stream;

  /// Adds a value to the debounce window.
  void add(T value) {
    if (_disposed) {
      return;
    }

    _pendingValue = value;
    _hasPendingValue = true;

    _timer?.cancel();

    _timer = Timer(duration, _emitPending);
  }

  /// Cancels the pending value without disposing the debouncer.
  void cancel() {
    _timer?.cancel();
    _timer = null;
    _pendingValue = null;
    _hasPendingValue = false;
  }

  /// Immediately emits the pending value, if any.
  void flush() {
    if (_disposed) {
      return;
    }

    _timer?.cancel();
    _timer = null;
    _emitPending();
  }

  void _emitPending() {
    if (_disposed || !_hasPendingValue) {
      return;
    }

    final value = _pendingValue as T;

    _pendingValue = null;
    _hasPendingValue = false;
    _timer = null;

    if (!_controller.isClosed) {
      _controller.add(value);
    }
  }

  /// Disposes this debouncer.
  Future<void> dispose() async {
    if (_disposed) {
      return;
    }

    _disposed = true;
    cancel();

    await _controller.close();
  }
}
