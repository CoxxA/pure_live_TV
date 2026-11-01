# media_core_media_kit

> 基於 [media_kit](https://pub.dev/packages/media_kit) 的 media_core 播放後端適配器。

## 定位

本包為 [media_core](../media_core) 提供以 media_kit(libmpv)為引擎的播放後端實現,目標是實現主包 `adapter` 模塊定義的合約:

- `PlayerAdapter` —— 統一的播放後端合約(`open/play/pause/stop/seek/setVolume/setRate/close/dispose`、狀態與事件流)
- `PlayerAdapterFactory` —— 適配器創建工廠,註冊到 `PlayerAdapterRegistry` / `BackendRegistry` 後即可參與 `PlayerAdapterSelector` 的能力選擇與降級候選

## 平台支持

跟隨 media_kit:Android、iOS、macOS、Windows、Linux、Web。

## 當前狀態

⚠️ **尚未實現**:目前僅為腳手架模板(`lib/` 內只有佔位代碼),適配器尚未編寫。依賴已聲明 `media_kit`、`media_kit_video` 與 `media_core`(path 依賴)。

## 規劃用法(實現後)

```dart
// 註冊後端工廠(示意)
registry.register(MediaKitAdapterRegistration());

// 創建播放器時由 Selector 依能力自動選擇 media_kit 後端
final player = await playerFactory.create();
```

## 相關文檔

- 主包架構:`packages/media_core/media_core_architecture_guide.md`
- 適配器合約:`packages/media_core/lib/adapter/README.md`
