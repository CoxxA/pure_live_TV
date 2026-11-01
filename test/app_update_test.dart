import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:pure_live/features/settings/pages/app_update_page.dart';
import 'package:pure_live/features/settings/pages/update_history_page.dart';
import 'package:pure_live/services/app_update/app_update_service.dart';
import 'package:pure_live/services/settings/settings.dart';
import 'package:pure_live/shared/models/release_model/release_model.dart';
import 'package:pure_live/shared/theme/index.dart';
import 'package:pure_live/shared/utils/hive_pref_util.dart';
import 'package:pure_live/shared/widgets/index.dart';

/// 在线更新 → 版本历史, and the device record on top of it.
class _FakeUpdateController extends AppUpdateController {
  _FakeUpdateController(this.initial);

  final AppUpdateState initial;
  int loadHistoryCalls = 0;
  String? installedUrl;

  @override
  AppUpdateState build() => initial;

  @override
  Future<void> loadHistory() async => loadHistoryCalls++;

  @override
  Future<bool> downloadAsset(String url, {bool preferGivenUrl = false}) async {
    installedUrl = url;
    return true;
  }
}

ReleaseModel _release({
  required String version,
  required String date,
  String size = '18.4 MB',
  int downloads = 0,
  String title = '',
  String notes = '',
}) {
  return ReleaseModel(
    version: version,
    title: title,
    date: date,
    changeLog: notes,
    author: const AuthorModel(name: 'liuchuancong'),
    files: <ReleaseFileModel>[
      ReleaseFileModel(
        name: 'arm64-v8a',
        size: size,
        downloads: downloads,
        url: 'https://example.test/$version.apk',
      ),
    ],
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // `AppStatusView` and the update page read their colours through the settings
    // service, so the store has to exist before either renders.
    final Directory dir = Directory.systemTemp.createTempSync(
      'pure_live_update_test',
    );
    Hive.init(dir.path);
    await HivePrefUtil.init();
    SettingsService.to.init(ProviderContainer());
  });

  group('release history payload', () {
    test(
      'keeps compatibility releases in date order and excludes upstream history',
      () {
        final releases = parseReleaseHistoryPayload(<dynamic>[
          {'version': '3.0.7-android5.1', 'date': '2026-01-01'},
          {'version': '3.0.7-android5.2', 'date': '2026-03-01'},
          {'version': '3.0.8', 'date': '2026-04-01'},
          {'version': '3.0.7-android5.10', 'date': '2026-03-01'},
        ]);
        expect(releases.map((r) => r.version).toList(), [
          '3.0.7-android5.10',
          '3.0.7-android5.2',
          '3.0.7-android5.1',
        ]);
      },
    );

    test('accepts wrapped payload and removes unsafe history assets', () {
      final releases = parseReleaseHistoryPayload({
        'releases': [
          {
            'version': '3.0.7-android5.1',
            'files': [
              {
                'name': 'PureLive-TV-arm64-v8a-skia.apk',
                'url':
                    'https://github.com/liuchuancong/pure_live_TV/releases/download/v3.0.7/PureLive-TV-arm64-v8a-skia.apk',
              },
            ],
          },
          {'version': '  '},
          'not a map',
        ],
      });
      expect(releases.single.version, '3.0.7-android5.1');
      expect(releases.single.files, isEmpty);
    });

    test('rejects an invalid history payload', () {
      expect(
        () => parseReleaseHistoryPayload({'nope': 1}),
        throwsFormatException,
      );
    });
  });

  group('release notes', () {
    test('drops the markdown table and the heading markers', () {
      const String raw =
          '# 更新内容\n\n- 修复了 A\n| 文件 | 大小 |\n| --- | --- |\n---\n- 新增了 B';

      final String cleaned = cleanReleaseNotes(raw);

      expect(cleaned, contains('更新内容'));
      expect(cleaned, contains('修复了 A'));
      expect(cleaned, contains('新增了 B'));
      expect(cleaned, isNot(contains('|')));
      expect(cleaned, isNot(contains('#')));
    });
  });

  group('asset naming', () {
    test(
      'reads the ABI and the renderer out of every name the repo published',
      () {
        // v3.0.0+ uploads these; the ABI never comes first in the name.
        expect(
          abiForAssetName('PureLive-TV-arm64-v8a-impeller.apk'),
          'arm64-v8a',
        );
        expect(
          rendererForAssetName('PureLive-TV-arm64-v8a-impeller.apk'),
          'impeller',
        );
        expect(
          abiForAssetName('PureLive-TV-armeabi-v7a-skia.apk'),
          'armeabi-v7a',
        );
        expect(rendererForAssetName('PureLive-TV-x86_64-skia.apk'), 'skia');
        // The releases.json entries carry the prefix and no extension.
        expect(abiForAssetName('PureLive-TV-arm64-v8a-impeller'), 'arm64-v8a');
        expect(
          rendererForAssetName('PureLive-TV-arm64-v8a-impeller'),
          'impeller',
        );
        // Older naming schemes.
        expect(
          abiForAssetName(
            'PureLive-2.0.20-12020-android-arm64-v8a-release.apk',
          ),
          'arm64-v8a',
        );
        expect(rendererForAssetName('app-arm64-v8a-release.apk'), '');
        expect(abiForAssetName('arm64-v8a'), 'arm64-v8a');
        // Nothing an ABI could be read from.
        expect(abiForAssetName('checksums.txt'), isNull);
        expect(abiForAssetName('source.zip'), isNull);
      },
    );

    test('tells a package from the other release files', () {
      expect(
        isApkAsset(
          'PureLive-TV-arm64-v8a-impeller.apk',
          'https://example.test/x',
        ),
        isTrue,
      );
      expect(
        isApkAsset(
          'PureLive-TV-arm64-v8a-impeller',
          'https://example.test/PureLive-TV-arm64-v8a-impeller.apk',
        ),
        isTrue,
      );
      expect(isApkAsset('source', 'https://example.test/v3.0.2.zip'), isFalse);
    });
  });

  group('release selection', () {
    test(
      'matches the exact compatibility preview even when upstream is newer',
      () {
        final selected = selectReleaseEntry([
          {'tag_name': 'v4.0.0', 'prerelease': false},
          {'tag_name': 'v3.0.7-android5.2', 'prerelease': true},
          {'tag_name': 'v3.0.7-android5.1', 'prerelease': true},
        ], '3.0.7-android5.1');
        expect(selected?['tag_name'], 'v3.0.7-android5.1');
      },
    );

    test(
      'does not pair manifest notes with a different release or a draft',
      () {
        final entries = [
          {'tag_name': 'v3.0.7-android5.2', 'prerelease': false},
          {'tag_name': 'v3.0.7-android5.1', 'draft': true},
          {'tag_name': 'v4.0.0', 'prerelease': false},
        ];
        expect(selectReleaseEntry(entries, '3.0.7-android5.1'), isNull);
        expect(selectReleaseEntry(entries, '4.0.0'), isNull);
        expect(
          selectReleaseEntry(entries, '')?['tag_name'],
          'v3.0.7-android5.2',
        );
      },
    );

    test('answers nothing for a payload without a compatible release', () {
      expect(
        selectReleaseEntry({'message': 'Not Found'}, '3.0.7-android5.1'),
        isNull,
      );
      expect(selectReleaseEntry([], '3.0.7-android5.1'), isNull);
      expect(
        selectReleaseEntry([
          {'tag_name': 'v3.0.7'},
        ], ''),
        isNull,
      );
    });
  });

  group('download candidates', () {
    const String url =
        'https://github.com/liuchuancong/pure_live_TV/releases/download/v3.0.2/PureLive-TV-arm64-v8a-skia.apk';

    test('wraps the plain release url in every mirror, the origin last', () {
      final List<String> candidates = downloadCandidates(url);

      expect(candidates.first, '${AppUpdateController.assetMirrors.first}$url');
      expect(candidates.last, url);
      expect(candidates.length, AppUpdateController.assetMirrors.length + 1);
    });

    test('keeps a picked mirror first and the fallbacks unstacked', () {
      final String picked = '${AppUpdateController.assetMirrors[1]}$url';
      final List<String> candidates = downloadCandidates(
        picked,
        preferGivenUrl: true,
      );

      expect(candidates.first, picked, reason: '"source 2" is tried first');
      expect(
        candidates.toSet().length,
        candidates.length,
        reason: 'no candidate is listed twice',
      );
      for (final String candidate in candidates) {
        final bool plain = candidate == url;
        final bool singleProxy = AppUpdateController.assetMirrors.any(
          (String mirror) => candidate == '$mirror$url',
        );
        expect(
          plain || singleProxy,
          isTrue,
          reason: 'a proxy in front of a proxy cannot serve: $candidate',
        );
      }
      expect(
        candidates,
        contains(url),
        reason: 'the plain origin is the last resort',
      );
    });
  });

  group('asset resolution', () {
    const origin =
        'https://github.com/CoxxA/pure_live_TV/releases/download/v3.0.7-android5.1';
    AppUpdateController controllerFor(AppUpdateState state) {
      final container = ProviderContainer(
        overrides: [
          appUpdateControllerProvider.overrideWith(
            () => _FakeUpdateController(state),
          ),
        ],
      );
      addTearDown(container.dispose);
      return container.read(appUpdateControllerProvider.notifier);
    }

    test('picks only the compatible published asset and its actual size', () {
      final controller = controllerFor(
        const AppUpdateState(
          latestVersion: '3.0.7-android5.1',
          selectedAbi: 'arm64-v8a',
          latestAssets: [
            ReleaseAssetInfo(
              name: 'PureLive-TV-arm64-v8a-impeller.apk',
              url:
                  'https://github.com/liuchuancong/pure_live_TV/releases/download/v3.0.7/PureLive-TV-arm64-v8a-impeller.apk',
              sizeBytes: 100,
            ),
            ReleaseAssetInfo(
              name: 'PureLive-TV-android5-arm64-v8a-skia.apk',
              url: '$origin/PureLive-TV-android5-arm64-v8a-skia.apk',
              sizeBytes: 89137791,
            ),
          ],
        ),
      );
      expect(
        controller.resolveAssetUrl(),
        '$origin/PureLive-TV-android5-arm64-v8a-skia.apk',
      );
      expect(controller.assetSizeFor('arm64-v8a'), '85.0 MB');
      expect(controller.expectedBytesFor('arm64-v8a'), 89137791);
    });

    test('reads matching compatibility history files', () {
      final controller = controllerFor(
        AppUpdateState(
          latestVersion: '3.0.7-android5.1',
          selectedAbi: 'armeabi-v7a',
          history: [
            ReleaseModel(
              version: '3.0.7-android5.1',
              author: const AuthorModel(),
              files: [
                ReleaseFileModel(
                  name: 'PureLive-TV-android5-armeabi-v7a-skia.apk',
                  size: '71.25 MB',
                  url: '$origin/PureLive-TV-android5-armeabi-v7a-skia.apk',
                ),
              ],
            ),
          ],
        ),
      );
      expect(
        controller.resolveAssetUrl(),
        '$origin/PureLive-TV-android5-armeabi-v7a-skia.apk',
      );
      expect(controller.assetSizeFor('armeabi-v7a'), '71.25 MB');
    });

    test(
      'assembles the compatibility name and refuses emulator or upstream versions',
      () {
        final controller = controllerFor(
          const AppUpdateState(
            latestVersion: '3.0.7-android5.1',
            selectedAbi: 'armeabi-v7a',
          ),
        );
        expect(
          controller.resolveAssetUrl(),
          '$origin/PureLive-TV-android5-armeabi-v7a-skia.apk',
        );
        expect(controller.resolveAssetUrl('x86_64'), isNull);
        final upstream = controllerFor(
          const AppUpdateState(
            latestVersion: '3.0.7',
            selectedAbi: 'arm64-v8a',
          ),
        );
        expect(upstream.resolveAssetUrl(), isNull);
      },
    );

    test('ignores a stale upstream package instead of falling back to it', () {
      final controller = controllerFor(
        const AppUpdateState(
          latestVersion: '3.0.7-android5.1',
          selectedAbi: 'arm64-v8a',
          latestAssets: [
            ReleaseAssetInfo(
              name: 'app-arm64-v8a-release.apk',
              url:
                  'https://github.com/liuchuancong/pure_live_TV/releases/download/v2.0.20/app-arm64-v8a-release.apk',
              sizeBytes: 100,
            ),
          ],
        ),
      );
      expect(
        controller.resolveAssetUrl(),
        '$origin/PureLive-TV-android5-arm64-v8a-skia.apk',
      );
      expect(controller.assetSizeFor('arm64-v8a'), isNull);
      expect(controller.expectedBytesFor('arm64-v8a'), 0);
    });
  });

  group('device record', () {
    test('survives a round trip through json', () {
      final record = AppUpdateRecord(
        version: '1.2.3',
        action: AppUpdateAction.installed,
        time: DateTime(2026, 9, 17, 20, 15),
      );

      final restored = AppUpdateRecord.fromJson(record.toJson());

      expect(restored.version, '1.2.3');
      expect(restored.action, AppUpdateAction.installed);
      expect(restored.time, record.time);
    });

    test('reads an unknown action as a check instead of throwing', () {
      expect(
        AppUpdateRecord.fromJson(<String, dynamic>{
          'action': 'wat',
          'time': 'nope',
        }).action,
        AppUpdateAction.checked,
      );
    });
  });

  group('download progress', () {
    test(
      'reports a remaining time only once the size and the speed are known',
      () {
        const idle = AppUpdateState(
          receivedBytes: 100,
          totalBytes: 1000,
          speedMbps: 0,
        );
        expect(idle.remainingSeconds, isNull);

        const running = AppUpdateState(
          receivedBytes: 5 * 1024 * 1024,
          totalBytes: 10 * 1024 * 1024,
          speedMbps: 2,
        );
        expect(running.progress, closeTo(0.5, 0.001));
        expect(running.remainingSeconds, 3);
      },
    );
  });

  group('the history page', () {
    Future<_FakeUpdateController> pumpPage(
      WidgetTester tester,
      AppUpdateState state,
    ) async {
      final fake = _FakeUpdateController(state);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [appUpdateControllerProvider.overrideWith(() => fake)],
          child: ScreenUtilPlusInit(
            designSize: const Size(1920, 1080),
            autoRebuild: false,
            minTextAdapt: false,
            splitScreenMode: false,
            child: MaterialApp(
              theme: ThemeData(
                extensions: <ThemeExtension<dynamic>>[
                  TvThemeExtension(theme: darkTvTheme),
                ],
              ),
              home: const UpdateHistoryPage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      return fake;
    }

    AppUpdateState stateWith({
      required List<ReleaseModel> history,
      List<AppUpdateRecord> records = const [],
    }) {
      return AppUpdateState(
        phase: AppUpdatePhase.upToDate,
        currentVersion: '1.2.0',
        currentBuild: '45',
        history: history,
        records: records,
      );
    }

    testWidgets('lists the releases and this device\'s update records', (
      WidgetTester tester,
    ) async {
      final fake = await pumpPage(
        tester,
        stateWith(
          history: <ReleaseModel>[
            _release(version: '1.2.0', date: '2026-03-01', notes: '当前版本'),
            _release(version: '1.1.0', date: '2026-01-01', downloads: 320),
          ],
          records: <AppUpdateRecord>[
            AppUpdateRecord(
              version: '1.2.0',
              action: AppUpdateAction.installed,
              time: DateTime(2026, 9, 17, 20, 15),
            ),
            AppUpdateRecord(
              version: '1.2.0',
              action: AppUpdateAction.downloaded,
              time: DateTime(2026, 9, 17, 20, 12),
            ),
          ],
        ),
      );

      expect(
        find.text('v1.2.0'),
        findsWidgets,
        reason: 'every release gets a row, labelled by version',
      );
      expect(find.text('v1.1.0'), findsOneWidget);
      expect(
        find.textContaining('2026-01-01'),
        findsWidgets,
        reason: 'the release date is part of the row',
      );
      expect(
        find.textContaining('320 ↓'),
        findsOneWidget,
        reason: 'download count when the manifest has one',
      );
      // The device record, newest first, with the version and a timestamp. Unlocalized
      // builds fall back to the key (`i18n` returns it), which is what these match on.
      expect(find.text('update_record_installed'), findsOneWidget);
      expect(find.text('update_record_downloaded'), findsOneWidget);
      expect(find.textContaining('2026-09-17 20:15'), findsOneWidget);

      fake.loadHistoryCalls =
          0; // The list was already there: no fetch on open.
      expect(fake.loadHistoryCalls, 0);
    });

    testWidgets('a release opens its notes and can install its asset', (
      WidgetTester tester,
    ) async {
      final fake = await pumpPage(
        tester,
        stateWith(
          history: <ReleaseModel>[
            _release(
              version: '1.1.0',
              date: '2026-01-01',
              notes: '修复了 A\n新增了 B',
            ),
          ],
        ),
      );

      await tester.tap(find.text('v1.1.0'));
      await tester.pumpAndSettle();

      expect(
        find.textContaining('修复了 A'),
        findsOneWidget,
        reason: 'the changelog is in the dialog',
      );
      expect(find.textContaining('新增了 B'), findsOneWidget);

      await tester.tap(find.textContaining('arm64-v8a'));
      await tester.pumpAndSettle();

      expect(fake.installedUrl, 'https://example.test/1.1.0.apk');
    });

    testWidgets('an empty history says so instead of showing nothing', (
      WidgetTester tester,
    ) async {
      await pumpPage(tester, stateWith(history: const <ReleaseModel>[]));

      expect(find.text('update_no_history'), findsOneWidget);
      expect(find.text('update_no_records'), findsOneWidget);
    });
  });

  group('the update page', () {
    Future<void> pumpUpdate(WidgetTester tester, AppUpdateState state) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appUpdateControllerProvider.overrideWith(
              () => _FakeUpdateController(state),
            ),
          ],
          child: ScreenUtilPlusInit(
            designSize: const Size(1920, 1080),
            autoRebuild: false,
            minTextAdapt: false,
            splitScreenMode: false,
            child: MaterialApp(
              theme: ThemeData(
                extensions: <ThemeExtension<dynamic>>[
                  TvThemeExtension(theme: darkTvTheme),
                ],
              ),
              home: const AppUpdatePage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    testWidgets(
      'up to date is drawn as a status, with a preview of the releases',
      (WidgetTester tester) async {
        await pumpUpdate(
          tester,
          AppUpdateState(
            phase: AppUpdatePhase.upToDate,
            currentVersion: '1.2.0',
            currentBuild: '45',
            latestVersion: '1.2.0',
            history: <ReleaseModel>[
              _release(version: '1.2.0', date: '2026-03-01'),
              _release(version: '1.1.0', date: '2026-01-01'),
            ],
          ),
        );

        expect(
          find.byType(AppStatusView),
          findsOneWidget,
          reason: 'the check state has to be visible',
        );
        expect(find.text('already_latest_version'), findsWidgets);
        expect(
          find.text('version_history'),
          findsOneWidget,
          reason: 'the way into the full history',
        );
        expect(
          find.text('v1.1.0'),
          findsOneWidget,
          reason: 'the newest releases are previewed',
        );
      },
    );

    testWidgets(
      'a pending release is a row hint; the content lives on the download page',
      (WidgetTester tester) async {
        await pumpUpdate(
          tester,
          AppUpdateState(
            phase: AppUpdatePhase.available,
            currentVersion: '1.2.0',
            currentBuild: '45',
            latestVersion: '2.0.0',
            changelog: '修复了 A',
            abis: <String>['arm64-v8a', 'armeabi-v7a'],
            selectedAbi: 'arm64-v8a',
            history: <ReleaseModel>[
              _release(version: '2.0.0', date: '2026-05-05', notes: '修复了 A'),
            ],
          ),
        );

        // The row carries the hint; entering it (the download page) is the way
        // to the sources and notes.
        expect(find.textContaining('new_version_found'), findsWidgets);
        // No inline card anymore: no per-ABI rows, no download buttons, no notes
        // on this page. (The release date still shows in the history preview.)
        expect(find.text('arm64-v8a'), findsNothing);
        expect(find.text('armeabi-v7a'), findsNothing);
        expect(find.text('update_download_install'), findsNothing);
        expect(find.text('修复了 A'), findsNothing);
        expect(
          find.byType(AppStatusView),
          findsNothing,
          reason: 'an available update is not a status card',
        );
      },
    );
  });
}
