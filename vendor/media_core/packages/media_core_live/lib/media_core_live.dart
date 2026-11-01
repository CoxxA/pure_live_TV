/// Live (non-seekable) playback on top of the player kernel.
///
/// Watchdog-driven orchestration: stall inference, line fallback, engine
/// fallback and backoff retry, all serialized through a single-slot task queue
/// so one line switch cannot race another.
library;

export 'package:media_core_live/src/live_playback_controller.dart';
export 'package:media_core_live/src/live_playback_models.dart';
export 'package:media_core_live/src/live_pool_policy.dart';
export 'package:media_core_live/src/live_request.dart';
export 'package:media_core_live/src/live_watchdogs.dart';
