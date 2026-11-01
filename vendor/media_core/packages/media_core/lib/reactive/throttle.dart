import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// Throttle utilities.
abstract final class Throttle {
  /// Throttles events so that at most one event is emitted within [duration].
  ///
  /// The first event is emitted immediately.
  static Stream<T> stream<T>(Stream<T> source, Duration duration, {bool trailing = false}) {
    if (trailing) {
      return source.throttleTime(duration, leading: true, trailing: true);
    }

    return source.throttleTime(duration, leading: true, trailing: false);
  }

  /// Creates a throttled callback.
  static VoidCallback callback(Duration duration, VoidCallback action) {
    Timer? timer;

    return () {
      if (timer?.isActive ?? false) {
        return;
      }

      action();

      timer = Timer(duration, () {
        timer = null;
      });
    };
  }
}

/// A callback type without arguments.
typedef VoidCallback = void Function();
