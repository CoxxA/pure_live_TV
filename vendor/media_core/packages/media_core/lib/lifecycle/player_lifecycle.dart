import 'package:media_core/lifecycle/lifecycle_event.dart';
import 'package:media_core/lifecycle/lifecycle_snapshot.dart';

/// Player lifecycle abstraction.
abstract interface class PlayerLifecycle {
  LifecycleSnapshot get snapshot;

  Stream<LifecycleEvent> get events;

  void create();

  void initialize();

  void activate();

  void pause();

  void resume();

  void deactivate();

  void detach();

  void dispose();
}
