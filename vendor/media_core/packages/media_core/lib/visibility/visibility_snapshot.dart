import 'package:media_core/visibility/visibility_state.dart';
import 'package:equatable/equatable.dart';

/// Immutable visibility snapshot.
final class VisibilitySnapshot extends Equatable {
  const VisibilitySnapshot({required this.state, this.updatedAt});

  final VisibilityState state;

  final DateTime? updatedAt;

  bool get visible => state.visible;

  double get ratio => state.visibility;

  factory VisibilitySnapshot.initial() {
    return const VisibilitySnapshot(state: VisibilityState());
  }

  VisibilitySnapshot copyWith({VisibilityState? state, DateTime? updatedAt}) {
    return VisibilitySnapshot(state: state ?? this.state, updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  List<Object?> get props => [state, updatedAt];
}
