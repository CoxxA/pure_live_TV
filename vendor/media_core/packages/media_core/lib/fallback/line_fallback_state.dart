import 'package:equatable/equatable.dart';

/// Immutable state for playback-line fallback.
///
/// A line is removed from [candidates] once it is selected for an attempt.
///
/// [exhausted] means that there are no remaining candidates after a failed
/// attempt.
final class LineFallbackState extends Equatable {
  const LineFallbackState({
    required this.currentLine,
    required this.candidates,
    required this.attempt,
    required this.active,
    required this.completed,
    required this.exhausted,
  });

  const LineFallbackState.initial({String? currentLine, List<String> candidates = const <String>[]})
    : this(
        currentLine: currentLine,
        candidates: candidates,
        attempt: 0,
        active: false,
        completed: false,
        exhausted: false,
      );

  final String? currentLine;

  final List<String> candidates;

  final int attempt;

  final bool active;

  final bool completed;

  final bool exhausted;

  bool get canFallback {
    return !completed && !exhausted && candidates.isNotEmpty;
  }

  String? get nextLine {
    if (!canFallback) {
      return null;
    }

    return candidates.first;
  }

  LineFallbackState start({required List<String> candidates, String? currentLine}) {
    // The line currently being attempted must not remain in the candidate
    // pool: next() would hand it back and the ladder would never advance.
    final List<String> remaining = currentLine != null && candidates.contains(currentLine)
        ? (List<String>.from(candidates)..remove(currentLine))
        : List<String>.from(candidates);

    return LineFallbackState(
      currentLine: currentLine,
      candidates: List<String>.unmodifiable(remaining),
      attempt: 0,
      active: true,
      completed: false,
      exhausted: remaining.isEmpty,
    );
  }

  LineFallbackState select(String line) {
    if (!active || completed || exhausted) {
      return this;
    }

    if (!candidates.contains(line)) {
      return this;
    }

    final List<String> remaining = List<String>.from(candidates)..remove(line);

    return LineFallbackState(
      currentLine: line,
      candidates: List<String>.unmodifiable(remaining),
      attempt: attempt + 1,
      active: true,
      completed: false,
      exhausted: false,
    );
  }

  LineFallbackState markFailed() {
    // A failed attempt must not deactivate the state machine: the caller
    // immediately calls next() to advance to the following line. Marking
    // the state inactive here would make select() a no-op and the same
    // line would be handed back forever.
    return LineFallbackState(
      currentLine: currentLine,
      candidates: candidates,
      attempt: attempt,
      active: active,
      completed: false,
      exhausted: candidates.isEmpty,
    );
  }

  LineFallbackState complete() {
    return LineFallbackState(
      currentLine: currentLine,
      candidates: candidates,
      attempt: attempt,
      active: false,
      completed: true,
      exhausted: false,
    );
  }

  LineFallbackState exhaust() {
    return LineFallbackState(
      currentLine: currentLine,
      candidates: const <String>[],
      attempt: attempt,
      active: false,
      completed: false,
      exhausted: true,
    );
  }

  LineFallbackState reset() {
    return const LineFallbackState.initial();
  }

  LineFallbackState copyWith({
    String? currentLine,
    List<String>? candidates,
    int? attempt,
    bool? active,
    bool? completed,
    bool? exhausted,
  }) {
    return LineFallbackState(
      currentLine: currentLine ?? this.currentLine,
      candidates: candidates != null ? List<String>.unmodifiable(candidates) : this.candidates,
      attempt: attempt ?? this.attempt,
      active: active ?? this.active,
      completed: completed ?? this.completed,
      exhausted: exhausted ?? this.exhausted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentLine': currentLine,
      'candidates': candidates,
      'attempt': attempt,
      'active': active,
      'completed': completed,
      'exhausted': exhausted,
    };
  }

  factory LineFallbackState.fromMap(Map<String, dynamic> map) {
    final Object? candidatesValue = map['candidates'];

    return LineFallbackState(
      currentLine: map['currentLine'] as String?,
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
  List<Object?> get props => <Object?>[currentLine, candidates, attempt, active, completed, exhausted];

  @override
  String toString() {
    return 'LineFallbackState('
        'currentLine: $currentLine, '
        'candidates: $candidates, '
        'attempt: $attempt, '
        'active: $active, '
        'completed: $completed, '
        'exhausted: $exhausted'
        ')';
  }
}
