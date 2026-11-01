/// Defines decoder resource limits.
///
/// [DecoderBudget] describes the maximum decoder
/// resources allowed by the media core resource layer.
///
/// Responsibilities:
///
/// - limit total decoder count
/// - limit hardware decoder count
/// - control software fallback policy
///
/// It does not:
///
/// - create decoders
/// - initialize codecs
/// - manage playback
/// - release decoder instances
///
/// Those responsibilities belong to:
///
/// - DecoderManager
/// - DecoderFactory
/// - Platform media backend
///
/// Decoder resource flow:
///
/// ```text
///
/// DecoderManager
///        |
///        v
/// DecoderBudget
///        |
///        v
/// Allocation decision
///
/// ```
final class DecoderBudget {
  /// Creates decoder budget.
  const DecoderBudget({
    this.enabled = true,

    this.maxDecoderCount = 4,

    this.maxHardwareDecoderCount = 2,

    this.allowSoftwareFallback = true,
  });

  /// Whether decoder limitation is enabled.
  ///
  /// When disabled, all allocation checks
  /// will allow access.
  final bool enabled;

  /// Maximum number of active decoders.
  final int maxDecoderCount;

  /// Maximum number of hardware decoders.
  final int maxHardwareDecoderCount;

  /// Whether software decoder fallback
  /// is allowed when hardware decoder
  /// capacity is exhausted.
  final bool allowSoftwareFallback;

  /// Checks whether a decoder can be allocated.
  ///
  /// [currentCount] represents current
  /// allocated decoder count.
  bool canAllocateDecoder(int currentCount) {
    if (!enabled) {
      return true;
    }

    return currentCount < maxDecoderCount;
  }

  /// Checks whether hardware decoder
  /// capacity exists.
  ///
  /// [currentCount] represents current
  /// hardware decoder usage.
  bool canAllocateHardwareDecoder(int currentCount) {
    if (!enabled) {
      return true;
    }

    return currentCount < maxHardwareDecoderCount;
  }

  /// Returns remaining decoder capacity.
  int remainingDecoderCount(int currentCount) {
    final remaining = maxDecoderCount - currentCount;

    return remaining < 0 ? 0 : remaining;
  }

  /// Returns remaining hardware decoder capacity.
  int remainingHardwareDecoderCount(int currentCount) {
    final remaining = maxHardwareDecoderCount - currentCount;

    return remaining < 0 ? 0 : remaining;
  }

  /// Whether decoder capacity is exhausted.
  bool isExhausted(int currentCount) {
    return !canAllocateDecoder(currentCount);
  }

  /// Whether hardware decoder capacity
  /// is exhausted.
  bool isHardwareExhausted(int currentCount) {
    return !canAllocateHardwareDecoder(currentCount);
  }

  /// Creates modified budget.
  DecoderBudget copyWith({
    bool? enabled,

    int? maxDecoderCount,

    int? maxHardwareDecoderCount,

    bool? allowSoftwareFallback,
  }) {
    return DecoderBudget(
      enabled: enabled ?? this.enabled,

      maxDecoderCount: maxDecoderCount ?? this.maxDecoderCount,

      maxHardwareDecoderCount: maxHardwareDecoderCount ?? this.maxHardwareDecoderCount,

      allowSoftwareFallback: allowSoftwareFallback ?? this.allowSoftwareFallback,
    );
  }

  @override
  String toString() {
    return 'DecoderBudget('
        'enabled=$enabled, '
        'decoder=$maxDecoderCount, '
        'hardware=$maxHardwareDecoderCount, '
        'softwareFallback=$allowSoftwareFallback'
        ')';
  }
}
