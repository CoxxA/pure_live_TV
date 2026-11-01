// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterContext {

/// Player identifier.
 PlayerId get playerId;/// Playback session identifier.
 SessionId get sessionId;/// Adapter configuration.
 PlayerAdapterConfig get config;/// Player configuration.
 PlayerConfig? get playerConfig;/// Backend specific options.
 Map<String, Object?> get options;/// Capabilities reported by the running device.
///
/// Filled from the platform probe the kernel was given; the defaults are
/// what a host that attached no provider gets, and they report themselves
/// as [PlatformCapabilities.reported] `false` so a backend can tell.
 PlatformCapabilities get platform;/// Device facts of the running device (cores, memory, ABI width).
 PlatformDeviceProfile get device;/// What the device can decode, and in hardware or not.
 PlatformCodecCapabilities get codecs;/// Debug mode.
 bool get debug;
/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterContextCopyWith<PlayerAdapterContext> get copyWith => _$PlayerAdapterContextCopyWithImpl<PlayerAdapterContext>(this as PlayerAdapterContext, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerAdapterContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterContext&&(identical(other.playerId, _this.playerId) || other.playerId == _this.playerId)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.config, _this.config) || other.config == _this.config)&&(identical(other.playerConfig, _this.playerConfig) || other.playerConfig == _this.playerConfig)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.codecs, _this.codecs) || other.codecs == _this.codecs)&&(identical(other.debug, _this.debug) || other.debug == _this.debug));
}


@override
int get hashCode {
  final _this = this as PlayerAdapterContext;
  return Object.hash(runtimeType,_this.playerId,_this.sessionId,_this.config,_this.playerConfig,const DeepCollectionEquality().hash(_this.options),_this.platform,_this.device,_this.codecs,_this.debug);
}

@override
String toString() {
  final _this = this as PlayerAdapterContext;
  return 'PlayerAdapterContext(playerId: ${_this.playerId}, sessionId: ${_this.sessionId}, config: ${_this.config}, playerConfig: ${_this.playerConfig}, options: ${_this.options}, platform: ${_this.platform}, device: ${_this.device}, codecs: ${_this.codecs}, debug: ${_this.debug})';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterContextCopyWith<$Res>  {
  factory $PlayerAdapterContextCopyWith(PlayerAdapterContext value, $Res Function(PlayerAdapterContext) _then) = _$PlayerAdapterContextCopyWithImpl;
@useResult
$Res call({
 PlayerId playerId, SessionId sessionId, PlayerAdapterConfig config, PlayerConfig? playerConfig, Map<String, Object?> options, PlatformCapabilities platform, PlatformDeviceProfile device, PlatformCodecCapabilities codecs, bool debug
});


$PlayerAdapterConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$PlayerAdapterContextCopyWithImpl<$Res>
    implements $PlayerAdapterContextCopyWith<$Res> {
  _$PlayerAdapterContextCopyWithImpl(this._self, this._then);

  final PlayerAdapterContext _self;
  final $Res Function(PlayerAdapterContext) _then;

/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? sessionId = null,Object? config = null,Object? playerConfig = freezed,Object? options = null,Object? platform = null,Object? device = null,Object? codecs = null,Object? debug = null,}) {
  return _then(PlayerAdapterContext(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as SessionId,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as PlayerAdapterConfig,playerConfig: freezed == playerConfig ? _self.playerConfig : playerConfig // ignore: cast_nullable_to_non_nullable
as PlayerConfig?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformCapabilities,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PlatformDeviceProfile,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as PlatformCodecCapabilities,debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerAdapterConfigCopyWith<$Res> get config {
  
  return $PlayerAdapterConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerAdapterContext].
extension PlayerAdapterContextPatterns on PlayerAdapterContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerAdapterContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerAdapterContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerAdapterContext value)  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerAdapterContext value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerId playerId,  SessionId sessionId,  PlayerAdapterConfig config,  PlayerConfig? playerConfig,  Map<String, Object?> options,  PlatformCapabilities platform,  PlatformDeviceProfile device,  PlatformCodecCapabilities codecs,  bool debug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerAdapterContext() when $default != null:
return $default(_that.playerId,_that.sessionId,_that.config,_that.playerConfig,_that.options,_that.platform,_that.device,_that.codecs,_that.debug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerId playerId,  SessionId sessionId,  PlayerAdapterConfig config,  PlayerConfig? playerConfig,  Map<String, Object?> options,  PlatformCapabilities platform,  PlatformDeviceProfile device,  PlatformCodecCapabilities codecs,  bool debug)  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterContext():
return $default(_that.playerId,_that.sessionId,_that.config,_that.playerConfig,_that.options,_that.platform,_that.device,_that.codecs,_that.debug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerId playerId,  SessionId sessionId,  PlayerAdapterConfig config,  PlayerConfig? playerConfig,  Map<String, Object?> options,  PlatformCapabilities platform,  PlatformDeviceProfile device,  PlatformCodecCapabilities codecs,  bool debug)?  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterContext() when $default != null:
return $default(_that.playerId,_that.sessionId,_that.config,_that.playerConfig,_that.options,_that.platform,_that.device,_that.codecs,_that.debug);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerAdapterContext implements PlayerAdapterContext {
  const _PlayerAdapterContext({required this.playerId, required this.sessionId, this.config = const PlayerAdapterConfig(), this.playerConfig,  Map<String, Object?> options = const {}, this.platform = const PlatformCapabilities(), this.device = PlatformDeviceProfile.unknown, this.codecs = PlatformCodecCapabilities.unknown, this.debug = false}): _options = options;
  

/// Player identifier.
@override final  PlayerId playerId;
/// Playback session identifier.
@override final  SessionId sessionId;
/// Adapter configuration.
@override@JsonKey() final  PlayerAdapterConfig config;
/// Player configuration.
@override final  PlayerConfig? playerConfig;
/// Backend specific options.
 final  Map<String, Object?> _options;
/// Backend specific options.
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}

/// Capabilities reported by the running device.
///
/// Filled from the platform probe the kernel was given; the defaults are
/// what a host that attached no provider gets, and they report themselves
/// as [PlatformCapabilities.reported] `false` so a backend can tell.
@override@JsonKey() final  PlatformCapabilities platform;
/// Device facts of the running device (cores, memory, ABI width).
@override@JsonKey() final  PlatformDeviceProfile device;
/// What the device can decode, and in hardware or not.
@override@JsonKey() final  PlatformCodecCapabilities codecs;
/// Debug mode.
@override@JsonKey() final  bool debug;

/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerAdapterContextCopyWith<_PlayerAdapterContext> get copyWith => __$PlayerAdapterContextCopyWithImpl<_PlayerAdapterContext>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerAdapterContext&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.config, config) || other.config == config)&&(identical(other.playerConfig, playerConfig) || other.playerConfig == playerConfig)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.device, device) || other.device == device)&&(identical(other.codecs, codecs) || other.codecs == codecs)&&(identical(other.debug, debug) || other.debug == debug));
}


