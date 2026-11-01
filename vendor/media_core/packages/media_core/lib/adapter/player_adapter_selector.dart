import 'package:media_core/source/player_source.dart';
import 'package:media_core/source/source_protocol.dart';
import 'package:media_core/source/source_format.dart';
import 'package:media_core/adapter/player_adapter_registry.dart';
import 'package:media_core/adapter/player_adapter_capabilities.dart';
import 'package:media_core_logging/media_core_logging.dart';

/// Selects the best adapter registration for a media source.
///
/// [PlayerAdapterSelector] bridges the adapter registry and
/// concrete adapter creation. It scores every enabled
/// [PlayerAdapterRegistration] against a [PlayerSource] and
/// returns the best match.
///
/// Responsibilities:
///
/// - score adapters against a source
/// - honour explicit preferences
/// - expose candidate ordering
///
/// It does not:
///
/// - create adapter instances
/// - initialize adapters
/// - perform fallback at runtime
///
/// Those belong to:
///
/// - PlayerAdapterFactory
/// - PlayerAdapter
/// - PlayerKernel
final class PlayerAdapterSelector {
  /// Creates a selector reading from [registry].
  const PlayerAdapterSelector(this.registry);

  /// Registry of available adapters.
  final PlayerAdapterRegistry registry;

  /// Returns the best registration for [source], or `null` when
  /// no enabled adapter is registered.
  ///
  /// When [preferredId] names a registered and enabled adapter it
  /// wins unconditionally.
  PlayerAdapterRegistration? select(PlayerSource source, {String? preferredId}) {
    // A blank preference is no preference: it must not match whichever
    // backend happens to be consulted first.
    if (preferredId != null && preferredId.trim().isNotEmpty) {
      final preferred = registry.get(preferredId);

      if (preferred != null && preferred.enabled) {
        // A preference is not a hint: it wins without consulting scores.
        // Logged because "why is this backend playing?" is otherwise
        // unanswerable from the outside.
        MediaCoreLog.info(
          LogCategory.fallback,
          'backend selection: preferred backend "$preferredId" selected',
          fields: <String, Object?>{'uri': source.uri.toString(), 'preferred': preferredId},
        );

        return preferred;
      }

      MediaCoreLog.warning(
        LogCategory.fallback,
        'backend selection: preferred backend "$preferredId" is '
            '${preferred == null ? 'not registered' : 'disabled'} — falling back to scoring',
        fields: <String, Object?>{'uri': source.uri.toString(), 'registered': registry.ids.toList()},
      );
    }

    final candidates = candidatesFor(source);

    if (candidates.isEmpty) {
      MediaCoreLog.error(
        LogCategory.fallback,
        'backend selection: no enabled backend can handle the source',
        fields: <String, Object?>{'uri': source.uri.toString(), 'registered': registry.ids.toList()},
      );

      return null;
    }

    PlayerAdapterRegistration? best;
    var bestScore = -1;

    for (final candidate in candidates) {
      final candidateScore = score(candidate, source);
      if (candidateScore > bestScore) {
        bestScore = candidateScore;
        best = candidate;
      }
    }

    MediaCoreLog.info(
      LogCategory.fallback,
      'backend selection: ${best?.id} selected (score $bestScore)',
      fields: <String, Object?>{
        'uri': source.uri.toString(),
        'protocol': source.protocol.name,
        'format': source.format.name,
        'live': source.isLive,
        'scores': _scoreTable(candidates, source),
      },
    );

    return best;
  }

  /// Returns the best registration for [source].
  ///
  /// Throws [StateError] when no enabled adapter can play [source].
  PlayerAdapterRegistration require(PlayerSource source, {String? preferredId}) {
    final selected = select(source, preferredId: preferredId);
    if (selected == null) {
      throw StateError(
        'No enabled player adapter can handle source '
        '"${source.uri}" (protocol: ${source.protocol.name}, format: ${source.format.name}).',
      );
    }
    return selected;
  }

