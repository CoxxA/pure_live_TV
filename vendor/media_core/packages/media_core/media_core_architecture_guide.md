# media_core 架构说明、使用流程与优化路线

> 基于当前 `lib(2).zip` 代码快照整理。
>
> 当前代码规模：约 **485 个 Dart 文件**，`lib/` 下 **38 个模块目录**，其中 `testing/` 为内部测试模块，不由 `lib/media_core.dart` 对外导出。
>
> 本文的目标不是要求一次性重构全部代码，而是先建立一套统一的“这个模块为什么存在、谁调用谁、什么时候使用、哪些东西不能越界”的架构说明。后续所有文件优化都应以本文的边界为准。

---

## 1. media_core 的定位

`media_core` 应当被视为一个 **与 UI、具体播放器引擎、具体平台实现解耦的媒体播放核心层**。

它负责解决的是：

- Player 生命周期
- Media Source 描述、校验、解析
- Backend / Adapter 选择与抽象
- Session 生命周期
- Playback 状态与命令
- 播放任务与异步操作
- Recovery / Fallback
- Renderer / Presentation / Audio
- Cache / Preload
- Resource / Concurrency
- Lifecycle / Visibility
- Diagnostics / Event
- Policy / Coordinator / Reconciliation

它不应该直接承担：

- Flutter 页面业务
- GetX Controller
- Android/iOS/Windows/macOS 的具体 UI
- 某一个播放器 SDK 的具体 API 细节
- 业务层 Room / User / LiveRoom 等概念
- App 全局单例业务状态

核心原则：

```text
业务层
   ↓
media_core 公共 API
   ↓
核心领域模型 + Session + Playback
   ↓
协调 / 策略 / 调度
   ↓
Adapter / Renderer / Audio / Platform
   ↓
具体播放器后端与平台实现
```

---

# 2. 总体架构

可以把整个项目理解为 8 个层次，而不是简单按照目录平铺。

```text
                    ┌──────────────────────────┐
                    │        Application       │
                    │ UI / Page / Business     │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │       Public Player       │
                    │ core / source / playback │
                    └────────────┬─────────────┘
                                 │
                  ┌──────────────┼──────────────┐
                  ▼              ▼              ▼
              session         operation       task
                  │              │              │
                  └──────────────┼──────────────┘
                                 ▼
                    ┌──────────────────────────┐
                    │      Coordination         │
                    │ coordinator / reconciler  │
                    │ policy / state_machine    │
                    └────────────┬─────────────┘
                                 │
        ┌────────────────────────┼────────────────────────┐
        ▼                        ▼                        ▼
   factory / adapter       recovery/fallback        resource/cache
        │                        │                        │
        ▼                        ▼                        ▼
   backend engine          retry / line / quality   decoder/memory/net
        │
        └────────────────────────┬───────────────────────┘
                                 ▼
                    renderer / audio / platform
                                 │
                                 ▼
                           OS / Device
```

更重要的是：**目录结构不是调用顺序。**

例如 `recovery` 在目录上和 `playback` 是平级的，但运行时 Recovery 是 Playback 出现故障后参与处理的机制；`coordinator` 是跨模块协调层，不应该成为所有业务逻辑的垃圾桶。

---

# 3. 各模块职责与用法

## 3.1 `core` —— Player 核心领域模型

路径：`lib/core/`

### 作用

`core` 是整个 media_core 最基础的 Player 领域层。

主要对象：

- `Player`
- `PlayerConfig`
- `PlayerOptions`
- `PlayerState`
- `PlayerStatus`
- `PlayerSnapshot`
- `PlayerInfo`
- `PlayerCapabilities`
- `PlayerMetrics`
- `PlayerError`
- `MediaType`
- `MediaCapabilities`
- `PlayerConstants`

### 核心概念

`Player` 只代表一个稳定的 Player 身份。

```text
Player
 └── PlayerId
```

运行时的 Session、Request、Generation 不应该塞进 `Player`。

因此：

```text
Player = “是谁”
Session = “这一次运行是什么”
Request = “这一次要求做什么”
Generation = “当前是哪一代运行状态”
```

这是目前架构中非常重要的身份隔离。

### 使用场景

业务层创建 Player 时主要使用：

```dart
final player = Player.create();

final config = PlayerConfig(
  autoInitialize: true,
  autoPlay: true,
  enableRecovery: true,
  enableFallback: true,
);
```

不要在 `core` 中直接创建：

- media engine
- Flutter texture
- Android Surface
- AudioSession
- Network client

---

## 3.2 `identity` —— 全系统身份系统

路径：`lib/identity/`

### 作用

统一管理跨模块使用的 ID：

- `PlayerId`
- `SessionId`
- `SlotId`
- `SourceId`
- `OperationId`
- `RequestId`
- `GenerationId`

### 为什么单独存在

这些 ID 是整个架构进行并发、生命周期、日志和状态关联的基础。

例如：

```text
PlayerId
   │
   ├── SessionId
   │      ├── OperationId
   │      ├── RequestId
   │      └── GenerationId
   │
   └── SlotId
```

### 使用原则

不要跨模块随意使用 `String` 表示这些身份。

错误：

```dart
String playerId;
String sessionId;
```

推荐：

```dart
PlayerId playerId;
SessionId sessionId;
```

这样可以降低把 PlayerId / SessionId 传错的风险。

---

## 3.3 `source` —— Media Source 层

路径：`lib/source/`

### 作用

负责回答一个问题：

> “我要播放的媒体到底是什么，以及最终应该交给播放器什么资源？”

主要组件：

