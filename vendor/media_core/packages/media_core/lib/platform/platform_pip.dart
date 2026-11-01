import 'package:equatable/equatable.dart';

/// Describes picture-in-picture capabilities.
///
/// [PlatformPip] represents whether the current
/// platform supports floating playback.
///
/// Responsibilities:
///
/// - describe PiP support
/// - describe window behavior
/// - describe interaction capability
///
/// It does not:
///
/// - enter PiP mode
/// - manage floating window
///
/// Those belong to:
///
/// - PipController
/// - Presentation layer
final class PlatformPip extends Equatable {
  /// Creates PiP capabilities.
  const PlatformPip({
    this.enabled = false,

    this.systemPip = false,

    this.customFloatingWindow = false,

    this.autoEnter = false,

    this.backgroundAudio = false,

    this.resizeable = true,

    this.keepControls = false,
  });

  /// Whether PiP feature is enabled.
  final bool enabled;

  /// Whether native system PiP is supported.
  ///
  /// Examples:
  ///
  /// - Android PiP
  /// - iOS PiP
  final bool systemPip;

  /// Whether custom floating window is supported.
  ///
  /// Examples:
  ///
  /// - desktop floating player
  /// - flutter_floating
  final bool customFloatingWindow;

  /// Whether player can automatically enter PiP.
  final bool autoEnter;

  /// Whether audio can continue in PiP.
  final bool backgroundAudio;

  /// Whether PiP window can resize.
  final bool resizeable;

  /// Whether playback controls remain visible.
  final bool keepControls;

  /// Whether any PiP mode is available.
  bool get available {
    return enabled && (systemPip || customFloatingWindow);
  }

  /// Whether native PiP is preferred.
  bool get preferSystem {
    return systemPip;
  }

  /// Whether custom floating mode is available.
  bool get canFloat {
    return customFloatingWindow;
  }

  /// Whether background playback is possible.
  bool get canContinuePlayback {
    return backgroundAudio;
  }

  /// Creates modified capability.
  PlatformPip copyWith({
    bool? enabled,

    bool? systemPip,

    bool? customFloatingWindow,

    bool? autoEnter,

    bool? backgroundAudio,

    bool? resizeable,

    bool? keepControls,
  }) {
    return PlatformPip(
      enabled: enabled ?? this.enabled,

      systemPip: systemPip ?? this.systemPip,

      customFloatingWindow: customFloatingWindow ?? this.customFloatingWindow,

      autoEnter: autoEnter ?? this.autoEnter,

      backgroundAudio: backgroundAudio ?? this.backgroundAudio,

      resizeable: resizeable ?? this.resizeable,

      keepControls: keepControls ?? this.keepControls,
    );
  }

  @override
  List<Object?> get props => [
    enabled,

    systemPip,

    customFloatingWindow,

    autoEnter,

    backgroundAudio,

    resizeable,

    keepControls,
  ];

  @override
  String toString() {
    return 'PlatformPip('
        'enabled=$enabled, '
        'system=$systemPip, '
        'floating=$customFloatingWindow'
        ')';
  }
}
