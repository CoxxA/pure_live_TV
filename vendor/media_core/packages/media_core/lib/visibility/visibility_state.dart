import 'package:equatable/equatable.dart';

/// Runtime visibility state.
final class VisibilityState extends Equatable {
  const VisibilityState({this.visible = false, this.visibility = 0.0, this.inViewport = false, this.occluded = false});

  /// Whether widget is visible.
  final bool visible;

  /// Visibility ratio.
  ///
  /// Range:
  ///
  /// 0.0 - 1.0
  final double visibility;

  /// Whether player is inside viewport.
  final bool inViewport;

  /// Whether player is covered.
  final bool occluded;

  bool get isFullyVisible {
    return visibility >= 1.0;
  }

  bool get isPartiallyVisible {
    return visibility > 0 && visibility < 1;
  }

  bool get isHidden {
    return visibility <= 0;
  }

  VisibilityState copyWith({bool? visible, double? visibility, bool? inViewport, bool? occluded}) {
    return VisibilityState(
      visible: visible ?? this.visible,
      visibility: visibility ?? this.visibility,
      inViewport: inViewport ?? this.inViewport,
      occluded: occluded ?? this.occluded,
    );
  }

  VisibilityState update(double value) {
    return copyWith(visibility: value, visible: value > 0);
  }

  VisibilityState show() {
    return copyWith(visible: true);
  }

  VisibilityState hide() {
    return copyWith(visible: false, visibility: 0);
  }

  @override
  List<Object?> get props => [visible, visibility, inViewport, occluded];
}
