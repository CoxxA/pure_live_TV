import 'dart:async';

/// Executes async tasks exclusively.
///
/// If a task is already running, new tasks wait until the current task
/// completes.
///
/// Useful for:
/// - player initialization
/// - source switching
/// - database migration
/// - sync operations
///
/// Example:
/// ```dart
/// final task = ExclusiveTask();
///
/// await task.run(() async {
///   await initialize();
/// });
/// ```
class ExclusiveTask {
  Future<void>? _current;

  /// Whether a task is currently running.
  bool get running => _current != null;

  /// Executes [action] exclusively.
  ///
  /// Tasks are executed in order of arrival.
  Future<T> run<T>(Future<T> Function() action) async {
    final previous = _current;

    final completer = Completer<void>();
    _current = completer.future;

    if (previous != null) {
      await previous;
    }

    try {
      return await action();
    } finally {
      completer.complete();

      if (identical(_current, completer.future)) {
        _current = null;
      }
    }
  }

  /// Waits until all running tasks complete.
  Future<void> wait() async {
    final current = _current;

    if (current != null) {
      await current;
    }
  }

  /// Clears the current state.
  ///
  /// Does not cancel running tasks.
  void reset() {
    _current = null;
  }
}

/// A keyed exclusive task executor.
///
/// Different keys have independent execution queues.
///
/// Example:
/// ```dart
/// final tasks = KeyedExclusiveTask<String>();
///
/// tasks.run(
///   'channel-1',
///   () async {
///     await reloadChannel();
///   },
/// );
/// ```
class KeyedExclusiveTask<K> {
  final Map<K, ExclusiveTask> _tasks = {};

  /// Executes a task exclusively for [key].
  Future<T> run<T>(K key, Future<T> Function() action) async {
    final task = _tasks.putIfAbsent(key, ExclusiveTask.new);

    try {
      return await task.run(action);
    } finally {
      if (!task.running) {
        _tasks.remove(key);
      }
    }
  }

  /// Number of active task queues.
  int get length => _tasks.length;

  /// Clears idle queues.
  void cleanup() {
    _tasks.removeWhere((_, task) => !task.running);
  }

  /// Clears all queues.
  ///
  /// Running tasks are not interrupted.
  void clear() {
    _tasks.clear();
  }
}
