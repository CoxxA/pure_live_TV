/// Base type for events emitted through a stream.
///
/// Events are intentionally immutable so they can safely travel through
/// RxDart pipelines.
sealed class StreamEvent {
  const StreamEvent();
}

/// A value/state changed event.
final class StreamValueChanged<T> extends StreamEvent {
  const StreamValueChanged({required this.value, this.previous});

  final T value;
  final T? previous;

  @override
  String toString() {
    return 'StreamValueChanged<$T>('
        'value: $value, '
        'previous: $previous'
        ')';
  }
}

/// A loading state event.
final class StreamLoading extends StreamEvent {
  const StreamLoading({this.message});

  final String? message;

  @override
  String toString() {
    return 'StreamLoading(message: $message)';
  }
}

/// A loading operation completed successfully.
final class StreamLoaded<T> extends StreamEvent {
  const StreamLoaded({this.value});

  final T? value;

  @override
  String toString() {
    return 'StreamLoaded<$T>(value: $value)';
  }
}

/// An error event.
final class StreamError extends StreamEvent {
  const StreamError(this.error, {this.stackTrace, this.message});

  final Object error;
  final StackTrace? stackTrace;
  final String? message;

  @override
  String toString() {
    return 'StreamError('
        'error: $error, '
        'message: $message'
        ')';
  }
}

/// A stream operation completed.
final class StreamCompleted extends StreamEvent {
  const StreamCompleted();

  @override
  String toString() => 'StreamCompleted()';
}

/// A stream operation was cancelled.
final class StreamCancelled extends StreamEvent {
  const StreamCancelled({this.reason});

  final String? reason;

  @override
  String toString() {
    return 'StreamCancelled(reason: $reason)';
  }
}

/// A stream operation was reset.
final class StreamReset extends StreamEvent {
  const StreamReset();

  @override
  String toString() => 'StreamReset()';
}

/// A generic notification event.
///
/// Use this when the event does not carry a value but represents an action
/// or notification.
final class StreamNotification extends StreamEvent {
  const StreamNotification(this.type, {this.data});

  final String type;
  final Object? data;

  @override
  String toString() {
    return 'StreamNotification('
        'type: $type, '
        'data: $data'
        ')';
  }
}

/// Utility extensions for [StreamEvent].
extension StreamEventX on StreamEvent {
  bool get isLoading => this is StreamLoading;

  bool get isLoaded => this is StreamLoaded;

  bool get isError => this is StreamError;

  bool get isCompleted => this is StreamCompleted;

  bool get isCancelled => this is StreamCancelled;

  bool get isReset => this is StreamReset;

  bool get isValueChanged => this is StreamValueChanged;

  bool get isNotification => this is StreamNotification;

  StreamError? get errorEvent {
    final event = this;

    if (event is StreamError) {
      return event;
    }

    return null;
  }

  T? valueOf<T>() {
    final event = this;

    if (event is StreamValueChanged<T>) {
      return event.value;
    }

    if (event is StreamLoaded<T>) {
      return event.value;
    }

    return null;
  }
}
