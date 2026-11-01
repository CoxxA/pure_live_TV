import 'package:media_core/core/player_error.dart';

/// Thrown when an adapter operation fails and the caller invoked the
/// adapter directly.
///
/// The failure is always published as an adapter error event first;
/// the exception only hands the normalized [PlayerError] to the
/// direct caller of the adapter `open`.
final class PlayerAdapterOpenException implements Exception {
  /// Creates the exception from the normalized failure.
  const PlayerAdapterOpenException(this.error);

  /// The normalized failure.
  final PlayerError error;

  @override
  String toString() => 'PlayerAdapterOpenException(${error.diagnosticMessage})';
}
