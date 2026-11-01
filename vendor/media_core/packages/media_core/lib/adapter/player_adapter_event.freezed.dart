// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent()';
}


}

/// @nodoc
class $PlayerAdapterEventCopyWith<$Res>  {
$PlayerAdapterEventCopyWith(PlayerAdapterEvent _, $Res Function(PlayerAdapterEvent) __);
}


/// Adds pattern-matching-related methods to [PlayerAdapterEvent].
extension PlayerAdapterEventPatterns on PlayerAdapterEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerAdapterOpened value)?  opened,TResult Function( PlayerAdapterPlaying value)?  playing,TResult Function( PlayerAdapterPaused value)?  paused,TResult Function( PlayerAdapterStopped value)?  stopped,TResult Function( PlayerAdapterBuffering value)?  buffering,TResult Function( PlayerAdapterCompleted value)?  completed,TResult Function( PlayerAdapterPositionChanged value)?  positionChanged,TResult Function( PlayerAdapterDurationChanged value)?  durationChanged,TResult Function( PlayerAdapterVideoSizeChanged value)?  videoSizeChanged,TResult Function( PlayerAdapterVideoFrameProgress value)?  videoFrameProgress,TResult Function( PlayerAdapterVideoReconfigured value)?  videoReconfigured,TResult Function( PlayerAdapterHwdecChanged value)?  hwdecChanged,TResult Function( PlayerAdapterAudioReconfigured value)?  audioReconfigured,TResult Function( PlayerAdapterAudioDeviceChanged value)?  audioDeviceChanged,TResult Function( PlayerAdapterSubtitleChanged value)?  subtitleChanged,TResult Function( PlayerAdapterCacheChanged value)?  cacheChanged,TResult Function( PlayerAdapterMetadataChanged value)?  metadataChanged,TResult Function( PlayerAdapterPlaylistChanged value)?  playlistChanged,TResult Function( PlayerAdapterClientMessage value)?  clientMessage,TResult Function( PlayerAdapterLogMessage value)?  logMessage,TResult Function( PlayerAdapterVolumeChanged value)?  volumeChanged,TResult Function( PlayerAdapterRateChanged value)?  rateChanged,TResult Function( PlayerAdapterErrorEvent value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerAdapterOpened() when opened != null:
return opened(_that);case PlayerAdapterPlaying() when playing != null:
return playing(_that);case PlayerAdapterPaused() when paused != null:
return paused(_that);case PlayerAdapterStopped() when stopped != null:
return stopped(_that);case PlayerAdapterBuffering() when buffering != null:
return buffering(_that);case PlayerAdapterCompleted() when completed != null:
return completed(_that);case PlayerAdapterPositionChanged() when positionChanged != null:
return positionChanged(_that);case PlayerAdapterDurationChanged() when durationChanged != null:
return durationChanged(_that);case PlayerAdapterVideoSizeChanged() when videoSizeChanged != null:
return videoSizeChanged(_that);case PlayerAdapterVideoFrameProgress() when videoFrameProgress != null:
return videoFrameProgress(_that);case PlayerAdapterVideoReconfigured() when videoReconfigured != null:
return videoReconfigured(_that);case PlayerAdapterHwdecChanged() when hwdecChanged != null:
return hwdecChanged(_that);case PlayerAdapterAudioReconfigured() when audioReconfigured != null:
return audioReconfigured(_that);case PlayerAdapterAudioDeviceChanged() when audioDeviceChanged != null:
return audioDeviceChanged(_that);case PlayerAdapterSubtitleChanged() when subtitleChanged != null:
return subtitleChanged(_that);case PlayerAdapterCacheChanged() when cacheChanged != null:
return cacheChanged(_that);case PlayerAdapterMetadataChanged() when metadataChanged != null:
return metadataChanged(_that);case PlayerAdapterPlaylistChanged() when playlistChanged != null:
return playlistChanged(_that);case PlayerAdapterClientMessage() when clientMessage != null:
return clientMessage(_that);case PlayerAdapterLogMessage() when logMessage != null:
return logMessage(_that);case PlayerAdapterVolumeChanged() when volumeChanged != null:
return volumeChanged(_that);case PlayerAdapterRateChanged() when rateChanged != null:
return rateChanged(_that);case PlayerAdapterErrorEvent() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerAdapterOpened value)  opened,required TResult Function( PlayerAdapterPlaying value)  playing,required TResult Function( PlayerAdapterPaused value)  paused,required TResult Function( PlayerAdapterStopped value)  stopped,required TResult Function( PlayerAdapterBuffering value)  buffering,required TResult Function( PlayerAdapterCompleted value)  completed,required TResult Function( PlayerAdapterPositionChanged value)  positionChanged,required TResult Function( PlayerAdapterDurationChanged value)  durationChanged,required TResult Function( PlayerAdapterVideoSizeChanged value)  videoSizeChanged,required TResult Function( PlayerAdapterVideoFrameProgress value)  videoFrameProgress,required TResult Function( PlayerAdapterVideoReconfigured value)  videoReconfigured,required TResult Function( PlayerAdapterHwdecChanged value)  hwdecChanged,required TResult Function( PlayerAdapterAudioReconfigured value)  audioReconfigured,required TResult Function( PlayerAdapterAudioDeviceChanged value)  audioDeviceChanged,required TResult Function( PlayerAdapterSubtitleChanged value)  subtitleChanged,required TResult Function( PlayerAdapterCacheChanged value)  cacheChanged,required TResult Function( PlayerAdapterMetadataChanged value)  metadataChanged,required TResult Function( PlayerAdapterPlaylistChanged value)  playlistChanged,required TResult Function( PlayerAdapterClientMessage value)  clientMessage,required TResult Function( PlayerAdapterLogMessage value)  logMessage,required TResult Function( PlayerAdapterVolumeChanged value)  volumeChanged,required TResult Function( PlayerAdapterRateChanged value)  rateChanged,required TResult Function( PlayerAdapterErrorEvent value)  error,}){
final _that = this;
switch (_that) {
case PlayerAdapterOpened():
return opened(_that);case PlayerAdapterPlaying():
return playing(_that);case PlayerAdapterPaused():
return paused(_that);case PlayerAdapterStopped():
return stopped(_that);case PlayerAdapterBuffering():
return buffering(_that);case PlayerAdapterCompleted():
return completed(_that);case PlayerAdapterPositionChanged():
return positionChanged(_that);case PlayerAdapterDurationChanged():
return durationChanged(_that);case PlayerAdapterVideoSizeChanged():
return videoSizeChanged(_that);case PlayerAdapterVideoFrameProgress():
return videoFrameProgress(_that);case PlayerAdapterVideoReconfigured():
return videoReconfigured(_that);case PlayerAdapterHwdecChanged():
return hwdecChanged(_that);case PlayerAdapterAudioReconfigured():
return audioReconfigured(_that);case PlayerAdapterAudioDeviceChanged():
return audioDeviceChanged(_that);case PlayerAdapterSubtitleChanged():
return subtitleChanged(_that);case PlayerAdapterCacheChanged():
return cacheChanged(_that);case PlayerAdapterMetadataChanged():
return metadataChanged(_that);case PlayerAdapterPlaylistChanged():
return playlistChanged(_that);case PlayerAdapterClientMessage():
return clientMessage(_that);case PlayerAdapterLogMessage():
return logMessage(_that);case PlayerAdapterVolumeChanged():
return volumeChanged(_that);case PlayerAdapterRateChanged():
return rateChanged(_that);case PlayerAdapterErrorEvent():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerAdapterOpened value)?  opened,TResult? Function( PlayerAdapterPlaying value)?  playing,TResult? Function( PlayerAdapterPaused value)?  paused,TResult? Function( PlayerAdapterStopped value)?  stopped,TResult? Function( PlayerAdapterBuffering value)?  buffering,TResult? Function( PlayerAdapterCompleted value)?  completed,TResult? Function( PlayerAdapterPositionChanged value)?  positionChanged,TResult? Function( PlayerAdapterDurationChanged value)?  durationChanged,TResult? Function( PlayerAdapterVideoSizeChanged value)?  videoSizeChanged,TResult? Function( PlayerAdapterVideoFrameProgress value)?  videoFrameProgress,TResult? Function( PlayerAdapterVideoReconfigured value)?  videoReconfigured,TResult? Function( PlayerAdapterHwdecChanged value)?  hwdecChanged,TResult? Function( PlayerAdapterAudioReconfigured value)?  audioReconfigured,TResult? Function( PlayerAdapterAudioDeviceChanged value)?  audioDeviceChanged,TResult? Function( PlayerAdapterSubtitleChanged value)?  subtitleChanged,TResult? Function( PlayerAdapterCacheChanged value)?  cacheChanged,TResult? Function( PlayerAdapterMetadataChanged value)?  metadataChanged,TResult? Function( PlayerAdapterPlaylistChanged value)?  playlistChanged,TResult? Function( PlayerAdapterClientMessage value)?  clientMessage,TResult? Function( PlayerAdapterLogMessage value)?  logMessage,TResult? Function( PlayerAdapterVolumeChanged value)?  volumeChanged,TResult? Function( PlayerAdapterRateChanged value)?  rateChanged,TResult? Function( PlayerAdapterErrorEvent value)?  error,}){
final _that = this;
switch (_that) {
case PlayerAdapterOpened() when opened != null:
return opened(_that);case PlayerAdapterPlaying() when playing != null:
return playing(_that);case PlayerAdapterPaused() when paused != null:
return paused(_that);case PlayerAdapterStopped() when stopped != null:
return stopped(_that);case PlayerAdapterBuffering() when buffering != null:
return buffering(_that);case PlayerAdapterCompleted() when completed != null:
return completed(_that);case PlayerAdapterPositionChanged() when positionChanged != null:
return positionChanged(_that);case PlayerAdapterDurationChanged() when durationChanged != null:
return durationChanged(_that);case PlayerAdapterVideoSizeChanged() when videoSizeChanged != null:
return videoSizeChanged(_that);case PlayerAdapterVideoFrameProgress() when videoFrameProgress != null:
return videoFrameProgress(_that);case PlayerAdapterVideoReconfigured() when videoReconfigured != null:
return videoReconfigured(_that);case PlayerAdapterHwdecChanged() when hwdecChanged != null:
return hwdecChanged(_that);case PlayerAdapterAudioReconfigured() when audioReconfigured != null:
return audioReconfigured(_that);case PlayerAdapterAudioDeviceChanged() when audioDeviceChanged != null:
return audioDeviceChanged(_that);case PlayerAdapterSubtitleChanged() when subtitleChanged != null:
return subtitleChanged(_that);case PlayerAdapterCacheChanged() when cacheChanged != null:
return cacheChanged(_that);case PlayerAdapterMetadataChanged() when metadataChanged != null:
return metadataChanged(_that);case PlayerAdapterPlaylistChanged() when playlistChanged != null:
return playlistChanged(_that);case PlayerAdapterClientMessage() when clientMessage != null:
return clientMessage(_that);case PlayerAdapterLogMessage() when logMessage != null:
return logMessage(_that);case PlayerAdapterVolumeChanged() when volumeChanged != null:
return volumeChanged(_that);case PlayerAdapterRateChanged() when rateChanged != null:
return rateChanged(_that);case PlayerAdapterErrorEvent() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? source)?  opened,TResult Function()?  playing,TResult Function()?  paused,TResult Function()?  stopped,TResult Function( bool buffering,  double? progress)?  buffering,TResult Function()?  completed,TResult Function( Duration position)?  positionChanged,TResult Function( Duration duration)?  durationChanged,TResult Function( int width,  int height)?  videoSizeChanged,TResult Function()?  videoFrameProgress,TResult Function()?  videoReconfigured,TResult Function( String? decoder)?  hwdecChanged,TResult Function()?  audioReconfigured,TResult Function( String? device)?  audioDeviceChanged,TResult Function( String? text)?  subtitleChanged,TResult Function( bool? buffering,  Duration? duration,  double? progress)?  cacheChanged,TResult Function( Map<String, dynamic> metadata)?  metadataChanged,TResult Function( List<String> items,  int? index)?  playlistChanged,TResult Function( String message,  List<String> args)?  clientMessage,TResult Function( String level,  String prefix,  String text)?  logMessage,TResult Function( double volume)?  volumeChanged,TResult Function( double rate)?  rateChanged,TResult Function( String message,  Object? error,  StackTrace? stackTrace)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerAdapterOpened() when opened != null:
return opened(_that.source);case PlayerAdapterPlaying() when playing != null:
return playing();case PlayerAdapterPaused() when paused != null:
return paused();case PlayerAdapterStopped() when stopped != null:
return stopped();case PlayerAdapterBuffering() when buffering != null:
return buffering(_that.buffering,_that.progress);case PlayerAdapterCompleted() when completed != null:
return completed();case PlayerAdapterPositionChanged() when positionChanged != null:
return positionChanged(_that.position);case PlayerAdapterDurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case PlayerAdapterVideoSizeChanged() when videoSizeChanged != null:
return videoSizeChanged(_that.width,_that.height);case PlayerAdapterVideoFrameProgress() when videoFrameProgress != null:
return videoFrameProgress();case PlayerAdapterVideoReconfigured() when videoReconfigured != null:
return videoReconfigured();case PlayerAdapterHwdecChanged() when hwdecChanged != null:
return hwdecChanged(_that.decoder);case PlayerAdapterAudioReconfigured() when audioReconfigured != null:
return audioReconfigured();case PlayerAdapterAudioDeviceChanged() when audioDeviceChanged != null:
return audioDeviceChanged(_that.device);case PlayerAdapterSubtitleChanged() when subtitleChanged != null:
return subtitleChanged(_that.text);case PlayerAdapterCacheChanged() when cacheChanged != null:
return cacheChanged(_that.buffering,_that.duration,_that.progress);case PlayerAdapterMetadataChanged() when metadataChanged != null:
return metadataChanged(_that.metadata);case PlayerAdapterPlaylistChanged() when playlistChanged != null:
return playlistChanged(_that.items,_that.index);case PlayerAdapterClientMessage() when clientMessage != null:
return clientMessage(_that.message,_that.args);case PlayerAdapterLogMessage() when logMessage != null:
return logMessage(_that.level,_that.prefix,_that.text);case PlayerAdapterVolumeChanged() when volumeChanged != null:
return volumeChanged(_that.volume);case PlayerAdapterRateChanged() when rateChanged != null:
return rateChanged(_that.rate);case PlayerAdapterErrorEvent() when error != null:
return error(_that.message,_that.error,_that.stackTrace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? source)  opened,required TResult Function()  playing,required TResult Function()  paused,required TResult Function()  stopped,required TResult Function( bool buffering,  double? progress)  buffering,required TResult Function()  completed,required TResult Function( Duration position)  positionChanged,required TResult Function( Duration duration)  durationChanged,required TResult Function( int width,  int height)  videoSizeChanged,required TResult Function()  videoFrameProgress,required TResult Function()  videoReconfigured,required TResult Function( String? decoder)  hwdecChanged,required TResult Function()  audioReconfigured,required TResult Function( String? device)  audioDeviceChanged,required TResult Function( String? text)  subtitleChanged,required TResult Function( bool? buffering,  Duration? duration,  double? progress)  cacheChanged,required TResult Function( Map<String, dynamic> metadata)  metadataChanged,required TResult Function( List<String> items,  int? index)  playlistChanged,required TResult Function( String message,  List<String> args)  clientMessage,required TResult Function( String level,  String prefix,  String text)  logMessage,required TResult Function( double volume)  volumeChanged,required TResult Function( double rate)  rateChanged,required TResult Function( String message,  Object? error,  StackTrace? stackTrace)  error,}) {final _that = this;
switch (_that) {
case PlayerAdapterOpened():
return opened(_that.source);case PlayerAdapterPlaying():
return playing();case PlayerAdapterPaused():
return paused();case PlayerAdapterStopped():
return stopped();case PlayerAdapterBuffering():
return buffering(_that.buffering,_that.progress);case PlayerAdapterCompleted():
return completed();case PlayerAdapterPositionChanged():
return positionChanged(_that.position);case PlayerAdapterDurationChanged():
return durationChanged(_that.duration);case PlayerAdapterVideoSizeChanged():
return videoSizeChanged(_that.width,_that.height);case PlayerAdapterVideoFrameProgress():
return videoFrameProgress();case PlayerAdapterVideoReconfigured():
return videoReconfigured();case PlayerAdapterHwdecChanged():
return hwdecChanged(_that.decoder);case PlayerAdapterAudioReconfigured():
return audioReconfigured();case PlayerAdapterAudioDeviceChanged():
return audioDeviceChanged(_that.device);case PlayerAdapterSubtitleChanged():
return subtitleChanged(_that.text);case PlayerAdapterCacheChanged():
return cacheChanged(_that.buffering,_that.duration,_that.progress);case PlayerAdapterMetadataChanged():
return metadataChanged(_that.metadata);case PlayerAdapterPlaylistChanged():
return playlistChanged(_that.items,_that.index);case PlayerAdapterClientMessage():
return clientMessage(_that.message,_that.args);case PlayerAdapterLogMessage():
return logMessage(_that.level,_that.prefix,_that.text);case PlayerAdapterVolumeChanged():
return volumeChanged(_that.volume);case PlayerAdapterRateChanged():
return rateChanged(_that.rate);case PlayerAdapterErrorEvent():
return error(_that.message,_that.error,_that.stackTrace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? source)?  opened,TResult? Function()?  playing,TResult? Function()?  paused,TResult? Function()?  stopped,TResult? Function( bool buffering,  double? progress)?  buffering,TResult? Function()?  completed,TResult? Function( Duration position)?  positionChanged,TResult? Function( Duration duration)?  durationChanged,TResult? Function( int width,  int height)?  videoSizeChanged,TResult? Function()?  videoFrameProgress,TResult? Function()?  videoReconfigured,TResult? Function( String? decoder)?  hwdecChanged,TResult? Function()?  audioReconfigured,TResult? Function( String? device)?  audioDeviceChanged,TResult? Function( String? text)?  subtitleChanged,TResult? Function( bool? buffering,  Duration? duration,  double? progress)?  cacheChanged,TResult? Function( Map<String, dynamic> metadata)?  metadataChanged,TResult? Function( List<String> items,  int? index)?  playlistChanged,TResult? Function( String message,  List<String> args)?  clientMessage,TResult? Function( String level,  String prefix,  String text)?  logMessage,TResult? Function( double volume)?  volumeChanged,TResult? Function( double rate)?  rateChanged,TResult? Function( String message,  Object? error,  StackTrace? stackTrace)?  error,}) {final _that = this;
switch (_that) {
case PlayerAdapterOpened() when opened != null:
return opened(_that.source);case PlayerAdapterPlaying() when playing != null:
return playing();case PlayerAdapterPaused() when paused != null:
return paused();case PlayerAdapterStopped() when stopped != null:
return stopped();case PlayerAdapterBuffering() when buffering != null:
return buffering(_that.buffering,_that.progress);case PlayerAdapterCompleted() when completed != null:
return completed();case PlayerAdapterPositionChanged() when positionChanged != null:
return positionChanged(_that.position);case PlayerAdapterDurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case PlayerAdapterVideoSizeChanged() when videoSizeChanged != null:
return videoSizeChanged(_that.width,_that.height);case PlayerAdapterVideoFrameProgress() when videoFrameProgress != null:
return videoFrameProgress();case PlayerAdapterVideoReconfigured() when videoReconfigured != null:
return videoReconfigured();case PlayerAdapterHwdecChanged() when hwdecChanged != null:
return hwdecChanged(_that.decoder);case PlayerAdapterAudioReconfigured() when audioReconfigured != null:
return audioReconfigured();case PlayerAdapterAudioDeviceChanged() when audioDeviceChanged != null:
return audioDeviceChanged(_that.device);case PlayerAdapterSubtitleChanged() when subtitleChanged != null:
return subtitleChanged(_that.text);case PlayerAdapterCacheChanged() when cacheChanged != null:
return cacheChanged(_that.buffering,_that.duration,_that.progress);case PlayerAdapterMetadataChanged() when metadataChanged != null:
return metadataChanged(_that.metadata);case PlayerAdapterPlaylistChanged() when playlistChanged != null:
return playlistChanged(_that.items,_that.index);case PlayerAdapterClientMessage() when clientMessage != null:
return clientMessage(_that.message,_that.args);case PlayerAdapterLogMessage() when logMessage != null:
return logMessage(_that.level,_that.prefix,_that.text);case PlayerAdapterVolumeChanged() when volumeChanged != null:
return volumeChanged(_that.volume);case PlayerAdapterRateChanged() when rateChanged != null:
return rateChanged(_that.rate);case PlayerAdapterErrorEvent() when error != null:
return error(_that.message,_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class PlayerAdapterOpened implements PlayerAdapterEvent {
  const PlayerAdapterOpened({this.source});
  

/// Opened source identifier.
 final  String? source;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterOpenedCopyWith<PlayerAdapterOpened> get copyWith => _$PlayerAdapterOpenedCopyWithImpl<PlayerAdapterOpened>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterOpened&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,source);
}

@override
String toString() {
    return 'PlayerAdapterEvent.opened(source: $source)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterOpenedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterOpenedCopyWith(PlayerAdapterOpened value, $Res Function(PlayerAdapterOpened) _then) = _$PlayerAdapterOpenedCopyWithImpl;
@useResult
$Res call({
 String? source
});




}
/// @nodoc
class _$PlayerAdapterOpenedCopyWithImpl<$Res>
    implements $PlayerAdapterOpenedCopyWith<$Res> {
  _$PlayerAdapterOpenedCopyWithImpl(this._self, this._then);

  final PlayerAdapterOpened _self;
  final $Res Function(PlayerAdapterOpened) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = freezed,}) {
  return _then(PlayerAdapterOpened(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerAdapterPlaying implements PlayerAdapterEvent {
  const PlayerAdapterPlaying();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterPlaying);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.playing()';
}


}




/// @nodoc


class PlayerAdapterPaused implements PlayerAdapterEvent {
  const PlayerAdapterPaused();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterPaused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.paused()';
}


}




/// @nodoc


class PlayerAdapterStopped implements PlayerAdapterEvent {
  const PlayerAdapterStopped();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterStopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.stopped()';
}


}