- `PlayerSource`
- `SourceDescriptor`
- `SourceIdentity`
- `SourceLocation`
- `SourceMetadata`
- `SourceRequest`
- `ResolvedSource`
- `SourceInspector`
- `SourceResolver`
- `SourceResolverChain`
- `SourceInspectorChain`
- `SourceValidator`
- `SourceRegistry`
- `SourceService`

### 推荐流程

```text
业务输入
   ↓
PlayerSource / SourceRequest
   ↓
SourceValidator
   ↓
SourceInspector
   ↓
SourceResolverChain
   ↓
ResolvedSource
```

### 典型使用

例如业务传入一个 URL：

```text
https://example.com/live.m3u8
```

Source 层负责处理：

- URL 是否有效
- 协议是什么
- 媒体类型是什么
- 是否需要 Header / Cookie
- 是否需要重定向
- 是否需要额外解析
- 最终播放地址是什么

### 重要边界

`source` 不应该：

- 调用具体播放器 SDK
- 创建 Adapter
- 开始播放
- 管理 UI

它只负责把“媒体来源”整理成后续层可以消费的标准形式。

---

## 3.4 `factory` —— Backend / Player 创建与选择

路径：`lib/factory/`

### 作用

解决：

> “应该使用哪个 Backend / Adapter？”

主要对象：

- `PlayerFactory`
- `BackendFactory`
- `BackendRegistry`
- `BackendDescriptor`
- `BackendCapabilities`
- `BackendSelector`
- `BackendSelectionRequest`
- `BackendSelectionResult`
- `PlayerFactoryConfig`

### 推荐流程

```text
Source / PlayerConfig
       ↓
BackendSelectionRequest
       ↓
BackendSelector
       ↓
BackendSelectionResult
       ↓
BackendFactory
       ↓
BackendInstance / PlayerAdapter
```

### 选择依据

Backend 不应该简单按照：

```dart
if (platform == android) useXxx();
```

而应该综合：

- media type
- codec
- hardware decoding capability
- platform capability
- source protocol
- user preference
- backend health
- fallback policy

---

## 3.5 `adapter` —— 具体播放器引擎适配层

路径：`lib/adapter/`

### 作用

`adapter` 是 media_core 与具体播放引擎之间的防火墙。

例如未来可以有：

```text
MediaKitAdapter
IjkAdapter
ExoPlayerAdapter
AVPlayerAdapter
CustomAdapter
```

但这些具体实现不应该污染 `core`。

### 核心对象

- `PlayerAdapter`
- `PlayerAdapterConfig`
- `PlayerAdapterContext`
- `PlayerAdapterCapabilities`
- `PlayerAdapterState`
- `PlayerAdapterEvent`
- `PlayerAdapterError`
- `PlayerAdapterMetrics`
- `PlayerAdapterRegistry`
- `PlayerAdapterSelector`
- `PlayerAdapterFactory`

### Adapter 的职责

Adapter 负责：

```text
media_core command
       ↓
Adapter
       ↓
具体播放器 SDK
       ↓
SDK event
       ↓
Adapter
       ↓
media_core event/state
```

### Adapter 不应该负责

- Player 业务策略
- Recovery 策略
- Fallback 策略
- UI
- 页面生命周期

这些应该由上层处理。

---

# 4. Session / Playback / Operation / Task

这是整个项目最容易发生职责重叠的部分，也是后续优化重点。

## 4.1 `session` —— 一次 Player 运行实例

路径：`lib/session/`

### 作用

`Session` 表示：

> 一个 Player 当前这一轮实际运行上下文。

主要对象：

- `PlayerSession`
- `SessionContext`
- `SessionState`
- `SessionLifecycle`
- `SessionGeneration`
- `SessionOperation`
- `SessionEvent`
- `SessionSnapshot`
- `SessionManager`
- `SessionController`

### 推荐关系

```text
Player
  │
  └── Session
       │
       ├── Source
       ├── Adapter
       ├── Generation
       ├── Operations
       └── Runtime State
```

### 为什么需要 Session

因为同一个 Player 可以经历：

```text
Session 1
  open A
  error
  dispose

Session 2
  open B
  play
```

如果所有状态都直接挂在 Player 上，就很容易出现旧异步任务污染新播放。

因此 Session + Generation 是处理异步竞态的重要基础。

---

## 4.2 `playback` —— 播放语义

路径：`lib/playback/`

### 作用

负责定义播放器“要做什么”。

主要对象：

- `PlaybackCommand`
- `PlaybackCommandType`
- `PlaybackController`
- `PlaybackRequest`
- `PlaybackState`
- `PlaybackSnapshot`
- `PlaybackOptions`
- `PlaybackPosition`
- `PlaybackDuration`
- `PlaybackRate`
- `PlaybackVolume`

### 典型命令

```text
open
play
pause
stop
seek
setRate
setVolume
mute
close
```

### 推荐原则

Playback 应表达：

```text
“用户想让播放器变成什么状态”
```

而不是：

```text
“MediaKit 应该调用哪个 API”
```

例如：

```dart
PlaybackCommand.play()
```

而不是在上层：

```dart
mediaKitPlayer.play();
```

这样 Backend 可以替换。

---

## 4.3 `operation` —— 一个高层异步业务操作

路径：`lib/operation/`

### 作用

表示一个具有明确生命周期的异步操作。

主要对象：

- `Operation`
- `OperationContext`
- `OperationState`
- `OperationType`
- `OperationCancelToken`
- `OperationTimeout`
- `OperationRegistry`
- `OperationTracker`

例如：

```text
Open
Seek
SwitchSource
Initialize
Recover
Fallback
Dispose
```

Operation 更偏向：

> “我要完成一件有业务意义的事情。”

---

## 4.4 `task` —— 实际调度执行单元

路径：`lib/task/`

