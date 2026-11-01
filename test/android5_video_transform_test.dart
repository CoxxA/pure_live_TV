import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_core/media_core.dart';
import 'package:media_core_media_kit/media_core_media_kit.dart';

void main() {
  test('video zoom keeps the focal point fixed with the old vector_math API', () {
    final zoom = VideoZoomController();
    addTearDown(zoom.dispose);
    const focal = Offset(960, 540);
    const size = Size(1920, 1080);

    zoom.scaleBy(2.0, focal, size);
    expect(MatrixUtils.transformPoint(zoom.matrix, focal), focal);
    expect(MatrixUtils.transformPoint(zoom.matrix, Offset.zero), const Offset(-960, -540));

    zoom.panBy(const Offset(100, 50), size);
    expect(MatrixUtils.transformPoint(zoom.matrix, focal), const Offset(1060, 590));
    zoom.reset();
    expect(MatrixUtils.transformPoint(zoom.matrix, focal), focal);
  });

  test('a failed hardware attempt falls back to software on an older TV', () {
    final policy = MpvDecodePolicy.resolve(
      preferredHwdec: 'auto-safe',
      forceSoftware: true,
      codec: 'h264',
      device: const PlatformDeviceProfile(
        cpuCores: 4,
        totalRamMb: 2048,
        reported: true,
      ),
      codecs: PlatformCodecCapabilities.unknown,
    );
    expect(policy.hwdec, 'no');
    expect(policy.software, isTrue);
    expect(policy.tuneForSmallDevice, isTrue);
    expect(policy.threads, inInclusiveRange(2, 4));
  });
}
