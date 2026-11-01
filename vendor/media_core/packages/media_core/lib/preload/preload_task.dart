import 'package:media_core/preload/preload_state.dart';
import 'package:media_core/preload/preload_priority.dart';
import 'package:media_core/identity/source_id.dart';

/// Single preload task.
final class PreloadTask {
  PreloadTask({required this.sourceId, this.priority = PreloadPriority.normal});

  final SourceId sourceId;

  final PreloadPriority priority;

  PreloadState state = const PreloadState();

  void queue() {
    state = state.queued();
  }

  void start() {
    state = state.start();
  }

  void complete() {
    state = state.complete();
  }

  void fail() {
    state = state.fail();
  }

  void cancel() {
    state = state.cancel();
  }
}
