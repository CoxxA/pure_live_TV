import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// A reactive value that always exposes its latest state.
///
/// This abstraction is backed by RxDart's [BehaviorSubject] and is intended
/// for player state, configuration state, and other values where new
/// subscribers should immediately receive the current value.
class ReactiveBehavior<T> extends Stream<T> implements Sink<T> {
  /// Creates a behavior value with an initial [value].
  ReactiveBehavior(T value, {bool sync = false}) : _subject = BehaviorSubject<T>.seeded(value, sync: sync);

  final BehaviorSubject<T> _subject;

  /// Returns the current value.
  T get value => _subject.value;

  /// Returns whether the subject currently has a value.
  bool get hasValue => _subject.hasValue;

  /// Returns whether the subject has been closed.
  bool get isClosed => _subject.isClosed;

  /// Returns whether the subject currently has listeners.
  bool get hasListener => _subject.hasListener;

  /// Returns the underlying stream.
  Stream<T> get stream => _subject.stream;

  /// Returns the underlying sink.
  Sink<T> get sink => _subject.sink;

  /// Replaces the current value.
  @override
  void add(T value) {
    _subject.add(value);
  }

  /// Adds an error to the reactive value.
  void addError(Object error, [StackTrace? stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  /// Closes the reactive value.
  @override
  Future<void> close() {
    return _subject.close();
  }

  /// Subscribes to value changes.
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _subject.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  /// Emits [value] only when it is different from the current value.
  void addIfChanged(T value, {bool Function(T previous, T next)? equals}) {
    final isSame = equals?.call(this.value, value) ?? this.value == value;

    if (!isSame) {
      add(value);
    }
  }

  /// Updates the current value using [transform].
  void update(T Function(T current) transform) {
    add(transform(value));
  }

  /// Updates the current value only when [shouldUpdate] returns true.
  void updateIf(bool Function(T current) shouldUpdate, T Function(T current) transform) {
    if (shouldUpdate(value)) {
      update(transform);
    }
  }

  /// Returns a stream that debounces value changes.
  Stream<T> debounce(Duration duration) {
    return _subject.debounceTime(duration);
  }

  /// Returns a stream that throttles value changes.
  Stream<T> throttle(Duration duration, {bool trailing = true, bool leading = true}) {
    return _subject.throttleTime(duration, leading: leading, trailing: trailing);
  }

  /// Creates a stream mapped from the current reactive value.
  Stream<R> mapValue<R>(R Function(T value) mapper) {
    return _subject.map(mapper);
  }

  /// Creates a stream filtered by [test].
  Stream<T> whereValue(bool Function(T value) test) {
    return _subject.where(test);
  }

  /// Returns a future containing the next emitted value.
  Future<T> firstValue() {
    return _subject.first;
  }

  /// Returns a future containing the next value satisfying [test].
  Future<T> firstWhereValue(bool Function(T value) test) {
    return _subject.firstWhere(test);
  }
}

/// A behavior value that can be updated through a state transformation.
///
/// This class is intended for state owned by a controller or manager.
final class ReactiveState<T> extends ReactiveBehavior<T> {
  /// Creates a reactive state container.
  ReactiveState(super.value, {super.sync});

  /// Replaces the current state.
  void setState(T value) {
    add(value);
  }

  /// Transforms the current state into a new state.
  void setStateWith(T Function(T current) transform) {
    update(transform);
  }
}

/// A behavior value specialized for nullable state.
///
/// The value may intentionally start as `null` and later receive a concrete
/// value.
final class NullableReactiveBehavior<T> extends Stream<T?> implements Sink<T?> {
  /// Creates a nullable behavior value.
  NullableReactiveBehavior({T? initialValue, bool sync = false})
    : _subject = BehaviorSubject<T?>.seeded(initialValue, sync: sync);

  final BehaviorSubject<T?> _subject;

  /// Returns the current value.
  T? get value => _subject.value;

  /// Returns whether the subject currently contains a non-null value.
  bool get hasNonNullValue => value != null;

  /// Returns whether the subject has been closed.
  bool get isClosed => _subject.isClosed;

  /// Returns whether the subject currently has listeners.
  bool get hasListener => _subject.hasListener;

  /// Returns the underlying stream.
  Stream<T?> get stream => _subject.stream;

  /// Returns the underlying sink.
  Sink<T?> get sink => _subject.sink;

  /// Sets the current value.
  @override
  void add(T? value) {
    _subject.add(value);
  }

  /// Adds an error to the subject.
  void addError(Object error, [StackTrace? stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  /// Closes the subject.
  @override
  Future<void> close() {
    return _subject.close();
  }

  /// Subscribes to value changes.
  @override
  StreamSubscription<T?> listen(
    void Function(T? event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _subject.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  /// Clears the current value.
  void clear() {
    add(null);
  }

  /// Updates the current value.
  void update(T? Function(T? current) transform) {
    add(transform(value));
  }
}