主要对象：

- `PlayerTask`
- `TaskManager`
- `TaskScheduler`
- `TaskQueue`
- `TaskPriority`
- `TaskState`
- `TaskCancelToken`

Task 更偏向：

> “现在这件异步工作怎么排队、取消、调度和执行？”

### 两者必须保持区别

```text
Operation
   ↓
Task
   ↓
实际执行
```

例如：

```text
Operation: OpenSource
    │
    ├── Task: inspect source
    ├── Task: resolve source
    ├── Task: select backend
    └── Task: initialize adapter
```

不要让 `OperationManager` 和 `TaskManager` 最后变成两个几乎一样的系统。

这是后续需要重点收敛的地方。

---

# 5. `result` 与 `error`

## 5.1 `result`

路径：`lib/result/`

负责统一异步调用结果：

- `Result<T>`
- `ResultSuccess<T>`
- `ResultFailure<T>`
- `AsyncResult<T>`
- `OperationResult<T>`
- `ResultError`
- `ResultStatus`

推荐：

```text
成功 → ResultSuccess
失败 → ResultFailure
```

不要在各模块自己创造一套：

```text
XxxResult
XxxResponse
XxxFailure
XxxStatus
```

除非它们确实表达了领域专属信息。

---

## 5.2 `error`

路径：`lib/error/`

负责统一错误模型：

```text
Exception
   ↓
ErrorClassifier
   ↓
PlayerErrorCategory / PlayerErrorCode
   ↓
PlayerFailure
   ↓
ErrorPolicy
   ↓
Retry / Recovery / Fallback / Report
```

主要对象：

- `PlayerErrorCategory`
- `PlayerErrorCode`
- `PlayerException`
- `PlayerFailure`
- `ErrorContext`
- `ErrorClassifier`
- `ErrorFormatter`
- `ErrorPolicy`

### 核心原则

错误本身和错误处理策略必须分开。

```text
Error = 发生了什么
Policy = 应该怎么办
```

例如：

```text
Network timeout
    ↓
ErrorCode.networkTimeout
    ↓
Policy
    ↓
Retry
```

---

# 6. `recovery` 与 `fallback`

## 6.1 `recovery`

路径：`lib/recovery/`

解决：

> 当前播放还能不能通过重试/重新初始化恢复？

典型：

```text
buffer timeout
network temporary failure
adapter transient error
session initialization failure
```

流程：

```text
Error
 ↓
RecoveryManager
 ↓
RecoveryReason
 ↓
RecoveryAction
 ↓
RetryScheduler
 ↓
Retry
```

---

## 6.2 `fallback`

路径：`lib/fallback/`

解决：

> 当前方案不行，是否切换到另一个方案？

目前包括：

- Backend fallback
- Line fallback
- Quality fallback

典型流程：

```text
Backend A
   ↓ failure
Recovery?
   ↓ cannot recover
FallbackManager
   ↓
Backend B / Line B / Quality B
   ↓
Retry playback
```

### Recovery 与 Fallback 的区别

```text
Recovery = 修复当前方案
Fallback = 换一个方案
```

例如：

```text
重新 prepare MediaKit
    → Recovery

MediaKit → IJK
    → Fallback

线路 1 → 线路 2
    → Fallback

1080p → 720p
    → Quality Fallback
```

---

# 7. `reconciler` —— Desired State 与 Actual State

路径：`lib/reconciler/`

这是整个架构中比较高级的一层。

### 作用

解决：

> “业务想要的状态”和“播放器实际状态”不一致怎么办？

```text
Desired State
      │
      ▼
PlayerReconciler
      │
      ▼
ReconcilePlan
      │
      ▼
ReconcileAction
      │
      ▼
Actual Player State
```

例如业务要求：

```text
playing
volume = 0.8
rate = 1.5
```

但实际：

```text
paused
volume = 0.5
rate = 1.0
```

Reconciler 可以生成：

```text
play
setVolume(0.8)
setRate(1.5)
```

### 注意

Reconciler 不应该重新实现 Playback Controller。

它负责的是：

```text
差异计算 + 动作规划
```

实际执行仍应交给对应控制层。

---

# 8. `coordinator` —— 跨模块协调层

路径：`lib/coordinator/`

目前包含：

- `PlayerCoordinator`
- `GlobalPlayerCoordinator`
- `PlaybackCoordinator`
- `LifecycleCoordinator`
- `PageCoordinator`
- `PlayerAudioCoordinator`
- `PreloadCoordinator`
- `PresentationCoordinator`
- `ResourceCoordinator`

### 作用

Coordinator 的职责是：

> 多个模块必须同时变化时，负责协调它们。

例如：

```text
进入后台
 ↓
LifecycleCoordinator
 ↓
Playback + Audio + Presentation + Resource
```

### Coordinator 最重要的限制

**不能把所有业务逻辑都塞进 Coordinator。**

如果一个 Coordinator 开始出现：

- source resolve
- backend select
- retry
- cache
- rendering
- audio
- session state
- UI state

全部自己处理，那么它已经变成 God Object。

当前项目里 `coordinator` 已经是一个需要重点关注的模块。

---

# 9. `policy` —— 决策规则层

路径：`lib/policy/`

包括：

- `PlayerPolicy`
- `PlaybackPolicy`
- `RecoveryPolicy`
- `FallbackPolicy`
- `ResourcePolicy`
- `PreloadPolicy`
- `PresentationPolicy`
- `VisibilityPolicy`
- `LifecyclePolicy`
- `ConcurrencyPolicy`
- `CachePolicy`
- `AudioPolicy`
- `MemoryPolicy`
- `ThermalPolicy`
- `PolicyContext`

### 作用

