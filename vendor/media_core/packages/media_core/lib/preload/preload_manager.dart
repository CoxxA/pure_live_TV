import 'dart:async';
import 'package:media_core/preload/preload_task.dart';
import 'package:media_core/preload/preload_metrics.dart';
import 'package:media_core/preload/preload_request.dart';
import 'package:media_core/preload/preload_scheduler.dart';
import 'package:media_core_memory/media_core_memory.dart';
import 'package:rxdart/rxdart.dart';

/// Manages preload lifecycle.
final class PreloadManager {
  PreloadManager();

  final PreloadScheduler _scheduler = PreloadScheduler();

  final Map<String, PreloadTask> _tasks = {};

  final BehaviorSubject<PreloadMetrics> _metricsSubject = BehaviorSubject.seeded(const PreloadMetrics());

  Stream<PreloadMetrics> get metrics => _metricsSubject.stream;

  PreloadMetrics get currentMetrics => _metricsSubject.value;

  int get count => _tasks.length;

  /// Ledger of the sources being preloaded.
  ///
  /// A preload is an open stream the viewer has not asked for yet: it is the
  /// first thing that should give up under memory pressure, and this is how a
  /// report shows it exists.
  /// This instance's key in the shared account.
  late final String _memoryKey = memoryContributorKey(this);

  final MemoryAccount _memory = MediaCoreMemory.of(MemoryModule.preload);

  void add(PreloadRequest request) {
    final task = PreloadTask(sourceId: request.sourceId, priority: request.priority);

    _tasks[request.sourceId.value] = task;

    _scheduler.add(task);

    _updateMetrics(total: currentMetrics.total + 1);

    _reportMemory();
  }

  PreloadTask? next() {
    return _scheduler.next();
  }

  void complete(PreloadTask task) {
    task.complete();

    _updateMetrics(completed: currentMetrics.completed + 1);

    _reportMemory();
  }

  void fail(PreloadTask task) {
    task.fail();

    _updateMetrics(failed: currentMetrics.failed + 1);

    _reportMemory();
  }

  void cancel(PreloadTask task) {
    task.cancel();

    _updateMetrics(cancelled: currentMetrics.cancelled + 1);

    _reportMemory();
  }

  /// Reports the preloads still open.
  void _reportMemory() {
    _memory.report(_memoryKey, 
      items: _tasks.length,
      bytes: _tasks.length * MemoryEstimates.videoStream720p,
      note: '${_tasks.length} preloading source(s)',
    );
  }

  void _updateMetrics({int? total, int? completed, int? failed, int? cancelled}) {
    _metricsSubject.add(
      currentMetrics.copyWith(total: total, completed: completed, failed: failed, cancelled: cancelled),
    );
  }

  Future<void> dispose() async {
    _scheduler.clear();

    _tasks.clear();

    _memory.withdraw(_memoryKey);

    await _metricsSubject.close();
  }
}
