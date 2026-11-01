import 'package:equatable/equatable.dart';

/// Defines the functional area associated with a diagnostic log record.
///
/// A [LogCategory] provides semantic grouping for diagnostic messages.
/// Categories allow callers to filter or inspect logs by subsystem without
/// relying on message text.
///
/// Responsibilities:
///
/// - define stable diagnostic categories
/// - identify the subsystem associated with a log record
/// - provide a stable serialized category name
///
/// It does not:
///
/// - determine log severity
/// - emit log records
/// - perform category filtering
///
/// Those responsibilities belong to:
///
/// - LogLevel
/// - PlayerLogger
/// - DiagnosticsConfig
enum LogCategory {
  /// General diagnostic information.
  general,

  /// Player-level lifecycle and coordination information.
  player,

  /// Session lifecycle information.
  session,

  /// Media source resolution and source management information.
  source,

  /// Playback state and command information.
  playback,

  /// Buffering and loading information.
  buffering,

  /// Rendering and video surface information.
  renderer,

  /// Audio output and audio focus information.
  audio,

  /// Presentation mode information.
  presentation,

  /// Recovery and retry information.
  recovery,

  /// Backend, line, or quality fallback information.
  fallback,

  /// Cache operations and cache state information.
  cache,

  /// Recording operations and recording state information.
  recording,

  /// Danmaku session, transport and filter information.
  danmaku,

  /// Visibility and foreground/background information.
  visibility,

  /// Player lifecycle information.
  lifecycle,

  /// Network activity and network state information.
  network,

  /// Performance measurements and performance state information.
  performance,

  /// Memory measurements and memory state information.
  memory,

  /// Multi-cell wall: cells, focus, budget and patrol.
  multiview,

  /// Player instance pool: acquisition, reuse and recycling.
  pool,

  /// Offline downloads: queue, transfer and resume.
  download,

  /// The logging subsystem itself: sinks, filters and throttling.
  logging,

  /// Diagnostics subsystem information.
  diagnostics,

  /// Error-related diagnostic information.
  error,
}

/// Provides common operations for [LogCategory].
extension LogCategoryX on LogCategory {
  /// Stable string representation used by diagnostic serialization.
  String get name {
    return switch (this) {
      LogCategory.general => 'general',
      LogCategory.player => 'player',
      LogCategory.session => 'session',
      LogCategory.source => 'source',
      LogCategory.playback => 'playback',
      LogCategory.buffering => 'buffering',
      LogCategory.renderer => 'renderer',
      LogCategory.audio => 'audio',
      LogCategory.presentation => 'presentation',
      LogCategory.recovery => 'recovery',
      LogCategory.fallback => 'fallback',
      LogCategory.cache => 'cache',
      LogCategory.recording => 'recording',
      LogCategory.multiview => 'multiview',
      LogCategory.pool => 'pool',
      LogCategory.download => 'download',
      LogCategory.logging => 'logging',
      LogCategory.danmaku => 'danmaku',
      LogCategory.visibility => 'visibility',
      LogCategory.lifecycle => 'lifecycle',
      LogCategory.network => 'network',
      LogCategory.performance => 'performance',
      LogCategory.memory => 'memory',
      LogCategory.diagnostics => 'diagnostics',
      LogCategory.error => 'error',
    };
  }
}

/// Immutable value object representing a [LogCategory].
///
/// This wrapper provides value semantics when a category needs to be stored
/// inside another immutable diagnostic model.
final class LogCategoryValue extends Equatable {
  /// Creates a log category value.
  const LogCategoryValue(this.category);

  /// Wrapped log category.
  final LogCategory category;

  @override
  List<Object?> get props => [category];

  @override
  String toString() {
    return category.name;
  }
}
