import 'package:equatable/equatable.dart';

/// HTTP or transport headers associated with a media source.
///
/// Header names are treated case-insensitively according to HTTP semantics.
/// The class is immutable and provides helpers for safely reading, updating,
/// merging, and removing headers.
class SourceHeaders extends Equatable {
  /// Creates source headers.
  ///
  /// Header names and values are copied into an immutable internal map.
  SourceHeaders([Map<String, String> headers = const {}])
    : _headers = Map.unmodifiable(
        Map<String, String>.fromEntries(headers.entries.map((entry) => MapEntry(entry.key.trim(), entry.value))),
      );

  final Map<String, String> _headers;

  /// Empty source headers.
  static SourceHeaders empty = SourceHeaders();

  /// Returns all headers as an immutable map.
  Map<String, String> get values => _headers;

  /// Whether no headers are present.
  bool get isEmpty => _headers.isEmpty;

  /// Whether at least one header is present.
  bool get isNotEmpty => _headers.isNotEmpty;

  /// Number of headers.
  int get length => _headers.length;

  /// Returns a header value using case-insensitive lookup.
  String? operator [](String name) {
    final normalizedName = name.trim().toLowerCase();

    for (final entry in _headers.entries) {
      if (entry.key.toLowerCase() == normalizedName) {
        return entry.value;
      }
    }

    return null;
  }

  /// Whether a header exists using case-insensitive lookup.
  bool contains(String name) {
    return this[name] != null;
  }

  /// Returns whether the headers contain an Authorization header.
  bool get hasAuthorization => contains('Authorization');

  /// Returns whether the headers contain a Cookie header.
  bool get hasCookie => contains('Cookie');

  /// Returns whether the headers contain a Referer header.
  bool get hasReferer => contains('Referer');

  /// Returns whether the headers contain a User-Agent header.
  bool get hasUserAgent => contains('User-Agent');

  /// Returns a new instance with the specified header added or replaced.
  ///
  /// Existing header names are matched case-insensitively.
  SourceHeaders set(String name, String value) {
    final normalizedName = name.trim();

    if (normalizedName.isEmpty) {
      return this;
    }

    final next = <String, String>{};

    for (final entry in _headers.entries) {
      if (entry.key.toLowerCase() != normalizedName.toLowerCase()) {
        next[entry.key] = entry.value;
      }
    }

    next[normalizedName] = value;

    return SourceHeaders(next);
  }

  /// Returns a new instance without the specified header.
  ///
  /// Header names are matched case-insensitively.
  SourceHeaders remove(String name) {
    final normalizedName = name.trim().toLowerCase();

    if (normalizedName.isEmpty) {
      return this;
    }

    final next = <String, String>{};

    for (final entry in _headers.entries) {
      if (entry.key.toLowerCase() != normalizedName) {
        next[entry.key] = entry.value;
      }
    }

    if (next.length == _headers.length) {
      return this;
    }

    return SourceHeaders(next);
  }

  /// Returns a new instance containing headers from both instances.
  ///
  /// Headers in [other] override existing headers with the same name.
  SourceHeaders merge(SourceHeaders other) {
    if (other.isEmpty) {
      return this;
    }

    var result = this;

    for (final entry in other._headers.entries) {
      result = result.set(entry.key, entry.value);
    }

    return result;
  }

  /// Returns a new instance containing only the specified header names.
  SourceHeaders select(Iterable<String> names) {
    var result = SourceHeaders.empty;

    for (final name in names) {
      final value = this[name];

      if (value != null) {
        result = result.set(name, value);
      }
    }

    return result;
  }

  /// Returns a new instance without the specified header names.
  SourceHeaders removeAll(Iterable<String> names) {
    var result = this;

    for (final name in names) {
      result = result.remove(name);
    }

    return result;
  }

  /// Returns the header names.
  Iterable<String> get names => _headers.keys;

  /// Returns the header values.
  Iterable<String> get headerValues => _headers.values;

  /// Converts the headers to a mutable map.
  ///
  /// This is useful when passing headers to an external API that requires
  /// a mutable map.
  Map<String, String> toMap() {
    return Map<String, String>.from(_headers);
  }

  /// Creates a copy of these headers.
  SourceHeaders copy() {
    return SourceHeaders(_headers);
  }

  /// Returns whether these headers contain the same values as [other].
  bool equals(SourceHeaders other) {
    if (_headers.length != other._headers.length) {
      return false;
    }

    for (final entry in _headers.entries) {
      if (other[entry.key] != entry.value) {
        return false;
      }
    }

    return true;
  }

  @override
  List<Object?> get props {
    final normalized = <String, String>{};

    for (final entry in _headers.entries) {
      normalized[entry.key.toLowerCase()] = entry.value;
    }

    return [normalized];
  }

  @override
  String toString() {
    return 'SourceHeaders($_headers)';
  }
}
