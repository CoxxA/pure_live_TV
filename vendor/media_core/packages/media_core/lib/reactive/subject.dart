import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// Defines the common contract for reactive subjects.
///
/// A subject is both a stream that can be listened to and a sink that can
/// receive values. Concrete implementations are backed by RxDart subjects.
abstract interface class ReactiveSubject<T> implements Stream<T>, Sink<T> {
  /// Returns whether the subject has been closed.
  bool get isClosed;

  /// Returns whether the subject currently has one or more listeners.
  bool get hasListener;

  /// Returns the subject's stream.
  Stream<T> get stream;

  /// Returns the subject's sink.
  Sink<T> get sink;

  /// Adds [value] to the subject.
  @override
  void add(T value);

  /// Adds an error to the subject.
  void addError(Object error, [StackTrace? stackTrace]);

  /// Closes the subject.
  @override
  Future<void> close();

  /// Subscribes to subject events.
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  });
}

/// A publish-style reactive subject.
///
/// Values are delivered only to subscribers that are active when the value
/// is emitted. Previously emitted values are not replayed to new listeners.
final class PublishReactiveSubject<T> extends Stream<T> implements ReactiveSubject<T> {
  /// Creates a publish subject.
  PublishReactiveSubject({bool sync = false}) : _subject = PublishSubject<T>(sync: sync);

  final PublishSubject<T> _subject;

  /// Returns whether the subject has been closed.
  @override
  bool get isClosed => _subject.isClosed;

  /// Returns whether the subject currently has listeners.
  @override
  bool get hasListener => _subject.hasListener;

  /// Returns the underlying stream.
  @override
  Stream<T> get stream => _subject.stream;

  /// Returns the underlying sink.
  @override
  Sink<T> get sink => _subject.sink;

  /// Adds [value] to the subject.
  @override
  void add(T value) {
    _subject.add(value);
  }

  /// Adds an error to the subject.
  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  /// Closes the subject.
  @override
  Future<void> close() {
    return _subject.close();
  }

  /// Subscribes to subject events.
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _subject.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}

/// A behavior-style reactive subject.
///
/// The subject stores the latest value and immediately exposes that value to
/// new subscribers.
final class BehaviorReactiveSubject<T> extends Stream<T> implements ReactiveSubject<T> {
  /// Creates a behavior subject with [seed].
  BehaviorReactiveSubject({required T seed, bool sync = false})
    : _subject = BehaviorSubject<T>.seeded(seed, sync: sync);

  final BehaviorSubject<T> _subject;

  /// Returns the latest value.
  T get value => _subject.value;

  /// Returns whether a current value is available.
  bool get hasValue => _subject.hasValue;

  /// Returns whether the subject has been closed.
  @override
  bool get isClosed => _subject.isClosed;

  /// Returns whether the subject currently has listeners.
  @override
  bool get hasListener => _subject.hasListener;

  /// Returns the underlying stream.
  @override
  Stream<T> get stream => _subject.stream;

  /// Returns the underlying sink.
  @override
  Sink<T> get sink => _subject.sink;

  /// Adds [value] and makes it the latest value.
  @override
  void add(T value) {
    _subject.add(value);
  }

  /// Adds an error to the subject.
  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  /// Closes the subject.
  @override
  Future<void> close() {
    return _subject.close();
  }

  /// Subscribes to subject events.
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _subject.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}

/// A replay-style reactive subject.
///
/// The subject stores recent values and replays them to new subscribers.
final class ReplayReactiveSubject<T> extends Stream<T> implements ReactiveSubject<T> {
  /// Creates a replay subject.
  ///
  /// When [maxSize] is provided, at most that many events are retained.
  ReplayReactiveSubject({int? maxSize, bool sync = false}) : _subject = ReplaySubject<T>(maxSize: maxSize, sync: sync);

  final ReplaySubject<T> _subject;

  /// Returns whether the subject has been closed.
  @override
  bool get isClosed => _subject.isClosed;

  /// Returns whether the subject currently has listeners.
  @override
  bool get hasListener => _subject.hasListener;

  /// Returns the underlying stream.
  @override
  Stream<T> get stream => _subject.stream;

  /// Returns the underlying sink.
  @override
  Sink<T> get sink => _subject.sink;

  /// Adds [value] to the subject and replay buffer.
  @override
  void add(T value) {
    _subject.add(value);
  }

  /// Adds an error to the subject.
  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  /// Closes the subject.
  @override
  Future<void> close() {
    return _subject.close();
  }

  /// Subscribes to subject events.
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _subject.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}

/// Factory helpers for creating reactive subjects.
///
/// Keeping subject creation here gives the package a single place to define
/// subject behavior while retaining RxDart as the implementation foundation.
abstract final class Subjects {
  /// Creates a publish-style subject.
  static PublishReactiveSubject<T> publish<T>({bool sync = false}) {
    return PublishReactiveSubject<T>(sync: sync);
  }

  /// Creates a behavior-style subject with [seed].
  static BehaviorReactiveSubject<T> behavior<T>({required T seed, bool sync = false}) {
    return BehaviorReactiveSubject<T>(seed: seed, sync: sync);
  }

  /// Creates a replay-style subject.
  static ReplayReactiveSubject<T> replay<T>({int? maxSize, bool sync = false}) {
    return ReplayReactiveSubject<T>(maxSize: maxSize, sync: sync);
  }
}