Policy 应回答：

```text
“在这个条件下，应该怎么选择？”
```

而不是：

```text
“具体执行 API 是什么？”
```

例如：

```text
Resource pressure = high
      ↓
ResourcePolicy
      ↓
reduce quality
stop preload
reduce decoder count
```

### 当前需要注意

当前依赖图中 `policy -> presentation`，这是一个值得后续调整的依赖方向。

理想情况下，Policy 应尽量依赖纯模型/能力，而不是依赖较高层的 Presentation 实现。

建议最终演化成：

```text
policy
  ↓
model / capability / context

presentation
  ↓
读取 policy 决策
```

而不是：

```text
policy → presentation
```

---

# 10. `concurrency` —— 并发控制

路径：`lib/concurrency/`

包括：

- `ConcurrencyKey`
- `ConcurrencyLimit`
- `ConcurrencyManager`
- `Mutex`
- `ReentrantMutex`
- `KeyedMutex`
- `AsyncLock`
- `AsyncSemaphore`
- `SerialExecutor`
- `ExclusiveTask`

### 作用

解决：

```text
同一个 Player 同时 seek + dispose
同一个 Session 同时 open + recover
多个 source 同时 resolve
多个 recording 同时启动
```

### 推荐思路

不同资源使用不同 key：

```text
player:<id>
session:<id>
source:<id>
backend:<id>
recording:<id>
```

然后通过：

```text
Mutex
Semaphore
SerialExecutor
ConcurrencyLimit
```

控制并发。

### 一个重要原则

不要到处自己写：

```dart
bool _busy = false;
```

然后：

```dart
if (_busy) return;
_busy = true;
try {...}
finally {_busy = false;}
```

这种逻辑应该尽量统一到 concurrency 层。

---

# 11. `cache` —— 内存与磁盘缓存

路径：`lib/cache/`

包括：

- `CacheManager`
- `CacheStorage`
- `MemoryCache`
- `DiskCache`
- `CacheEntry`
- `CacheKey`
- `CacheEviction`
- `CacheMetrics`
- `CacheState`
- `CacheResult`

### 典型结构

```text
CacheManager
 ├── MemoryCache
 └── DiskCache
```

### Cache 不应该知道

- Player UI
- Session lifecycle
- Flutter widget
- 某个具体 backend

Cache 只处理数据生命周期。

---

# 12. `preload` —— 预加载

路径：`lib/preload/`

包括：

- `PreloadManager`
- `PreloadScheduler`
- `PreloadTask`
- `PreloadRequest`
- `PreloadPriority`
- `PreloadContext`
- `PreloadState`
- `PreloadMetrics`

### 推荐流程

```text
业务预测下一个播放
       ↓
PreloadRequest
       ↓
PreloadManager
       ↓
PreloadScheduler
       ↓
Source / Factory / Adapter
       ↓
Warm resource
```

Preload 的目标不是直接开始正常播放，而是降低正式播放的启动成本。

### 必须和 Resource 配合

预加载不是无限的。

```text
Preload
   ↓
ResourcePolicy
   ↓
Decoder / Memory / Bandwidth Budget
```

---

# 13. `pool` 与 `slot`

## `pool`

路径：`lib/pool/`

负责 Player 实例复用：

```text
PlayerPoolManager
 ↓
allocate
 ↓
Player
 ↓
release
 ↓
recycle
```

当前 `PlayerPoolManager` 的职责已经写得比较明确：

- 分配
- 回收
- 跟踪 active player

而不负责：

- 创建 Player
- 销毁 Player
- 控制 Playback

这个边界应该保持。

## `slot`

路径：`lib/slot/`

`Slot` 更偏向“逻辑位置/占用关系”：

```text
Slot
 ↓
Owner
 ↓
Player
 ↓
Session
```

例如多窗口、多画面、列表播放器都可以通过 Slot 管理播放器占用关系。

---

# 14. `resource` —— Decoder / Memory / Bandwidth / Thermal

路径：`lib/resource/`

包括：

- `ResourceManager`
- `DecoderManager`
- `MemoryManager`
- `BandwidthManager`
- `ThermalManager`
- Budget / Pressure / Snapshot / Metrics / State

### 资源模型

```text
             ResourceManager
                    │
       ┌────────────┼────────────┐
       ▼            ▼            ▼
   Decoder       Memory      Bandwidth
       │                         │
       └──────────┬──────────────┘
                  ▼
              Thermal
                  │
                  ▼
           ResourcePressure
```

### 作用

它不直接控制播放，而是提供资源状态：

```text
当前 decoder 数量
内存占用
带宽使用
温度
资源压力
```

上层根据这些信息做：

- 降画质
- 停止 preload
- 回收 player
- 减少 decoder
- 降低并发

### 注意

`ResourceManager` 目前已经比较接近正确的“聚合器”角色，但后续要进一步明确：

```text
Manager = 管理资源状态
Policy = 决定策略
Coordinator = 协调其他模块执行策略
```

---

# 15. `renderer` —— 播放画面输出

路径：`lib/renderer/`

包括：

- `PlayerRenderer`
- `PlayerSurface`
- `PlayerView`
- `PlayerOverlay`
- `RendererController`
- `RendererCapabilities`
- `RendererConfig`
- `RendererState`

### 作用

Renderer 解决：

> 播放器产生的视频，最终如何呈现出来？

```text
Adapter
  ↓
Video Output
  ↓
Renderer
  ↓
Surface / View
```

Renderer 不应该知道：

- 房间业务
- Source 解析
- Fallback 选择
- Retry 业务

---

# 16. `presentation` —— Fullscreen / PiP / Floating

路径：`lib/presentation/`

包括：

