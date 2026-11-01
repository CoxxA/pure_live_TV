import 'package:equatable/equatable.dart';

/// Immutable state for quality fallback.
///
/// A quality candidate is removed when it is selected for an attempt.
///
/// The state becomes exhausted only after the current attempt fails and there
/// are no remaining candidates.
final class QualityFallbackState extends Equatable {
  const QualityFallbackState({
    required this.currentQuality,
    required this.candidates,
    required this.attempt,
    required this.active,
    required this.completed,
    required this.exhausted,
  });

  const QualityFallbackState.initial({String? currentQuality, List<String> candidates = const <String>[]})
    : this(
        currentQuality: currentQuality,
        candidates: candidates,
        attempt: 0,
        active: false,
        completed: false,
        exhausted: false,
      );

  final String? currentQuality;

  final List<String> candidates;

  final int attempt;

  final bool active;

  final bool completed;

  final bool exhausted;

  bool get canFallback {
    return !completed && !exhausted && candidates.isNotEmpty;
  }

  String? get nextQuality {
    if (!canFallback) {
      return null;
    }

    return candidates.first;
  }

  QualityFallbackState start({required List<String> candidates, String? currentQuality}) {
    return QualityFallbackState(
      currentQuality: currentQuality,
      candidates: List<String>.unmodifiable(candidates),
      attempt: 0,
      active: true,
      completed: false,
      exhausted: candidates.isEmpty,
    );
  }

  QualityFallbackState select(String quality) {
    if (!active || completed || exhausted) {
      return this;
    }

    if (!candidates.contains(quality)) {
      return this;
    }

    final List<String> remaining = List<String>.from(candidates)..remove(quality);

    return QualityFallbackState(
      currentQuality: quality,
      candidates: List<String>.unmodifiable(remaining),
      attempt: attempt + 1,
      active: true,
      completed: false,
      exhausted: false,
    );
  }

  QualityFallbackState markFailed() {
    return QualityFallbackState(
      currentQuality: currentQuality,
      candidates: candidates,
      attempt: attempt,
      active: false,
      completed: false,
      exhausted: candidates.isEmpty,
    );
  }

  QualityFallbackState complete() {
    return QualityFallbackState(
      currentQuality: currentQuality,
      candidates: candidates,
      attempt: attempt,
      active: false,
      completed: true,
      exhausted: false,
    );
  }

  QualityFallbackState exhaust() {
    return QualityFallbackState(
      currentQuality: currentQuality,
      candidates: const <String>[],
      attempt: attempt,
      active: false,
      completed: false,
      exhausted: true,
    );
  }

  QualityFallbackState reset() {
    return const QualityFallbackState.initial();
  }

  QualityFallbackState copyWith({
    String? currentQuality,
    List<String>? candidates,
    int? attempt,
    bool? active,
    bool? completed,
    bool? exhausted,
  }) {
    return QualityFallbackState(
      currentQuality: currentQuality ?? this.currentQuality,
      candidates: candidates != null ? List<String>.unmodifiable(candidates) : this.candidates,
      attempt: attempt ?? this.attempt,
      active: active ?? this.active,
      completed: completed ?? this.completed,
      exhausted: exhausted ?? this.exhausted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentQuality': currentQuality,
      'candidates': candidates,
      'attempt': attempt,
      'active': active,
      'completed': completed,
      'exhausted': exhausted,
    };
  }

  factory QualityFallbackState.fromMap(Map<String, dynamic> map) {
    final Object? candidatesValue = map['candidates'];

    return QualityFallbackState(
      currentQuality: map['currentQuality'] as String?,
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
  List<Object?> get props => <Object?>[currentQuality, candidates, attempt, active, completed, exhausted];

  @override
  String toString() {
    return 'QualityFallbackState('
        'currentQuality: $currentQuality, '
        'candidates: $candidates, '
        'attempt: $attempt, '
        'active: $active, '
        'completed: $completed, '
        'exhausted: $exhausted'
        ')';
  }
}
