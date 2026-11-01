/// Describes the type of an operation.
///
/// [OperationType] is an immutable value object rather than a Dart enum.
/// Built-in operation types provide the stable core operation vocabulary,
/// while custom operation types allow extensions without modifying this class.
///
/// Operation type describes what an operation does.
///
/// It does not describe:
///
/// - whether the operation is running;
/// - whether the operation succeeded;
/// - whether the operation failed;
/// - how the operation is scheduled;
///
/// Those responsibilities belong to [OperationState], task management,
/// and policy layers.
final class OperationType {
  const OperationType._(this.value, this.name);

  /// Creates a custom operation type.
  factory OperationType.custom(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Operation type cannot be empty.');
    }

    return OperationType._(normalized, normalized);
  }

  // ---------------------------------------------------------------------------
  // Built-in operation types
  // ---------------------------------------------------------------------------

  static const OperationType open = OperationType._('open', 'Open');

  static const OperationType play = OperationType._('play', 'Play');

  static const OperationType pause = OperationType._('pause', 'Pause');

  static const OperationType stop = OperationType._('stop', 'Stop');

  static const OperationType seek = OperationType._('seek', 'Seek');

  static const OperationType close = OperationType._('close', 'Close');

  static const OperationType initialize = OperationType._('initialize', 'Initialize');

  static const OperationType dispose = OperationType._('dispose', 'Dispose');

  static const OperationType prepare = OperationType._('prepare', 'Prepare');

  static const OperationType load = OperationType._('load', 'Load');

  static const OperationType reload = OperationType._('reload', 'Reload');

  static const OperationType setPlaybackRate = OperationType._('set_playback_rate', 'Set Playback Rate');

  static const OperationType setVolume = OperationType._('set_volume', 'Set Volume');

  static const OperationType setMute = OperationType._('set_mute', 'Set Mute');

  static const OperationType enterFullscreen = OperationType._('enter_fullscreen', 'Enter Fullscreen');

  static const OperationType exitFullscreen = OperationType._('exit_fullscreen', 'Exit Fullscreen');

  static const OperationType enterPip = OperationType._('enter_pip', 'Enter PiP');

  static const OperationType exitPip = OperationType._('exit_pip', 'Exit PiP');

  static const OperationType startRecording = OperationType._('start_recording', 'Start Recording');

  static const OperationType captureScreenshot = OperationType._('capture_screenshot', 'Capture Screenshot');

  static const OperationType stopRecording = OperationType._('stop_recording', 'Stop Recording');

  static const OperationType recover = OperationType._('recover', 'Recover');

  static const OperationType fallback = OperationType._('fallback', 'Fallback');

  static const OperationType retry = OperationType._('retry', 'Retry');

  // ---------------------------------------------------------------------------
  // Built-in values
  // ---------------------------------------------------------------------------

  static const Set<String> _builtInValues = <String>{
    'open',
    'play',
    'pause',
    'stop',
    'seek',
    'close',
    'initialize',
    'dispose',
    'prepare',
    'load',
    'reload',
    'set_playback_rate',
    'set_volume',
    'set_mute',
    'enter_fullscreen',
    'exit_fullscreen',
    'enter_pip',
    'exit_pip',
    'start_recording',
    'stop_recording',
    'capture_screenshot',
    'recover',
    'fallback',
    'retry',
  };

  /// All built-in operation types.
  static const List<OperationType> values = <OperationType>[
    open,
    play,
    pause,
    stop,
    seek,
    close,
    initialize,
    dispose,
    prepare,
    load,
    reload,
    setPlaybackRate,
    setVolume,
    setMute,
    enterFullscreen,
    exitFullscreen,
    enterPip,
    exitPip,
    startRecording,
    stopRecording,
    captureScreenshot,
    recover,
    fallback,
    retry,
  ];

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  /// Stable machine-readable operation type value.
  final String value;

  /// Human-readable operation type name.
  final String name;

  /// Whether this is a built-in operation type.
  bool get isBuiltIn => _builtInValues.contains(value);

  /// Whether this is a custom operation type.
  bool get isCustom => !isBuiltIn;

  // ---------------------------------------------------------------------------
  // Predicates
  // ---------------------------------------------------------------------------

  bool get isOpen => value == open.value;

  bool get isPlay => value == play.value;

  bool get isPause => value == pause.value;

  bool get isStop => value == stop.value;

  bool get isSeek => value == seek.value;

  bool get isClose => value == close.value;

  bool get isInitialize => value == initialize.value;

  bool get isDispose => value == dispose.value;

  bool get isPrepare => value == prepare.value;

  bool get isLoad => value == load.value;

  bool get isReload => value == reload.value;

  bool get isSetPlaybackRate => value == setPlaybackRate.value;

  bool get isSetVolume => value == setVolume.value;

  bool get isSetMute => value == setMute.value;

  bool get isEnterFullscreen => value == enterFullscreen.value;

  bool get isExitFullscreen => value == exitFullscreen.value;

  bool get isEnterPip => value == enterPip.value;

  bool get isExitPip => value == exitPip.value;

  bool get isStartRecording => value == startRecording.value;

  bool get isStopRecording => value == stopRecording.value;

  bool get isRecover => value == recover.value;

  bool get isFallback => value == fallback.value;

  bool get isRetry => value == retry.value;

  // ---------------------------------------------------------------------------
  // Classification
  // ---------------------------------------------------------------------------

  /// Whether this operation affects playback state.
  bool get isPlaybackOperation {
    return isOpen || isPlay || isPause || isStop || isSeek || isClose || isPrepare || isLoad || isReload;
  }

  /// Whether this operation changes a player configuration.
  bool get isConfigurationOperation {
    return isSetPlaybackRate || isSetVolume || isSetMute;
  }

  /// Whether this operation affects presentation.
  bool get isPresentationOperation {
    return isEnterFullscreen || isExitFullscreen || isEnterPip || isExitPip;
  }

  /// Whether this operation affects recording.
  bool get isRecordingOperation {
    return isStartRecording || isStopRecording;
  }

  /// Whether this operation is related to recovery.
  bool get isRecoveryOperation {
    return isRecover || isFallback || isRetry;
  }

  /// Whether this operation initializes or disposes resources.
  bool get isLifecycleOperation {
    return isInitialize || isDispose;
  }

  // ---------------------------------------------------------------------------
  // Conversion
  // ---------------------------------------------------------------------------

  /// Returns the stable operation type value.
  String toValue() => value;

  /// Returns the stable operation type value for JSON serialization.
  String toJson() => value;

  /// Creates an operation type from JSON.
  factory OperationType.fromJson(Object? json) {
    if (json is! String) {
      throw FormatException('OperationType JSON value must be a String.');
    }

    return OperationType.fromValue(json);
  }

  /// Creates an operation type from a stable value.
  ///
  /// Built-in values return their canonical built-in instance.
  /// Unknown values become custom operation types.
  factory OperationType.fromValue(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError.value(value, 'value', 'Operation type cannot be empty.');
    }

    for (final type in values) {
      if (type.value == normalized) {
        return type;
      }
    }

    return OperationType.custom(normalized);
  }

  /// Parses an operation type from a string.
  static OperationType parse(String value) {
    return OperationType.fromValue(value);
  }

  /// Returns whether [value] is a valid operation type.
  static bool isValid(String value) {
    return value.trim().isNotEmpty;
  }

  /// Returns whether [value] is a built-in operation type.
  static bool isBuiltInValue(String value) {
    return _builtInValues.contains(value.trim());
  }

  /// Attempts to parse an operation type.
  ///
  /// Returns `null` when [value] is empty or invalid.
  static OperationType? tryParse(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      return null;
    }

    return OperationType.fromValue(normalized);
  }

  // ---------------------------------------------------------------------------
  // Value helpers
  // ---------------------------------------------------------------------------

  /// Creates a new operation type with a different value.
  ///
  /// The returned value is canonicalized through [custom].
  OperationType copyWith(String value) {
    return OperationType.custom(value);
  }

  /// Whether this type has the same value as [other].
  bool isSameAs(OperationType other) {
    return this == other;
  }

  /// Whether this type has a different value from [other].
  bool isDifferentFrom(OperationType other) {
    return this != other;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is OperationType && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'OperationType($value)';
  }
}