- Fullscreen
- PiP
- Floating
- Presentation mode
- Presentation state
- Presentation request
- Presentation controller / manager / service / dispatcher

### 作用

Presentation 负责：

> “播放器以什么展示模式存在。”

例如：

```text
normal
fullscreen
pip
floating
background
```

它和 Renderer 不一样：

```text
Renderer = 怎么画
Presentation = 放在哪里 / 以什么模式显示
```

---

# 17. `audio` —— Audio Focus / Session / Route

路径：`lib/audio/`

包括：

- `AudioManager`
- `AudioCoordinator`
- `AudioFocus`
- `AudioSession`
- `AudioRoute`
- `AudioVolume`
- `AudioMute`

### 作用

处理：

```text
播放声音
 ↓
AudioSession
 ↓
AudioFocus
 ↓
AudioRoute
 ↓
Volume / Mute
```

Audio 与 Playback 应保持解耦。

例如：

```text
PlaybackState = playing
```

不等于：

```text
AudioFocus 一定是 granted
```

因为系统可能发生：

- 电话中断
- 蓝牙切换
- 其他 App 抢占音频焦点
- 后台限制

---

# 18. `platform` —— 平台能力抽象

路径：`lib/platform/`

包括：

- `PlatformProvider`
- `PlatformInfo`
- `PlatformCapabilities`
- `PlatformLifecycle`
- `PlatformNetwork`
- `PlatformAudio`
- `PlatformPip`
- `PlatformRenderer`
- `PlatformSurface`
- `PlatformType`

### 作用

把：

```text
Android
iOS
Windows
macOS
Linux
```

的差异抽象掉。

例如上层只问：

```text
supportsPip?
supportsHardwareDecoding?
supportsSurface?
```

而不是直接判断：

```dart
Platform.isAndroid
```

### 原则

平台实现应尽可能隐藏在 platform / adapter 层。

---

# 19. `geometry` —— 视频尺寸与旋转

路径：`lib/geometry/`

处理：

- Aspect Ratio
- Video Size
- Display Size
- Pixel Ratio
- Orientation
- Rotation
- Geometry State / Snapshot / Event

典型流程：

```text
Video metadata
 ↓
VideoSize
 ↓
VideoGeometry
 ↓
AspectRatio
 ↓
DisplaySize
 ↓
Renderer
```

Geometry 不应该参与播放业务决策。

---

# 20. `visibility` —— 可见性

路径：`lib/visibility/`

负责：

```text
visible
hidden
appeared
disappeared
```

以及对应：

- state
- snapshot
- event
- metrics
- observer
- controller

典型使用：

```text
Player visible
   ↓
正常播放策略

Player hidden
   ↓
降低资源
   ↓
暂停 / 降画质 / 降低刷新
```

Visibility 本身只负责观察，不应该决定所有策略。

策略交给 `policy`。

---

# 21. `lifecycle` —— Player / Page / Application 生命周期

路径：`lib/lifecycle/`

负责：

```text
created
initialized
attached
detached
background
foreground
disposing
disposed
```

### 推荐关系

```text
Platform lifecycle
       ↓
Lifecycle
       ↓
Coordinator
       ↓
Session / Playback / Audio / Presentation
```

Lifecycle 是“发生了什么”，Policy 才是“应该怎么办”。

---

# 22. `event` —— 事件传播

路径：`lib/event/`

包括：

- `PlayerEvent`
- `PlayerEventBus`
- `EventDispatcher`
- `EventSubscription`
- `EventFilter`
- `EventPriority`
- `EventContext`

### Event 与 State 的区别

```text
State = 当前是什么
Event = 刚刚发生了什么
```

例如：

```text
State:
playing

Event:
PlaybackStarted
```

不要用 Event 代替 State，也不要让所有东西都变成 Event。

---

# 23. `reactive` —— Stream / RxDart 基础设施

路径：`lib/reactive/`

目前包含较多 Stream 工具：

- Behavior
- Subject
- Combine
- Debounce
- Distinct
- Throttle
- Stream Cache
- Cancellation
- Disposable
- Event
- Gate
- Lifecycle
- Mutex
- Queue
- Result
- Retry
- Safe
- Scheduler
- State
- Transform

### 作用

这是基础设施层。

上层模块可以使用它统一处理：

```text
state stream
snapshot stream
event stream
cancellation
retry
debounce
serialization
```

### 当前优化重点

Reactive 文件数量已经较多，后续需要避免：

```text
同一种功能出现 3~4 套实现
```

例如 Stream retry / scheduler / queue / state 等，需要明确“官方推荐入口”。

否则使用者会不知道应该选哪个类。

---

# 24. `state_machine` —— 通用状态机

路径：`lib/state_machine/`

提供：

- State
- StateMachine
- StateMachineController
- StateMachineEvent
- StateTransition
- StateTransitionResult
- StateMachineContext

### 作用

用于有明确状态转换规则的对象。

例如：

```text
idle
 ↓ initialize
initializing
 ↓ success
ready
 ↓ play
playing
 ↓ pause
paused
 ↓ dispose
disposed
```

### 使用原则

只有真正存在复杂状态转换的对象才使用状态机。

不要为了“看起来架构完整”给每个类都套 StateMachine。

---

# 25. `diagnostics` —— 日志、性能、内存、网络诊断

路径：`lib/diagnostics/`

包括：

- `DiagnosticsManager`
- `PlayerLogger`
- `PerformanceMonitor`
- `MemoryMonitor`
- `NetworkDiagnostics`
- `PlayerDebugSnapshot`
- `DiagnosticsEvent`
- Metrics / Snapshot / Config

### 作用

解决：

> 播放失败以后，如何知道为什么失败？

