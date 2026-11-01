import 'package:equatable/equatable.dart';

/// Identifies the broad category of a player event.
///
/// The event bus does not attach behavior to these values. They are used by
/// filters and consumers to select the events they are interested in.
enum PlayerEventType {
  unknown,
  player,
  session,
  source,
  playback,
  buffering,
  renderer,
  audio,
  presentation,
  recovery,
  fallback,
  cache,
  recording,
  visibility,
  lifecycle,
  error,
  diagnostics,
}

/// Immutable event type matcher.
///
/// This value object is useful when a consumer needs to describe a set of
/// accepted event categories without depending on a concrete event class.
final class PlayerEventTypeFilter extends Equatable {
  const PlayerEventTypeFilter({this.types = const <PlayerEventType>{}, this.acceptAll = false});

  final Set<PlayerEventType> types;

  final bool acceptAll;

  bool accepts(PlayerEventType type) {
    return acceptAll || types.contains(type);
  }

  PlayerEventTypeFilter copyWith({Set<PlayerEventType>? types, bool? acceptAll}) {
    return PlayerEventTypeFilter(types: types ?? this.types, acceptAll: acceptAll ?? this.acceptAll);
  }

  @override
  List<Object?> get props => <Object?>[types, acceptAll];

  @override
  String toString() {
    return 'PlayerEventTypeFilter('
        'types: $types, '
        'acceptAll: $acceptAll'
        ')';
  }
}
