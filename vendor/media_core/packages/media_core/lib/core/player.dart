import 'package:clock/clock.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:equatable/equatable.dart';

/// Represents the stable identity of a player.
///
/// [Player] contains only information that belongs to the lifetime of the
/// player identity itself. Runtime associations such as session, request,
/// operation, and generation are intentionally kept outside this object.
///
/// Player equality is determined exclusively by [id].
final class Player extends Equatable {
  /// Creates a player from an existing [PlayerId].
  const Player({required this.id, required this.createdAt});

  /// Creates a new player with a generated unique identifier.
  factory Player.create({DateTime? createdAt}) {
    return Player(id: PlayerId.generate(), createdAt: createdAt ?? clock.now());
  }

  /// Stable identifier of this player instance.
  final PlayerId id;

  /// Time at which this player identity was created.
  ///
  /// This value is informational and does not participate in identity
  /// equality.
  final DateTime createdAt;

  /// Returns whether [other] represents the same player identity.
  ///
  /// Player identity is determined exclusively by [id].
  bool isSamePlayer(Player other) {
    return id == other.id;
  }

  /// Returns whether [other] represents a different player identity.
  bool isDifferentPlayer(Player other) {
    return id != other.id;
  }

  @override
  List<Object> get props => <Object>[id];

  @override
  String toString() {
    return 'Player('
        'id: $id, '
        'createdAt: $createdAt'
        ')';
  }
}
