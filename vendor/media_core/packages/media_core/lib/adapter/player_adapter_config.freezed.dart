// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterConfig {

/// Enable hardware decoding.
 bool get hardwareAcceleration;/// Enable audio output.
 bool get audioEnabled;/// Initial volume.
 double get volume;/// Initial playback rate.
 double get playbackRate;/// Network timeout.
 Duration get networkTimeout;/// Buffer duration target.
 Duration get bufferDuration;/// Maximum buffer size in bytes.
///
/// Null means backend default.
 int? get maxBufferBytes;/// Preferred decoder name.
///
/// Example:
/// - h264
/// - hevc
 String? get preferredDecoder;/// Backend-specific options.
 Map<String, Object?> get options;
/// Create a copy of PlayerAdapterConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterConfigCopyWith<PlayerAdapterConfig> get copyWith => _$PlayerAdapterConfigCopyWithImpl<PlayerAdapterConfig>(this as PlayerAdapterConfig, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerAdapterConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterConfig&&(identical(other.hardwareAcceleration, _this.hardwareAcceleration) || other.hardwareAcceleration == _this.hardwareAcceleration)&&(identical(other.audioEnabled, _this.audioEnabled) || other.audioEnabled == _this.audioEnabled)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.playbackRate, _this.playbackRate) || other.playbackRate == _this.playbackRate)&&(identical(other.networkTimeout, _this.networkTimeout) || other.networkTimeout == _this.networkTimeout)&&(identical(other.bufferDuration, _this.bufferDuration) || other.bufferDuration == _this.bufferDuration)&&(identical(other.maxBufferBytes, _this.maxBufferBytes) || other.maxBufferBytes == _this.maxBufferBytes)&&(identical(other.preferredDecoder, _this.preferredDecoder) || other.preferredDecoder == _this.preferredDecoder)&&const DeepCollectionEquality().equals(other.options, _this.options));
}


@override
int get hashCode {
  final _this = this as PlayerAdapterConfig;
  return Object.hash(runtimeType,_this.hardwareAcceleration,_this.audioEnabled,_this.volume,_this.playbackRate,_this.networkTimeout,_this.bufferDuration,_this.maxBufferBytes,_this.preferredDecoder,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as PlayerAdapterConfig;
  return 'PlayerAdapterConfig(hardwareAcceleration: ${_this.hardwareAcceleration}, audioEnabled: ${_this.audioEnabled}, volume: ${_this.volume}, playbackRate: ${_this.playbackRate}, networkTimeout: ${_this.networkTimeout}, bufferDuration: ${_this.bufferDuration}, maxBufferBytes: ${_this.maxBufferBytes}, preferredDecoder: ${_this.preferredDecoder}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterConfigCopyWith<$Res>  {
  factory $PlayerAdapterConfigCopyWith(PlayerAdapterConfig value, $Res Function(PlayerAdapterConfig) _then) = _$PlayerAdapterConfigCopyWithImpl;
@useResult
$Res call({
 bool hardwareAcceleration, bool audioEnabled, double volume, double playbackRate, Duration networkTimeout, Duration bufferDuration, int? maxBufferBytes, String? preferredDecoder, Map<String, Object?> options
});




}
/// @nodoc
class _$PlayerAdapterConfigCopyWithImpl<$Res>
    implements $PlayerAdapterConfigCopyWith<$Res> {
  _$PlayerAdapterConfigCopyWithImpl(this._self, this._then);

  final PlayerAdapterConfig _self;
  final $Res Function(PlayerAdapterConfig) _then;

/// Create a copy of PlayerAdapterConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hardwareAcceleration = null,Object? audioEnabled = null,Object? volume = null,Object? playbackRate = null,Object? networkTimeout = null,Object? bufferDuration = null,Object? maxBufferBytes = freezed,Object? preferredDecoder = freezed,Object? options = null,}) {
  return _then(PlayerAdapterConfig(
hardwareAcceleration: null == hardwareAcceleration ? _self.hardwareAcceleration : hardwareAcceleration // ignore: cast_nullable_to_non_nullable
as bool,audioEnabled: null == audioEnabled ? _self.audioEnabled : audioEnabled // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,playbackRate: null == playbackRate ? _self.playbackRate : playbackRate // ignore: cast_nullable_to_non_nullable
as double,networkTimeout: null == networkTimeout ? _self.networkTimeout : networkTimeout // ignore: cast_nullable_to_non_nullable
as Duration,bufferDuration: null == bufferDuration ? _self.bufferDuration : bufferDuration // ignore: cast_nullable_to_non_nullable
as Duration,maxBufferBytes: freezed == maxBufferBytes ? _self.maxBufferBytes : maxBufferBytes // ignore: cast_nullable_to_non_nullable
as int?,preferredDecoder: freezed == preferredDecoder ? _self.preferredDecoder : preferredDecoder // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerAdapterConfig].
extension PlayerAdapterConfigPatterns on PlayerAdapterConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerAdapterConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerAdapterConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerAdapterConfig value)  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerAdapterConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hardwareAcceleration,  bool audioEnabled,  double volume,  double playbackRate,  Duration networkTimeout,  Duration bufferDuration,  int? maxBufferBytes,  String? preferredDecoder,  Map<String, Object?> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerAdapterConfig() when $default != null:
return $default(_that.hardwareAcceleration,_that.audioEnabled,_that.volume,_that.playbackRate,_that.networkTimeout,_that.bufferDuration,_that.maxBufferBytes,_that.preferredDecoder,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hardwareAcceleration,  bool audioEnabled,  double volume,  double playbackRate,  Duration networkTimeout,  Duration bufferDuration,  int? maxBufferBytes,  String? preferredDecoder,  Map<String, Object?> options)  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterConfig():
return $default(_that.hardwareAcceleration,_that.audioEnabled,_that.volume,_that.playbackRate,_that.networkTimeout,_that.bufferDuration,_that.maxBufferBytes,_that.preferredDecoder,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hardwareAcceleration,  bool audioEnabled,  double volume,  double playbackRate,  Duration networkTimeout,  Duration bufferDuration,  int? maxBufferBytes,  String? preferredDecoder,  Map<String, Object?> options)?  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterConfig() when $default != null:
return $default(_that.hardwareAcceleration,_that.audioEnabled,_that.volume,_that.playbackRate,_that.networkTimeout,_that.bufferDuration,_that.maxBufferBytes,_that.preferredDecoder,_that.options);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerAdapterConfig implements PlayerAdapterConfig {
  const _PlayerAdapterConfig({this.hardwareAcceleration = true, this.audioEnabled = true, this.volume = 1.0, this.playbackRate = 1.0, this.networkTimeout = const Duration(seconds: 15), this.bufferDuration = const Duration(seconds: 5), this.maxBufferBytes, this.preferredDecoder,  Map<String, Object?> options = const {}}): _options = options;
  

/// Enable hardware decoding.
@override@JsonKey() final  bool hardwareAcceleration;
/// Enable audio output.
@override@JsonKey() final  bool audioEnabled;
/// Initial volume.
@override@JsonKey() final  double volume;
/// Initial playback rate.
@override@JsonKey() final  double playbackRate;
/// Network timeout.
@override@JsonKey() final  Duration networkTimeout;
/// Buffer duration target.
@override@JsonKey() final  Duration bufferDuration;
/// Maximum buffer size in bytes.
///
/// Null means backend default.
@override final  int? maxBufferBytes;
/// Preferred decoder name.
///
/// Example:
/// - h264
/// - hevc
@override final  String? preferredDecoder;
/// Backend-specific options.
 final  Map<String, Object?> _options;
/// Backend-specific options.
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of PlayerAdapterConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerAdapterConfigCopyWith<_PlayerAdapterConfig> get copyWith => __$PlayerAdapterConfigCopyWithImpl<_PlayerAdapterConfig>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerAdapterConfig&&(identical(other.hardwareAcceleration, hardwareAcceleration) || other.hardwareAcceleration == hardwareAcceleration)&&(identical(other.audioEnabled, audioEnabled) || other.audioEnabled == audioEnabled)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.playbackRate, playbackRate) || other.playbackRate == playbackRate)&&(identical(other.networkTimeout, networkTimeout) || other.networkTimeout == networkTimeout)&&(identical(other.bufferDuration, bufferDuration) || other.bufferDuration == bufferDuration)&&(identical(other.maxBufferBytes, maxBufferBytes) || other.maxBufferBytes == maxBufferBytes)&&(identical(other.preferredDecoder, preferredDecoder) || other.preferredDecoder == preferredDecoder)&&const DeepCollectionEquality().equals(other.options, _options));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hardwareAcceleration,audioEnabled,volume,playbackRate,networkTimeout,bufferDuration,maxBufferBytes,preferredDecoder,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'PlayerAdapterConfig(hardwareAcceleration: $hardwareAcceleration, audioEnabled: $audioEnabled, volume: $volume, playbackRate: $playbackRate, networkTimeout: $networkTimeout, bufferDuration: $bufferDuration, maxBufferBytes: $maxBufferBytes, preferredDecoder: $preferredDecoder, options: $options)';
}


}

