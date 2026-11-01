import 'package:media_core/core/player_constants.dart';

/// Global options for the player kernel.
///
/// [KernelOptions] tunes cross-cutting behaviour of the
/// orchestration layer. Per-player overrides come from
/// [PlayerConfig] passed to `PlayerKernel.create`.
///
/// Responsibilities:
///
/// - describe kernel-wide defaults
/// - tune recovery and fallback behaviour
/// - supply the recovery budget and ladder policy every player starts from
///
/// It does not:
///
/// - store per-player state
/// - make policy decisions for a single player
/// - decide when a specific player recovers (the ladder does)
final class KernelOptions {
  /// Creates kernel options.
  const KernelOptions({
    this.enableRecovery = true,
    this.enableFallback = true,
    this.enablePool = true,
    this.enableEventBus = true,
    this.autoAttachAudio = true,
    this.maxRecoveryAttempts = PlayerConstants.maxRecoveryAttempts,
    this.maxFallbackAttempts = PlayerConstants.maxFallbackAttempts,
    this.retryBaseDelay = const Duration(seconds: 1),
    this.retryMaxDelay = const Duration(seconds: 8),
  });

  /// Whether automatic error recovery is enabled.
  final bool enableRecovery;

  /// Whether automatic backend fallback is enabled.
  final bool enableFallback;

  /// Whether created players join the player pool.
  final bool enablePool;

  /// Whether kernel events are published to the event bus.
  final bool enableEventBus;

  /// Default maximum recovery attempts per error.
  ///
  /// A [PlayerConfig] with its own value wins.
  final int maxRecoveryAttempts;

  /// Default maximum fallback attempts per error.
  ///
  /// A [PlayerConfig] with its own value wins.
  final int maxFallbackAttempts;

  /// Base delay for the first recovery retry.
  ///
  /// Subsequent retries back off linearly up to [retryMaxDelay].
  final Duration retryBaseDelay;

  /// Upper bound for a single recovery retry delay.
  final Duration retryMaxDelay;

  /// Whether this kernel takes the process-wide media-session driver.
  ///
  /// A capability package installs one via `PlayerKernel.audioDriverFactory` —
  /// `MediaSessionBootstrap.enable()` in `media_core_mediasession` does exactly
  /// that — and every kernel created afterwards attaches it, so a host does not
  /// have to remember `attachAudio` for each player. Set this to false for a
  /// kernel that must not publish to the platform's media surfaces: a settings
  /// preview, a diagnostic player, or a second kernel that would fight the
  /// first for the single notification.
  final bool autoAttachAudio;

  /// Whether a driver should be attached to a new kernel.
  ///
  /// The rule in one place: the capability has to be installed process-wide
  /// *and* this kernel has to want it.
  bool shouldAttachAudio({required bool hasFactory}) => autoAttachAudio && hasFactory;

  /// Creates a copy with modifications.
  KernelOptions copyWith({
    bool? enableRecovery,
    bool? enableFallback,
    bool? enablePool,
    bool? enableEventBus,
    bool? autoAttachAudio,
    int? maxRecoveryAttempts,
    int? maxFallbackAttempts,
    Duration? retryBaseDelay,
    Duration? retryMaxDelay,
  }) {
    return KernelOptions(
      enableRecovery: enableRecovery ?? this.enableRecovery,
      enableFallback: enableFallback ?? this.enableFallback,
      enablePool: enablePool ?? this.enablePool,
      enableEventBus: enableEventBus ?? this.enableEventBus,
      autoAttachAudio: autoAttachAudio ?? this.autoAttachAudio,
      maxRecoveryAttempts: maxRecoveryAttempts ?? this.maxRecoveryAttempts,
      maxFallbackAttempts: maxFallbackAttempts ?? this.maxFallbackAttempts,
      retryBaseDelay: retryBaseDelay ?? this.retryBaseDelay,
      retryMaxDelay: retryMaxDelay ?? this.retryMaxDelay,
    );
  }
}
