// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_pool_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerPoolSnapshot {

/// Current pool state.
 PlayerPoolState get state;/// Current pool metrics.
 PlayerPoolMetrics get metrics;/// Snapshot creation time.
 DateTime get createdAt;
/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPoolSnapshotCopyWith<PlayerPoolSnapshot> get copyWith => _$PlayerPoolSnapshotCopyWithImpl<PlayerPoolSnapshot>(this as PlayerPoolSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerPoolSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPoolSnapshot&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.metrics, _this.metrics) || other.metrics == _this.metrics)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as PlayerPoolSnapshot;
  return Object.hash(runtimeType,_this.state,_this.metrics,_this.createdAt);
}

@override
String toString() {
  final _this = this as PlayerPoolSnapshot;
  return 'PlayerPoolSnapshot(state: ${_this.state}, metrics: ${_this.metrics}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $PlayerPoolSnapshotCopyWith<$Res>  {
  factory $PlayerPoolSnapshotCopyWith(PlayerPoolSnapshot value, $Res Function(PlayerPoolSnapshot) _then) = _$PlayerPoolSnapshotCopyWithImpl;
@useResult
$Res call({
 PlayerPoolState state, PlayerPoolMetrics metrics, DateTime createdAt
});


$PlayerPoolStateCopyWith<$Res> get state;$PlayerPoolMetricsCopyWith<$Res> get metrics;

}
/// @nodoc
class _$PlayerPoolSnapshotCopyWithImpl<$Res>
    implements $PlayerPoolSnapshotCopyWith<$Res> {
  _$PlayerPoolSnapshotCopyWithImpl(this._self, this._then);

  final PlayerPoolSnapshot _self;
  final $Res Function(PlayerPoolSnapshot) _then;

/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? metrics = null,Object? createdAt = null,}) {
  return _then(PlayerPoolSnapshot(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PlayerPoolState,metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as PlayerPoolMetrics,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerPoolStateCopyWith<$Res> get state {
  
  return $PlayerPoolStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerPoolMetricsCopyWith<$Res> get metrics {
  
  return $PlayerPoolMetricsCopyWith<$Res>(_self.metrics, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerPoolSnapshot].
extension PlayerPoolSnapshotPatterns on PlayerPoolSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerPoolSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerPoolSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerPoolSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerPoolSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerPoolState state,  PlayerPoolMetrics metrics,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerPoolSnapshot() when $default != null:
return $default(_that.state,_that.metrics,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerPoolState state,  PlayerPoolMetrics metrics,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolSnapshot():
return $default(_that.state,_that.metrics,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerPoolState state,  PlayerPoolMetrics metrics,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolSnapshot() when $default != null:
return $default(_that.state,_that.metrics,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerPoolSnapshot implements PlayerPoolSnapshot {
  const _PlayerPoolSnapshot({required this.state, required this.metrics, required this.createdAt});
  

/// Current pool state.
@override final  PlayerPoolState state;
/// Current pool metrics.
@override final  PlayerPoolMetrics metrics;
/// Snapshot creation time.
@override final  DateTime createdAt;

/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPoolSnapshotCopyWith<_PlayerPoolSnapshot> get copyWith => __$PlayerPoolSnapshotCopyWithImpl<_PlayerPoolSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerPoolSnapshot&&(identical(other.state, state) || other.state == state)&&(identical(other.metrics, metrics) || other.metrics == metrics)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,state,metrics,createdAt);
}

@override
String toString() {
    return 'PlayerPoolSnapshot(state: $state, metrics: $metrics, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PlayerPoolSnapshotCopyWith<$Res> implements $PlayerPoolSnapshotCopyWith<$Res> {
  factory _$PlayerPoolSnapshotCopyWith(_PlayerPoolSnapshot value, $Res Function(_PlayerPoolSnapshot) _then) = __$PlayerPoolSnapshotCopyWithImpl;
@override @useResult
$Res call({
 PlayerPoolState state, PlayerPoolMetrics metrics, DateTime createdAt
});


@override $PlayerPoolStateCopyWith<$Res> get state;@override $PlayerPoolMetricsCopyWith<$Res> get metrics;

}
/// @nodoc
class __$PlayerPoolSnapshotCopyWithImpl<$Res>
    implements _$PlayerPoolSnapshotCopyWith<$Res> {
  __$PlayerPoolSnapshotCopyWithImpl(this._self, this._then);

  final _PlayerPoolSnapshot _self;
  final $Res Function(_PlayerPoolSnapshot) _then;

/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? metrics = null,Object? createdAt = null,}) {
  return _then(_PlayerPoolSnapshot(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PlayerPoolState,metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as PlayerPoolMetrics,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerPoolStateCopyWith<$Res> get state {
  
  return $PlayerPoolStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}/// Create a copy of PlayerPoolSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerPoolMetricsCopyWith<$Res> get metrics {
  
  return $PlayerPoolMetricsCopyWith<$Res>(_self.metrics, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}

// dart format on