  /// Returns enabled registrations able to handle [source],
  /// ordered from best to worst match.
  List<PlayerAdapterRegistration> candidatesFor(PlayerSource source) {
    final capable = registry.registrations.where((registration) => registration.enabled).toList()
      ..sort((a, b) {
        final byScore = score(b, source).compareTo(score(a, source));
        if (byScore != 0) return byScore;
        return b.priority.compareTo(a.priority);
      });

    final table = capable
        .map((registration) => '${registration.id}:${score(registration, source)}')
        .join(', ');

    MediaCoreLog.debug(
      LogCategory.fallback,
      'backend candidates: $table',
      fields: <String, Object?>{'uri': source.uri.toString(), 'live': source.isLive},
    );

    return capable;
  }

  /// Renders every candidate with its score breakdown.
  ///
  /// The breakdown is what turns "why this backend?" into an answer: it
  /// shows the priority each registration carries and which capability
  /// bonuses it earned, so a surprising winner is visible as a number
  /// rather than as a mystery.
  List<Map<String, Object?>> scoreTable(PlayerSource source) => _scoreTable(registry.registrations, source);

  List<Map<String, Object?>> _scoreTable(Iterable<PlayerAdapterRegistration> registrations, PlayerSource source) {
    final table = <Map<String, Object?>>[];

    for (final registration in registrations) {
      final capabilities = registration.capabilities;
      final protocolMatch = protocolMatches(capabilities, source);
      final formatMatch = formatMatches(capabilities, source);
      final liveMatch = source.isLive && capabilities.supportsLive;

      table.add(<String, Object?>{
        'id': registration.id,
        'enabled': registration.enabled,
        'priority': registration.priority,
        'protocolMatch': protocolMatch,
        'formatMatch': formatMatch,
        'liveMatch': liveMatch,
        'score': score(registration, source),
      });
    }

    table.sort((a, b) => (b['score']! as int).compareTo(a['score']! as int));

    return table;
  }

  /// Scores one registration against [source].
  ///
  /// Weights:
  ///
  /// - registration priority: as registered (tie-breaker baseline)
  /// - protocol match: +40
  /// - format match: +30
  /// - live support for live sources: +10
  int score(PlayerAdapterRegistration registration, PlayerSource source) {
    var score = registration.priority;
    final capabilities = registration.capabilities;

    if (protocolMatches(capabilities, source)) {
      score += 40;
    }

    if (formatMatches(capabilities, source)) {
      score += 30;
    }

    if (source.isLive && capabilities.supportsLive) {
      score += 10;
    }

    return score;
  }

  /// Whether [capabilities] declares support for [source]'s protocol.
  ///
  /// Both spellings count: the [SourceProtocol] name and the URI scheme.
  /// `SourceProtocol` has no value for every scheme an engine accepts
  /// (`rtmps`, `srt`, `ftp`), and a declaration that lists those schemes
  /// would otherwise never match anything.
  bool protocolMatches(PlayerAdapterCapabilities capabilities, PlayerSource source) {
    final protocol = source.protocol;

    if (protocol.isKnown && capabilities.supportsProtocol(protocol.name)) {
      return true;
    }

    final scheme = source.uri.scheme.trim().toLowerCase();

    return scheme.isNotEmpty && capabilities.supportsProtocol(scheme);
  }

  /// Whether [capabilities] declares support for [source]'s container.
  ///
  /// Both spellings count: the [SourceFormat] name and the raw URI
  /// extension. The enum and the extension disagree in places (`.ts` is
  /// [SourceFormat.mpegTs]), and containers the enum does not model at all
  /// (`rmvb`, `ape`, `nut`) can only be matched as extensions.
  bool formatMatches(PlayerAdapterCapabilities capabilities, PlayerSource source) {
    final format = source.format;

    if (format.isKnown && capabilities.supportsFormat(format.name)) {
      return true;
    }

    final extension = SourceFormat.extensionOf(source.uri);

    if (extension != null && capabilities.supportsFormat(extension)) {
      return true;
    }

    // The enum can be present while the URI has no extension (a source
    // built by hand from a manifest URL): fall back to the enum's own
    // conventional extension.
    final conventional = format.extension;

    return conventional != null && capabilities.supportsFormat(conventional);
  }
}
