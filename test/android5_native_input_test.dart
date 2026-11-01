import 'dart:typed_data';

import 'package:android_tv_text_field/native_textfield_tv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'native TV input uses hybrid composition and retains IME events',
    (tester) async {
      final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      final creates = <Map<dynamic, dynamic>>[];
      final nativeCalls = <MethodCall>[];
      const codec = StandardMethodCodec();

      messenger.setMockMethodCallHandler(SystemChannels.platform_views, (call) async {
        if (call.method == 'create') {
          creates.add(call.arguments as Map<dynamic, dynamic>);
        }
        return null;
      });
      messenger.setMockMethodCallHandler(const MethodChannel('native_textfield_tv'), (call) async {
        nativeCalls.add(call);
        return null;
      });
      addTearDown(() {
        messenger.setMockMethodCallHandler(SystemChannels.platform_views, null);
        messenger.setMockMethodCallHandler(const MethodChannel('native_textfield_tv'), null);
      });

      final controller = NativeTextFieldController(text: 'controller text');
      String? submitted;
      bool? focused;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 80,
              child: NativeTextField(
                controller: controller,
                initialText: 'initial text',
                hint: 'search',
                obscureText: true,
                onSubmitted: (text) => submitted = text,
                onFocusChanged: (value) => focused = value,
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(creates, hasLength(1));
      final create = creates.single;
      expect(create['hybrid'], isTrue);
      expect(create['viewType'], 'native_textfield_tv');
      expect(find.byType(AndroidView), findsNothing);
      expect(find.byType(PlatformViewLink), findsOneWidget);
      final params =
          const StandardMessageCodec().decodeMessage(ByteData.sublistView(create['params'] as Uint8List))
              as Map<dynamic, dynamic>;
      expect(params['initialText'], 'initial text');
      expect(params['hint'], 'search');
      expect(params['obscureText'], true);
      expect(
        nativeCalls.any((call) => call.method == 'setText' && call.arguments['text'] == 'controller text'),
        isTrue,
      );

      Future<void> nativeEvent(String method, Map<String, Object> values) async {
        await messenger.handlePlatformMessage(
          'native_textfield_tv',
          codec.encodeMethodCall(MethodCall(method, {'instanceId': params['instanceId'], ...values})),
          (_) {},
        );
      }

      await nativeEvent('onTextChanged', {'text': '斗鱼'});
      await nativeEvent('onSubmitted', {'text': '斗鱼'});
      await nativeEvent('onFocusChanged', {'hasFocus': true});
      expect(controller.text, '斗鱼');
      expect(submitted, '斗鱼');
      expect(focused, true);
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );
}
