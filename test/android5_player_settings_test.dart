import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:pure_live/services/player_settings/player_settings_controller.dart';
import 'package:pure_live/shared/utils/hive_pref_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory preferences;

  setUpAll(() async {
    preferences = await Directory.systemTemp.createTemp('android5-player-settings-');
    Hive.init(preferences.path);
    await HivePrefUtil.init();
  });

  tearDownAll(() async {
    await Hive.close();
    await preferences.delete(recursive: true);
  });

  for (final removedEngine in ['fvp', 'better_player', 'unavailable_engine']) {
    test('a backup selecting $removedEngine is repaired and persisted', () {
      HivePrefUtil.setString('videoPlayerKey', removedEngine);
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final subscription = container.listen(playerSettingsControllerProvider, (_, __) {});
      addTearDown(subscription.close);

      final initial = container.read(playerSettingsControllerProvider);
      expect(initial.videoPlayerKey, 'mpv');

      container.read(playerSettingsControllerProvider.notifier).updateSettings(
        initial.copyWith(videoPlayerKey: removedEngine),
      );
      expect(container.read(playerSettingsControllerProvider).videoPlayerKey, 'mpv');
      expect(HivePrefUtil.getString('videoPlayerKey'), 'mpv');
    });
  }

  test('an IJK preference remains available after restoring settings', () {
    HivePrefUtil.setString('videoPlayerKey', 'ijk');
    final container = ProviderContainer();
    addTearDown(container.dispose);
    expect(container.read(playerSettingsControllerProvider).videoPlayerKey, 'ijk');
  });
}
