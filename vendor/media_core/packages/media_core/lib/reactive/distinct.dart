import 'package:rxdart/rxdart.dart';

/// Reactive distinct helpers.
///
/// Provides a small project-level API around RxDart's distinct operators.
abstract final class Distinct {
  const Distinct._();

  /// Emits only values that are different from the previously emitted value.
  static Stream<T> stream<T>(Stream<T> source, {bool Function(T previous, T current)? equals}) {
    if (equals == null) {
      return source.distinct();
    }

    return source.distinctUnique(equals: equals);
  }

  /// Emits only values that have not appeared before.
  ///
  /// Unlike [stream], this compares the current value against all previously
  /// emitted values.
  static Stream<T> unique<T>(Stream<T> source, {bool Function(T previous, T current)? equals}) {
    if (equals == null) {
      return source.distinctUnique();
    }

    return source.distinctUnique(equals: equals);
  }

  /// Emits only when the mapped key changes.
  static Stream<T> byKey<T, K>(Stream<T> source, K Function(T value) keyOf) {
    return source
        .map((value) => _KeyedValue<T, K>(value, keyOf(value)))
        .distinct((previous, current) => previous.key == current.key)
        .map((value) => value.value);
  }
}

final class _KeyedValue<T, K> {
  const _KeyedValue(this.value, this.key);

  final T value;
  final K key;
}
