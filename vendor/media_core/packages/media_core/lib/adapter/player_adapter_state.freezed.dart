// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterState {

/// Whether adapter is initialized.
 bool get initialized;/// Whether a source is opened.
 bool get opened;/// Whether playback is active.
 bool get playing;/// Whether playback is paused.
 bool get paused;/// Whether backend is buffering.
 bool get buffering;/// Whether playback completed.
 bool get completed;/// Whether adapter has error.
 bool get hasError;/// Current playback position.
 Duration get position;/// Current duration.
 Duration? get duration;/// Current volume.
 double get volume;/// Current playback rate.
 double get rate;/// Video width.
 int? get width;/// Video height.
 int? get height;/// Error message.
 String? get errorMessage;
/// Create a copy of PlayerAdapterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterStateCopyWith<PlayerAdapterState> get copyWith => _$PlayerAdapterStateCopyWithImpl<PlayerAdapterState>(this as PlayerAdapterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerAdapterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterState&&(identical(other.initialized, _this.initialized) || other.initialized == _this.initialized)&&(identical(other.opened, _this.opened) || other.opened == _this.opened)&&(identical(other.playing, _this.playing) || other.playing == _this.playing)&&(identical(other.paused, _this.paused) || other.paused == _this.paused)&&(identical(other.buffering, _this.buffering) || other.buffering == _this.buffering)&&(identical(other.completed, _this.completed) || other.completed == _this.completed)&&(identical(other.hasError, _this.hasError) || other.hasError == _this.hasError)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as PlayerAdapterState;
  return Object.hash(runtimeType,_this.initialized,_this.opened,_this.playing,_this.paused,_this.buffering,_this.completed,_this.hasError,_this.position,_this.duration,_this.volume,_this.rate,_this.width,_this.height,_this.errorMessage);
}

