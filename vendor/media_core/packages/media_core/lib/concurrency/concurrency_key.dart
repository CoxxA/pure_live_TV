/// Identifies a logical resource used for concurrency coordination.
///
/// The key is intentionally domain-agnostic. Higher-level modules decide
/// which scopes and resource identifiers they need.
final class ConcurrencyKey {
  const ConcurrencyKey({required this.scope, required this.name});

  final String scope;

  final String name;

  String get value => '$scope:$name';

  bool hasScope(String scope) => this.scope == scope;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is ConcurrencyKey && other.scope == scope && other.name == name;
  }

  @override
  int get hashCode => Object.hash(scope, name);

  @override
  String toString() => 'ConcurrencyKey($value)';
}
