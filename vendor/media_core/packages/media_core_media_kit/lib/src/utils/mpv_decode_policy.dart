import 'package:media_core/media_core.dart';

/// What mpv should be told about decoding, and why.
///
/// The decision is a pure function of facts the adapter already has, so it can
/// be reasoned about — and tested — without an engine: what the user chose, what
/// the device can decode in hardware, how big the stream is, and whether this
/// particular open was already marked as a software retry.
///
/// Responsibilities:
///
/// - pick the `hwdec` value
/// - decide whether the software fallback tuning applies
/// - explain the choice for logs and diagnostics
///
/// It does not:
///
/// - set any property (the adapter does)
/// - know about mpv's platform profiles (the adapter resolves those first)
final class MpvDecodePolicy {
  /// Creates a policy.
  const MpvDecodePolicy({
    required this.hwdec,
    required this.software,
    required this.tuneForSmallDevice,
    required this.rationale,
    this.threads,
  });

  /// Value handed to mpv's `hwdec`.
  final String hwdec;

  /// Whether this decision decodes in software.
  final bool software;

  /// Whether the software cost tuning applies.
  ///
  /// True only for a small device decoding in software: the tuning trades
  /// sharpness for realtime playback, which is the right trade there and the
  /// wrong one anywhere else.
  final bool tuneForSmallDevice;

  /// Thread count for the software decoder, when it should be pinned.
  final int? threads;

  /// Why this policy was chosen, in one line.
  ///
  /// Carried into the adapter's diagnostics: "why did this box fall back to
  /// software" is the question every such log is read for.
  final String rationale;

  /// Whether the policy deliberately skipped a hardware decoder.
  bool get skippedHardware => software && hwdec == 'no';

  /// Chooses the policy for one `open`.
  ///
  /// Precedence:
  ///
  /// 1. an explicit software retry ([forceSoftware]) — the previous attempt
  ///    already failed, so the decision is made;
  /// 2. the resolved preference when it is already `no`;
  /// 3. the device's codec answer: a stream whose codec has no hardware decoder
  ///    on this device is decoded in software from the start, rather than
  ///    spending a failed hardware attempt on it first;
  /// 4. the resolved preference.
  ///
  /// The codec check only fires when the platform actually answered
  /// ([PlatformCodecCapabilities.canDecodeInHardware] returns null otherwise) —
  /// "nobody asked" must never read as "not supported".
  static MpvDecodePolicy resolve({
    required String preferredHwdec,
    required PlatformDeviceProfile device,
    required PlatformCodecCapabilities codecs,
    bool forceSoftware = false,
    String? codec,
    int width = 0,
    int height = 0,
  }) {
    final threads = device.isLowEnd ? device.softwareDecodeThreads : null;

    if (forceSoftware) {
      return MpvDecodePolicy(
        hwdec: 'no',
        software: true,
        tuneForSmallDevice: device.isLowEnd,
        threads: threads,
        rationale: 'previous hardware attempt failed',
      );
    }

    if (preferredHwdec == 'no') {
      return MpvDecodePolicy(
        hwdec: 'no',
        software: true,
        tuneForSmallDevice: device.isLowEnd,
        threads: threads,
        rationale: 'hardware decoding disabled',
      );
    }

    final hardware = codecs.canDecodeCodecName(codec, width: width, height: height);

    if (hardware == false) {
      return MpvDecodePolicy(
        hwdec: 'no',
        software: true,
        tuneForSmallDevice: device.isLowEnd,
        threads: threads,
        rationale: 'device has no hardware decoder for $codec',
      );
    }

    return MpvDecodePolicy(
      hwdec: preferredHwdec,
      software: false,
      tuneForSmallDevice: false,
      threads: null,
      rationale: hardware == null ? 'no codec report for $codec' : 'hardware decode available',
    );
  }

  @override
  String toString() {
    return 'MpvDecodePolicy(hwdec: $hwdec, threads: $threads, rationale: $rationale)';
  }
}
