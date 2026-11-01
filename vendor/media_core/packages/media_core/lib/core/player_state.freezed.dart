// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerState {

/// Current player lifecycle state.
 PlayerLifecycleState get lifecycle;/// Current semantic playback state.
 PlayerPlaybackState get playback;/// Whether a media source is currently associated with the player.
 bool get hasSource;/// Whether audio output is enabled.
 bool get audioEnabled;/// Whether video output is enabled.
 bool get videoEnabled;/// Whether subtitle output is enabled.
 bool get subtitlesEnabled;/// Whether audio output is muted.
 bool get muted;
/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStateCopyWith<PlayerState> get copyWith => _$PlayerStateCopyWithImpl<PlayerState>(this as PlayerState, _$identity);

  /// Serializes this PlayerState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerState&&(identical(other.lifecycle, _this.lifecycle) || other.lifecycle == _this.lifecycle)&&(identical(other.playback, _this.playback) || other.playback == _this.playback)&&(identical(other.hasSource, _this.hasSource) || other.hasSource == _this.hasSource)&&(identical(other.audioEnabled, _this.audioEnabled) || other.audioEnabled == _this.audioEnabled)&&(identical(other.videoEnabled, _this.videoEnabled) || other.videoEnabled == _this.videoEnabled)&&(identical(other.subtitlesEnabled, _this.subtitlesEnabled) || other.subtitlesEnabled == _this.subtitlesEnabled)&&(identical(other.muted, _this.muted) || other.muted == _this.muted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerState;
  return Object.hash(runtimeType,_this.lifecycle,_this.playback,_this.hasSource,_this.audioEnabled,_this.videoEnabled,_this.subtitlesEnabled,_this.muted);
}

@override
String toString() {
  final _this = this as PlayerState;
  return 'PlayerState(lifecycle: ${_this.lifecycle}, playback: ${_this.playback}, hasSource: ${_this.hasSource}, audioEnabled: ${_this.audioEnabled}, videoEnabled: ${_this.videoEnabled}, subtitlesEnabled: ${_this.subtitlesEnabled}, muted: ${_this.muted})';
}


}

