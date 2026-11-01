import 'dart:async';

/// Exception thrown when an asynchronous operation is cancelled.
class StreamCancelledException implements Exception {
  const StreamCancelledException([this.message = 'Operation was cancelled.']);

  final String message;

  @override
  String toString() {
    return 'StreamCancelledException: $message';
  }
}

/// A lightweight cancellation token.
///
/// Dart Futures cannot generally be forcibly cancelled. This token provides
/// cooperative cancellation: asynchronous code can check [isCancelled] or
/// call [throwIfCancelled].
class StreamCancellationToken {
  StreamCancellationToken();

  bool _cancelled = false;

  /// Whether cancellation has been requested.
  bool get isCancelled => _cancelled;

  /// Whether the operation can continue.
  bool get isActive => !_cancelled;

  /// Cancel this token.
  void cancel() {
    _cancelled = true;
  }

  /// Throws [StreamCancelledException] if cancellation was requested.
  void throwIfCancelled([String message = 'Operation was cancelled.']) {
    if (_cancelled) {
      throw StreamCancelledException(message);
    }
  }

  /// Returns a Future that completes when [cancel] is called.
  Future<void> get whenCancelled {
    if (_cancelled) {
      return Future<void>.value();
    }

    final completer = Completer<void>();

    late final StreamCancellationSubscription subscription;

    subscription = StreamCancellationSubscription(() {
      if (!completer.isCompleted) {
        completer.complete();
      }
      subscription.dispose();
    });

    _subscriptions.add(subscription);

    return completer.future;
  }

  final List<StreamCancellationSubscription> _subscriptions = <StreamCancellationSubscription>[];

  void _notifyCancelled() {
    for (final subscription in List<StreamCancellationSubscription>.from(_subscriptions)) {
      subscription.notify();
    }

    _subscriptions.clear();
  }
}

/// Internal cancellation listener.
class StreamCancellationSubscription {
  StreamCancellationSubscription(this._onCancel);

  final void Function() _onCancel;

  bool _disposed = false;

  void notify() {
    if (_disposed) {
      return;
    }

    _onCancel();
  }

  void dispose() {
    _disposed = true;
  }
}

/// A cancellation source that owns a [StreamCancellationToken].
///
/// Use the source to cancel an operation and pass the token to the operation.
class StreamCancellationSource {
  StreamCancellationSource();

  final StreamCancellationToken token = StreamCancellationToken();

  bool get isCancelled => token.isCancelled;

  /// Cancel the associated operation.
  void cancel() {
    if (token._cancelled) {
      return;
    }

    token._cancelled = true;
    token._notifyCancelled();
  }
}

/// Runs an asynchronous operation with cooperative cancellation.
///
/// The operation itself must periodically check the token.
abstract final class StreamCancellable {
  /// Execute [action] with a cancellation token.
  static Future<T> run<T>(
    Future<T> Function(StreamCancellationToken token) action, {
    StreamCancellationToken? token,
  }) async {
    final cancellationToken = token ?? StreamCancellationToken();

    cancellationToken.throwIfCancelled();

    final result = await action(cancellationToken);

    cancellationToken.throwIfCancelled();

    return result;
  }

  /// Wait for [duration], but return early when [token] is cancelled.
  static Future<bool> delay(Duration duration, StreamCancellationToken token) async {
    if (token.isCancelled) {
      return false;
    }

    final timerFuture = Future<void>.delayed(duration);

    try {
      await Future.any<void>([timerFuture, token.whenCancelled]);
    } catch (_) {
      return false;
    }

    return !token.isCancelled;
  }
}

/// A group of cancellation tokens.
///
/// Cancelling the group cancels all registered tokens.
class StreamCancellationGroup {
  StreamCancellationGroup();

  final Set<StreamCancellationSource> _sources = <StreamCancellationSource>{};

  bool _cancelled = false;

  bool get isCancelled => _cancelled;

  int get length => _sources.length;

  /// Create and register a new cancellation source.
  StreamCancellationSource create() {
    if (_cancelled) {
      final source = StreamCancellationSource();
      source.cancel();
      return source;
    }

    final source = StreamCancellationSource();
    _sources.add(source);
    return source;
  }

  /// Register an existing source.
  void add(StreamCancellationSource source) {
    if (_cancelled) {
      source.cancel();
      return;
    }

    _sources.add(source);
  }

  /// Remove a source from the group.
  void remove(StreamCancellationSource source) {
    _sources.remove(source);
  }

  /// Cancel all sources.
  void cancelAll() {
    for (final source in List<StreamCancellationSource>.from(_sources)) {
      source.cancel();
    }

    _sources.clear();
  }

  /// Cancel the group permanently.
  void dispose() {
    if (_cancelled) {
      return;
    }

    _cancelled = true;
    cancelAll();
  }
}
