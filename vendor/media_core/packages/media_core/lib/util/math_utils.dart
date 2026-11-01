/// Math related utilities.
abstract final class MathUtils {
  MathUtils._();

  /// Clamps [value] between [min] and [max].
  static num clamp(num value, num min, num max) {
    if (value < min) {
      return min;
    }

    if (value > max) {
      return max;
    }

    return value;
  }

  /// Clamps integer value.
  static int clampInt(int value, int min, int max) {
    return clamp(value, min, max).toInt();
  }

  /// Clamps double value.
  static double clampDouble(double value, double min, double max) {
    return clamp(value, min, max).toDouble();
  }

  /// Checks whether value is inside range.
  static bool between(num value, num min, num max, {bool inclusive = true}) {
    if (inclusive) {
      return value >= min && value <= max;
    }

    return value > min && value < max;
  }

  /// Linear interpolation.
  ///
  /// `t` should be between `0.0` and `1.0`.
  static double lerp(double a, double b, double t) {
    return a + (b - a) * t;
  }

  /// Calculates percentage.
  static double percent(num value, num total) {
    if (total == 0) {
      return 0;
    }

    return value / total;
  }

  /// Converts percentage to value.
  static double fromPercent(double percent, double total) {
    return percent * total;
  }

  /// Calculates average.
  static double average(Iterable<num> values) {
    if (values.isEmpty) {
      return 0;
    }

    var sum = 0.0;

    for (final value in values) {
      sum += value;
    }

    return sum / values.length;
  }

  /// Calculates median.
  static double median(Iterable<num> values) {
    if (values.isEmpty) {
      return 0;
    }

    final list = values.map((e) => e.toDouble()).toList()..sort();

    final middle = list.length ~/ 2;

    if (list.length.isOdd) {
      return list[middle];
    }

    return (list[middle - 1] + list[middle]) / 2;
  }

  /// Calculates safe division.
  static double divide(num a, num b, {double fallback = 0}) {
    if (b == 0) {
      return fallback;
    }

    return a / b;
  }

  /// Converts bytes to kilobytes.
  static double bytesToKb(int bytes) {
    return bytes / 1024;
  }

  /// Converts bytes to megabytes.
  static double bytesToMb(int bytes) {
    return bytes / (1024 * 1024);
  }

  /// Converts megabytes to bytes.
  static int mbToBytes(double mb) {
    return (mb * 1024 * 1024).round();
  }

  /// Calculates aspect ratio.
  static double aspectRatio(double width, double height) {
    if (height == 0) {
      return 0;
    }

    return width / height;
  }

  /// Checks whether number is close.
  static bool closeTo(double a, double b, {double epsilon = 0.000001}) {
    return (a - b).abs() <= epsilon;
  }

  /// Returns sign of number.
  static int sign(num value) {
    if (value > 0) {
      return 1;
    }

    if (value < 0) {
      return -1;
    }

    return 0;
  }

  /// Returns absolute value.
  static num abs(num value) {
    return value.abs();
  }
}
