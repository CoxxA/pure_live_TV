import 'package:equatable/equatable.dart';

/// Runtime lifecycle state.
final class LifecycleState extends Equatable {
  const LifecycleState({
    this.created = false,
    this.initialized = false,
    this.active = false,
    this.paused = false,
    this.inactive = false,
    this.detached = false,
    this.disposing = false,
    this.disposed = false,
  });

  final bool created;

  final bool initialized;

  final bool active;

  final bool paused;

  final bool inactive;

  final bool detached;

  final bool disposing;

  final bool disposed;

  bool get isAlive {
    return !disposed;
  }

  bool get isReady {
    return initialized && !disposing && !disposed;
  }

  bool get isTerminal {
    return disposed;
  }

  LifecycleState copyWith({
    bool? created,
    bool? initialized,
    bool? active,
    bool? paused,
    bool? inactive,
    bool? detached,
    bool? disposing,
    bool? disposed,
  }) {
    return LifecycleState(
      created: created ?? this.created,
      initialized: initialized ?? this.initialized,
      active: active ?? this.active,
      paused: paused ?? this.paused,
      inactive: inactive ?? this.inactive,
      detached: detached ?? this.detached,
      disposing: disposing ?? this.disposing,
      disposed: disposed ?? this.disposed,
    );
  }

  LifecycleState markCreated() {
    return copyWith(created: true);
  }

  LifecycleState markInitialized() {
    return copyWith(initialized: true);
  }

  LifecycleState markActive() {
    return copyWith(active: true, paused: false, inactive: false, detached: false);
  }

  LifecycleState markPaused() {
    return copyWith(active: false, paused: true, inactive: false);
  }

  LifecycleState markInactive() {
    return copyWith(active: false, paused: false, inactive: true);
  }

  LifecycleState markDetached() {
    return copyWith(detached: true, active: false, paused: false, inactive: false);
  }

  LifecycleState markDisposing() {
    return copyWith(disposing: true, active: false, paused: false, inactive: false);
  }

  LifecycleState markDisposed() {
    return copyWith(disposing: false, disposed: true, active: false, paused: false, inactive: false);
  }

  @override
  List<Object?> get props => [created, initialized, active, paused, inactive, detached, disposing, disposed];
}
