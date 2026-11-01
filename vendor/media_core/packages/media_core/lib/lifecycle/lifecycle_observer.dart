import 'package:media_core/lifecycle/lifecycle_event.dart';

/// Receives lifecycle events.
abstract interface class LifecycleObserver {
  void onLifecycleEvent(LifecycleEvent event);
}
