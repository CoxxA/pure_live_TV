import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:hive_ce/hive.dart';
import 'package:pure_live/features/settings/pages/app_download_page.dart';
import 'package:pure_live/services/app_update/app_update_service.dart';
import 'package:pure_live/services/settings/settings.dart';
import 'package:pure_live/shared/models/release_model/release_model.dart';
import 'package:pure_live/shared/theme/index.dart';
import 'package:pure_live/shared/utils/hive_pref_util.dart';

/// Renders [AppDownloadPage] (the 当前版本 download page) to PNGs — top with
/// the per-ABI 下载源 grid, bottom with the markdown release notes.
///
/// Run: flutter test test/app_download_page_preview_test.dart
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final Directory dir = Directory.systemTemp.createTempSync(
      'pure_live_download_preview',
    );
    Hive.init(dir.path);
    await HivePrefUtil.init();
    SettingsService.to.init(ProviderContainer());
  });

  testWidgets('render download page preview', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // The app now defaults to the platform font; no bundled MiSans fixture is
    // part of a fresh installation. Keep the preview on that default path.
    const String version = '3.0.7-android5.1';
    const String origin =
        'https://github.com/CoxxA/pure_live_TV/releases/download/v$version';
    final fake = _FakeUpdateController(
      AppUpdateState(
        phase: AppUpdatePhase.available,
        currentVersion: '3.0.7-android5.0',
        currentBuild: '1000',
        latestVersion: version,
        changelog: '修复了 A\n新增了 B',
        changelogMarkdown:
            '# v$version 更新日志\n\n- 修复了**在线更新**在部分电视盒子上的下载失败问题\n- 支持 `下载源` 选择\n- 优化弹幕渲染性能\n\n> Android 5 使用系统设置中的未知来源选项。',
        abis: ['arm64-v8a', 'armeabi-v7a'],
        history: [
          ReleaseModel(
            version: version,
            date: '2026-11-01',
            author: const AuthorModel(),
            files: [
              ReleaseFileModel(
                name: 'PureLive-TV-android5-arm64-v8a-skia.apk',
                size: '42.5 MB',
                url: '$origin/PureLive-TV-android5-arm64-v8a-skia.apk',
              ),
              ReleaseFileModel(
                name: 'PureLive-TV-android5-armeabi-v7a-skia.apk',
                size: '39.1 MB',
                url: '$origin/PureLive-TV-android5-armeabi-v7a-skia.apk',
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appUpdateControllerProvider.overrideWith(() => fake)],
        child: ez.EasyLocalization(
          supportedLocales: const [Locale('zh'), Locale('en')],
          path: 'assets/translations',
          fallbackLocale: const Locale('zh'),
          startLocale: const Locale('zh'),
          useOnlyLangCode: true,
          child: ScreenUtilPlusInit(
            designSize: const Size(1920, 1080),
            autoRebuild: false,
            minTextAdapt: false,
            splitScreenMode: false,
            child: MaterialApp(
              locale: const Locale('zh'),
              theme: ThemeData(
                extensions: <ThemeExtension<dynamic>>[
                  TvThemeExtension(theme: blueTvTheme),
                ],
              ),
              home: const RepaintBoundary(
                key: Key('dl-page'),
                child: AppDownloadPage(),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      tester.takeException(),
      isNull,
      reason: 'the download layout must not overflow',
    );
    expect(find.text('42.5 MB'), findsOneWidget);
    expect(find.text('39.1 MB'), findsOneWidget);

    final Directory out = Directory('build/test-previews/app-download')
      ..createSync(recursive: true);

    Future<void> snap(String file) async {
      await tester.runAsync(() async {
        final RenderRepaintBoundary boundary = tester
            .renderObject<RenderRepaintBoundary>(
              find.byKey(const Key('dl-page')),
            );
        final ui.Image image = await boundary.toImage();
        expect(image.width, 1920);
        expect(image.height, 1080);
        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        expect(data, isNotNull);
        expect(data!.lengthInBytes, greaterThan(0));
        File('${out.path}/$file').writeAsBytesSync(data.buffer.asUint8List());
        image.dispose();
      });
    }

    await snap('download_page_top.png');

    // Bottom of the page: the markdown release notes.
    final scroller = find.byType(Scrollable).first;
    await tester.drag(scroller, const Offset(0, -800));
    await tester.pumpAndSettle();
    expect(
      tester.takeException(),
      isNull,
      reason: 'the scrolled notes layout must not overflow',
    );
    await snap('download_page_bottom.png');
  });
}

class _FakeUpdateController extends AppUpdateController {
  _FakeUpdateController(this.initial);

  final AppUpdateState initial;

  @override
  AppUpdateState build() => initial;

  @override
  Future<void> loadHistory() async {}

  @override
  Future<bool> downloadAsset(String url, {bool preferGivenUrl = false}) async =>
      false;
}
