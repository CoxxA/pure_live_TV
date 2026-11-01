# 纯粹直播 TV · Android 5 兼容版

这是 [liuchuancong/pure_live_TV](https://github.com/liuchuancong/pure_live_TV) 的独立兼容分支，以 **v3.0.7** 为基线，为 **小米 L55M4-AA / Android 5.1.1（API22）** 制作。

**状态：预览测试中，尚未达到稳定播放标准。** 已在小米 L55M4-AA / Android 5.1.1 的 32 位系统安装、启动并播放斗鱼、B站、抖音，收藏及重新启动已验证。首版自动检查的 224 项测试、签名与 API22 模拟器启动均通过。真机反馈：MPV / IJK 默认模式有明显卡顿及音画不同步；MPV 开启兼容模式后声音同步，但 720P 仍有轻微掉帧，正在继续修复。

## 功能与兼容取舍

- 保留新版界面、平台解析、搜索、收藏、历史、弹幕、IPTV 与手机网页遥控。
- 优先验证 **斗鱼、B站、抖音**；平台登录与高清观看仍受各平台账号和接口限制。
- 使用 **Skia** 渲染器，播放内核保留 **MPV / IJK**，移除 FVP / Exo；视频壁纸默认关闭，可使用静态壁纸。
- 第二个预览版默认开启 MPV 兼容模式；IJK 关闭未使用的截图功能，避免强制额外 GLES 渲染。保留清晰度及软硬解切换。已有的手动设置会保留。
- 修复对话框输入焦点和部分浅色主题的文字对比度，并通过原有回归测试。
- 独立包名：`com.coxxa.purelive.tv.android5`；应用名称：**纯粹直播 TV（安卓5兼容版）**。
- 可与原来的 v2.0.20 并行安装。首次测试请保留旧版，收藏与设置可以通过应用内备份/恢复迁移。

## 安装与验证

前往 [本分叉的 Releases](https://github.com/CoxxA/pure_live_TV/releases)，只下载标签带 `-android5.` 的兼容预览版。

| 安装包 | 系统架构 |
| --- | --- |
| `PureLive-TV-android5-armeabi-v7a-skia.apk` | 32 位 ARM |
| `PureLive-TV-android5-arm64-v8a-skia.apk` | 64 位 ARM |

不能仅根据“64 位处理器”判断 Android 系统位数。若已启用 ADB，可用 `adb shell getprop ro.product.cpu.abilist` 确认；应用内更新也会读取系统支持的 ABI。

下载后对照同一 Release 的 `SHA256SUMS` 校验文件。通过 U 盘或已有的 ADB 工具侧载，在电视系统设置中允许安装未知来源应用。Android 5 使用系统级未知来源设置，不需要 Android 8 的逐应用安装授权。

请重点检查以下场景，并记录使用的 APK 架构、内核和清晰度：

1. 安装、首次启动、遥控器方向键 / 确认 / 返回。
2. 斗鱼、B站、抖音各搜索一个正在直播的房间，验证画面与声音。
3. 切换清晰度、切换房间、开启和关闭弹幕、收藏房间。
4. 连续播放至少 10 分钟，再退出和重新启动。
5. 若出现黑屏或花屏，切换 MPV / IJK、软硬解或较低清晰度后再验证。

遇到闪退，请提供应用内日志；若可以使用 ADB，可在复现后保存 `adb logcat -d`。日志中可能含直播地址和账号信息，分享前请删去 Cookie 等凭据。

## 固定构建环境

| 项目 | 版本 |
| --- | --- |
| Flutter / Dart | 3.32.8 / 3.8.1 |
| Java | 17 |
| Gradle / AGP / Kotlin | 8.12 / 8.7.3 / 2.1.0 |
| 最低系统 / compileSdk / targetSdk | 21 / 35 / 35 |
| media_kit / media_kit_video | 1.2.0 / 1.3.0 |
| media_kit_libs_video / Android 库 | 1.0.6 / 1.3.7 |

```sh
flutter pub get --enforce-lockfile
dart run build_runner build --delete-conflicting-outputs
flutter analyze --no-fatal-infos
flutter test --concurrency=2
flutter build apk --release --flavor skia --split-per-abi --target-platform android-arm,android-arm64
```

`pubspec.lock` 必须随兼容修改一起提交，避免后续解析到要求更高 Android / Flutter 版本的传递依赖。项目所需的 `media_core` 子包随兼容分支保存，其接口在适配层兼容旧版播放依赖。

## 自动构建与签名

`android5-compat` 分支推送或手动运行 **Android 5 compatibility** workflow，会执行代码检查、相关测试和 APK 构建。随后在 API22 x86_64 模拟器上侧载并启动测试包，保存启动截图与 logcat；x86_64 包只用于模拟器验证，不放入面向电视的 Release。

在仓库 Actions Secrets 中配置独立、长期保留的签名材料：

- `KEYSTORE_BASE64`：JKS 文件的 Base64 内容。
- `STORE_PASSWORD`：密钥库密码。
- `KEY_PASSWORD`：签名密钥密码。
- `KEY_ALIAS`：签名别名。

私钥和 `android/key.properties` 不应提交到源码。缺少任一签名 Secret 时，APK job 会明确失败，不会把临时 debug 签名包作为兼容版本发布。请保存签名材料的私密备份；后续覆盖升级需要使用同一签名。

推送标签 **`v3.0.7-android5.1`**（后续递增兼容修订号和 `versionCode`），只有构建、签名检查、API22 启动检查通过后才发布预览 Release。Release 提供 ARM32 / ARM64 APK 与 SHA256，构建页另外保留包信息、签名报告和模拟器证据。

在线更新只读取 **CoxxA/pure_live_TV 的 android5-compat 分支**，仅接受匹配版本的兼容标签和 ARM Skia 包；不会回退下载上游 Android 7+ 安装包。发布后的索引 workflow 会更新 `assets/version.json` 与 `assets/releases.json`。

## 上游与许可

感谢原项目及其依赖的作者。本分支保留原项目 [LICENSE](LICENSE) 和原有版权声明。原项目说明、贡献者及完整功能介绍见 [上游仓库](https://github.com/liuchuancong/pure_live_TV)。
