// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fullscreen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FullscreenState {

/// Whether fullscreen is currently active.
 bool get active;/// Whether fullscreen transition is running.
 bool get transitioning;/// Whether fullscreen feature is available.
 bool get available;/// Lifecycle generation.
 int get generation;/// Last fullscreen error.
 String? get error;
/// Create a copy of FullscreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullscreenStateCopyWith<FullscreenState> get copyWith => _$FullscreenStateCopyWithImpl<FullscreenState>(this as FullscreenState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FullscreenState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullscreenState&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.transitioning, _this.transitioning) || other.transitioning == _this.transitioning)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.generation, _this.generation) || other.generation == _this.generation)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as FullscreenState;
  return Object.hash(runtimeType,_this.active,_this.transitioning,_this.available,_this.generation,_this.error);
}

@override
String toString() {
  final _this = this as FullscreenState;
  return 'FullscreenState(active: ${_this.active}, transitioning: ${_this.transitioning}, available: ${_this.available}, generation: ${_this.generation}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $FullscreenStateCopyWith<$Res>  {
  factory $FullscreenStateCopyWith(FullscreenState value, $Res Function(FullscreenState) _then) = _$FullscreenStateCopyWithImpl;
@useResult
$Res call({
 bool active, bool transitioning, bool available, int generation, String? error
});




}
/// @nodoc
class _$FullscreenStateCopyWithImpl<$Res>
    implements $FullscreenStateCopyWith<$Res> {
  _$FullscreenStateCopyWithImpl(this._self, this._then);

  final FullscreenState _self;
  final $Res Function(FullscreenState) _then;

/// Create a copy of FullscreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? transitioning = null,Object? available = null,Object? generation = null,Object? error = freezed,}) {
  return _then(FullscreenState(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FullscreenState].
extension FullscreenStatePatterns on FullscreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullscreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullscreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullscreenState value)  $default,){
final _that = this;
switch (_that) {
case _FullscreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullscreenState value)?  $default,){
final _that = this;
switch (_that) {
case _FullscreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active,  bool transitioning,  bool available,  int generation,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FullscreenState() when $default != null:
return $default(_that.active,_that.transitioning,_that.available,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active,  bool transitioning,  bool available,  int generation,  String? error)  $default,) {final _that = this;
switch (_that) {
case _FullscreenState():
return $default(_that.active,_that.transitioning,_that.available,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active,  bool transitioning,  bool available,  int generation,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _FullscreenState() when $default != null:
return $default(_that.active,_that.transitioning,_that.available,_that.generation,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FullscreenState extends FullscreenState {
  const _FullscreenState({this.active = false, this.transitioning = false, this.available = true, this.generation = 0, this.error}): super._();
  

/// Whether fullscreen is currently active.
@override@JsonKey() final  bool active;
/// Whether fullscreen transition is running.
@override@JsonKey() final  bool transitioning;
/// Whether fullscreen feature is available.
@override@JsonKey() final  bool available;
/// Lifecycle generation.
@override@JsonKey() final  int generation;
/// Last fullscreen error.
@override final  String? error;

/// Create a copy of FullscreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullscreenStateCopyWith<_FullscreenState> get copyWith => __$FullscreenStateCopyWithImpl<_FullscreenState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullscreenState&&(identical(other.active, active) || other.active == active)&&(identical(other.transitioning, transitioning) || other.transitioning == transitioning)&&(identical(other.available, available) || other.available == available)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,active,transitioning,available,generation,error);
}

@override
String toString() {
    return 'FullscreenState(active: $active, transitioning: $transitioning, available: $available, generation: $generation, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FullscreenStateCopyWith<$Res> implements $FullscreenStateCopyWith<$Res> {
  factory _$FullscreenStateCopyWith(_FullscreenState value, $Res Function(_FullscreenState) _then) = __$FullscreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool active, bool transitioning, bool available, int generation, String? error
});




}
/// @nodoc
class __$FullscreenStateCopyWithImpl<$Res>
    implements _$FullscreenStateCopyWith<$Res> {
  __$FullscreenStateCopyWithImpl(this._self, this._then);

  final _FullscreenState _self;
  final $Res Function(_FullscreenState) _then;

/// Create a copy of FullscreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? transitioning = null,Object? available = null,Object? generation = null,Object? error = freezed,}) {
  return _then(_FullscreenState(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