建议所有重要运行对象都可以关联：

```text
PlayerId
SessionId
OperationId
RequestId
GenerationId
```

这样可以把一次播放过程完整串起来。

---

# 26. `bug` —— 故障注入 / Debug Mode

路径：`lib/bug/`

这是一个非常有价值的测试基础设施。

包括：

- BugMode
- FaultConfig
- FaultType
- FaultScenario
- FaultInjector
- FaultScheduler
- FaultEvent
- BugHooks

### 可以模拟

```text
network timeout
backend error
prepare failure
buffer stall
random failure
slow operation
```

它的价值在于：

Recovery / Fallback 不应该只靠线上真实故障测试。

---

# 27. `recording` —— 录制子系统

路径：`lib/recording/`

包括：

- `RecordingManager`
- `RecordingSession`
- `RecordingBackend`
- `RecordingConfig`
- `RecordingFormat`
- `RecordingSource`
- `RecordingState`
- `RecordingResult`
- `RecordingError`

### 推荐结构

```text
RecordingManager
      ↓
RecordingSession
      ↓
RecordingBackend
      ↓
Actual recorder
```

Recording 不应该把 Playback Controller 变成一个“什么都能做”的控制器。

---

# 28. `util` —— 通用工具

路径：`lib/util/`

包括：

- duration
- future
- stream
- URI
- MIME
- header
- cookie
- enum
- list/map
- validation
- retry
- dispose
- platform
- debug

### 原则

Util 必须是最低依赖层。

不要把领域业务放进：

```text
util/
```

例如：

```text
PlayerRetryPolicy
```

就不应该叫：

```text
retry_utils.dart
```

因为它已经属于 recovery / policy 领域。

---

# 29. `testing` —— 内部测试设施

路径：`lib/testing/`

包括：

- fake clock
- fake lifecycle
- fake network
- fake platform
- fake player
- fake adapter
- fake timer
- fake visibility
- test factories
- test scenarios

当前 `media_core.dart` 不导出 `testing`，这个方向是正确的。

测试工具可以继续存在于 `lib/testing`，但必须明确它是：

```text
internal testing support
```

而不是生产 API。

---

# 30. 推荐的完整播放流程

这是以后开发任何功能时最应该遵守的主流程。

## 30.1 创建 Player

```text
Player.create()
      ↓
PlayerConfig
      ↓
PlayerFactory
```

---

## 30.2 创建 Session

```text
Player
  ↓
SessionManager
  ↓
PlayerSession
  ↓
SessionGeneration
```

---

## 30.3 输入 Source

```text
PlayerSource / SourceRequest
          ↓
SourceValidator
          ↓
SourceInspector
          ↓
SourceResolverChain
          ↓
ResolvedSource
```

---

## 30.4 选择 Backend

```text
ResolvedSource
      +
PlayerConfig
      +
PlatformCapabilities
      ↓
BackendSelectionRequest
      ↓
BackendSelector
      ↓
BackendSelectionResult
      ↓
BackendFactory
      ↓
PlayerAdapter
```

---

## 30.5 初始化 Adapter

```text
PlayerSession
      ↓
PlayerAdapterContext
      ↓
PlayerAdapter.initialize()
      ↓
AdapterState.ready
```

---

## 30.6 开始 Playback

```text
PlaybackRequest
      ↓
PlaybackController
      ↓
Operation
      ↓
Task
      ↓
PlayerAdapter
      ↓
Backend
```

---

## 30.7 播放过程中

同时存在：

```text
Playback
Session
Audio
Renderer
Visibility
Resource
Diagnostics
Event
```

这些模块不应该互相直接乱调用，而应该通过：

```text
Coordinator
Policy
Event
State
```

进行协作。

---

# 31. 出错流程

推荐统一成：

```text
Adapter / Network / Source
          ↓
        Error
          ↓
   ErrorClassifier
          ↓
    PlayerFailure
          ↓
     ErrorPolicy
          ↓
 ┌────────┼──────────┐
 ▼        ▼          ▼
Retry   Recovery   Fallback
                   │
                   ▼
              New Backend/
              New Line/
              New Quality
                   │
                   ▼
                Playback
```

判断顺序建议：

```text
1. 当前操作是否已经取消？
2. 是否属于旧 Generation？
3. 是否属于可恢复错误？
4. 是否还有 Recovery 次数？
5. 是否还有 Fallback 候选？
6. 是否应该向上层报告最终失败？
```

这套顺序可以显著减少异步竞态。

---

# 32. 生命周期流程

推荐：

```text
create
  ↓
initialize
  ↓
ready
  ↓
open
  ↓
playing
  ↓
paused / buffering / seeking
  ↓
stopping
  ↓
stopped
  ↓
dispose
  ↓
disposed
```

同时还有外部生命周期：

```text
App foreground/background
Page attach/detach
Visibility visible/hidden
Presentation normal/fullscreen/PiP/floating
```

这些不是同一个 State。

应保持：

```text
Player lifecycle
≠
Playback state
≠
Page lifecycle
≠
Visibility state
≠
Presentation mode
```

这是架构稳定性的关键。

---

# 33. 多播放器 / MultiView 流程

对于多画面场景，建议使用：

```text
Slot
 ↓
Player
 ↓
Session
 ↓
Adapter
```

而不是让一个 Global Player 假设系统永远只有一个播放器。

例如：

```text
Slot A → Player A → Session A
Slot B → Player B → Session B
Slot C → Player C → Session C
```

资源统一由：

```text
ResourceManager
```

进行全局预算控制。

这样可以支持：

- 4 分屏
- 9 分屏
- 多路预加载
- 资源降级
- 当前焦点播放器优先

---

