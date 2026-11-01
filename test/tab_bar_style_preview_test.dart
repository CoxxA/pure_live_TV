import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dpad/dpad.dart';
import 'package:pure_live/shared/theme/index.dart';
import 'package:pure_live/shared/widgets/index.dart';

/// Renders the restyled [TvTabBar] (segmented-control look) to a PNG so the
/// new tray/selected/idle states can be reviewed without a device.
///
/// Run: flutter test test/tab_bar_style_preview_test.dart
/// Output: build/test-previews/tab-bar/
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('render TvTabBar style preview', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // Use the same default-font path as a fresh app installation.

    Widget logoDot(Color color) => Container(
      width: 24.sp,
      height: 24.sp,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );

    final Widget bars = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RepaintBoundary(
          key: const Key('status-bar'),
          child: TvTabBar(
            tabs: const [
              TvTabItemData(id: 'live', title: '正在直播'),
              TvTabItemData(id: 'replay', title: '正在重播'),
              TvTabItemData(id: 'off', title: '未开播'),
            ],
            currentIndex: 0,
            onTabChange: (_) {},
          ),
        ),
        SizedBox(height: 24.sp),
        RepaintBoundary(
          key: const Key('platform-bar'),
          child: TvTabBar(
            tabs: [
              TvTabItemData(
                id: 'all',
                title: '全部',
                icon: Icon(Icons.apps_rounded, size: 24.sp),
              ),
              TvTabItemData(
                id: 'bilibili',
                title: '哔哩哔哩',
                icon: logoDot(Colors.pinkAccent),
              ),
              TvTabItemData(
                id: 'douyu',
                title: '斗鱼',
                icon: logoDot(Colors.orange),
              ),
              TvTabItemData(
                id: 'huya',
                title: '虎牙',
                icon: logoDot(Colors.orangeAccent),
              ),
              TvTabItemData(
                id: 'douyin',
                title: '抖音',
                icon: logoDot(Colors.black),
              ),
              TvTabItemData(
                id: 'kuaishou',
                title: '快手',
                icon: logoDot(Colors.deepOrange),
              ),
              TvTabItemData(
                id: 'netease',
                title: '网易CC',
                icon: logoDot(Colors.red),
              ),
              TvTabItemData(
                id: 'twitch',
                title: 'Twitch',
                icon: logoDot(Colors.purple),
              ),
              TvTabItemData(
                id: 'soop',
                title: 'Soop',
                icon: logoDot(Colors.indigo),
              ),
              TvTabItemData(id: 'yy', title: 'YY', icon: logoDot(Colors.amber)),
            ],
            currentIndex: 0,
            onTabChange: (_) {},
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      ScreenUtilPlusInit(
        designSize: const Size(1920, 1080),
        autoRebuild: false,
        minTextAdapt: true,
        child: MaterialApp(
          builder: Dpad.wrap(),
          // The user's palette from the screenshot: blue (青蓝强调色).
          theme: ThemeData(
            extensions: <ThemeExtension<dynamic>>[
              TvThemeExtension(theme: blueTvTheme),
            ],
          ),
          home: Scaffold(
            backgroundColor: blueTvTheme.backgroundColor,
            body: Center(child: bars),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      tester.takeException(),
      isNull,
      reason: 'both tab bars must fit the default font layout',
    );
    expect(find.byType(TvTabBar), findsNWidgets(2));

    // Walk focus onto the second tab of each bar so the golden also shows the
    // focused-idle state (tint + ring on the tray). Best effort: if traversal
    // does not land, the golden simply shows idle/selected only.
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump(const Duration(milliseconds: 200));
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump(const Duration(milliseconds: 200));

    expect(
      tester.takeException(),
      isNull,
      reason: 'focus changes must preserve the tab layout',
    );
    final Directory out = Directory('build/test-previews/tab-bar')
      ..createSync(recursive: true);

    Future<void> snap(String key, String file) async {
      final RenderRepaintBoundary boundary = tester
          .renderObject<RenderRepaintBoundary>(find.byKey(Key(key)));
      await tester.runAsync(() async {
        final ui.Image image = await boundary.toImage();
        expect(image.width, inInclusiveRange(1, 1920));
        expect(image.height, inInclusiveRange(1, 1080));
        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        expect(data, isNotNull);
        expect(data!.lengthInBytes, greaterThan(0));
        File('${out.path}/$file').writeAsBytesSync(data.buffer.asUint8List());
        image.dispose();
      });
    }

    await snap('status-bar', 'tab_bar_status.png');
    await snap('platform-bar', 'tab_bar_platform.png');
  });
}
