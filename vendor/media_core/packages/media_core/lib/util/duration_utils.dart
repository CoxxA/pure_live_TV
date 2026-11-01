/// Utilities for working with [Duration].
abstract final class DurationUtils {
  DurationUtils._();

  /// A zero duration.
  static const Duration zero = Duration.zero;

  /// Returns whether [duration] is zero.
  static bool isZero(Duration duration) {
    return duration == Duration.zero;
  }

  /// Returns whether [duration] is positive.
  static bool isPositive(Duration duration) {
    return duration > Duration.zero;
  }

  /// Returns whether [duration] is negative.
  static bool isNegative(Duration duration) {
    return duration < Duration.zero;
  }

  /// Returns [duration] when positive, otherwise [Duration.zero].
  static Duration nonNegative(Duration duration) {
    return duration.isNegative ? Duration.zero : duration;
  }

  /// Returns [duration] when negative, otherwise [Duration.zero].
  static Duration nonPositive(Duration duration) {
    return duration.isNegative ? duration : Duration.zero;
  }

  /// Clamps [duration] between [minimum] and [maximum].
  static Duration clamp(Duration duration, {Duration? minimum, Duration? maximum}) {
    if (minimum != null && maximum != null && minimum > maximum) {
      throw ArgumentError('Minimum duration must not be greater than maximum duration.');
    }

    if (minimum != null && duration < minimum) {
      return minimum;
    }

    if (maximum != null && duration > maximum) {
      return maximum;
    }

    return duration;
  }

  /// Returns the smaller of [a] and [b].
  static Duration min(Duration a, Duration b) {
    return a <= b ? a : b;
  }

  /// Returns the larger of [a] and [b].
  static Duration max(Duration a, Duration b) {
    return a >= b ? a : b;
  }

  /// Adds [amount] to [duration] while preventing overflow.
  ///
  /// Dart's [Duration] internally uses microseconds, so this method clamps
  /// the result to the representable [Duration] range.
  static Duration add(Duration duration, Duration amount) {
    final value = duration.inMicroseconds;
    final delta = amount.inMicroseconds;

    final result = value + delta;

    if (delta > 0 && result < value) {
      return const Duration(days: 106751);
    }

    if (delta < 0 && result > value) {
      return const Duration(days: -106751);
    }

    return Duration(microseconds: result);
  }

  /// Subtracts [amount] from [duration].
  static Duration subtract(Duration duration, Duration amount) {
    return add(duration, -amount);
  }

  /// Converts milliseconds to [Duration].
  static Duration fromMilliseconds(int milliseconds) {
    return Duration(milliseconds: milliseconds);
  }

  /// Converts seconds to [Duration].
  static Duration fromSeconds(num seconds) {
    return Duration(microseconds: (seconds * Duration.microsecondsPerSecond).round());
  }

  /// Converts minutes to [Duration].
  static Duration fromMinutes(num minutes) {
    return Duration(microseconds: (minutes * Duration.microsecondsPerMinute).round());
  }

  /// Converts hours to [Duration].
  static Duration fromHours(num hours) {
    return Duration(microseconds: (hours * Duration.microsecondsPerHour).round());
  }

  /// Converts [duration] to seconds as a fractional value.
  static double toSeconds(Duration duration) {
    return duration.inMicroseconds / Duration.microsecondsPerSecond;
  }

  /// Converts [duration] to minutes as a fractional value.
  static double toMinutes(Duration duration) {
    return duration.inMicroseconds / Duration.microsecondsPerMinute;
  }

  /// Converts [duration] to hours as a fractional value.
  static double toHours(Duration duration) {
    return duration.inMicroseconds / Duration.microsecondsPerHour;
  }

  /// Returns [duration] rounded down to the nearest [unit].
  static Duration floor(Duration duration, Duration unit) {
    _validateUnit(unit);

    final value = duration.inMicroseconds;
    final unitValue = unit.inMicroseconds;

    return Duration(microseconds: (value ~/ unitValue) * unitValue);
  }

  /// Returns [duration] rounded up to the nearest [unit].
  static Duration ceil(Duration duration, Duration unit) {
    _validateUnit(unit);

    final value = duration.inMicroseconds;
    final unitValue = unit.inMicroseconds;

    if (value % unitValue == 0) {
      return duration;
    }

    final quotient = value ~/ unitValue;

    return Duration(microseconds: (quotient + 1) * unitValue);
  }

  /// Returns [duration] rounded to the nearest [unit].
  static Duration round(Duration duration, Duration unit) {
    _validateUnit(unit);

    final value = duration.inMicroseconds;
    final unitValue = unit.inMicroseconds;

    final quotient = value ~/ unitValue;
    final remainder = value % unitValue;

    if (remainder.abs() * 2 < unitValue) {
      return Duration(microseconds: quotient * unitValue);
    }

    final direction = value.isNegative ? -1 : 1;

    return Duration(microseconds: (quotient + direction) * unitValue);
  }

  /// Formats a duration as `HH:MM:SS`.
  ///
  /// Hours are not limited to 24.
  static String formatHms(Duration duration, {bool showMilliseconds = false}) {
    final negative = duration.isNegative;
    final value = duration.abs();

    final hours = value.inHours;
    final minutes = value.inMinutes.remainder(60);
    final seconds = value.inSeconds.remainder(60);

    final buffer = StringBuffer();

    if (negative) {
      buffer.write('-');
    }

    buffer
      ..write(hours.toString().padLeft(2, '0'))
      ..write(':')
      ..write(minutes.toString().padLeft(2, '0'))
      ..write(':')
      ..write(seconds.toString().padLeft(2, '0'));

    if (showMilliseconds) {
      final milliseconds = value.inMilliseconds.remainder(1000);

      buffer
        ..write('.')
        ..write(milliseconds.toString().padLeft(3, '0'));
    }

    return buffer.toString();
  }

  /// Formats a duration compactly.
  ///
  /// Examples:
  /// - `5s`
  /// - `1m 20s`
  /// - `2h 3m 10s`
  static String formatCompact(Duration duration) {
    final negative = duration.isNegative;
    final value = duration.abs();

    final hours = value.inHours;
    final minutes = value.inMinutes.remainder(60);
    final seconds = value.inSeconds.remainder(60);

    final parts = <String>[];

    if (hours > 0) {
      parts.add('${hours}h');
    }

    if (minutes > 0) {
      parts.add('${minutes}m');
    }

    if (seconds > 0 || parts.isEmpty) {
      parts.add('${seconds}s');
    }

    final result = parts.join(' ');

    return negative ? '-$result' : result;
  }

  static void _validateUnit(Duration unit) {
    if (unit <= Duration.zero) {
      throw ArgumentError.value(unit, 'unit', 'Unit must be greater than zero.');
    }
  }
}
