import 'package:equatable/equatable.dart';

/// Identifies the logical audio output route used by the media session.
///
/// This is a platform-independent value object. Native route identifiers
/// should not leak into the media core because their representation differs
/// across Android, iOS, macOS, Windows, Linux, and other platforms.
///
/// A route may represent a physical output device, a platform-managed output
/// group, or the system's default route.
final class AudioRoute extends Equatable {
  /// Creates an audio route.
  ///
  /// [id] must uniquely identify the route within the owning platform audio
  /// implementation. [name] is intended for presentation and diagnostics and
  /// should therefore not be used as the route's identity.
  const AudioRoute({
    required this.id,
    required this.name,
    this.kind = AudioRouteKind.unknown,
    this.isDefault = false,
    this.isAvailable = true,
  });

  /// Stable identifier supplied by the platform audio implementation.
  final String id;

  /// Human-readable route name.
  final String name;

  /// Logical type of the route.
  final AudioRouteKind kind;

  /// Whether this is currently the platform's default route.
  final bool isDefault;

  /// Whether the route is currently available for selection.
  final bool isAvailable;

  /// Creates a copy with selected fields replaced.
  AudioRoute copyWith({String? id, String? name, AudioRouteKind? kind, bool? isDefault, bool? isAvailable}) {
    return AudioRoute(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      isDefault: isDefault ?? this.isDefault,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  List<Object?> get props => <Object?>[id, name, kind, isDefault, isAvailable];

  @override
  String toString() {
    return 'AudioRoute('
        'id: $id, '
        'name: $name, '
        'kind: $kind, '
        'isDefault: $isDefault, '
        'isAvailable: $isAvailable'
        ')';
  }
}

/// Logical category of an audio output route.
///
/// The enum intentionally describes capabilities at a coarse level rather
/// than mirroring platform-specific device types.
enum AudioRouteKind {
  /// Platform-managed or otherwise unknown route.
  unknown,

  /// Built-in speaker.
  speaker,

  /// Built-in earpiece.
  earpiece,

  /// Wired headset or headphones.
  wiredHeadset,

  /// Bluetooth audio device.
  bluetooth,

  /// USB audio device.
  usb,

  /// HDMI or display audio output.
  hdmi,

  /// Cast or remote network audio output.
  remote,

  /// Other external audio output.
  external,
}
