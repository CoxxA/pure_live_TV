## 0.1.0

Initial release.

- Identity and generations: `SourceId` / `SessionId` / `GenerationId` / `OperationId` value objects; the generation is what lets late events from a previous playback attempt be dropped.
- Sessions and handles: `PlayerSession`, `SessionController` and `PlayerHandle` — the handle is the host-facing facade, mirroring playback state and the declared playback intent.
- Command serialization: task queue (`ExclusiveTask` / `KeyedAsyncLock`), state machine and reconciler, so commands on one player never overlap.
- Recovery: a single `RecoveryLadder` decision (switch line / switch engine / rebuild), failure classification and snapshots; recovery restores play or pause from the declared intent.
- Events: a normalized playback event bus (`PlayerEventBus`) with priorities and de-duplication.
- Player pool and preload: pooled reuse, the preload manager and resource reclaim policies.
- Observation and diagnostics: `OperationTracker` (operation history), the diagnostics manager and debug snapshots.
- Resources: the memory accounting bridge, resource manager and memory pressure response.
- Platform and network: platform provider abstraction, network monitoring and cache policies.
- Adapter contract: `PlayerAdapter`, `PlayerVideo`, the adapter registry and the capability / priority based selector; engine-independent video geometry (`VideoOrientation`).
- Also: screenshots (multi-route capture plus a writer), the FLV legacy-HEVC rewriter and loopback relay, the recording contract, error and result types.
