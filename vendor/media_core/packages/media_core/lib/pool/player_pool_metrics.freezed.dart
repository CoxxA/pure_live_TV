// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_pool_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerPoolMetrics {

/// Total players created.
 int get createdCount;/// Total players destroyed.
 int get destroyedCount;/// Total player allocations.
 int get allocationCount;/// Total allocation failures.
 int get allocationFailureCount;/// Total recycle operations.
 int get recycleCount;/// Total recycle failures.
 int get recycleFailureCount;/// Current allocated players.
 int get allocatedCount;/// Current idle players.
 int get idleCount;/// Peak concurrent players.
 int get peakCount;/// Average allocation latency.
 Duration? get averageAllocationTime;/// Last update timestamp.
 DateTime? get updatedAt;
/// Create a copy of PlayerPoolMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPoolMetricsCopyWith<PlayerPoolMetrics> get copyWith => _$PlayerPoolMetricsCopyWithImpl<PlayerPoolMetrics>(this as PlayerPoolMetrics, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerPoolMetrics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPoolMetrics&&(identical(other.createdCount, _this.createdCount) || other.createdCount == _this.createdCount)&&(identical(other.destroyedCount, _this.destroyedCount) || other.destroyedCount == _this.destroyedCount)&&(identical(other.allocationCount, _this.allocationCount) || other.allocationCount == _this.allocationCount)&&(identical(other.allocationFailureCount, _this.allocationFailureCount) || other.allocationFailureCount == _this.allocationFailureCount)&&(identical(other.recycleCount, _this.recycleCount) || other.recycleCount == _this.recycleCount)&&(identical(other.recycleFailureCount, _this.recycleFailureCount) || other.recycleFailureCount == _this.recycleFailureCount)&&(identical(other.allocatedCount, _this.allocatedCount) || other.allocatedCount == _this.allocatedCount)&&(identical(other.idleCount, _this.idleCount) || other.idleCount == _this.idleCount)&&(identical(other.peakCount, _this.peakCount) || other.peakCount == _this.peakCount)&&(identical(other.averageAllocationTime, _this.averageAllocationTime) || other.averageAllocationTime == _this.averageAllocationTime)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as PlayerPoolMetrics;
  return Object.hash(runtimeType,_this.createdCount,_this.destroyedCount,_this.allocationCount,_this.allocationFailureCount,_this.recycleCount,_this.recycleFailureCount,_this.allocatedCount,_this.idleCount,_this.peakCount,_this.averageAllocationTime,_this.updatedAt);
}

