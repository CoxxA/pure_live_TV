import 'package:equatable/equatable.dart';

/// Describes platform audio capabilities.
///
/// [PlatformAudio] represents available audio
/// features on current runtime platform.
///
/// Responsibilities:
///
/// - audio output capability
/// - audio format support
/// - audio focus capability
///
/// It does not:
///
/// - play audio
/// - manage volume
/// - request system focus
///
/// Those belong to:
///
/// - AudioBackend
/// - Player
final class PlatformAudio extends Equatable {
  /// Creates audio capabilities.
  const PlatformAudio({
    this.enabled = true,

    this.output = true,

    this.volumeControl = true,

    this.muteControl = true,

    this.audioFocus = false,

    this.bluetooth = false,

    this.speaker = true,

    this.headphones = true,

    this.maxChannels = 2,

    this.sampleRates = const <int>[44100, 48000],
  });

  /// Whether audio playback is enabled.
  final bool enabled;

  /// Whether audio output is supported.
  final bool output;

  /// Whether system volume control is supported.
  final bool volumeControl;

  /// Whether mute control is supported.
  final bool muteControl;

  /// Whether audio focus is supported.
  ///
  /// Example:
  ///
  /// - Android AudioFocus
  /// - iOS AVAudioSession
  final bool audioFocus;

  /// Whether bluetooth audio is supported.
  final bool bluetooth;

  /// Whether speaker output is supported.
  final bool speaker;

  /// Whether headphone output is supported.
  final bool headphones;

  /// Maximum supported audio channels.
  ///
  /// Example:
  ///
  /// - 2 stereo
  /// - 6 surround
  final int maxChannels;

  /// Supported sample rates.
  ///
  /// Example:
  ///
  /// - 44100
  /// - 48000
  final List<int> sampleRates;

  /// Whether audio playback is possible.
  bool get canPlay {
    return enabled && output;
  }

  /// Whether stereo output is supported.
  bool get supportsStereo {
    return maxChannels >= 2;
  }

  /// Whether high quality audio is supported.
  bool get supportsHighQuality {
    return sampleRates.contains(48000);
  }

  /// Creates modified audio capability.
  PlatformAudio copyWith({
    bool? enabled,

    bool? output,

    bool? volumeControl,

    bool? muteControl,

    bool? audioFocus,

    bool? bluetooth,

    bool? speaker,

    bool? headphones,

    int? maxChannels,

    List<int>? sampleRates,
  }) {
    return PlatformAudio(
      enabled: enabled ?? this.enabled,

      output: output ?? this.output,

      volumeControl: volumeControl ?? this.volumeControl,

      muteControl: muteControl ?? this.muteControl,

      audioFocus: audioFocus ?? this.audioFocus,

      bluetooth: bluetooth ?? this.bluetooth,

      speaker: speaker ?? this.speaker,

      headphones: headphones ?? this.headphones,

      maxChannels: maxChannels ?? this.maxChannels,

      sampleRates: sampleRates ?? this.sampleRates,
    );
  }

  @override
  List<Object?> get props => [
    enabled,

    output,

    volumeControl,

    muteControl,

    audioFocus,

    bluetooth,

    speaker,

    headphones,

    maxChannels,

    sampleRates,
  ];

  @override
  String toString() {
    return 'PlatformAudio('
        'enabled=$enabled, '
        'channels=$maxChannels, '
        'focus=$audioFocus'
        ')';
  }
}