# 34. 一个标准的业务调用范式

业务层不应该直接操作几十个 Manager。

理想使用方式：

```text
Application
    ↓
PlayerCoordinator / PlayerController
    ↓
PlayerSession
    ↓
PlaybackController
    ↓
Adapter
```

例如：

```dart
final player = Player.create();

final config = PlayerConfig(
  autoPlay: true,
  enableRecovery: true,
  enableFallback: true,
);

// 由 Factory / Session / Playback 层完成实际创建和播放。
```

业务层应该只关心：

```text
我要播放什么
我要什么配置
我要播放 / 暂停 / seek
我要监听什么状态
```

而不关心：

```text
MediaKit 怎么 prepare
IJK 怎么 setOption
Texture 怎么创建
Decoder 怎么申请
```

---

# 35. 当前项目最值得优化的地方

根据当前目录、类职责和模块依赖关系，建议不要马上继续“增加文件”，而是先进行下面几项收敛。

## P0 —— 依赖方向

当前模块依赖中值得关注：

```text
policy → presentation
```

Policy 应尽量成为低层决策模型，不应该反向依赖 Presentation。

建议最终：

```text
policy
  ↓
capability / context / model

presentation
  ↓
consume policy
```

---

## P0 —— Coordinator 防止变成 God Object

当前 `coordinator` 已经拥有很多 Coordinator：

```text
Global
Player
Playback
Lifecycle
Page
Audio
Preload
Presentation
Resource
```

数量本身不是问题，问题是它们之间很容易产生：

```text
Coordinator → Coordinator → Coordinator
```

甚至：

```text
GlobalCoordinator
  → PlayerCoordinator
  → PlaybackCoordinator
  → ResourceCoordinator
  → PresentationCoordinator
```

最终所有逻辑都会堆进去。

需要明确：

```text
Manager = 管理某个领域
Controller = 对外操作入口
Coordinator = 跨领域协调
Policy = 决策
```

---

## P0 —— Operation 与 Task 收敛

目前两个体系都比较完整：

```text
Operation
Task
```

必须明确：

```text
Operation = 业务动作
Task = 调度执行
```

否则以后会出现：

```text
OperationManager
TaskManager
```

都在做 cancellation / timeout / state / queue / retry。

建议统一职责，而不是继续各自增加功能。

---

## P0 —— Recovery / Fallback / Retry 边界

现在有：

```text
Recovery
Fallback
RetryScheduler
OperationTimeout
TaskScheduler
```

需要最终确定：

```text
Retry = 同一个方案再执行
Recovery = 为恢复当前 Session 做动作
Fallback = 切换方案
```

否则会产生重复重试。

---

## P1 —— Reactive 收敛

当前 reactive 文件数量已经比较多。

建议给整个项目定义“官方推荐组件”：

```text
State stream → ReactiveState
Event stream → ReactiveSubject
Serialized work → SerialExecutor
Debounce → StreamDebouncer
Retry → StreamRetry
Cancellation → StreamCancellation
```

其他底层实现尽量内部化。

目标：

> 使用者不需要在 20 个 reactive 文件里选择应该用哪一个。

---

## P1 —— Manager / Controller / Service 命名统一

目前项目中同时存在：

```text
Manager
Controller
Service
Coordinator
Factory
Registry
Selector
Scheduler
```

建议固定语义：

| 类型 | 职责 |
|---|---|
| Model | 数据/状态/值对象 |
| Controller | 对外操作入口 |
| Manager | 管理一个领域运行状态 |
| Service | 无状态或业务服务 |
| Coordinator | 跨领域协调 |
| Factory | 创建对象 |
| Registry | 注册/查找 |
| Selector | 选择 |
| Scheduler | 安排执行 |
| Policy | 决策 |
| Adapter | 对接外部实现 |

以后新文件必须先确定属于哪一种。

---

## P1 —— State / Snapshot / Metrics / Event 不要重复表达同一信息

建议：

```text
State
= 当前运行状态

Snapshot
= 某一时刻的完整只读快照

Metrics
= 数值统计

Event
= 发生过的事情
```

不要让：

```text
State
Snapshot
Event
Metrics
```

四套对象都重复保存同样字段。

---

## P1 —— 生命周期所有权

需要继续明确每个对象由谁 dispose。

建议统一：

```text
Application
 ↓ owns
Global Manager
 ↓ owns
Player Manager
 ↓ owns
Session
 ↓ owns
Adapter / Resources
```

每个对象只能有一个明确 owner。

尤其需要避免：

```text
A dispose B
B dispose A
```

以及：

```text
Manager dispose
但 child stream 仍然在 emit
```

---

## P1 —— ID + Generation 防旧任务污染

这是播放核心非常重要的能力。

所有异步流程建议至少能够判断：

```text
PlayerId
SessionId
GenerationId
OperationId
RequestId
```

例如：

```text
Session Generation = 8

旧任务返回：Generation = 7

→ 丢弃结果
```

不要让旧的 prepare / seek / fallback 结果写入新的 Session。

---

## P2 —— Public API 收敛

目前 `media_core.dart` 对外暴露了大量模块。

虽然模块化很好，但最终使用者不应该需要理解全部 37 个公开模块。

建议未来形成三级 API：

```text
Level 1: 常用 API
core / source / playback / session

Level 2: 高级 API
factory / adapter / recovery / fallback / recording

Level 3: Infrastructure
reactive / concurrency / diagnostics / bug / util / state_machine
```

可以继续导出，但文档必须明确哪些是普通业务开发者应该使用的入口。

---

# 36. 推荐的开发顺序

以后新增功能，不要按照文件名顺序机械创建。

建议：