@override
String toString() {
  final _this = this as PlayerAdapterState;
  return 'PlayerAdapterState(initialized: ${_this.initialized}, opened: ${_this.opened}, playing: ${_this.playing}, paused: ${_this.paused}, buffering: ${_this.buffering}, completed: ${_this.completed}, hasError: ${_this.hasError}, position: ${_this.position}, duration: ${_this.duration}, volume: ${_this.volume}, rate: ${_this.rate}, width: ${_this.width}, height: ${_this.height}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterStateCopyWith<$Res>  {
  factory $PlayerAdapterStateCopyWith(PlayerAdapterState value, $Res Function(PlayerAdapterState) _then) = _$PlayerAdapterStateCopyWithImpl;
@useResult
$Res call({
 bool initialized, bool opened, bool playing, bool paused, bool buffering, bool completed, bool hasError, Duration position, Duration? duration, double volume, double rate, int? width, int? height, String? errorMessage
});




}
/// @nodoc
class _$PlayerAdapterStateCopyWithImpl<$Res>
    implements $PlayerAdapterStateCopyWith<$Res> {
  _$PlayerAdapterStateCopyWithImpl(this._self, this._then);

  final PlayerAdapterState _self;
  final $Res Function(PlayerAdapterState) _then;

/// Create a copy of PlayerAdapterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialized = null,Object? opened = null,Object? playing = null,Object? paused = null,Object? buffering = null,Object? completed = null,Object? hasError = null,Object? position = null,Object? duration = freezed,Object? volume = null,Object? rate = null,Object? width = freezed,Object? height = freezed,Object? errorMessage = freezed,}) {
  return _then(PlayerAdapterState(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,opened: null == opened ? _self.opened : opened // ignore: cast_nullable_to_non_nullable
as bool,playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as bool,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerAdapterState].
extension PlayerAdapterStatePatterns on PlayerAdapterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerAdapterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerAdapterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerAdapterState value)  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerAdapterState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool initialized,  bool opened,  bool playing,  bool paused,  bool buffering,  bool completed,  bool hasError,  Duration position,  Duration? duration,  double volume,  double rate,  int? width,  int? height,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerAdapterState() when $default != null:
return $default(_that.initialized,_that.opened,_that.playing,_that.paused,_that.buffering,_that.completed,_that.hasError,_that.position,_that.duration,_that.volume,_that.rate,_that.width,_that.height,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool initialized,  bool opened,  bool playing,  bool paused,  bool buffering,  bool completed,  bool hasError,  Duration position,  Duration? duration,  double volume,  double rate,  int? width,  int? height,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterState():
return $default(_that.initialized,_that.opened,_that.playing,_that.paused,_that.buffering,_that.completed,_that.hasError,_that.position,_that.duration,_that.volume,_that.rate,_that.width,_that.height,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool initialized,  bool opened,  bool playing,  bool paused,  bool buffering,  bool completed,  bool hasError,  Duration position,  Duration? duration,  double volume,  double rate,  int? width,  int? height,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterState() when $default != null:
return $default(_that.initialized,_that.opened,_that.playing,_that.paused,_that.buffering,_that.completed,_that.hasError,_that.position,_that.duration,_that.volume,_that.rate,_that.width,_that.height,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerAdapterState implements PlayerAdapterState {
  const _PlayerAdapterState({this.initialized = false, this.opened = false, this.playing = false, this.paused = false, this.buffering = false, this.completed = false, this.hasError = false, this.position = Duration.zero, this.duration, this.volume = 1.0, this.rate = 1.0, this.width, this.height, this.errorMessage});
  

/// Whether adapter is initialized.
@override@JsonKey() final  bool initialized;
/// Whether a source is opened.
@override@JsonKey() final  bool opened;
/// Whether playback is active.
@override@JsonKey() final  bool playing;
/// Whether playback is paused.
@override@JsonKey() final  bool paused;
/// Whether backend is buffering.
@override@JsonKey() final  bool buffering;
/// Whether playback completed.
@override@JsonKey() final  bool completed;
/// Whether adapter has error.
@override@JsonKey() final  bool hasError;
/// Current playback position.
@override@JsonKey() final  Duration position;
/// Current duration.
@override final  Duration? duration;
/// Current volume.
@override@JsonKey() final  double volume;
/// Current playback rate.
@override@JsonKey() final  double rate;
/// Video width.
@override final  int? width;
/// Video height.
@override final  int? height;
/// Error message.
@override final  String? errorMessage;

/// Create a copy of PlayerAdapterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerAdapterStateCopyWith<_PlayerAdapterState> get copyWith => __$PlayerAdapterStateCopyWithImpl<_PlayerAdapterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerAdapterState&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.opened, opened) || other.opened == opened)&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.paused, paused) || other.paused == paused)&&(identical(other.buffering, buffering) || other.buffering == buffering)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,initialized,opened,playing,paused,buffering,completed,hasError,position,duration,volume,rate,width,height,errorMessage);
}

@override
String toString() {
    return 'PlayerAdapterState(initialized: $initialized, opened: $opened, playing: $playing, paused: $paused, buffering: $buffering, completed: $completed, hasError: $hasError, position: $position, duration: $duration, volume: $volume, rate: $rate, width: $width, height: $height, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PlayerAdapterStateCopyWith<$Res> implements $PlayerAdapterStateCopyWith<$Res> {
  factory _$PlayerAdapterStateCopyWith(_PlayerAdapterState value, $Res Function(_PlayerAdapterState) _then) = __$PlayerAdapterStateCopyWithImpl;
@override @useResult
$Res call({
 bool initialized, bool opened, bool playing, bool paused, bool buffering, bool completed, bool hasError, Duration position, Duration? duration, double volume, double rate, int? width, int? height, String? errorMessage
});




}
/// @nodoc
class __$PlayerAdapterStateCopyWithImpl<$Res>
    implements _$PlayerAdapterStateCopyWith<$Res> {
  __$PlayerAdapterStateCopyWithImpl(this._self, this._then);

  final _PlayerAdapterState _self;
  final $Res Function(_PlayerAdapterState) _then;

/// Create a copy of PlayerAdapterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialized = null,Object? opened = null,Object? playing = null,Object? paused = null,Object? buffering = null,Object? completed = null,Object? hasError = null,Object? position = null,Object? duration = freezed,Object? volume = null,Object? rate = null,Object? width = freezed,Object? height = freezed,Object? errorMessage = freezed,}) {
  return _then(_PlayerAdapterState(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,opened: null == opened ? _self.opened : opened // ignore: cast_nullable_to_non_nullable
as bool,playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as bool,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
