## 0.1.0

Initial release.

- Declared side: every module reports what it holds into the ledger (`MemoryAccount` / `MemoryRegistry`), so a report can answer **who** is using memory.
- Measured side: `MemoryMonitor` reads device snapshots (used / available / external bytes) from a host-installed provider, answering **how much** the process uses in total.
- Budget and pressure: `MemoryBudget` sets thresholds and crossing one yields a `MemoryPressure` level the kernel can act on.
- Reports: `MemoryReport` lines the declared side up against the measured side and points out gaps and heavy users.
- Hub: `MemoryHub` / `MemoryManager` wire the parts together; `MemorySnapshotProvider` is the host's device data source.
