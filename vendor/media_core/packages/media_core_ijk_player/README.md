# media_core_ijk_player

> ijkplayer（`flv_lzc`）适配器：把 IJK 引擎接到 media_core 的适配器契约上，并带上这条线最需要的直播参数（重连、超时、代理、请求头、快照）。

## 接的是哪一层

`FlvLzcPlayerAdapter` 实现 `PlayerAdapter` + `PlayerVideo`：能力由
`FlvLzcPlayerAdapter.defaultCapabilities` 声明（选择器与引擎升级只读这一份），操作走
media_core 的串行化契约，FLV/RTMP/代理/请求头等引擎细节收在 `FijkPlayerConfig` 里
（`extraPlayerOptions` / `extraHostOptions` / `extraFormatOptions` 是逃生口，能覆盖或补上任何
本类没包装的 IJK 选项）。

## 日志：引擎的日志跟着宿主走

ijkplayer 的日志**不经过** `MediaCoreLog`：状态迁移一行、每个播放器创建/释放打印一整块
（logcat 里是 `IJKMEDIA` 标签），插件自己的 Dart 层每次调用再补一行（`[fijk] ...`）。一个房间一个
播放器的宿主，一场下来就是几百行 —— 看起来像"这个适配器日志太多"，而适配器本体一行都没打。

引擎自带开关，本包把它接在日志枢纽上（`FijkHelper.syncLogLevel()`，在 `onInitialize` 里、
第一次碰播放器之前调用一次）：

| `MediaCoreLog.level` | 引擎级别（fijk） | 效果 |
| --- | --- | --- |
| `nothing`（默认） | `Silent` | logcat 里没有引擎日志 |
| `error` / `critical` | `Error` / `Fatal` | 只留错误 |
| `info` / `warning` | `Info` / `Warn` | 常规 |
| `debug` / `trace` | `Debug` / `Verbose` | 引擎的完整输出，排查 IJK 问题时用 |

映射是单向的（枢纽越安静，引擎越安静），所以**枢纽依旧是唯一权威**：宿主不需要为引擎再学一个开关，
量级换算由插件自己做（`level / 100` 后夹到 0..8，再交给 ijk 的 `setLogLevel`）。级别按进程缓存，
换房间不会重复下发。

## 与宿主应用的关系

宿主只做两件事：注册这个适配器（`PlayerAdapterRegistration`，`id` 用 `kIjkPlayerBackendId`），
以及按需设置 `MediaCoreLog.level` —— 引擎日志随之开关。