/// @nodoc


class PlayerAdapterBuffering implements PlayerAdapterEvent {
  const PlayerAdapterBuffering({required this.buffering, this.progress});
  

/// Whether buffering is active.
 final  bool buffering;
/// Optional buffering percentage.
 final  double? progress;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterBufferingCopyWith<PlayerAdapterBuffering> get copyWith => _$PlayerAdapterBufferingCopyWithImpl<PlayerAdapterBuffering>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterBuffering&&(identical(other.buffering, buffering) || other.buffering == buffering)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode {
    return Object.hash(runtimeType,buffering,progress);
}

@override
String toString() {
    return 'PlayerAdapterEvent.buffering(buffering: $buffering, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterBufferingCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterBufferingCopyWith(PlayerAdapterBuffering value, $Res Function(PlayerAdapterBuffering) _then) = _$PlayerAdapterBufferingCopyWithImpl;
@useResult
$Res call({
 bool buffering, double? progress
});




}
/// @nodoc
class _$PlayerAdapterBufferingCopyWithImpl<$Res>
    implements $PlayerAdapterBufferingCopyWith<$Res> {
  _$PlayerAdapterBufferingCopyWithImpl(this._self, this._then);

  final PlayerAdapterBuffering _self;
  final $Res Function(PlayerAdapterBuffering) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buffering = null,Object? progress = freezed,}) {
  return _then(PlayerAdapterBuffering(
buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class PlayerAdapterCompleted implements PlayerAdapterEvent {
  const PlayerAdapterCompleted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.completed()';
}


}




/// @nodoc


class PlayerAdapterPositionChanged implements PlayerAdapterEvent {
  const PlayerAdapterPositionChanged({required this.position});
  

 final  Duration position;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterPositionChangedCopyWith<PlayerAdapterPositionChanged> get copyWith => _$PlayerAdapterPositionChangedCopyWithImpl<PlayerAdapterPositionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterPositionChanged&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode {
    return Object.hash(runtimeType,position);
}

@override
String toString() {
    return 'PlayerAdapterEvent.positionChanged(position: $position)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterPositionChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterPositionChangedCopyWith(PlayerAdapterPositionChanged value, $Res Function(PlayerAdapterPositionChanged) _then) = _$PlayerAdapterPositionChangedCopyWithImpl;
@useResult
$Res call({
 Duration position
});




}
/// @nodoc
class _$PlayerAdapterPositionChangedCopyWithImpl<$Res>
    implements $PlayerAdapterPositionChangedCopyWith<$Res> {
  _$PlayerAdapterPositionChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterPositionChanged _self;
  final $Res Function(PlayerAdapterPositionChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(PlayerAdapterPositionChanged(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class PlayerAdapterDurationChanged implements PlayerAdapterEvent {
  const PlayerAdapterDurationChanged({required this.duration});
  

 final  Duration duration;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterDurationChangedCopyWith<PlayerAdapterDurationChanged> get copyWith => _$PlayerAdapterDurationChangedCopyWithImpl<PlayerAdapterDurationChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterDurationChanged&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,duration);
}

@override
String toString() {
    return 'PlayerAdapterEvent.durationChanged(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterDurationChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterDurationChangedCopyWith(PlayerAdapterDurationChanged value, $Res Function(PlayerAdapterDurationChanged) _then) = _$PlayerAdapterDurationChangedCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class _$PlayerAdapterDurationChangedCopyWithImpl<$Res>
    implements $PlayerAdapterDurationChangedCopyWith<$Res> {
  _$PlayerAdapterDurationChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterDurationChanged _self;
  final $Res Function(PlayerAdapterDurationChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(PlayerAdapterDurationChanged(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class PlayerAdapterVideoSizeChanged implements PlayerAdapterEvent {
  const PlayerAdapterVideoSizeChanged({required this.width, required this.height});
  

 final  int width;
 final  int height;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterVideoSizeChangedCopyWith<PlayerAdapterVideoSizeChanged> get copyWith => _$PlayerAdapterVideoSizeChangedCopyWithImpl<PlayerAdapterVideoSizeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterVideoSizeChanged&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode {
    return Object.hash(runtimeType,width,height);
}

@override
String toString() {
    return 'PlayerAdapterEvent.videoSizeChanged(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterVideoSizeChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterVideoSizeChangedCopyWith(PlayerAdapterVideoSizeChanged value, $Res Function(PlayerAdapterVideoSizeChanged) _then) = _$PlayerAdapterVideoSizeChangedCopyWithImpl;
@useResult
$Res call({
 int width, int height
});




}
/// @nodoc
class _$PlayerAdapterVideoSizeChangedCopyWithImpl<$Res>
    implements $PlayerAdapterVideoSizeChangedCopyWith<$Res> {
  _$PlayerAdapterVideoSizeChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterVideoSizeChanged _self;
  final $Res Function(PlayerAdapterVideoSizeChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,}) {
  return _then(PlayerAdapterVideoSizeChanged(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PlayerAdapterVideoFrameProgress implements PlayerAdapterEvent {
  const PlayerAdapterVideoFrameProgress();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterVideoFrameProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.videoFrameProgress()';
}


}




/// @nodoc


class PlayerAdapterVideoReconfigured implements PlayerAdapterEvent {
  const PlayerAdapterVideoReconfigured();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterVideoReconfigured);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.videoReconfigured()';
}


}




/// @nodoc


class PlayerAdapterHwdecChanged implements PlayerAdapterEvent {
  const PlayerAdapterHwdecChanged({this.decoder});
  

 final  String? decoder;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterHwdecChangedCopyWith<PlayerAdapterHwdecChanged> get copyWith => _$PlayerAdapterHwdecChangedCopyWithImpl<PlayerAdapterHwdecChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterHwdecChanged&&(identical(other.decoder, decoder) || other.decoder == decoder));
}


@override
int get hashCode {
    return Object.hash(runtimeType,decoder);
}

@override
String toString() {
    return 'PlayerAdapterEvent.hwdecChanged(decoder: $decoder)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterHwdecChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterHwdecChangedCopyWith(PlayerAdapterHwdecChanged value, $Res Function(PlayerAdapterHwdecChanged) _then) = _$PlayerAdapterHwdecChangedCopyWithImpl;
@useResult
$Res call({
 String? decoder
});




}
/// @nodoc
class _$PlayerAdapterHwdecChangedCopyWithImpl<$Res>
    implements $PlayerAdapterHwdecChangedCopyWith<$Res> {
  _$PlayerAdapterHwdecChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterHwdecChanged _self;
  final $Res Function(PlayerAdapterHwdecChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? decoder = freezed,}) {
  return _then(PlayerAdapterHwdecChanged(
decoder: freezed == decoder ? _self.decoder : decoder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerAdapterAudioReconfigured implements PlayerAdapterEvent {
  const PlayerAdapterAudioReconfigured();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterAudioReconfigured);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PlayerAdapterEvent.audioReconfigured()';
}


}




/// @nodoc


class PlayerAdapterAudioDeviceChanged implements PlayerAdapterEvent {
  const PlayerAdapterAudioDeviceChanged({this.device});
  

 final  String? device;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterAudioDeviceChangedCopyWith<PlayerAdapterAudioDeviceChanged> get copyWith => _$PlayerAdapterAudioDeviceChangedCopyWithImpl<PlayerAdapterAudioDeviceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterAudioDeviceChanged&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode {
    return Object.hash(runtimeType,device);
}

@override
String toString() {
    return 'PlayerAdapterEvent.audioDeviceChanged(device: $device)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterAudioDeviceChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterAudioDeviceChangedCopyWith(PlayerAdapterAudioDeviceChanged value, $Res Function(PlayerAdapterAudioDeviceChanged) _then) = _$PlayerAdapterAudioDeviceChangedCopyWithImpl;
@useResult
$Res call({
 String? device
});




}
/// @nodoc
class _$PlayerAdapterAudioDeviceChangedCopyWithImpl<$Res>
    implements $PlayerAdapterAudioDeviceChangedCopyWith<$Res> {
  _$PlayerAdapterAudioDeviceChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterAudioDeviceChanged _self;
  final $Res Function(PlayerAdapterAudioDeviceChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = freezed,}) {
  return _then(PlayerAdapterAudioDeviceChanged(
device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerAdapterSubtitleChanged implements PlayerAdapterEvent {
  const PlayerAdapterSubtitleChanged({this.text});
  

 final  String? text;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterSubtitleChangedCopyWith<PlayerAdapterSubtitleChanged> get copyWith => _$PlayerAdapterSubtitleChangedCopyWithImpl<PlayerAdapterSubtitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterSubtitleChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'PlayerAdapterEvent.subtitleChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterSubtitleChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterSubtitleChangedCopyWith(PlayerAdapterSubtitleChanged value, $Res Function(PlayerAdapterSubtitleChanged) _then) = _$PlayerAdapterSubtitleChangedCopyWithImpl;
@useResult
$Res call({
 String? text
});




}
/// @nodoc
class _$PlayerAdapterSubtitleChangedCopyWithImpl<$Res>
    implements $PlayerAdapterSubtitleChangedCopyWith<$Res> {
  _$PlayerAdapterSubtitleChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterSubtitleChanged _self;
  final $Res Function(PlayerAdapterSubtitleChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = freezed,}) {
  return _then(PlayerAdapterSubtitleChanged(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerAdapterCacheChanged implements PlayerAdapterEvent {
  const PlayerAdapterCacheChanged({this.buffering, this.duration, this.progress});
  

/// Whether the backend is currently buffering.
 final  bool? buffering;
/// Cached duration when available.
 final  Duration? duration;
/// Cached or buffered progress when available.
 final  double? progress;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterCacheChangedCopyWith<PlayerAdapterCacheChanged> get copyWith => _$PlayerAdapterCacheChangedCopyWithImpl<PlayerAdapterCacheChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterCacheChanged&&(identical(other.buffering, buffering) || other.buffering == buffering)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode {
    return Object.hash(runtimeType,buffering,duration,progress);
}

@override
String toString() {
    return 'PlayerAdapterEvent.cacheChanged(buffering: $buffering, duration: $duration, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterCacheChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterCacheChangedCopyWith(PlayerAdapterCacheChanged value, $Res Function(PlayerAdapterCacheChanged) _then) = _$PlayerAdapterCacheChangedCopyWithImpl;
@useResult
$Res call({
 bool? buffering, Duration? duration, double? progress
});




}
/// @nodoc
class _$PlayerAdapterCacheChangedCopyWithImpl<$Res>
    implements $PlayerAdapterCacheChangedCopyWith<$Res> {
  _$PlayerAdapterCacheChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterCacheChanged _self;
  final $Res Function(PlayerAdapterCacheChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buffering = freezed,Object? duration = freezed,Object? progress = freezed,}) {
  return _then(PlayerAdapterCacheChanged(
buffering: freezed == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class PlayerAdapterMetadataChanged implements PlayerAdapterEvent {
  const PlayerAdapterMetadataChanged({required  Map<String, dynamic> metadata}): _metadata = metadata;
  

 final  Map<String, dynamic> _metadata;
 Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterMetadataChangedCopyWith<PlayerAdapterMetadataChanged> get copyWith => _$PlayerAdapterMetadataChangedCopyWithImpl<PlayerAdapterMetadataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterMetadataChanged&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'PlayerAdapterEvent.metadataChanged(metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterMetadataChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterMetadataChangedCopyWith(PlayerAdapterMetadataChanged value, $Res Function(PlayerAdapterMetadataChanged) _then) = _$PlayerAdapterMetadataChangedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> metadata
});




}
/// @nodoc
class _$PlayerAdapterMetadataChangedCopyWithImpl<$Res>
    implements $PlayerAdapterMetadataChangedCopyWith<$Res> {
  _$PlayerAdapterMetadataChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterMetadataChanged _self;
  final $Res Function(PlayerAdapterMetadataChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? metadata = null,}) {
  return _then(PlayerAdapterMetadataChanged(
metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class PlayerAdapterPlaylistChanged implements PlayerAdapterEvent {
  const PlayerAdapterPlaylistChanged({required  List<String> items, this.index}): _items = items;
  

 final  List<String> _items;
 List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  int? index;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterPlaylistChangedCopyWith<PlayerAdapterPlaylistChanged> get copyWith => _$PlayerAdapterPlaylistChangedCopyWithImpl<PlayerAdapterPlaylistChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterPlaylistChanged&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),index);
}

@override
String toString() {
    return 'PlayerAdapterEvent.playlistChanged(items: $items, index: $index)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterPlaylistChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterPlaylistChangedCopyWith(PlayerAdapterPlaylistChanged value, $Res Function(PlayerAdapterPlaylistChanged) _then) = _$PlayerAdapterPlaylistChangedCopyWithImpl;
@useResult
$Res call({
 List<String> items, int? index
});




}
/// @nodoc
class _$PlayerAdapterPlaylistChangedCopyWithImpl<$Res>
    implements $PlayerAdapterPlaylistChangedCopyWith<$Res> {
  _$PlayerAdapterPlaylistChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterPlaylistChanged _self;
  final $Res Function(PlayerAdapterPlaylistChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? index = freezed,}) {
  return _then(PlayerAdapterPlaylistChanged(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class PlayerAdapterClientMessage implements PlayerAdapterEvent {
  const PlayerAdapterClientMessage({required this.message,  List<String> args = const <String>[]}): _args = args;
  

/// Backend message.
 final  String message;
/// Optional message arguments.
 final  List<String> _args;
/// Optional message arguments.
@JsonKey() List<String> get args {
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_args);
}


/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterClientMessageCopyWith<PlayerAdapterClientMessage> get copyWith => _$PlayerAdapterClientMessageCopyWithImpl<PlayerAdapterClientMessage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterClientMessage&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.args, _args));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_args));
}

@override
String toString() {
    return 'PlayerAdapterEvent.clientMessage(message: $message, args: $args)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterClientMessageCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterClientMessageCopyWith(PlayerAdapterClientMessage value, $Res Function(PlayerAdapterClientMessage) _then) = _$PlayerAdapterClientMessageCopyWithImpl;
@useResult
$Res call({
 String message, List<String> args
});




}
/// @nodoc
class _$PlayerAdapterClientMessageCopyWithImpl<$Res>
    implements $PlayerAdapterClientMessageCopyWith<$Res> {
  _$PlayerAdapterClientMessageCopyWithImpl(this._self, this._then);

  final PlayerAdapterClientMessage _self;
  final $Res Function(PlayerAdapterClientMessage) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? args = null,}) {
  return _then(PlayerAdapterClientMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,args: null == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class PlayerAdapterLogMessage implements PlayerAdapterEvent {
  const PlayerAdapterLogMessage({required this.level, required this.prefix, required this.text});
  

 final  String level;
 final  String prefix;
 final  String text;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterLogMessageCopyWith<PlayerAdapterLogMessage> get copyWith => _$PlayerAdapterLogMessageCopyWithImpl<PlayerAdapterLogMessage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterLogMessage&&(identical(other.level, level) || other.level == level)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,level,prefix,text);
}

@override
String toString() {
    return 'PlayerAdapterEvent.logMessage(level: $level, prefix: $prefix, text: $text)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterLogMessageCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterLogMessageCopyWith(PlayerAdapterLogMessage value, $Res Function(PlayerAdapterLogMessage) _then) = _$PlayerAdapterLogMessageCopyWithImpl;
@useResult
$Res call({
 String level, String prefix, String text
});




}
/// @nodoc
class _$PlayerAdapterLogMessageCopyWithImpl<$Res>
    implements $PlayerAdapterLogMessageCopyWith<$Res> {
  _$PlayerAdapterLogMessageCopyWithImpl(this._self, this._then);

  final PlayerAdapterLogMessage _self;
  final $Res Function(PlayerAdapterLogMessage) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,Object? prefix = null,Object? text = null,}) {
  return _then(PlayerAdapterLogMessage(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,prefix: null == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlayerAdapterVolumeChanged implements PlayerAdapterEvent {
  const PlayerAdapterVolumeChanged({required this.volume});
  

 final  double volume;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterVolumeChangedCopyWith<PlayerAdapterVolumeChanged> get copyWith => _$PlayerAdapterVolumeChangedCopyWithImpl<PlayerAdapterVolumeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterVolumeChanged&&(identical(other.volume, volume) || other.volume == volume));
}


@override
int get hashCode {
    return Object.hash(runtimeType,volume);
}

@override
String toString() {
    return 'PlayerAdapterEvent.volumeChanged(volume: $volume)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterVolumeChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterVolumeChangedCopyWith(PlayerAdapterVolumeChanged value, $Res Function(PlayerAdapterVolumeChanged) _then) = _$PlayerAdapterVolumeChangedCopyWithImpl;
@useResult
$Res call({
 double volume
});




}
/// @nodoc
class _$PlayerAdapterVolumeChangedCopyWithImpl<$Res>
    implements $PlayerAdapterVolumeChangedCopyWith<$Res> {
  _$PlayerAdapterVolumeChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterVolumeChanged _self;
  final $Res Function(PlayerAdapterVolumeChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? volume = null,}) {
  return _then(PlayerAdapterVolumeChanged(
volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PlayerAdapterRateChanged implements PlayerAdapterEvent {
  const PlayerAdapterRateChanged({required this.rate});
  

 final  double rate;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterRateChangedCopyWith<PlayerAdapterRateChanged> get copyWith => _$PlayerAdapterRateChangedCopyWithImpl<PlayerAdapterRateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterRateChanged&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rate);
}

@override
String toString() {
    return 'PlayerAdapterEvent.rateChanged(rate: $rate)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterRateChangedCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterRateChangedCopyWith(PlayerAdapterRateChanged value, $Res Function(PlayerAdapterRateChanged) _then) = _$PlayerAdapterRateChangedCopyWithImpl;
@useResult
$Res call({
 double rate
});




}
/// @nodoc
class _$PlayerAdapterRateChangedCopyWithImpl<$Res>
    implements $PlayerAdapterRateChangedCopyWith<$Res> {
  _$PlayerAdapterRateChangedCopyWithImpl(this._self, this._then);

  final PlayerAdapterRateChanged _self;
  final $Res Function(PlayerAdapterRateChanged) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = null,}) {
  return _then(PlayerAdapterRateChanged(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PlayerAdapterErrorEvent implements PlayerAdapterEvent {
  const PlayerAdapterErrorEvent({required this.message, this.error, this.stackTrace});
  

 final  String message;
 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterErrorEventCopyWith<PlayerAdapterErrorEvent> get copyWith => _$PlayerAdapterErrorEventCopyWithImpl<PlayerAdapterErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterErrorEvent&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);
}

@override
String toString() {
    return 'PlayerAdapterEvent.error(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterErrorEventCopyWith<$Res> implements $PlayerAdapterEventCopyWith<$Res> {
  factory $PlayerAdapterErrorEventCopyWith(PlayerAdapterErrorEvent value, $Res Function(PlayerAdapterErrorEvent) _then) = _$PlayerAdapterErrorEventCopyWithImpl;
@useResult
$Res call({
 String message, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$PlayerAdapterErrorEventCopyWithImpl<$Res>
    implements $PlayerAdapterErrorEventCopyWith<$Res> {
  _$PlayerAdapterErrorEventCopyWithImpl(this._self, this._then);

  final PlayerAdapterErrorEvent _self;
  final $Res Function(PlayerAdapterErrorEvent) _then;

/// Create a copy of PlayerAdapterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(PlayerAdapterErrorEvent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