@override
String toString() {
  final _this = this as PlayerPoolMetrics;
  return 'PlayerPoolMetrics(createdCount: ${_this.createdCount}, destroyedCount: ${_this.destroyedCount}, allocationCount: ${_this.allocationCount}, allocationFailureCount: ${_this.allocationFailureCount}, recycleCount: ${_this.recycleCount}, recycleFailureCount: ${_this.recycleFailureCount}, allocatedCount: ${_this.allocatedCount}, idleCount: ${_this.idleCount}, peakCount: ${_this.peakCount}, averageAllocationTime: ${_this.averageAllocationTime}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $PlayerPoolMetricsCopyWith<$Res>  {
  factory $PlayerPoolMetricsCopyWith(PlayerPoolMetrics value, $Res Function(PlayerPoolMetrics) _then) = _$PlayerPoolMetricsCopyWithImpl;
@useResult
$Res call({
 int createdCount, int destroyedCount, int allocationCount, int allocationFailureCount, int recycleCount, int recycleFailureCount, int allocatedCount, int idleCount, int peakCount, Duration? averageAllocationTime, DateTime? updatedAt
});




}
/// @nodoc
class _$PlayerPoolMetricsCopyWithImpl<$Res>
    implements $PlayerPoolMetricsCopyWith<$Res> {
  _$PlayerPoolMetricsCopyWithImpl(this._self, this._then);

  final PlayerPoolMetrics _self;
  final $Res Function(PlayerPoolMetrics) _then;

/// Create a copy of PlayerPoolMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdCount = null,Object? destroyedCount = null,Object? allocationCount = null,Object? allocationFailureCount = null,Object? recycleCount = null,Object? recycleFailureCount = null,Object? allocatedCount = null,Object? idleCount = null,Object? peakCount = null,Object? averageAllocationTime = freezed,Object? updatedAt = freezed,}) {
  return _then(PlayerPoolMetrics(
createdCount: null == createdCount ? _self.createdCount : createdCount // ignore: cast_nullable_to_non_nullable
as int,destroyedCount: null == destroyedCount ? _self.destroyedCount : destroyedCount // ignore: cast_nullable_to_non_nullable
as int,allocationCount: null == allocationCount ? _self.allocationCount : allocationCount // ignore: cast_nullable_to_non_nullable
as int,allocationFailureCount: null == allocationFailureCount ? _self.allocationFailureCount : allocationFailureCount // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,recycleFailureCount: null == recycleFailureCount ? _self.recycleFailureCount : recycleFailureCount // ignore: cast_nullable_to_non_nullable
as int,allocatedCount: null == allocatedCount ? _self.allocatedCount : allocatedCount // ignore: cast_nullable_to_non_nullable
as int,idleCount: null == idleCount ? _self.idleCount : idleCount // ignore: cast_nullable_to_non_nullable
as int,peakCount: null == peakCount ? _self.peakCount : peakCount // ignore: cast_nullable_to_non_nullable
as int,averageAllocationTime: freezed == averageAllocationTime ? _self.averageAllocationTime : averageAllocationTime // ignore: cast_nullable_to_non_nullable
as Duration?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerPoolMetrics].
extension PlayerPoolMetricsPatterns on PlayerPoolMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerPoolMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerPoolMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerPoolMetrics value)  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerPoolMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerPoolMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int createdCount,  int destroyedCount,  int allocationCount,  int allocationFailureCount,  int recycleCount,  int recycleFailureCount,  int allocatedCount,  int idleCount,  int peakCount,  Duration? averageAllocationTime,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerPoolMetrics() when $default != null:
return $default(_that.createdCount,_that.destroyedCount,_that.allocationCount,_that.allocationFailureCount,_that.recycleCount,_that.recycleFailureCount,_that.allocatedCount,_that.idleCount,_that.peakCount,_that.averageAllocationTime,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int createdCount,  int destroyedCount,  int allocationCount,  int allocationFailureCount,  int recycleCount,  int recycleFailureCount,  int allocatedCount,  int idleCount,  int peakCount,  Duration? averageAllocationTime,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolMetrics():
return $default(_that.createdCount,_that.destroyedCount,_that.allocationCount,_that.allocationFailureCount,_that.recycleCount,_that.recycleFailureCount,_that.allocatedCount,_that.idleCount,_that.peakCount,_that.averageAllocationTime,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int createdCount,  int destroyedCount,  int allocationCount,  int allocationFailureCount,  int recycleCount,  int recycleFailureCount,  int allocatedCount,  int idleCount,  int peakCount,  Duration? averageAllocationTime,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PlayerPoolMetrics() when $default != null:
return $default(_that.createdCount,_that.destroyedCount,_that.allocationCount,_that.allocationFailureCount,_that.recycleCount,_that.recycleFailureCount,_that.allocatedCount,_that.idleCount,_that.peakCount,_that.averageAllocationTime,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerPoolMetrics implements PlayerPoolMetrics {
  const _PlayerPoolMetrics({this.createdCount = 0, this.destroyedCount = 0, this.allocationCount = 0, this.allocationFailureCount = 0, this.recycleCount = 0, this.recycleFailureCount = 0, this.allocatedCount = 0, this.idleCount = 0, this.peakCount = 0, this.averageAllocationTime, this.updatedAt});
  

/// Total players created.
@override@JsonKey() final  int createdCount;
/// Total players destroyed.
@override@JsonKey() final  int destroyedCount;
/// Total player allocations.
@override@JsonKey() final  int allocationCount;
/// Total allocation failures.
@override@JsonKey() final  int allocationFailureCount;
/// Total recycle operations.
@override@JsonKey() final  int recycleCount;
/// Total recycle failures.
@override@JsonKey() final  int recycleFailureCount;
/// Current allocated players.
@override@JsonKey() final  int allocatedCount;
/// Current idle players.
@override@JsonKey() final  int idleCount;
/// Peak concurrent players.
@override@JsonKey() final  int peakCount;
/// Average allocation latency.
@override final  Duration? averageAllocationTime;
/// Last update timestamp.
@override final  DateTime? updatedAt;

/// Create a copy of PlayerPoolMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPoolMetricsCopyWith<_PlayerPoolMetrics> get copyWith => __$PlayerPoolMetricsCopyWithImpl<_PlayerPoolMetrics>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerPoolMetrics&&(identical(other.createdCount, createdCount) || other.createdCount == createdCount)&&(identical(other.destroyedCount, destroyedCount) || other.destroyedCount == destroyedCount)&&(identical(other.allocationCount, allocationCount) || other.allocationCount == allocationCount)&&(identical(other.allocationFailureCount, allocationFailureCount) || other.allocationFailureCount == allocationFailureCount)&&(identical(other.recycleCount, recycleCount) || other.recycleCount == recycleCount)&&(identical(other.recycleFailureCount, recycleFailureCount) || other.recycleFailureCount == recycleFailureCount)&&(identical(other.allocatedCount, allocatedCount) || other.allocatedCount == allocatedCount)&&(identical(other.idleCount, idleCount) || other.idleCount == idleCount)&&(identical(other.peakCount, peakCount) || other.peakCount == peakCount)&&(identical(other.averageAllocationTime, averageAllocationTime) || other.averageAllocationTime == averageAllocationTime)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,createdCount,destroyedCount,allocationCount,allocationFailureCount,recycleCount,recycleFailureCount,allocatedCount,idleCount,peakCount,averageAllocationTime,updatedAt);
}

@override
String toString() {
    return 'PlayerPoolMetrics(createdCount: $createdCount, destroyedCount: $destroyedCount, allocationCount: $allocationCount, allocationFailureCount: $allocationFailureCount, recycleCount: $recycleCount, recycleFailureCount: $recycleFailureCount, allocatedCount: $allocatedCount, idleCount: $idleCount, peakCount: $peakCount, averageAllocationTime: $averageAllocationTime, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PlayerPoolMetricsCopyWith<$Res> implements $PlayerPoolMetricsCopyWith<$Res> {
  factory _$PlayerPoolMetricsCopyWith(_PlayerPoolMetrics value, $Res Function(_PlayerPoolMetrics) _then) = __$PlayerPoolMetricsCopyWithImpl;
@override @useResult
$Res call({
 int createdCount, int destroyedCount, int allocationCount, int allocationFailureCount, int recycleCount, int recycleFailureCount, int allocatedCount, int idleCount, int peakCount, Duration? averageAllocationTime, DateTime? updatedAt
});




}
/// @nodoc
class __$PlayerPoolMetricsCopyWithImpl<$Res>
    implements _$PlayerPoolMetricsCopyWith<$Res> {
  __$PlayerPoolMetricsCopyWithImpl(this._self, this._then);

  final _PlayerPoolMetrics _self;
  final $Res Function(_PlayerPoolMetrics) _then;

/// Create a copy of PlayerPoolMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdCount = null,Object? destroyedCount = null,Object? allocationCount = null,Object? allocationFailureCount = null,Object? recycleCount = null,Object? recycleFailureCount = null,Object? allocatedCount = null,Object? idleCount = null,Object? peakCount = null,Object? averageAllocationTime = freezed,Object? updatedAt = freezed,}) {
  return _then(_PlayerPoolMetrics(
createdCount: null == createdCount ? _self.createdCount : createdCount // ignore: cast_nullable_to_non_nullable
as int,destroyedCount: null == destroyedCount ? _self.destroyedCount : destroyedCount // ignore: cast_nullable_to_non_nullable
as int,allocationCount: null == allocationCount ? _self.allocationCount : allocationCount // ignore: cast_nullable_to_non_nullable
as int,allocationFailureCount: null == allocationFailureCount ? _self.allocationFailureCount : allocationFailureCount // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,recycleFailureCount: null == recycleFailureCount ? _self.recycleFailureCount : recycleFailureCount // ignore: cast_nullable_to_non_nullable
as int,allocatedCount: null == allocatedCount ? _self.allocatedCount : allocatedCount // ignore: cast_nullable_to_non_nullable
as int,idleCount: null == idleCount ? _self.idleCount : idleCount // ignore: cast_nullable_to_non_nullable
as int,peakCount: null == peakCount ? _self.peakCount : peakCount // ignore: cast_nullable_to_non_nullable
as int,averageAllocationTime: freezed == averageAllocationTime ? _self.averageAllocationTime : averageAllocationTime // ignore: cast_nullable_to_non_nullable
as Duration?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