```text
1. Identity
2. 基础 Value Object / Enum
3. Config
4. State
5. Snapshot / Metrics
6. Result / Error
7. 核心 Service / Manager
8. Controller
9. Coordinator
10. Recovery / Fallback
11. Diagnostics
12. Testing
```

对于一个新模块也遵循：

```text
定义 → 状态 → 行为 → 管理 → 协调
```

这样可以明显减少返工。

---

# 37. 新功能应该怎么落模块

遇到需求时先问：

### “这是一个数据定义？”

→ `core / source / session / playback / ...`

### “这是选择规则？”

→ `policy`

### “这是具体执行？”

→ 对应 `Manager / Controller / Adapter`

### “这是跨两个以上领域的协作？”

→ `coordinator`

### “这是一次异步业务动作？”

→ `operation`

### “这是一个排队执行单元？”

→ `task`

### “这是重试当前方案？”

→ `recovery`

### “这是换另一个方案？”

→ `fallback`

### “这是并发控制？”

→ `concurrency`

### “这是资源预算？”

→ `resource`

### “这是播放画面？”

→ `renderer`

### “这是显示模式？”

→ `presentation`

### “这是平台差异？”

→ `platform`

---

# 38. 推荐的最终依赖方向

理想状态不是完全没有依赖，而是依赖方向稳定。

建议逐渐收敛为：

```text
                         util
                          ↑
                     identity
                          ↑
        ┌─────────────────┼─────────────────┐
        │                 │                 │
      result            error           reactive
        │                 │                 │
        └────────────┬────┴─────────────────┘
                     │
                   core
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
       source                playback
          │                     │
          └──────────┬──────────┘
                     ▼
                  session
                     │
            ┌────────┴────────┐
            ▼                 ▼
         factory           operation
            │                 │
            ▼                 ▼
         adapter             task
            │                 │
            └────────┬────────┘
                     ▼
                coordination
                     │
      ┌──────────────┼───────────────┐
      ▼              ▼               ▼
 recovery         fallback         policy
      │              │               │
      └──────────────┼───────────────┘
                     ▼
       resource / cache / preload
                     │
       ┌─────────────┼─────────────┐
       ▼             ▼             ▼
    renderer       audio       presentation
       │             │             │
       └─────────────┼─────────────┘
                     ▼
                  platform
```

这不是要求代码必须严格变成这张图，而是作为后续重构的方向。

---

# 39. 最终推荐的“一次播放”时序

```text
Application
    │
    │ create Player
    ▼
 PlayerFactory
    │
    ▼
 PlayerSession
    │
    │ SourceRequest
    ▼
 SourceService
    │
    ├── validate
    ├── inspect
    └── resolve
    │
    ▼
 ResolvedSource
    │
    ▼
 BackendSelector
    │
    ▼
 PlayerAdapter
    │
    │ initialize
    ▼
 Adapter Ready
    │
    │ PlaybackRequest
    ▼
 PlaybackController
    │
    ▼
 Operation
    │
    ▼
 TaskScheduler
    │
    ▼
 Adapter / Backend
    │
    ├──────────────► Audio
    ├──────────────► Renderer
    ├──────────────► Diagnostics
    └──────────────► EventBus

运行期间：

Visibility ──────┐
Lifecycle ────────┤
Resource ─────────┤
Policy ───────────┤
                  ▼
             Coordinator
                  │
                  ▼
          调整 Playback / Session

发生错误：

Adapter
  ↓
Error
  ↓
ErrorClassifier
  ↓
Recovery
  ↓ 失败
Fallback
  ↓
Backend/Line/Quality change
  ↓
Playback
```

---

# 40. 当前阶段最重要的结论

现在这个项目已经不是“缺少类”的问题了。

当前更大的风险是：

> **模块越来越完整，但模块之间的边界和职责可能开始重叠。**

所以后续优化不应该继续单纯增加：

```text
xxx_manager.dart
xxx_controller.dart
xxx_service.dart
xxx_state.dart
xxx_snapshot.dart
```

而应该优先检查：

1. 依赖方向
2. 职责边界
3. Operation / Task
4. Recovery / Retry / Fallback
5. Coordinator 是否过重
6. Manager / Controller / Service 的区别
7. State / Snapshot / Metrics / Event 是否重复
8. 生命周期 ownership
9. Generation / cancellation 是否完整
10. Public API 是否过度暴露

---

# 41. 后续建议的实际优化顺序

建议后续不要全项目一起改，而按以下顺序逐层收敛：

```text
Phase 1
core
identity
result
error

        ↓

Phase 2
source
factory
adapter

        ↓

Phase 3
session
playback
operation
task

        ↓

Phase 4
recovery
fallback
reconciler
policy

        ↓

Phase 5
concurrency
resource
cache
preload
pool
slot

        ↓

Phase 6
renderer
audio
presentation
geometry
visibility
lifecycle
platform

        ↓

Phase 7
coordinator
event
reactive
diagnostics
bug
recording

        ↓

Phase 8
testing
public API
文档
架构检查
```

其中每个 Phase 都应该先检查“定义和边界”，再写 Manager / Controller。

---

# 42. 一句话记忆整个 media_core

可以用下面这句话理解整个架构：

> **Player 定义是谁，Source 定义播什么，Session 定义这一轮运行，Playback 定义想做什么，Operation 定义要完成什么，Task 定义怎么执行，Adapter 定义怎么接具体播放器，Recovery 定义怎么救当前方案，Fallback 定义怎么换方案，Policy 定义怎么决策，Coordinator 定义怎么协调，Resource 定义系统还能承受多少，Renderer/Audio/Presentation 定义最终怎么输出。**

这句话可以作为以后判断新代码应该放在哪里的第一原则。
