## 0.1.0

Initial release.

- One log hub: `MediaCoreLog` — the whole framework writes through this single entry point, and the host decides whether it speaks.
- Levels and categories: `LogLevel` (trace → off) and `LogCategory` (per module), so different modules can run at different levels.
- Pluggable sinks: the `PlayerLogSink` interface plus console, in-memory ring buffer and size-rotated file implementations; several can be attached at once.
- Scoped fields: `LogScope` attaches shared fields (player id, source id, generation) to a stretch of work, so every line carries them without manual string building.
- Replaceable formatter: `LogFormatter` decides the line layout.
- Silent by default: nothing is emitted until it is initialized, and the host's bootstrap does that (usually behind `if (kDebugMode)`).
