/// Represents the state/result of an asynchronous operation.
///
/// This is intentionally independent from Flutter and can be used by
/// repositories, services, controllers, and stream pipelines.
sealed class StreamResult<T> {
  const StreamResult();

  bool get isLoading => this is StreamLoadingResult<T>;

  bool get isSuccess => this is StreamSuccess<T>;

  bool get isError => this is StreamErrorResult<T>;

  bool get isEmpty => this is StreamEmptyResult<T>;

  /// Returns the successful value, or `null` for other states.
  T? get data {
    final result = this;

    if (result is StreamSuccess<T>) {
      return result.data;
    }

    return null;
  }

  /// Returns the error, or `null` when this is not an error result.
  Object? get error {
    final result = this;

    if (result is StreamErrorResult<T>) {
      return result.error;
    }

    return null;
  }

  /// Returns the stack trace of an error result.
  StackTrace? get stackTrace {
    final result = this;

    if (result is StreamErrorResult<T>) {
      return result.stackTrace;
    }

    return null;
  }

  /// Pattern matching helper.
  R when<R>({
    required R Function() loading,
    required R Function(T data) success,
    required R Function(Object error, StackTrace? stackTrace) error,
    required R Function() empty,
  }) {
    final result = this;

    if (result is StreamLoadingResult<T>) {
      return loading();
    }

    if (result is StreamSuccess<T>) {
      return success(result.data);
    }

    if (result is StreamErrorResult<T>) {
      return error(result.error, result.stackTrace);
    }

    return empty();
  }

  /// Map the successful value to another type.
  StreamResult<R> map<R>(R Function(T value) mapper) {
    final result = this;

    if (result is StreamLoadingResult<T>) {
      return StreamLoadingResult<R>();
    }

    if (result is StreamSuccess<T>) {
      return StreamSuccess<R>(mapper(result.data));
    }

    if (result is StreamErrorResult<T>) {
      return StreamErrorResult<R>(result.error, stackTrace: result.stackTrace, message: result.message);
    }

    return StreamEmptyResult<R>();
  }
}

/// Loading state.
final class StreamLoadingResult<T> extends StreamResult<T> {
  const StreamLoadingResult({this.message});

  final String? message;

  @override
  String toString() {
    return 'StreamLoadingResult(message: $message)';
  }
}

/// Successful result.
final class StreamSuccess<T> extends StreamResult<T> {
  const StreamSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'StreamSuccess<$T>(data: $data)';
  }
}

/// Error result.
final class StreamErrorResult<T> extends StreamResult<T> {
  const StreamErrorResult(this.error, {this.stackTrace, this.message});

  @override
  final Object error;
  @override
  final StackTrace? stackTrace;
  final String? message;

  @override
  String toString() {
    return 'StreamErrorResult<$T>('
        'error: $error, '
        'message: $message'
        ')';
  }
}

/// Empty result.
///
/// This is different from [StreamSuccess]:
/// - Success means an actual value was returned.
/// - Empty means the operation completed but there was no usable value.
final class StreamEmptyResult<T> extends StreamResult<T> {
  const StreamEmptyResult();

  @override
  String toString() => 'StreamEmptyResult<$T>()';
}

/// Convenient constructors for [StreamResult].
abstract final class StreamResults {
  static StreamLoadingResult<T> loading<T>({String? message}) {
    return StreamLoadingResult<T>(message: message);
  }

  static StreamSuccess<T> success<T>(T data) {
    return StreamSuccess<T>(data);
  }

  static StreamErrorResult<T> error<T>(Object error, {StackTrace? stackTrace, String? message}) {
    return StreamErrorResult<T>(error, stackTrace: stackTrace, message: message);
  }

  static StreamEmptyResult<T> empty<T>() {
    return StreamEmptyResult<T>();
  }
}
