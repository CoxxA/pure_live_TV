import 'package:media_core/media_core.dart';

import 'package:media_core_native/src/media_core_native_platform.dart';
import 'package:media_core_native/src/platform_probe_report.dart';

/// [PlatformProvider] backed by the platform's own capability probe.
///
/// This is what turns `media_core`'s platform layer from a declaration into a
/// fact. Attach it once and every player created afterwards carries the real
/// answers:
///
/// ```dart
/// final provider = await NativePlatformProvider.load();
/// kernel.attachPlatformProvider(provider);
/// ```
///
/// Responsibilities:
///
/// - run the probe once and cache it
/// - answer [PlatformProvider]'s questions from the report
///
/// It does not:
///
/// - decide anything from the answers (engines and policies do)
/// - block on a missing platform implementation: a probe that cannot run
///   resolves to [PlatformProbeReport.unknown], which reports itself as
///   unreported rather than as a healthy device.
final class NativePlatformProvider implements PlatformProvider {
  NativePlatformProvider._(this._report, {required bool ready}) : _ready = ready;

  /// A provider that has not probed anything yet.
  ///
  /// Attach this to keep the previous behaviour (optimistic defaults):
  /// every answer is the "unknown" one.
  factory NativePlatformProvider.unreported() => NativePlatformProvider._(PlatformProbeReport.unknown, ready: false);

  /// Probes the platform and caches the result.
  ///
  /// [platform] exists for tests and for a host that installs its own probe
  /// implementation; production callers omit it.
  static Future<NativePlatformProvider> load({MediaCoreNativePlatform? platform}) async {
    final report = await (platform ?? MediaCoreNativePlatform.instance).probe();

    return NativePlatformProvider._(report, ready: report.isReported);
  }

  PlatformProbeReport _report;
  bool _ready;

  /// The last report.
  PlatformProbeReport get report => _report;

  @override
  PlatformType get type => _report.info.type;

  @override
  PlatformInfo get info => _report.info;

  @override
  PlatformCapabilities get capabilities => _report.capabilities;

  @override
  PlatformDeviceProfile get device => _report.device;

  @override
  PlatformCodecCapabilities get codecs => _report.codecs;

  /// Whether a probe produced this report.
  ///
  /// False means every answer above is the unknown one; a host can render that
  /// in a diagnostics screen instead of pretending the device was inspected.
  @override
  bool get isReady => _ready;

  /// Runs the probe again, replacing the cached report.
  ///
  /// For a host that offers a "re-check this device" action — after a plugin
  /// was installed, or after the user changed a system setting.
  Future<void> refresh({MediaCoreNativePlatform? platform}) async {
    final report = await (platform ?? MediaCoreNativePlatform.instance).probe();

    _report = report;
    _ready = report.isReported;
  }

  /// Whether the *device* can hardware-decode [codec] at [width]x[height].
  ///
  /// A convenience over [codecs] that keeps the null-is-unknown rule visible at
  /// the call site: null means the platform has no answer, which a caller
  /// should treat as "let the engine try".
  bool? canHardwareDecode(VideoCodec codec, {int width = 0, int height = 0}) {
    return codecs.canDecodeInHardware(codec, width: width, height: height);
  }

  @override
  String toString() {
    return 'NativePlatformProvider('
        'ready: $isReady, '
        'platform: ${type.value}, '
        'codecs: ${codecs.hardwareCodecs.map((codec) => codec.name).join('/')}'
        ')';
  }
}
