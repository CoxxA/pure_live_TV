import 'package:equatable/equatable.dart';

/// Immutable state for backend fallback.
///
/// [candidates] contains only candidates that have not yet been selected.
///
/// [exhausted] means that no candidate remains after a failed attempt.
/// Selecting the final candidate does not itself make the state exhausted.
final class BackendFallbackState extends Equatable {
  const BackendFallbackState({
    required this.currentBackend,
    required this.candidates,
    required this.attempt,
    required this.active,
    required this.completed,
    required this.exhausted,
  });

  const BackendFallbackState.initial({String? currentBackend, List<String> candidates = const <String>[]})
    : this(
        currentBackend: currentBackend,
        candidates: candidates,
        attempt: 0,
        active: false,
        completed: false,
        exhausted: false,
      );

  final String? currentBackend;

  final List<String> candidates;

  final int attempt;

  final bool active;

  final bool completed;

  final bool exhausted;

  bool get canFallback {
    return !completed && !exhausted && candidates.isNotEmpty;
  }

  String? get nextBackend {
    if (!canFallback) {
      return null;
    }

    return candidates.first;
  }

  BackendFallbackState start({required List<String> candidates, String? currentBackend}) {
    return BackendFallbackState(
      currentBackend: currentBackend,
      candidates: List<String>.unmodifiable(candidates),
      attempt: 0,
      active: true,
      completed: false,
      exhausted: candidates.isEmpty,
    );
  }

  BackendFallbackState select(String backend) {
    if (!active || completed || exhausted) {
      return this;
    }

    if (!candidates.contains(backend)) {
      return this;
    }

    final List<String> remaining = List<String>.from(candidates)..remove(backend);

    return BackendFallbackState(
      currentBackend: backend,
      candidates: List<String>.unmodifiable(remaining),
      attempt: attempt + 1,
      active: true,
      completed: false,
      exhausted: false,
    );
  }

  BackendFallbackState markFailed() {
    return BackendFallbackState(
      currentBackend: currentBackend,
      candidates: candidates,
      attempt: attempt,
      active: false,
      completed: false,
      exhausted: candidates.isEmpty,
    );
  }

  BackendFallbackState complete() {
    return BackendFallbackState(
      currentBackend: currentBackend,
      candidates: candidates,
      attempt: attempt,
      active: false,
      completed: true,
      exhausted: false,
    );
  }

  BackendFallbackState exhaust() {
    return BackendFallbackState(
      currentBackend: currentBackend,
      candidates: const <String>[],
      attempt: attempt,
      active: false,
      completed: false,
      exhausted: true,
    );
  }

  BackendFallbackState reset() {
    return const BackendFallbackState.initial();
  }

  BackendFallbackState copyWith({
    String? currentBackend,
    List<String>? candidates,
    int? attempt,
    bool? active,
    bool? completed,
    bool? exhausted,
  }) {
    return BackendFallbackState(
      currentBackend: currentBackend ?? this.currentBackend,
      candidates: candidates != null ? List<String>.unmodifiable(candidates) : this.candidates,
      attempt: attempt ?? this.attempt,
      active: active ?? this.active,
      completed: completed ?? this.completed,
      exhausted: exhausted ?? this.exhausted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentBackend': currentBackend,
      'candidates': candidates,
      'attempt': attempt,
      'active': active,
      'completed': completed,
      'exhausted': exhausted,
    };
  }

  factory BackendFallbackState.fromMap(Map<String, dynamic> map) {
    final Object? candidatesValue = map['candidates'];

    return BackendFallbackState(
      currentBackend: map['currentBackend'] as String?,
      candidates: candidatesValue is List
          ? List<String>.unmodifiable(candidatesValue.whereType<String>())
          : const <String>[],
      attempt: (map['attempt'] as num?)?.toInt() ?? 0,
      active: map['active'] as bool? ?? false,
      completed: map['completed'] as bool? ?? false,
      exhausted: map['exhausted'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => <Object?>[currentBackend, candidates, attempt, active, completed, exhausted];

  @override
  String toString() {
    return 'BackendFallbackState('
        'currentBackend: $currentBackend, '
        'candidates: $candidates, '
        'attempt: $attempt, '
        'active: $active, '
        'completed: $completed, '
        'exhausted: $exhausted'
        ')';
  }
}
