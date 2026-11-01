## Unreleased

- Re-exports `package:media_kit/media_kit.dart` and `package:media_kit_video/media_kit_video.dart`, so a host that depends on this adapter alone gets the upstream API (`Media`, `Video`, `VideoController`, `PlayerConfiguration`, `MediaKit.ensureInitialized()`, …) without declaring them itself. `Player` and `PlayerState` stay hidden: `media_core` exports its own types under those names and an importer of both barrels would be ambiguous — import `package:media_kit/media_kit.dart` directly for those two.

## 0.1.0

Initial release.

- Backend adapter: `MediaKitPlayerAdapter` + `MediaKitAdapterFactory` connect media_kit to the media_core adapter contract (`PlayerAdapter` + `PlayerVideo`).
- View: `MediaKitVideoView` carries media_kit's rendering output.
- Proxy: `MediaKitProxyUrlResolver` resolves stream addresses that must go through a proxy.
- Configuration: `MediaKitPlayerConfig` declares engine-side options, including the CDN allowlist for legacy-HEVC FLV — streams on that list go through core's FLV rewriter and loopback relay before reaching the engine.
- Shares the kernel with the other backends: sessions, the recovery ladder and event normalization come from `media_core`.
