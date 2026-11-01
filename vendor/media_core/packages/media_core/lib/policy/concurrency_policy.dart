/// Defines concurrency policies for player runtime.
///
/// [ConcurrencyPolicy] controls how many
/// asynchronous player operations can run
/// at the same time.
///
/// Responsibilities:
///
/// - limit player creation concurrency
/// - limit source loading concurrency
/// - limit decoder initialization concurrency
/// - limit network operations
///
/// It does not:
///
/// - implement synchronization
/// - queue tasks
/// - execute operations
///
/// Those belong to:
///
/// - ConcurrencyManager
/// - Mutex
/// - Semaphore
/// - SerialExecutor
final class ConcurrencyPolicy {
  /// Creates concurrency policy.
  const ConcurrencyPolicy({
    this.maxPlayers = 4,

    this.maxSourceLoads = 4,

    this.maxDecoderInitializations = 2,

    this.maxNetworkRequests = 8,

    this.maxRecordings = 1,

    this.enableConcurrencyLimit = true,
  });

  /// Maximum active player instances.
  ///
  /// Prevents creating too many players
  /// at the same time.
  final int maxPlayers;

  /// Maximum concurrent source loading tasks.
  final int maxSourceLoads;

  /// Maximum decoder initialization tasks.
  ///
  /// Decoder creation is usually expensive.
  final int maxDecoderInitializations;

  /// Maximum concurrent network operations.
  final int maxNetworkRequests;

  /// Maximum recording tasks.
  final int maxRecordings;

  /// Whether concurrency limits are enabled.
  final bool enableConcurrencyLimit;

  /// Whether player creation can start.
  bool canCreatePlayer(int currentCount) {
    if (!enableConcurrencyLimit) {
      return true;
    }

    return currentCount < maxPlayers;
  }

  /// Whether source loading has capacity.
  bool canLoadSource(int currentCount) {
    if (!enableConcurrencyLimit) {
      return true;
    }

    return currentCount < maxSourceLoads;
  }

  /// Whether decoder initialization has capacity.
  bool canInitializeDecoder(int currentCount) {
    if (!enableConcurrencyLimit) {
      return true;
    }

    return currentCount < maxDecoderInitializations;
  }

  /// Creates modified policy.
  ConcurrencyPolicy copyWith({
    int? maxPlayers,

    int? maxSourceLoads,

    int? maxDecoderInitializations,

    int? maxNetworkRequests,

    int? maxRecordings,

    bool? enableConcurrencyLimit,
  }) {
    return ConcurrencyPolicy(
      maxPlayers: maxPlayers ?? this.maxPlayers,

      maxSourceLoads: maxSourceLoads ?? this.maxSourceLoads,

      maxDecoderInitializations: maxDecoderInitializations ?? this.maxDecoderInitializations,

      maxNetworkRequests: maxNetworkRequests ?? this.maxNetworkRequests,

      maxRecordings: maxRecordings ?? this.maxRecordings,

      enableConcurrencyLimit: enableConcurrencyLimit ?? this.enableConcurrencyLimit,
    );
  }

  @override
  String toString() {
    return 'ConcurrencyPolicy('
        'players=$maxPlayers, '
        'sourceLoads=$maxSourceLoads, '
        'decoders=$maxDecoderInitializations'
        ')';
  }
}