@override
int get hashCode {
    return Object.hash(runtimeType,playerId,sessionId,config,playerConfig,const DeepCollectionEquality().hash(_options),platform,device,codecs,debug);
}

@override
String toString() {
    return 'PlayerAdapterContext(playerId: $playerId, sessionId: $sessionId, config: $config, playerConfig: $playerConfig, options: $options, platform: $platform, device: $device, codecs: $codecs, debug: $debug)';
}


}

/// @nodoc
abstract mixin class _$PlayerAdapterContextCopyWith<$Res> implements $PlayerAdapterContextCopyWith<$Res> {
  factory _$PlayerAdapterContextCopyWith(_PlayerAdapterContext value, $Res Function(_PlayerAdapterContext) _then) = __$PlayerAdapterContextCopyWithImpl;
@override @useResult
$Res call({
 PlayerId playerId, SessionId sessionId, PlayerAdapterConfig config, PlayerConfig? playerConfig, Map<String, Object?> options, PlatformCapabilities platform, PlatformDeviceProfile device, PlatformCodecCapabilities codecs, bool debug
});


@override $PlayerAdapterConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$PlayerAdapterContextCopyWithImpl<$Res>
    implements _$PlayerAdapterContextCopyWith<$Res> {
  __$PlayerAdapterContextCopyWithImpl(this._self, this._then);

  final _PlayerAdapterContext _self;
  final $Res Function(_PlayerAdapterContext) _then;

/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? sessionId = null,Object? config = null,Object? playerConfig = freezed,Object? options = null,Object? platform = null,Object? device = null,Object? codecs = null,Object? debug = null,}) {
  return _then(_PlayerAdapterContext(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as SessionId,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as PlayerAdapterConfig,playerConfig: freezed == playerConfig ? _self.playerConfig : playerConfig // ignore: cast_nullable_to_non_nullable
as PlayerConfig?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformCapabilities,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PlatformDeviceProfile,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as PlatformCodecCapabilities,debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PlayerAdapterContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerAdapterConfigCopyWith<$Res> get config {
  
  return $PlayerAdapterConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
