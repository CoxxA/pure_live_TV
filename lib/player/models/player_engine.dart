enum PlayerEngine { mediaKit, fijk }

abstract class BackendIds {
  static const String mediaKit = 'mpv';
  static const String fijk = 'ijk';
}

class PlayerEngineConfig {
  final PlayerEngine engine;
  final String nameKey;

  const PlayerEngineConfig({required this.engine, required this.nameKey});
}
