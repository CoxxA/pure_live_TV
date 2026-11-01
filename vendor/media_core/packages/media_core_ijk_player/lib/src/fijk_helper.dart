import 'package:media_core_ijk_player/src/fijk_player_config.dart';
import 'package:flutter/material.dart';
import 'package:flv_lzc/fijkplayer.dart';
import 'package:media_core_logging/media_core_logging.dart';

/// FijkPlayer Helper
class FijkHelper {
  /// Applies [config] to [player] for the upcoming open.
  ///
  /// - Named options and extra options are folded into three maps
  ///   (one write per key), so a single `Future.wait` dispatches
  ///   them concurrently without any ordering hazard.
  /// - `extraXxxOptions` are merged after the named options and can
  ///   override built-in keys.
  /// - [sourceHeaders] are merged on top of `config.headers`; source
  ///   wins because it is more specific.
  /// - A null or empty [proxyUrl] writes `''` (DIRECT).
  static Future<void> applyConfig(
    FijkPlayer player,
    FijkPlayerConfig config, {
    Map<String, String>? sourceHeaders,
    String? proxyUrl,
  }) async {
    // headers
    final mergedHeaders = <String, String>{...config.headers, ...?sourceHeaders};

    String? userAgent;
    final headerBuffer = StringBuffer();
    for (final entry in mergedHeaders.entries) {
      final key = entry.key.trim();
      final value = entry.value.replaceAll(RegExp(r'[\r\n\u0000]+'), ' ').trim();
      if (key.isEmpty || value.isEmpty) continue;

      if (key.toLowerCase() == 'user-agent') {
        userAgent = value;
      } else {
        headerBuffer.write('$key:$value\r\n');
      }
    }

    // merge the three categories
    final playerOpts = <String, Object>{
      'mediacodec': config.enableCodec ? 1 : 0,
      'mediacodec-hevc': config.enableCodec ? 1 : 0,
      'videotoolbox': config.enableCodec ? 1 : 0,
      'enable-accurate-seek': config.accurateSeek ? 1 : 0,
      'soundtouch': config.soundtouch ? 1 : 0,
      'subtitle': config.subtitle ? 1 : 0,
      'an': config.disableAudioOutput ? 1 : 0,
      ...config.extraPlayerOptions,
    };

    final hostOpts = <String, Object>{
      'request-screen-on': config.requestScreenOn ? 1 : 0,
      'request-audio-focus': (config.requestAudioFocus && !config.disableAudioOutput) ? 1 : 0,
      // IJKPlayer refuses `snapshot` unless the host enables it, and a
      // screenshot request arrives long after the open that writes options, so
      // it is enabled for every source instead of on demand.
      'enable-snapshot': 1,
      ...config.extraHostOptions,
    };

    final formatOpts = <String, Object>{
      'reconnect': config.reconnect ? 1 : 0,
      'timeout': config.timeout.inMicroseconds,
      'fflags': config.fflags,
      'rtsp_transport': config.rtspTransport,
      'http_proxy': proxyUrl ?? '',
      'headers': headerBuffer.toString(),
      if (userAgent != null) 'user_agent': userAgent,
      ...config.extraFormatOptions,
    };

    // dispatch concurrently
    final futures = <Future<void>>[
      for (final e in playerOpts.entries) player.setOption(FijkOption.playerCategory, e.key, e.value),
      for (final e in hostOpts.entries) player.setOption(FijkOption.hostCategory, e.key, e.value),
      for (final e in formatOpts.entries) player.setOption(FijkOption.formatCategory, e.key, e.value),
    ];

    await Future.wait(futures);
  }

  /// Level the engine was last told to log at.
  ///
  /// Static because the plugin's level is process-wide: one value per app, not
  /// one per player, and a room-per-player host must not push it again on every
  /// open.
  static FijkLogLevel? _engineLogLevel;

  /// Copies the host's logging configuration onto the engine's own log.
  ///
  /// ijkplayer logs from C — a line per state transition and a block per player
  /// create/release (`IJKMEDIA`), plus a Dart line per plugin call — and none of
  /// that goes through [MediaCoreLog]. A host that keeps the hub silent still
  /// gets hundreds of engine lines in logcat, which reads as "this adapter logs
  /// too much" when the adapter itself logs nothing at all.
  ///
  /// The engine has its own switch and this is the only place it is set, so the
  /// hub stays the single authority: a silent hub is a silent engine, and a host
  /// chasing an engine problem sets `MediaCoreLog.level = LogLevel.trace` to get
  /// the engine's own output back. The mapping is monotone; the plugin normalizes
  /// the value on its own side (`level / 100`, clamped to 0..8, then ijk's
  /// `setLogLevel`).
  ///
  /// Call before the first player exists: setting it loads the plugin's native
  /// libraries, and doing that mid-open pays for it on the user's first frame.
  static void syncLogLevel() {
    final level = _engineLogLevelOf(MediaCoreLog.level);

    if (level == _engineLogLevel) {
      return;
    }

    _engineLogLevel = level;

    FijkLog.setLevel(level);
  }

  static FijkLogLevel _engineLogLevelOf(LogLevel level) {
    return switch (level) {
      LogLevel.trace => FijkLogLevel.Verbose,
      LogLevel.debug => FijkLogLevel.Debug,
      LogLevel.info => FijkLogLevel.Info,
      LogLevel.warning => FijkLogLevel.Warn,
      LogLevel.error => FijkLogLevel.Error,
      LogLevel.critical => FijkLogLevel.Fatal,
      LogLevel.nothing => FijkLogLevel.Silent,
    };
  }

  /// Formats a player position as a readable string.
  static String formatDuration(Duration duration) {
    if (duration.inMilliseconds < 0) return '-: negative';

    String two(int n) => n.toString().padLeft(2, '0');

    final minutes = two(duration.inMinutes.remainder(60));
    final seconds = two(duration.inSeconds.remainder(60));
    final hours = duration.inHours;

    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  static FijkFit getIjkBoxFit(BoxFit videoFit) {
    switch (videoFit) {
      case BoxFit.contain:
        return FijkFit.contain;
      case BoxFit.cover:
        return FijkFit.cover;
      case BoxFit.fill:
        return FijkFit.fill;
      case BoxFit.fitHeight:
        return FijkFit.fitHeight;
      case BoxFit.fitWidth:
        return FijkFit.fitWidth;
      default:
        return FijkFit.contain;
    }
  }
}
