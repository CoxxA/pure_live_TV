import 'package:flutter_test/flutter_test.dart';
import 'package:pure_live/shared/utils/android5_update_policy.dart';
import 'package:pure_live/shared/utils/version_util.dart';

void main() {
  const version = '3.0.7-android5.1';
  const name = 'PureLive-TV-android5-armeabi-v7a-skia.apk';
  const origin =
      'https://github.com/CoxxA/pure_live_TV/releases/download/v$version/$name';

  test(
    'orders compatibility revisions without advertising upstream packages',
    () {
      expect(
        isNewerAndroid5Version('3.0.7-android5.10', '3.0.7-android5.2'),
        isTrue,
      );
      expect(isNewerAndroid5Version('v3.0.8-android5.1', version), isTrue);
      expect(isNewerAndroid5Version(version, version), isFalse);
      expect(isNewerAndroid5Version('3.1.0', version), isFalse);
      expect(isNewerAndroid5Version('3.1.0-beta.1', version), isFalse);
      expect(isAndroid5Version('3.0.7-android5.1/other'), isFalse);
    },
  );

  test(
    'requires the fork, compatibility tag, matching version and Skia asset name',
    () {
      expect(isAndroid5Asset(name, origin, version: version), isTrue);
      expect(
        isAndroid5Asset(name, origin, version: '3.0.7-android5.2'),
        isFalse,
      );
      expect(
        isAndroid5Asset(name, origin.replaceFirst('/CoxxA/', '/liuchuancong/')),
        isFalse,
      );
      expect(
        isAndroid5Asset(name, origin.replaceFirst('-android5.1', '')),
        isFalse,
      );
      expect(
        isAndroid5Asset(
          name,
          origin.replaceFirst('github.com/', 'github.com.example/'),
        ),
        isFalse,
      );
      expect(
        isAndroid5Asset(name, origin.replaceFirst('https:', 'http:')),
        isFalse,
      );
      expect(isAndroid5Asset(name, '$origin?redirect=other.apk'), isFalse);
      expect(
        isAndroid5Asset(name, origin.replaceAll('-skia.apk', '-impeller.apk')),
        isFalse,
      );
      expect(
        isAndroid5Asset(name, origin.replaceAll('armeabi-v7a', 'x86_64')),
        isFalse,
      );
    },
  );

  test('assembles only compatibility ARM packages', () {
    const urls = ReleaseAssetUrls(
      projectUrl: 'https://github.com/CoxxA/pure_live_TV',
      version: version,
    );
    expect(urls.apkForAbi('armeabi-v7a'), origin);
    expect(
      urls.apkForAbi('arm64-v8a', renderer: 'impeller'),
      contains('android5-arm64-v8a-skia.apk'),
    );
    expect(urls.apkForAbi('x86_64'), isEmpty);
    expect(
      const ReleaseAssetUrls(
        projectUrl: 'https://github.com/CoxxA/pure_live_TV',
        version: '3.0.7',
      ).isValid,
      isFalse,
    );
    expect(
      const ReleaseAssetUrls(
        projectUrl: 'https://github.com/liuchuancong/pure_live_TV',
        version: version,
      ).isValid,
      isFalse,
    );
  });

  test('the manifest ABI list cannot offer emulator packages', () {
    expect(
      VersionUtil.selectAndroidAbis({
        'android_abis': ['armeabi-v7a', 'x86_64', 'arm64-v8a'],
      }),
      {'armeabi-v7a', 'arm64-v8a'},
    );
  });

  test(
    'selects the system ABI rather than guessing from the television model',
    () {
      expect(preferredAndroid5Abi(['armeabi-v7a', 'armeabi']), 'armeabi-v7a');
      expect(preferredAndroid5Abi(['arm64-v8a', 'armeabi-v7a']), 'arm64-v8a');
      expect(preferredAndroid5Abi(['x86_64']), isNull);
    },
  );
}
