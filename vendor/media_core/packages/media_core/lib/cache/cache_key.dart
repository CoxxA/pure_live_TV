import 'package:equatable/equatable.dart';

/// Immutable cache key.
///
/// Cache keys are intentionally represented as a dedicated value object
/// instead of passing raw strings throughout the cache subsystem.
///
/// A key identifies one logical cache entry. It does not describe how the
/// entry is stored or when it should be evicted.
final class CacheKey extends Equatable {
  const CacheKey(this.value) : assert(value != '');

  final String value;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[value];

  @override
  String toString() => value;
}
