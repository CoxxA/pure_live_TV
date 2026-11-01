import 'package:clock/clock.dart';

/// Time related utilities.
abstract final class TimeUtils {
  TimeUtils._();

  /// Returns current time.
  ///
  /// Uses `clock.now()` for testability.
  static DateTime now() {
    return clock.now();
  }

  /// Returns current UTC time.
  static DateTime utcNow() {
    return clock.now().toUtc();
  }

  /// Converts seconds to [Duration].
  static Duration seconds(num value) {
    return Duration(milliseconds: (value * 1000).round());
  }

  /// Converts milliseconds to [Duration].
  static Duration milliseconds(int value) {
    return Duration(milliseconds: value);
  }

  /// Converts minutes to [Duration].
  static Duration minutes(num value) {
    return Duration(milliseconds: (value * 60 * 1000).round());
  }

  /// Converts hours to [Duration].
  static Duration hours(num value) {
    return Duration(milliseconds: (value * 60 * 60 * 1000).round());
  }

  /// Converts [Duration] to seconds.
  static double toSeconds(Duration duration) {
    return duration.inMilliseconds / 1000;
  }

  /// Converts [Duration] to milliseconds.
  static int toMilliseconds(Duration duration) {
    return duration.inMilliseconds;
  }

  /// Returns unix timestamp in milliseconds.
  static int timestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  /// Creates date from unix milliseconds.
  static DateTime fromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  /// Checks whether date is expired.
  static bool isExpired(DateTime expiresAt, {DateTime? current}) {
    return (current ?? now()).isAfter(expiresAt);
  }

  /// Checks whether duration has passed.
  static bool elapsed(DateTime start, Duration duration, {DateTime? current}) {
    return (current ?? now()).difference(start) >= duration;
  }

  /// Returns minimum date.
  static DateTime min(DateTime a, DateTime b) {
    return a.isBefore(b) ? a : b;
  }

  /// Returns maximum date.
  static DateTime max(DateTime a, DateTime b) {
    return a.isAfter(b) ? a : b;
  }

  /// Formats duration as `HH:mm:ss`.
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;

    final minutes = duration.inMinutes % 60;

    final seconds = duration.inSeconds % 60;

    final mm = minutes.toString().padLeft(2, '0');

    final ss = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '$mm:$ss';
    }

    return '$mm:$ss';
  }

  /// Parses ISO date safely.
  static DateTime? parse(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }

  /// Returns difference between dates.
  static Duration difference(DateTime from, DateTime to) {
    return to.difference(from);
  }

  /// Clamps duration.
  static Duration clamp(Duration value, Duration min, Duration max) {
    if (value < min) {
      return min;
    }

    if (value > max) {
      return max;
    }

    return value;
  }

  /// Adds milliseconds safely.
  static DateTime addMilliseconds(DateTime dateTime, int milliseconds) {
    return dateTime.add(Duration(milliseconds: milliseconds));
  }

  /// Returns whether two dates are equal by timestamp.
  static bool sameMoment(DateTime a, DateTime b) {
    return a.millisecondsSinceEpoch == b.millisecondsSinceEpoch;
  }

  /// Returns relative age.
  static Duration age(DateTime dateTime, {DateTime? current}) {
    return (current ?? now()).difference(dateTime);
  }
}
