import 'dart:math';
import 'package:clock/clock.dart';

/// General-purpose identifier generation utilities.
///
/// This class does not define domain-specific identifiers.
/// Domain IDs such as PlayerId, SessionId, SourceId, etc. belong to
/// `identity/`.
abstract final class IdGenerator {
  IdGenerator._();

  static const String _alphanumeric = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  static const String _hex = '0123456789abcdef';

  static final Random _random = Random();

  static int _sequence = 0;

  /// Generates a random alphanumeric identifier.
  ///
  /// Example:
  /// `a8K2mP7xQ1`
  static String random({int length = 16}) {
    _validateLength(length);

    final buffer = StringBuffer();

    for (var i = 0; i < length; i++) {
      buffer.write(_alphanumeric[_random.nextInt(_alphanumeric.length)]);
    }

    return buffer.toString();
  }

  /// Generates a random hexadecimal identifier.
  ///
  /// Example:
  /// `7f3a91c0d4e8`
  static String hex({int length = 16}) {
    _validateLength(length);

    final buffer = StringBuffer();

    for (var i = 0; i < length; i++) {
      buffer.write(_hex[_random.nextInt(_hex.length)]);
    }

    return buffer.toString();
  }

  /// Generates a UUID v4 identifier.
  ///
  /// Example:
  /// `550e8400-e29b-41d4-a716-446655440000`
  static String uuid() {
    final bytes = List<int>.generate(16, (_) => _random.nextInt(256), growable: false);

    // RFC 4122 version 4.
    bytes[6] = (bytes[6] & 0x0f) | 0x40;

    // RFC 4122 variant.
    bytes[8] = (bytes[8] & 0x3f) | 0x80;

    final value = bytes.map(_byteToHex).join();

    return '${value.substring(0, 8)}-'
        '${value.substring(8, 12)}-'
        '${value.substring(12, 16)}-'
        '${value.substring(16, 20)}-'
        '${value.substring(20, 32)}';
  }

  /// Generates a short random identifier.
  ///
  /// Intended for logs, debug labels, and temporary references.
  /// It should not be treated as a globally unique identifier.
  static String short({int length = 8}) {
    return random(length: length);
  }

  /// Generates an identifier containing a timestamp and a random suffix.
  ///
  /// The timestamp uses base-36 encoding to keep the identifier compact.
  ///
  /// Example:
  /// `m5x8k2p1-a8K2mP`
  static String timestamped({int randomLength = 6}) {
    _validateLength(randomLength, name: 'randomLength');

    final timestamp = clock.now().millisecondsSinceEpoch.toRadixString(36);

    return '$timestamp-${random(length: randomLength)}';
  }

  /// Returns a process-local monotonically increasing sequence number.
  ///
  /// This value:
  ///
  /// - is only unique within the current process;
  /// - resets when the process restarts;
  /// - is not suitable as a persistent domain ID.
  ///
  /// Useful for ordering internal events, operations, or diagnostics.
  static int nextSequence() {
    return ++_sequence;
  }

  /// Generates a sequence-based identifier with an optional prefix.
  ///
  /// Example:
  /// `event-42`
  static String sequence({String prefix = 'id'}) {
    final normalizedPrefix = prefix.trim();

    if (normalizedPrefix.isEmpty) {
      throw ArgumentError.value(prefix, 'prefix', 'Prefix must not be empty.');
    }

    return '$normalizedPrefix-${nextSequence()}';
  }

  static String _byteToHex(int value) {
    return value.toRadixString(16).padLeft(2, '0');
  }

  static void _validateLength(int length, {String name = 'length'}) {
    if (length <= 0) {
      throw ArgumentError.value(length, name, 'Length must be greater than zero.');
    }
  }
}
