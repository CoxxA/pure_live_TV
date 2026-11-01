// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_pool_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerPoolState {

/// Total slots managed by pool.
 int get totalPlayers;/// Currently idle players.
 int get idlePlayers;/// Currently active players.
 int get activePlayers;/// Players being released.
 int get releasingPlayers;/// Whether pool reached capacity.
 bool get isFull;/// Current active player ids.
 List<PlayerId> get activePlayerIds;/// Current active sessions.
 List<SessionId> get activeSessionIds;/// Whether pool is initialized.
 bool get initialized;/// Whether pool is disposing.
 bool get disposing;
/// Create a copy of PlayerPoolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPoolStateCopyWith<PlayerPoolState> get copyWith => _$PlayerPoolStateCopyWithImpl<PlayerPoolState>(this as PlayerPoolState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerPoolState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPoolState&&(identical(other.totalPlayers, _this.totalPlayers) || other.totalPlayers == _this.totalPlayers)&&(identical(other.idlePlayers, _this.idlePlayers) || other.idlePlayers == _this.idlePlayers)&&(identical(other.activePlayers, _this.activePlayers) || other.activePlayers == _this.activePlayers)&&(identical(other.releasingPlayers, _this.releasingPlayers) || other.releasingPlayers == _this.releasingPlayers)&&(identical(other.isFull, _this.isFull) || other.isFull == _this.isFull)&&const DeepCollectionEquality().equals(other.activePlayerIds, _this.activePlayerIds)&&const DeepCollectionEquality().equals(other.activeSessionIds, _this.activeSessionIds)&&(identical(other.initialized, _this.initialized) || other.initialized == _this.initialized)&&(identical(other.disposing, _this.disposing) || other.disposing == _this.disposing));
}


@override
int get hashCode {
  final _this = this as PlayerPoolState;
  return Object.hash(runtimeType,_this.totalPlayers,_this.idlePlayers,_this.activePlayers,_this.releasingPlayers,_this.isFull,const DeepCollectionEquality().hash(_this.activePlayerIds),const DeepCollectionEquality().hash(_this.activeSessionIds),_this.initialized,_this.disposing);
}

@override
String toString() {
  final _this = this as PlayerPoolState;
  return 'PlayerPoolState(totalPlayers: ${_this.totalPlayers}, idlePlayers: ${_this.idlePlayers}, activePlayers: ${_this.activePlayers}, releasingPlayers: ${_this.releasingPlayers}, isFull: ${_this.isFull}, activePlayerIds: ${_this.activePlayerIds}, activeSessionIds: ${_this.activeSessionIds}, initialized: ${_this.initialized}, disposing: ${_this.disposing})';
}


}

/// @nodoc
abstract mixin class $PlayerPoolStateCopyWith<$Res>  {
  factory $PlayerPoolStateCopyWith(PlayerPoolState value, $Res Function(PlayerPoolState) _then) = _$PlayerPoolStateCopyWithImpl;
@useResult
$Res call({
 int totalPlayers, int idlePlayers, int activePlayers, int releasingPlayers, bool isFull, List<PlayerId> activePlayerIds, List<SessionId> activeSessionIds, bool initialized, bool disposing
});




}
/// @nodoc
class _$PlayerPoolStateCopyWithImpl<$Res>
    implements $PlayerPoolStateCopyWith<$Res> {
  _$PlayerPoolStateCopyWithImpl(this._self, this._then);

  final PlayerPoolState _self;
  final $Res Function(PlayerPoolState) _then;

/// Create a copy of PlayerPoolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPlayers = null,Object? idlePlayers = null,Object? activePlayers = null,Object? releasingPlayers = null,Object? isFull = null,Object? activePlayerIds = null,Object? activeSessionIds = null,Object? initialized = null,Object? disposing = null,}) {
  return _then(PlayerPoolState(
totalPlayers: null == totalPlayers ? _self.totalPlayers : totalPlayers // ignore: cast_nullable_to_non_nullable
as int,idlePlayers: null == idlePlayers ? _self.idlePlayers : idlePlayers // ignore: cast_nullable_to_non_nullable
as int,activePlayers: null == activePlayers ? _self.activePlayers : activePlayers // ignore: cast_nullable_to_non_nullable
as int,releasingPlayers: null == releasingPlayers ? _self.releasingPlayers : releasingPlayers // ignore: cast_nullable_to_non_nullable
as int,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,activePlayerIds: null == activePlayerIds ? _self.activePlayerIds : activePlayerIds // ignore: cast_nullable_to_non_nullable
as List<PlayerId>,activeSessionIds: null == activeSessionIds ? _self.activeSessionIds : activeSessionIds // ignore: cast_nullable_to_non_nullable
as List<SessionId>,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,disposing: null == disposing ? _self.disposing : disposing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerPoolState].
extension PlayerPoolStatePatterns on PlayerPoolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerPoolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerPoolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerPoolState value)  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerPoolState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalPlayers,  int idlePlayers,  int activePlayers,  int releasingPlayers,  bool isFull,  List<PlayerId> activePlayerIds,  List<SessionId> activeSessionIds,  bool initialized,  bool disposing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerPoolState() when $default != null:
return $default(_that.totalPlayers,_that.idlePlayers,_that.activePlayers,_that.releasingPlayers,_that.isFull,_that.activePlayerIds,_that.activeSessionIds,_that.initialized,_that.disposing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalPlayers,  int idlePlayers,  int activePlayers,  int releasingPlayers,  bool isFull,  List<PlayerId> activePlayerIds,  List<SessionId> activeSessionIds,  bool initialized,  bool disposing)  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolState():
return $default(_that.totalPlayers,_that.idlePlayers,_that.activePlayers,_that.releasingPlayers,_that.isFull,_that.activePlayerIds,_that.activeSessionIds,_that.initialized,_that.disposing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalPlayers,  int idlePlayers,  int activePlayers,  int releasingPlayers,  bool isFull,  List<PlayerId> activePlayerIds,  List<SessionId> activeSessionIds,  bool initialized,  bool disposing)?  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolState() when $default != null:
return $default(_that.totalPlayers,_that.idlePlayers,_that.activePlayers,_that.releasingPlayers,_that.isFull,_that.activePlayerIds,_that.activeSessionIds,_that.initialized,_that.disposing);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerPoolState implements PlayerPoolState {
  const _PlayerPoolState({this.totalPlayers = 0, this.idlePlayers = 0, this.activePlayers = 0, this.releasingPlayers = 0, this.isFull = false,  List<PlayerId> activePlayerIds = const <PlayerId>[],  List<SessionId> activeSessionIds = const <SessionId>[], this.initialized = false, this.disposing = false}): _activePlayerIds = activePlayerIds,_activeSessionIds = activeSessionIds;
  

/// Total slots managed by pool.
@override@JsonKey() final  int totalPlayers;
/// Currently idle players.
@override@JsonKey() final  int idlePlayers;
/// Currently active players.
@override@JsonKey() final  int activePlayers;
/// Players being released.
@override@JsonKey() final  int releasingPlayers;
/// Whether pool reached capacity.
@override@JsonKey() final  bool isFull;
/// Current active player ids.
 final  List<PlayerId> _activePlayerIds;
/// Current active player ids.
@override@JsonKey() List<PlayerId> get activePlayerIds {
  if (_activePlayerIds is EqualUnmodifiableListView) return _activePlayerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activePlayerIds);
}

/// Current active sessions.
 final  List<SessionId> _activeSessionIds;
/// Current active sessions.
@override@JsonKey() List<SessionId> get activeSessionIds {
  if (_activeSessionIds is EqualUnmodifiableListView) return _activeSessionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSessionIds);
}

