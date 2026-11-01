import 'package:equatable/equatable.dart';

/// Screenshot behaviour of one player.
final class ScreenshotConfig extends Equatable {
  /// Creates a screenshot configuration.
  const ScreenshotConfig({this.historyLimit = 8, this.surfaceFallback = true});

  /// How many captures are kept in `ScreenshotManager.history`.
  ///
  /// A screenshot holds its encoded bytes, so the limit is what bounds the
  /// memory the player spends on frames the caller may never look at again.
  /// `0` disables the history and keeps only the capture that is in flight.
  final int historyLimit;

  /// Whether a capture may fall back to the rendered surface.
  ///
  /// Enabled by default because most engines have no frame-capture API. Turn
  /// it off in a host that must never read the widget layer — a protected
  /// video path, for example — so a capture then reports "unavailable"
  /// instead of quietly reading the screen.
  final bool surfaceFallback;

  /// Whether captures are remembered at all.
  bool get keepsHistory => historyLimit > 0;

  /// Creates a modified configuration.
  ScreenshotConfig copyWith({int? historyLimit, bool? surfaceFallback}) {
    return ScreenshotConfig(
      historyLimit: historyLimit ?? this.historyLimit,
      surfaceFallback: surfaceFallback ?? this.surfaceFallback,
    );
  }

  @override
  List<Object?> get props => [historyLimit, surfaceFallback];

  @override
  String toString() => 'ScreenshotConfig(historyLimit: $historyLimit, surfaceFallback: $surfaceFallback)';
}
