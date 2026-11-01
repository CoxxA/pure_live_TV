/// Native platform capabilities for `media_core`.
///
/// `media_core` can describe what a *backend* supports, but only the platform
/// knows what the *device* can do: whether HEVC decodes on a dedicated block or
/// on four slow cores, how much memory is left for a decode pipeline, whether
/// the OS offers picture-in-picture at all. This package asks, once, and hands
/// the answer to the core's platform layer:
///
/// ```dart
/// final provider = await NativePlatformProvider.load();
/// kernel.attachPlatformProvider(provider);
///
/// // …and from then on every session and every adapter carries:
/// handle.session.context.platform;        // capability flags
/// adapter context: device / codecs         // what to decode, and how
/// ```
///
/// Wire protocol (the Dart side is the source of truth, the native side
/// follows it):
///
/// | direction | method | arguments | result |
/// |---|---|---|---|
/// | Dart → platform | `probe` | – | report map |
/// | Dart → platform | `acquire` | {title, text, wakeLock} | background-execution session id |
/// | Dart → platform | `release` | {id} | – |
///
/// The report map has up to four sections, every one of them optional:
///
/// ```text
/// {
///   "info":         { type, name, version, buildNumber, architecture, deviceModel, isEmulator },
///   "capabilities": { hardwareDecode, softwareDecode, pictureInPicture, backgroundPlayback, … },
///   "device":       { cpuCores, totalRamMb, lowRamDevice, supports64BitAbi },
///   "codecs":       { video: { h264: { hardware, maxWidth, maxHeight, maxFrameRate }, hevc: {…} } }
/// }
/// ```
///
/// A missing section, a missing field and a failed call all mean the same
/// thing: *unknown*. Nothing in this package ever reports "unsupported" on
/// behalf of a platform that did not answer, because a backend that believes
/// hardware decoding is unavailable when it merely was not asked will refuse
/// streams the device could play.
library;

export 'package:media_core_native/src/background_execution.dart';
export 'package:media_core_native/src/media_core_native_platform.dart';
export 'package:media_core_native/src/method_channel_media_core_native.dart';
export 'package:media_core_native/src/native_platform_provider.dart';
export 'package:media_core_native/src/platform_probe_report.dart';
