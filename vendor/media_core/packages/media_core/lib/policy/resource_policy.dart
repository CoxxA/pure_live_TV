/// Defines resource management policies.
///
/// [ResourcePolicy] controls how the player
/// consumes system resources.
///
/// Responsibilities:
///
/// - decoder resource limits
/// - bandwidth limits
/// - memory pressure behavior
/// - resource degradation strategy
///
/// It does not:
///
/// - allocate resources
/// - monitor resources
/// - release resources
///
/// Those belong to:
///
/// - ResourceManager
/// - DecoderManager
/// - MemoryManager
final class ResourcePolicy {
  /// Creates resource policy.
  const ResourcePolicy({
    this.enabled = true,

    this.maxDecoderCount = 4,

    this.maxHardwareDecoderCount = 2,

    this.maxBandwidthMbps = 20,

    this.releaseOnPressure = true,

    this.reduceQualityOnPressure = true,

    this.stopPreloadOnPressure = true,

    this.allowSoftwareDecodeFallback = true,
  });

  /// Whether resource management is enabled.
  final bool enabled;

  /// Maximum active decoder count.
  final int maxDecoderCount;

  /// Maximum hardware decoder count.
  final int maxHardwareDecoderCount;

  /// Maximum allowed bandwidth.
  ///
  /// Unit:
  ///
  /// Mbps
  final int maxBandwidthMbps;

  /// Whether resources should be released
  /// under pressure.
  final bool releaseOnPressure;

  /// Whether quality should be reduced
  /// under pressure.
  final bool reduceQualityOnPressure;

  /// Whether preload should stop
  /// under resource pressure.
  final bool stopPreloadOnPressure;

  /// Whether software decoder fallback
  /// is allowed.
  final bool allowSoftwareDecodeFallback;

  /// Checks whether decoder capacity exists.
  bool canAllocateDecoder(int currentCount) {
    if (!enabled) {
      return true;
    }

    return currentCount < maxDecoderCount;
  }

  /// Checks whether hardware decoder
  /// capacity exists.
  bool canAllocateHardwareDecoder(int currentCount) {
    if (!enabled) {
      return true;
    }

    return currentCount < maxHardwareDecoderCount;
  }

  /// Checks whether bandwidth exceeds limit.
  bool exceedsBandwidth(double currentMbps) {
    if (!enabled) {
      return false;
    }

    return currentMbps > maxBandwidthMbps;
  }

  /// Whether resource pressure requires
  /// releasing resources.
  bool shouldRelease() {
    return enabled && releaseOnPressure;
  }

  /// Creates modified policy.
  ResourcePolicy copyWith({
    bool? enabled,

    int? maxDecoderCount,

    int? maxHardwareDecoderCount,

    int? maxBandwidthMbps,

    bool? releaseOnPressure,

    bool? reduceQualityOnPressure,

    bool? stopPreloadOnPressure,

    bool? allowSoftwareDecodeFallback,
  }) {
    return ResourcePolicy(
      enabled: enabled ?? this.enabled,

      maxDecoderCount: maxDecoderCount ?? this.maxDecoderCount,

      maxHardwareDecoderCount: maxHardwareDecoderCount ?? this.maxHardwareDecoderCount,

      maxBandwidthMbps: maxBandwidthMbps ?? this.maxBandwidthMbps,

      releaseOnPressure: releaseOnPressure ?? this.releaseOnPressure,

      reduceQualityOnPressure: reduceQualityOnPressure ?? this.reduceQualityOnPressure,

      stopPreloadOnPressure: stopPreloadOnPressure ?? this.stopPreloadOnPressure,

      allowSoftwareDecodeFallback: allowSoftwareDecodeFallback ?? this.allowSoftwareDecodeFallback,
    );
  }

  @override
  String toString() {
    return 'ResourcePolicy('
        'decoder=$maxDecoderCount, '
        'hwDecoder=$maxHardwareDecoderCount, '
        'bandwidth=${maxBandwidthMbps}Mbps'
        ')';
  }
}
