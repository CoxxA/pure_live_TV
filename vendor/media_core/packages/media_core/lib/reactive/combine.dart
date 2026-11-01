import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// Provides helpers for combining multiple reactive streams.
///
/// RxDart remains the underlying implementation. This class only provides
/// stable APIs for common stream combination patterns used by the player core.
abstract final class ReactiveCombine {
  /// Combines the latest values from all [streams].
  ///
  /// The resulting stream emits after every source has emitted at least once.
  static Stream<List<T>> latest<T>(Iterable<Stream<T>> streams) {
    final items = streams.toList(growable: false);

    if (items.isEmpty) {
      return Stream<List<T>>.empty();
    }

    return Rx.combineLatestList<T>(items);
  }

  /// Combines the latest values from two streams.
  static Stream<R> latest2<A, B, R>(Stream<A> first, Stream<B> second, R Function(A first, B second) combiner) {
    return Rx.combineLatest2<A, B, R>(first, second, combiner);
  }

  /// Combines the latest values from three streams.
  static Stream<R> latest3<A, B, C, R>(
    Stream<A> first,
    Stream<B> second,
    Stream<C> third,
    R Function(A first, B second, C third) combiner,
  ) {
    return Rx.combineLatest3<A, B, C, R>(first, second, third, combiner);
  }

  /// Combines the latest values from four streams.
  static Stream<R> latest4<A, B, C, D, R>(
    Stream<A> first,
    Stream<B> second,
    Stream<C> third,
    Stream<D> fourth,
    R Function(A first, B second, C third, D fourth) combiner,
  ) {
    return Rx.combineLatest4<A, B, C, D, R>(first, second, third, fourth, combiner);
  }

  /// Merges all [streams].
  static Stream<T> merge<T>(Iterable<Stream<T>> streams) {
    final items = streams.toList(growable: false);

    if (items.isEmpty) {
      return Stream<T>.empty();
    }

    return Rx.merge<T>(items);
  }

  /// Merges two streams.
  static Stream<T> merge2<T>(Stream<T> first, Stream<T> second) {
    return Rx.merge<T>(<Stream<T>>[first, second]);
  }

  /// Merges three streams.
  static Stream<T> merge3<T>(Stream<T> first, Stream<T> second, Stream<T> third) {
    return Rx.merge<T>(<Stream<T>>[first, second, third]);
  }

  /// Concatenates streams sequentially.
  static Stream<T> concat<T>(Iterable<Stream<T>> streams) {
    final items = streams.toList(growable: false);

    if (items.isEmpty) {
      return Stream<T>.empty();
    }

    return Rx.concat<T>(items);
  }

  /// Concatenates two streams sequentially.
  static Stream<T> concat2<T>(Stream<T> first, Stream<T> second) {
    return Rx.concat<T>(<Stream<T>>[first, second]);
  }

  /// Concatenates three streams sequentially.
  static Stream<T> concat3<T>(Stream<T> first, Stream<T> second, Stream<T> third) {
    return Rx.concat<T>(<Stream<T>>[first, second, third]);
  }

  /// Maps each event to a stream and consumes the resulting streams
  /// sequentially.
  ///
  /// The next mapped stream starts after the previous mapped stream
  /// completes.
  ///
  /// This implementation uses Dart's native [Stream.asyncExpand] and does
  /// not depend on a RxDart concatMap extension.
  static Stream<R> concatMap<T, R>(Stream<T> source, Stream<R> Function(T value) mapper) {
    return source.asyncExpand(mapper);
  }

  /// Maps each event to a stream and merges the resulting streams.
  ///
  /// This uses Dart's native [Stream.asyncExpand] semantics.
  ///
  /// For strict concurrent flat-map behavior, use RxDart directly at the
  /// adapter layer when that capability is required.
  static Stream<R> flatMap<T, R>(Stream<T> source, Stream<R> Function(T value) mapper) {
    return source.asyncExpand(mapper);
  }

  /// Creates a stream that emits the latest value from [source] and maps it
  /// to another stream.
  ///
  /// A new mapped stream does not start until the previous mapped stream
  /// completes. This keeps the core implementation independent from
  /// version-specific RxDart flattening extensions.
  static Stream<R> mapSequentially<T, R>(Stream<T> source, Stream<R> Function(T value) mapper) {
    return source.asyncExpand(mapper);
  }
}

/// Extensions for common stream-combination operations.
extension ReactiveCombineStreamExtensions<T> on Stream<T> {
  /// Combines this stream with [other] using the latest values.
  Stream<R> combineLatestWith<O, R>(Stream<O> other, R Function(T first, O second) combiner) {
    return Rx.combineLatest2<T, O, R>(this, other, combiner);
  }

  /// Merges this stream with [other].
  Stream<T> mergeWithStream(Stream<T> other) {
    return Rx.merge<T>(<Stream<T>>[this, other]);
  }

  /// Concatenates this stream with [other].
  Stream<T> concatWithStream(Stream<T> other) {
    return Rx.concat<T>(<Stream<T>>[this, other]);
  }

  /// Maps each value to a stream and processes the mapped streams
  /// sequentially.
  ///
  /// Dart's native [Stream.asyncExpand] provides the required sequential
  /// stream-expansion behavior for the core abstraction.
  Stream<R> concatMapValue<R>(Stream<R> Function(T value) mapper) {
    return asyncExpand(mapper);
  }

  /// Maps each value to a stream using Dart's native asynchronous expansion.
  ///
  /// This method intentionally avoids relying on version-specific RxDart
  /// flattening extensions.
  Stream<R> expandAsync<R>(Stream<R> Function(T value) mapper) {
    return asyncExpand(mapper);
  }
}

/// Provides helpers for nullable stream combinations.
abstract final class NullableReactiveCombine {
  /// Combines the latest values from two nullable streams.
  static Stream<R> latest2<A, B, R>(Stream<A?> first, Stream<B?> second, R Function(A? first, B? second) combiner) {
    return Rx.combineLatest2<A?, B?, R>(first, second, combiner);
  }

  /// Merges two nullable streams.
  static Stream<T?> merge2<T>(Stream<T?> first, Stream<T?> second) {
    return Rx.merge<T?>(<Stream<T?>>[first, second]);
  }
}

/// Provides helpers for deriving state from multiple streams.
abstract final class ReactiveStateCombine {
  /// Creates a derived stream from two source streams.
  static Stream<R> from2<A, B, R>({
    required Stream<A> first,
    required Stream<B> second,
    required R Function(A first, B second) builder,
  }) {
    return ReactiveCombine.latest2(first, second, builder);
  }

  /// Creates a derived stream from three source streams.
  static Stream<R> from3<A, B, C, R>({
    required Stream<A> first,
    required Stream<B> second,
    required Stream<C> third,
    required R Function(A first, B second, C third) builder,
  }) {
    return ReactiveCombine.latest3(first, second, third, builder);
  }

  /// Creates a derived stream from four source streams.
  static Stream<R> from4<A, B, C, D, R>({
    required Stream<A> first,
    required Stream<B> second,
    required Stream<C> third,
    required Stream<D> fourth,
    required R Function(A first, B second, C third, D fourth) builder,
  }) {
    return ReactiveCombine.latest4(first, second, third, fourth, builder);
  }
}