/// Whether pool is initialized.
@override@JsonKey() final  bool initialized;
/// Whether pool is disposing.
@override@JsonKey() final  bool disposing;

/// Create a copy of PlayerPoolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPoolStateCopyWith<_PlayerPoolState> get copyWith => __$PlayerPoolStateCopyWithImpl<_PlayerPoolState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerPoolState&&(identical(other.totalPlayers, totalPlayers) || other.totalPlayers == totalPlayers)&&(identical(other.idlePlayers, idlePlayers) || other.idlePlayers == idlePlayers)&&(identical(other.activePlayers, activePlayers) || other.activePlayers == activePlayers)&&(identical(other.releasingPlayers, releasingPlayers) || other.releasingPlayers == releasingPlayers)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&const DeepCollectionEquality().equals(other.activePlayerIds, _activePlayerIds)&&const DeepCollectionEquality().equals(other.activeSessionIds, _activeSessionIds)&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.disposing, disposing) || other.disposing == disposing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,totalPlayers,idlePlayers,activePlayers,releasingPlayers,isFull,const DeepCollectionEquality().hash(_activePlayerIds),const DeepCollectionEquality().hash(_activeSessionIds),initialized,disposing);
}

@override
String toString() {
    return 'PlayerPoolState(totalPlayers: $totalPlayers, idlePlayers: $idlePlayers, activePlayers: $activePlayers, releasingPlayers: $releasingPlayers, isFull: $isFull, activePlayerIds: $activePlayerIds, activeSessionIds: $activeSessionIds, initialized: $initialized, disposing: $disposing)';
}


}

/// @nodoc
abstract mixin class _$PlayerPoolStateCopyWith<$Res> implements $PlayerPoolStateCopyWith<$Res> {
  factory _$PlayerPoolStateCopyWith(_PlayerPoolState value, $Res Function(_PlayerPoolState) _then) = __$PlayerPoolStateCopyWithImpl;
@override @useResult
$Res call({
 int totalPlayers, int idlePlayers, int activePlayers, int releasingPlayers, bool isFull, List<PlayerId> activePlayerIds, List<SessionId> activeSessionIds, bool initialized, bool disposing
});




}
/// @nodoc
class __$PlayerPoolStateCopyWithImpl<$Res>
    implements _$PlayerPoolStateCopyWith<$Res> {
  __$PlayerPoolStateCopyWithImpl(this._self, this._then);

  final _PlayerPoolState _self;
  final $Res Function(_PlayerPoolState) _then;

/// Create a copy of PlayerPoolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPlayers = null,Object? idlePlayers = null,Object? activePlayers = null,Object? releasingPlayers = null,Object? isFull = null,Object? activePlayerIds = null,Object? activeSessionIds = null,Object? initialized = null,Object? disposing = null,}) {
  return _then(_PlayerPoolState(
totalPlayers: null == totalPlayers ? _self.totalPlayers : totalPlayers // ignore: cast_nullable_to_non_nullable
as int,idlePlayers: null == idlePlayers ? _self.idlePlayers : idlePlayers // ignore: cast_nullable_to_non_nullable
as int,activePlayers: null == activePlayers ? _self.activePlayers : activePlayers // ignore: cast_nullable_to_non_nullable
as int,releasingPlayers: null == releasingPlayers ? _self.releasingPlayers : releasingPlayers // ignore: cast_nullable_to_non_nullable
as int,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,activePlayerIds: null == activePlayerIds ? _self._activePlayerIds : activePlayerIds // ignore: cast_nullable_to_non_nullable
as List<PlayerId>,activeSessionIds: null == activeSessionIds ? _self._activeSessionIds : activeSessionIds // ignore: cast_nullable_to_non_nullable
as List<SessionId>,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,disposing: null == disposing ? _self.disposing : disposing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
