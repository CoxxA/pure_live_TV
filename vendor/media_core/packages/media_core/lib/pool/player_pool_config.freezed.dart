// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_pool_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerPoolConfig {

/// Maximum number of players in pool.
///
/// 0 means unlimited.
 int get maxPlayers;/// Initial number of pre-created players.
 int get initialSize;/// Whether pool can create players lazily.
 bool get lazyCreate;/// Whether unused players should be recycled.
 bool get enableRecycle;/// Maximum idle duration before recycle.
 Duration? get idleTimeout;/// Whether pool should keep at least one warm player.
 bool get keepWarm;/// Number of warm players.
 int get warmSize;/// Maximum concurrent active sessions.
 int get maxActivePlayers;/// How many neighbours on each side of the active item are kept warm.
///
/// A list or feed pre-opens the items a swipe can reach, so the swipe is a
/// source swap on an already-open player rather than a cold start. One is
/// the smallest useful value (the next item only) and the default; zero
/// turns preloading off.
 int get preloadCount;/// Visibility ratio at which an item is allowed to play.
///
/// Above this the item becomes the active one. Between this and
/// [pauseVisibilityThreshold] nothing changes, which is what stops a
/// partially visible item from flapping between play and pause mid-scroll.
 double get playVisibilityThreshold;/// Visibility ratio below which the active item is paused.
 double get pauseVisibilityThreshold;/// How long a warm item may stay open without becoming active.
///
/// A warm player holds a decoder, so one that never becomes active is
/// released rather than kept forever. Null means no timeout.
 Duration? get preloadTimeout;/// Whether an idle player may be re-pointed at another item instead of
/// being released and replaced.
///
/// This is the difference between "one player per swipe" and "three players
/// for an endless list": with reuse on, an idle player takes the next
/// item's source, so decoder setup happens once per pool slot rather than
/// once per item. Turn it off when every item needs to keep its own player
/// (its own playback state, its own session).
 bool get reuseIdlePlayers;
/// Create a copy of PlayerPoolConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPoolConfigCopyWith<PlayerPoolConfig> get copyWith => _$PlayerPoolConfigCopyWithImpl<PlayerPoolConfig>(this as PlayerPoolConfig, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerPoolConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPoolConfig&&(identical(other.maxPlayers, _this.maxPlayers) || other.maxPlayers == _this.maxPlayers)&&(identical(other.initialSize, _this.initialSize) || other.initialSize == _this.initialSize)&&(identical(other.lazyCreate, _this.lazyCreate) || other.lazyCreate == _this.lazyCreate)&&(identical(other.enableRecycle, _this.enableRecycle) || other.enableRecycle == _this.enableRecycle)&&(identical(other.idleTimeout, _this.idleTimeout) || other.idleTimeout == _this.idleTimeout)&&(identical(other.keepWarm, _this.keepWarm) || other.keepWarm == _this.keepWarm)&&(identical(other.warmSize, _this.warmSize) || other.warmSize == _this.warmSize)&&(identical(other.maxActivePlayers, _this.maxActivePlayers) || other.maxActivePlayers == _this.maxActivePlayers)&&(identical(other.preloadCount, _this.preloadCount) || other.preloadCount == _this.preloadCount)&&(identical(other.playVisibilityThreshold, _this.playVisibilityThreshold) || other.playVisibilityThreshold == _this.playVisibilityThreshold)&&(identical(other.pauseVisibilityThreshold, _this.pauseVisibilityThreshold) || other.pauseVisibilityThreshold == _this.pauseVisibilityThreshold)&&(identical(other.preloadTimeout, _this.preloadTimeout) || other.preloadTimeout == _this.preloadTimeout)&&(identical(other.reuseIdlePlayers, _this.reuseIdlePlayers) || other.reuseIdlePlayers == _this.reuseIdlePlayers));
}


@override
int get hashCode {
  final _this = this as PlayerPoolConfig;
  return Object.hash(runtimeType,_this.maxPlayers,_this.initialSize,_this.lazyCreate,_this.enableRecycle,_this.idleTimeout,_this.keepWarm,_this.warmSize,_this.maxActivePlayers,_this.preloadCount,_this.playVisibilityThreshold,_this.pauseVisibilityThreshold,_this.preloadTimeout,_this.reuseIdlePlayers);
}

@override
String toString() {
  final _this = this as PlayerPoolConfig;
  return 'PlayerPoolConfig(maxPlayers: ${_this.maxPlayers}, initialSize: ${_this.initialSize}, lazyCreate: ${_this.lazyCreate}, enableRecycle: ${_this.enableRecycle}, idleTimeout: ${_this.idleTimeout}, keepWarm: ${_this.keepWarm}, warmSize: ${_this.warmSize}, maxActivePlayers: ${_this.maxActivePlayers}, preloadCount: ${_this.preloadCount}, playVisibilityThreshold: ${_this.playVisibilityThreshold}, pauseVisibilityThreshold: ${_this.pauseVisibilityThreshold}, preloadTimeout: ${_this.preloadTimeout}, reuseIdlePlayers: ${_this.reuseIdlePlayers})';
}


}

