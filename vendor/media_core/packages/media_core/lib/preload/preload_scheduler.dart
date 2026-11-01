import 'package:media_core/preload/preload_task.dart';

/// Schedules preload tasks.
final class PreloadScheduler {
  final List<PreloadTask> _tasks = [];

  List<PreloadTask> get tasks => List.unmodifiable(_tasks);

  bool get hasTasks => _tasks.isNotEmpty;

  void add(PreloadTask task) {
    task.queue();

    _tasks.add(task);

    _sort();
  }

  PreloadTask? next() {
    if (_tasks.isEmpty) {
      return null;
    }

    return _tasks.removeAt(0);
  }

  void clear() {
    _tasks.clear();
  }

  void _sort() {
    _tasks.sort((a, b) {
      return b.priority.index.compareTo(a.priority.index);
    });
  }
}