/// @nodoc
abstract mixin class _$PlayerAdapterConfigCopyWith<$Res> implements $PlayerAdapterConfigCopyWith<$Res> {
  factory _$PlayerAdapterConfigCopyWith(_PlayerAdapterConfig value, $Res Function(_PlayerAdapterConfig) _then) = __$PlayerAdapterConfigCopyWithImpl;
@override @useResult
$Res call({
 bool hardwareAcceleration, bool audioEnabled, double volume, double playbackRate, Duration networkTimeout, Duration bufferDuration, int? maxBufferBytes, String? preferredDecoder, Map<String, Object?> options
});




}
/// @nodoc
class __$PlayerAdapterConfigCopyWithImpl<$Res>
    implements _$PlayerAdapterConfigCopyWith<$Res> {
  __$PlayerAdapterConfigCopyWithImpl(this._self, this._then);

  final _PlayerAdapterConfig _self;
  final $Res Function(_PlayerAdapterConfig) _then;

/// Create a copy of PlayerAdapterConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hardwareAcceleration = null,Object? audioEnabled = null,Object? volume = null,Object? playbackRate = null,Object? networkTimeout = null,Object? bufferDuration = null,Object? maxBufferBytes = freezed,Object? preferredDecoder = freezed,Object? options = null,}) {
  return _then(_PlayerAdapterConfig(
hardwareAcceleration: null == hardwareAcceleration ? _self.hardwareAcceleration : hardwareAcceleration // ignore: cast_nullable_to_non_nullable
as bool,audioEnabled: null == audioEnabled ? _self.audioEnabled : audioEnabled // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,playbackRate: null == playbackRate ? _self.playbackRate : playbackRate // ignore: cast_nullable_to_non_nullable
as double,networkTimeout: null == networkTimeout ? _self.networkTimeout : networkTimeout // ignore: cast_nullable_to_non_nullable
as Duration,bufferDuration: null == bufferDuration ? _self.bufferDuration : bufferDuration // ignore: cast_nullable_to_non_nullable
as Duration,maxBufferBytes: freezed == maxBufferBytes ? _self.maxBufferBytes : maxBufferBytes // ignore: cast_nullable_to_non_nullable
as int?,preferredDecoder: freezed == preferredDecoder ? _self.preferredDecoder : preferredDecoder // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
