import 'package:equatable/equatable.dart';

/// Runtime preload state.
final class PreloadState extends Equatable {
  const PreloadState({
    this.pending = false,
    this.loading = false,
    this.completed = false,
    this.failed = false,
    this.cancelled = false,
  });

  final bool pending;

  final bool loading;

  final bool completed;

  final bool failed;

  final bool cancelled;

  bool get isIdle => !pending && !loading && !completed && !failed && !cancelled;

  bool get isRunning => loading;

  bool get isFinished => completed || failed || cancelled;

  PreloadState copyWith({bool? pending, bool? loading, bool? completed, bool? failed, bool? cancelled}) {
    return PreloadState(
      pending: pending ?? this.pending,
      loading: loading ?? this.loading,
      completed: completed ?? this.completed,
      failed: failed ?? this.failed,
      cancelled: cancelled ?? this.cancelled,
    );
  }

  PreloadState queued() {
    return const PreloadState(pending: true);
  }

  PreloadState start() {
    return const PreloadState(loading: true);
  }

  PreloadState complete() {
    return const PreloadState(completed: true);
  }

  PreloadState fail() {
    return const PreloadState(failed: true);
  }

  PreloadState cancel() {
    return const PreloadState(cancelled: true);
  }

  @override
  List<Object?> get props => [pending, loading, completed, failed, cancelled];
}
