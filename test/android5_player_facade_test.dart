import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_core/media_core.dart';
import 'package:pure_live/player/live_player_facade.dart';
import 'package:pure_live/player/models/player_engine.dart';
import 'package:pure_live/services/settings/settings.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('manual engine selection reports the preferred backend callback', () async {
    final container = ProviderContainer();
    SettingsService.to.init(container);
    final kernel = PlayerKernel();
    final selections = <PlayerEngine>[];
    final player = LivePlayerFacade(
      kernel,
      defaultEngine: PlayerEngine.mediaKit,
      onPreferredEngineChanged: selections.add,
    );

    try {
      await player.switchEngine(PlayerEngine.fijk, isManual: true, resumeCurrentSource: false);
      expect(player.preferredEngine, PlayerEngine.fijk);
      expect(selections, [PlayerEngine.fijk]);

      await player.switchEngine(PlayerEngine.mediaKit, resumeCurrentSource: false);
      expect(selections, [PlayerEngine.fijk]);
    } finally {
      await player.dispose();
      await kernel.dispose();
      container.dispose();
    }
  });
}
