# media_core_memory

`media_core` 的内存记账模块。两个视角，缺一不可：

- **申报值（declared）**：每个模块把自己持有的东西报进账本（`MediaCoreMemory.of(...)`），于是报告能回答 *谁* 在占内存。
- **实测值（measured）**：`MemoryMonitor` 从宿主安装的平台 provider 取设备快照（已用/可用/外部字节），回答 *进程一共用了多少*。

## 为什么单独成包

内存横跨每一层——开播放器的内核、留热播放器的池、缓冲下载的队列、逐格缓存弹幕的视频墙——但它们都不该为了记一笔内存而互相依赖。抽成独立包后依赖方向只有一个：`media_core` 与各能力包 → `media_core_memory`。

它同时消除了原来三处重叠：`diagnostics/MemoryMonitor`（设备快照）、`resource/MemoryManager`（单一标量 + 预算）、以及各模块自己也不知道被谁占用的那部分。

## 关于"估算"这件事，先说清楚

没有任何 Dart API 能报告一个解码流、一个纹理或一个原生播放器占了多少字节——真实数字在 codec 的内部缓冲、GPU 分配器和原生堆里，都不对外暴露。所以一个想回答"内存是谁在用"的框架只有两条路：不报，或者报一个**申报值并明说它是申报值**。

这个包选第二条。`MemoryEstimates` 里的数字是刻意取整、偏保守的，用途是**排序**（谁大谁小）和**驱动预算**，不是告诉用户还剩多少 MB。想拿到真数的宿主可以直接报自己测到的值（`MemoryAccount.set`/`report` 接受任何数字）；磁盘缓存和录像就是真数——它们本来就知道自己写了多少。

## 用法

```dart
// 模块侧：取一个账本，持有东西时上报。
final _memory = MediaCoreMemory.of(MemoryModule.pool);
late final String _key = memoryContributorKey(this);   // 一个模块可能有多个实例

_memory.report(_key, items: players, bytes: players * MemoryEstimates.videoStream720p, note: '$players warm');
// 实例销毁时把自己的那份撤掉，否则总数会永远虚高：
_memory.withdraw(_key);

// 策略侧：做可选工作前先问压力。
if (MediaCoreMemory.pressure.shouldStopPreload) return;

// 诊断侧：报告 + 设备真值。
MediaCoreMemory.attachDeviceProvider(myPlatformMemoryReader);
print(MediaCoreMemory.report().describe());
```

`describe()` 输出形如：

```text
1.2GB tracked / 512.0MB budget [emergency] | device 2.1GB used (68%)
  pool: 640.0MB in 10 item(s) — 4 active, 6 warm
  kernel: 512.0MB in 8 item(s)
  danmaku: 900.0KB in 450 item(s) from 9 instances
```

## 一个账户，多个贡献者

账户按**模块**划分，而模块可以有多个活着的实例：一面 3×3 视频墙有 9 个弹幕队列，一个宿主可能跑两个内核。所以用量按贡献者 key 分别记账再求和：

```dart
_memory.report('cell-1', bytes: 100, items: 10);
_memory.report('cell-2', bytes: 200, items: 20);   // 相加，不是覆盖
```

单实例模块（内核、池）可以直接用 `add`/`remove`/`set`，它们作用在一个隐式贡献者上，省掉这套仪式。同一个贡献者再次上报是**替换**而非累加：模块报的是"我现在持有多少"，这样即使某次回调崩了没来得及撤，下一次上报也会覆盖掉，而不会永久虚高。

## 压力与预算

`MemoryBudget` 默认 512 MiB、70% 告警、85% 严重：

| 用量 | 压力 | 含义 |
| --- | --- | --- |
| < 70% | `normal` | 正常 |
| ≥ 70% | `elevated` | 停止增长（预载、热播放器等可选工作） |
| ≥ 85% | `critical` | 开始释放 |
| ≥ 100% | `emergency` | 立即释放，并拒绝新的分配 |

压力等级变化会以 `memory` 分类写进日志（升级到 critical 用 warning，越过预算用 error，回落用 info），debug 级别下还会带上各模块的分布——这正是排查"内存涨了是谁涨的"要的那一行。资源层（`ResourceManager`）通过 `memory_pressure_bridge.dart` 把内存压力折算进它自己的 `ResourcePressure`，与解码器、带宽、温度压力一起取最大值。

## 各模块上报了什么

| 模块 | items | bytes | 精度 |
| --- | --- | --- | --- |
| `kernel` | 打开的播放器数 | 每个按 720p 估算 | 估算 |
| `pool` | 活跃/热/空闲播放器数 | 每个按 720p 估算 | 估算 |
| `preload` | 预载中的源 | 每个按 720p 估算 | 估算 |
| `cache` | 缓存条目数 | 条目自报的真实字节 | **实测** |
| `download` | 传输中的任务 | 已写入字节 | **实测** |
| `recording` | 录制会话 | FFmpeg 已写字节 | **实测** |
| `danmaku` | 队列消息数 | 每条 2KB | 估算 |
| `multiview` | 已指派格子数 | 每格 720p + 各自弹幕队列 | 估算 |
| `pip` / `floating` | 承载中的画面（0/1） | 一个视频表面 | 估算 |
| `playback`（列表/feed） | 条目数 | 每条 1KB 元数据 | 估算 |
| `live` | 候选线路 + 引擎数 | 每条 8KB | 估算 |
| `fullscreen` | — | — | 刻意不报：它只是把同一个表面铺满，不额外分配 |

## 设计约束

- **不释放任何东西**：压力是信号，释放是各模块自己的决定（池裁员、预载停摆、缓存淘汰）。
- **不测量平台**：真实设备读数由宿主安装 provider（依赖与权限属于宿主），未安装时报告只有申报分布。
- **provider 抛异常不影响播放**：`sample()` 吞掉异常返回 `null`——诊断路径不能拖垮它正在观测的播放。
- **默认预算只管"被记账的内存"**：512 MiB 说的是框架自己的footprint，不是进程总量；总量看 `device` 那一段。

## 测试

```bash
flutter test   # 49 项：预算阈值、多贡献者求和与撤回、峰值、报告排序与描述、压力升级/回落日志、监控历史、资源层桥接
```
