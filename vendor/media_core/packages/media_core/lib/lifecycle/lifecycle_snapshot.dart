import 'package:media_core/lifecycle/lifecycle_state.dart';
import 'package:equatable/equatable.dart';


/// Immutable lifecycle snapshot.
final class LifecycleSnapshot extends Equatable {
  const LifecycleSnapshot({required this.state, this.updatedAt});

  final LifecycleState state;

  final DateTime? updatedAt;

  bool get isDisposed {
    return state.disposed;
  }

  bool get isActive {
    return state.active;
  }

  LifecycleSnapshot copyWith({LifecycleState? state, DateTime? updatedAt}) {
    return LifecycleSnapshot(state: state ?? this.state, updatedAt: updatedAt ?? this.updatedAt);
  }

  factory LifecycleSnapshot.initial() {
    return const LifecycleSnapshot(state: LifecycleState());
  }

  @override
  List<Object?> get props => [state, updatedAt];
}

/// Serialization helpers for [LifecycleSnapshot].
extension LifecycleSnapshotSerialization on LifecycleSnapshot {
  Map<String, Object?> toMap() => {'state': state.toString(), 'updatedAt': updatedAt?.toIso8601String()};
}