/// @nodoc
abstract mixin class $PlayerStateCopyWith<$Res>  {
  factory $PlayerStateCopyWith(PlayerState value, $Res Function(PlayerState) _then) = _$PlayerStateCopyWithImpl;
@useResult
$Res call({
 PlayerLifecycleState lifecycle, PlayerPlaybackState playback, bool hasSource, bool audioEnabled, bool videoEnabled, bool subtitlesEnabled, bool muted
});




}
/// @nodoc
class _$PlayerStateCopyWithImpl<$Res>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._self, this._then);

  final PlayerState _self;
  final $Res Function(PlayerState) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lifecycle = null,Object? playback = null,Object? hasSource = null,Object? audioEnabled = null,Object? videoEnabled = null,Object? subtitlesEnabled = null,Object? muted = null,}) {
  return _then(PlayerState(
lifecycle: null == lifecycle ? _self.lifecycle : lifecycle // ignore: cast_nullable_to_non_nullable
as PlayerLifecycleState,playback: null == playback ? _self.playback : playback // ignore: cast_nullable_to_non_nullable
as PlayerPlaybackState,hasSource: null == hasSource ? _self.hasSource : hasSource // ignore: cast_nullable_to_non_nullable
as bool,audioEnabled: null == audioEnabled ? _self.audioEnabled : audioEnabled // ignore: cast_nullable_to_non_nullable
as bool,videoEnabled: null == videoEnabled ? _self.videoEnabled : videoEnabled // ignore: cast_nullable_to_non_nullable
as bool,subtitlesEnabled: null == subtitlesEnabled ? _self.subtitlesEnabled : subtitlesEnabled // ignore: cast_nullable_to_non_nullable
as bool,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerState].
extension PlayerStatePatterns on PlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerState value)  $default,){
final _that = this;
switch (_that) {
case _PlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerLifecycleState lifecycle,  PlayerPlaybackState playback,  bool hasSource,  bool audioEnabled,  bool videoEnabled,  bool subtitlesEnabled,  bool muted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
return $default(_that.lifecycle,_that.playback,_that.hasSource,_that.audioEnabled,_that.videoEnabled,_that.subtitlesEnabled,_that.muted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerLifecycleState lifecycle,  PlayerPlaybackState playback,  bool hasSource,  bool audioEnabled,  bool videoEnabled,  bool subtitlesEnabled,  bool muted)  $default,) {final _that = this;
switch (_that) {
case _PlayerState():
return $default(_that.lifecycle,_that.playback,_that.hasSource,_that.audioEnabled,_that.videoEnabled,_that.subtitlesEnabled,_that.muted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerLifecycleState lifecycle,  PlayerPlaybackState playback,  bool hasSource,  bool audioEnabled,  bool videoEnabled,  bool subtitlesEnabled,  bool muted)?  $default,) {final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
return $default(_that.lifecycle,_that.playback,_that.hasSource,_that.audioEnabled,_that.videoEnabled,_that.subtitlesEnabled,_that.muted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerState extends PlayerState {
  const _PlayerState({this.lifecycle = PlayerLifecycleState.idle, this.playback = PlayerPlaybackState.idle, this.hasSource = false, this.audioEnabled = false, this.videoEnabled = false, this.subtitlesEnabled = false, this.muted = false}): super._();
  factory _PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);

/// Current player lifecycle state.
@override@JsonKey() final  PlayerLifecycleState lifecycle;
/// Current semantic playback state.
@override@JsonKey() final  PlayerPlaybackState playback;
/// Whether a media source is currently associated with the player.
@override@JsonKey() final  bool hasSource;
/// Whether audio output is enabled.
@override@JsonKey() final  bool audioEnabled;
/// Whether video output is enabled.
@override@JsonKey() final  bool videoEnabled;
/// Whether subtitle output is enabled.
@override@JsonKey() final  bool subtitlesEnabled;
/// Whether audio output is muted.
@override@JsonKey() final  bool muted;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStateCopyWith<_PlayerState> get copyWith => __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerState&&(identical(other.lifecycle, lifecycle) || other.lifecycle == lifecycle)&&(identical(other.playback, playback) || other.playback == playback)&&(identical(other.hasSource, hasSource) || other.hasSource == hasSource)&&(identical(other.audioEnabled, audioEnabled) || other.audioEnabled == audioEnabled)&&(identical(other.videoEnabled, videoEnabled) || other.videoEnabled == videoEnabled)&&(identical(other.subtitlesEnabled, subtitlesEnabled) || other.subtitlesEnabled == subtitlesEnabled)&&(identical(other.muted, muted) || other.muted == muted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lifecycle,playback,hasSource,audioEnabled,videoEnabled,subtitlesEnabled,muted);
}

@override
String toString() {
    return 'PlayerState(lifecycle: $lifecycle, playback: $playback, hasSource: $hasSource, audioEnabled: $audioEnabled, videoEnabled: $videoEnabled, subtitlesEnabled: $subtitlesEnabled, muted: $muted)';
}


}

/// @nodoc
abstract mixin class _$PlayerStateCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(_PlayerState value, $Res Function(_PlayerState) _then) = __$PlayerStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerLifecycleState lifecycle, PlayerPlaybackState playback, bool hasSource, bool audioEnabled, bool videoEnabled, bool subtitlesEnabled, bool muted
});




}
/// @nodoc
class __$PlayerStateCopyWithImpl<$Res>
    implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(this._self, this._then);

  final _PlayerState _self;
  final $Res Function(_PlayerState) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lifecycle = null,Object? playback = null,Object? hasSource = null,Object? audioEnabled = null,Object? videoEnabled = null,Object? subtitlesEnabled = null,Object? muted = null,}) {
  return _then(_PlayerState(
lifecycle: null == lifecycle ? _self.lifecycle : lifecycle // ignore: cast_nullable_to_non_nullable
as PlayerLifecycleState,playback: null == playback ? _self.playback : playback // ignore: cast_nullable_to_non_nullable
as PlayerPlaybackState,hasSource: null == hasSource ? _self.hasSource : hasSource // ignore: cast_nullable_to_non_nullable
as bool,audioEnabled: null == audioEnabled ? _self.audioEnabled : audioEnabled // ignore: cast_nullable_to_non_nullable
as bool,videoEnabled: null == videoEnabled ? _self.videoEnabled : videoEnabled // ignore: cast_nullable_to_non_nullable
as bool,subtitlesEnabled: null == subtitlesEnabled ? _self.subtitlesEnabled : subtitlesEnabled // ignore: cast_nullable_to_non_nullable
as bool,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