/// @nodoc
abstract mixin class $PlayerPoolConfigCopyWith<$Res>  {
  factory $PlayerPoolConfigCopyWith(PlayerPoolConfig value, $Res Function(PlayerPoolConfig) _then) = _$PlayerPoolConfigCopyWithImpl;
@useResult
$Res call({
 int maxPlayers, int initialSize, bool lazyCreate, bool enableRecycle, Duration? idleTimeout, bool keepWarm, int warmSize, int maxActivePlayers, int preloadCount, double playVisibilityThreshold, double pauseVisibilityThreshold, Duration? preloadTimeout, bool reuseIdlePlayers
});




}
/// @nodoc
class _$PlayerPoolConfigCopyWithImpl<$Res>
    implements $PlayerPoolConfigCopyWith<$Res> {
  _$PlayerPoolConfigCopyWithImpl(this._self, this._then);

  final PlayerPoolConfig _self;
  final $Res Function(PlayerPoolConfig) _then;

/// Create a copy of PlayerPoolConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxPlayers = null,Object? initialSize = null,Object? lazyCreate = null,Object? enableRecycle = null,Object? idleTimeout = freezed,Object? keepWarm = null,Object? warmSize = null,Object? maxActivePlayers = null,Object? preloadCount = null,Object? playVisibilityThreshold = null,Object? pauseVisibilityThreshold = null,Object? preloadTimeout = freezed,Object? reuseIdlePlayers = null,}) {
  return _then(PlayerPoolConfig(
maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,initialSize: null == initialSize ? _self.initialSize : initialSize // ignore: cast_nullable_to_non_nullable
as int,lazyCreate: null == lazyCreate ? _self.lazyCreate : lazyCreate // ignore: cast_nullable_to_non_nullable
as bool,enableRecycle: null == enableRecycle ? _self.enableRecycle : enableRecycle // ignore: cast_nullable_to_non_nullable
as bool,idleTimeout: freezed == idleTimeout ? _self.idleTimeout : idleTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,keepWarm: null == keepWarm ? _self.keepWarm : keepWarm // ignore: cast_nullable_to_non_nullable
as bool,warmSize: null == warmSize ? _self.warmSize : warmSize // ignore: cast_nullable_to_non_nullable
as int,maxActivePlayers: null == maxActivePlayers ? _self.maxActivePlayers : maxActivePlayers // ignore: cast_nullable_to_non_nullable
as int,preloadCount: null == preloadCount ? _self.preloadCount : preloadCount // ignore: cast_nullable_to_non_nullable
as int,playVisibilityThreshold: null == playVisibilityThreshold ? _self.playVisibilityThreshold : playVisibilityThreshold // ignore: cast_nullable_to_non_nullable
as double,pauseVisibilityThreshold: null == pauseVisibilityThreshold ? _self.pauseVisibilityThreshold : pauseVisibilityThreshold // ignore: cast_nullable_to_non_nullable
as double,preloadTimeout: freezed == preloadTimeout ? _self.preloadTimeout : preloadTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,reuseIdlePlayers: null == reuseIdlePlayers ? _self.reuseIdlePlayers : reuseIdlePlayers // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerPoolConfig].
extension PlayerPoolConfigPatterns on PlayerPoolConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerPoolConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerPoolConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerPoolConfig value)  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerPoolConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxPlayers,  int initialSize,  bool lazyCreate,  bool enableRecycle,  Duration? idleTimeout,  bool keepWarm,  int warmSize,  int maxActivePlayers,  int preloadCount,  double playVisibilityThreshold,  double pauseVisibilityThreshold,  Duration? preloadTimeout,  bool reuseIdlePlayers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerPoolConfig() when $default != null:
return $default(_that.maxPlayers,_that.initialSize,_that.lazyCreate,_that.enableRecycle,_that.idleTimeout,_that.keepWarm,_that.warmSize,_that.maxActivePlayers,_that.preloadCount,_that.playVisibilityThreshold,_that.pauseVisibilityThreshold,_that.preloadTimeout,_that.reuseIdlePlayers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxPlayers,  int initialSize,  bool lazyCreate,  bool enableRecycle,  Duration? idleTimeout,  bool keepWarm,  int warmSize,  int maxActivePlayers,  int preloadCount,  double playVisibilityThreshold,  double pauseVisibilityThreshold,  Duration? preloadTimeout,  bool reuseIdlePlayers)  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolConfig():
return $default(_that.maxPlayers,_that.initialSize,_that.lazyCreate,_that.enableRecycle,_that.idleTimeout,_that.keepWarm,_that.warmSize,_that.maxActivePlayers,_that.preloadCount,_that.playVisibilityThreshold,_that.pauseVisibilityThreshold,_that.preloadTimeout,_that.reuseIdlePlayers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxPlayers,  int initialSize,  bool lazyCreate,  bool enableRecycle,  Duration? idleTimeout,  bool keepWarm,  int warmSize,  int maxActivePlayers,  int preloadCount,  double playVisibilityThreshold,  double pauseVisibilityThreshold,  Duration? preloadTimeout,  bool reuseIdlePlayers)?  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolConfig() when $default != null:
return $default(_that.maxPlayers,_that.initialSize,_that.lazyCreate,_that.enableRecycle,_that.idleTimeout,_that.keepWarm,_that.warmSize,_that.maxActivePlayers,_that.preloadCount,_that.playVisibilityThreshold,_that.pauseVisibilityThreshold,_that.preloadTimeout,_that.reuseIdlePlayers);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerPoolConfig implements PlayerPoolConfig {
  const _PlayerPoolConfig({this.maxPlayers = 0, this.initialSize = 0, this.lazyCreate = true, this.enableRecycle = true, this.idleTimeout, this.keepWarm = false, this.warmSize = 0, this.maxActivePlayers = 1, this.preloadCount = 1, this.playVisibilityThreshold = 0.6, this.pauseVisibilityThreshold = 0.4, this.preloadTimeout, this.reuseIdlePlayers = true});
  

/// Maximum number of players in pool.
///
/// 0 means unlimited.
@override@JsonKey() final  int maxPlayers;
/// Initial number of pre-created players.
@override@JsonKey() final  int initialSize;
/// Whether pool can create players lazily.
@override@JsonKey() final  bool lazyCreate;
/// Whether unused players should be recycled.
@override@JsonKey() final  bool enableRecycle;
/// Maximum idle duration before recycle.
@override final  Duration? idleTimeout;
/// Whether pool should keep at least one warm player.
@override@JsonKey() final  bool keepWarm;
/// Number of warm players.
@override@JsonKey() final  int warmSize;
/// Maximum concurrent active sessions.
@override@JsonKey() final  int maxActivePlayers;
/// How many neighbours on each side of the active item are kept warm.
///
/// A list or feed pre-opens the items a swipe can reach, so the swipe is a
/// source swap on an already-open player rather than a cold start. One is
/// the smallest useful value (the next item only) and the default; zero
/// turns preloading off.
@override@JsonKey() final  int preloadCount;
/// Visibility ratio at which an item is allowed to play.
///
/// Above this the item becomes the active one. Between this and
/// [pauseVisibilityThreshold] nothing changes, which is what stops a
/// partially visible item from flapping between play and pause mid-scroll.
@override@JsonKey() final  double playVisibilityThreshold;
/// Visibility ratio below which the active item is paused.
@override@JsonKey() final  double pauseVisibilityThreshold;
/// How long a warm item may stay open without becoming active.
///
/// A warm player holds a decoder, so one that never becomes active is
/// released rather than kept forever. Null means no timeout.
@override final  Duration? preloadTimeout;
/// Whether an idle player may be re-pointed at another item instead of
/// being released and replaced.
///
/// This is the difference between "one player per swipe" and "three players
/// for an endless list": with reuse on, an idle player takes the next
/// item's source, so decoder setup happens once per pool slot rather than
/// once per item. Turn it off when every item needs to keep its own player
/// (its own playback state, its own session).
@override@JsonKey() final  bool reuseIdlePlayers;

/// Create a copy of PlayerPoolConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPoolConfigCopyWith<_PlayerPoolConfig> get copyWith => __$PlayerPoolConfigCopyWithImpl<_PlayerPoolConfig>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerPoolConfig&&(identical(other.maxPlayers, maxPlayers) || other.maxPlayers == maxPlayers)&&(identical(other.initialSize, initialSize) || other.initialSize == initialSize)&&(identical(other.lazyCreate, lazyCreate) || other.lazyCreate == lazyCreate)&&(identical(other.enableRecycle, enableRecycle) || other.enableRecycle == enableRecycle)&&(identical(other.idleTimeout, idleTimeout) || other.idleTimeout == idleTimeout)&&(identical(other.keepWarm, keepWarm) || other.keepWarm == keepWarm)&&(identical(other.warmSize, warmSize) || other.warmSize == warmSize)&&(identical(other.maxActivePlayers, maxActivePlayers) || other.maxActivePlayers == maxActivePlayers)&&(identical(other.preloadCount, preloadCount) || other.preloadCount == preloadCount)&&(identical(other.playVisibilityThreshold, playVisibilityThreshold) || other.playVisibilityThreshold == playVisibilityThreshold)&&(identical(other.pauseVisibilityThreshold, pauseVisibilityThreshold) || other.pauseVisibilityThreshold == pauseVisibilityThreshold)&&(identical(other.preloadTimeout, preloadTimeout) || other.preloadTimeout == preloadTimeout)&&(identical(other.reuseIdlePlayers, reuseIdlePlayers) || other.reuseIdlePlayers == reuseIdlePlayers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,maxPlayers,initialSize,lazyCreate,enableRecycle,idleTimeout,keepWarm,warmSize,maxActivePlayers,preloadCount,playVisibilityThreshold,pauseVisibilityThreshold,preloadTimeout,reuseIdlePlayers);
}

@override
String toString() {
    return 'PlayerPoolConfig(maxPlayers: $maxPlayers, initialSize: $initialSize, lazyCreate: $lazyCreate, enableRecycle: $enableRecycle, idleTimeout: $idleTimeout, keepWarm: $keepWarm, warmSize: $warmSize, maxActivePlayers: $maxActivePlayers, preloadCount: $preloadCount, playVisibilityThreshold: $playVisibilityThreshold, pauseVisibilityThreshold: $pauseVisibilityThreshold, preloadTimeout: $preloadTimeout, reuseIdlePlayers: $reuseIdlePlayers)';
}


}

/// @nodoc
abstract mixin class _$PlayerPoolConfigCopyWith<$Res> implements $PlayerPoolConfigCopyWith<$Res> {
  factory _$PlayerPoolConfigCopyWith(_PlayerPoolConfig value, $Res Function(_PlayerPoolConfig) _then) = __$PlayerPoolConfigCopyWithImpl;
@override @useResult
$Res call({
 int maxPlayers, int initialSize, bool lazyCreate, bool enableRecycle, Duration? idleTimeout, bool keepWarm, int warmSize, int maxActivePlayers, int preloadCount, double playVisibilityThreshold, double pauseVisibilityThreshold, Duration? preloadTimeout, bool reuseIdlePlayers
});




}
/// @nodoc
class __$PlayerPoolConfigCopyWithImpl<$Res>
    implements _$PlayerPoolConfigCopyWith<$Res> {
  __$PlayerPoolConfigCopyWithImpl(this._self, this._then);

  final _PlayerPoolConfig _self;
  final $Res Function(_PlayerPoolConfig) _then;

/// Create a copy of PlayerPoolConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxPlayers = null,Object? initialSize = null,Object? lazyCreate = null,Object? enableRecycle = null,Object? idleTimeout = freezed,Object? keepWarm = null,Object? warmSize = null,Object? maxActivePlayers = null,Object? preloadCount = null,Object? playVisibilityThreshold = null,Object? pauseVisibilityThreshold = null,Object? preloadTimeout = freezed,Object? reuseIdlePlayers = null,}) {
  return _then(_PlayerPoolConfig(
maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,initialSize: null == initialSize ? _self.initialSize : initialSize // ignore: cast_nullable_to_non_nullable
as int,lazyCreate: null == lazyCreate ? _self.lazyCreate : lazyCreate // ignore: cast_nullable_to_non_nullable
as bool,enableRecycle: null == enableRecycle ? _self.enableRecycle : enableRecycle // ignore: cast_nullable_to_non_nullable
as bool,idleTimeout: freezed == idleTimeout ? _self.idleTimeout : idleTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,keepWarm: null == keepWarm ? _self.keepWarm : keepWarm // ignore: cast_nullable_to_non_nullable
as bool,warmSize: null == warmSize ? _self.warmSize : warmSize // ignore: cast_nullable_to_non_nullable
as int,maxActivePlayers: null == maxActivePlayers ? _self.maxActivePlayers : maxActivePlayers // ignore: cast_nullable_to_non_nullable
as int,preloadCount: null == preloadCount ? _self.preloadCount : preloadCount // ignore: cast_nullable_to_non_nullable
as int,playVisibilityThreshold: null == playVisibilityThreshold ? _self.playVisibilityThreshold : playVisibilityThreshold // ignore: cast_nullable_to_non_nullable
as double,pauseVisibilityThreshold: null == pauseVisibilityThreshold ? _self.pauseVisibilityThreshold : pauseVisibilityThreshold // ignore: cast_nullable_to_non_nullable
as double,preloadTimeout: freezed == preloadTimeout ? _self.preloadTimeout : preloadTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,reuseIdlePlayers: null == reuseIdlePlayers ? _self.reuseIdlePlayers : reuseIdlePlayers // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
