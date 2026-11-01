// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FloatingState {

/// Whether floating mode is active.
 bool get active;/// Whether floating transition is running.
 bool get transitioning;/// Whether floating window is supported.
 bool get available;/// Whether floating mode is enabled.
///
/// Controlled by:
///
/// - user settings
/// - application policy
 bool get enabled;/// Lifecycle generation.
///
/// Used to ignore stale async callbacks.
 int get generation;/// Last floating error.
 String? get error;
/// Create a copy of FloatingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloatingStateCopyWith<FloatingState> get copyWith => _$FloatingStateCopyWithImpl<FloatingState>(this as FloatingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FloatingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloatingState&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.transitioning, _this.transitioning) || other.transitioning == _this.transitioning)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.generation, _this.generation) || other.generation == _this.generation)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as FloatingState;
  return Object.hash(runtimeType,_this.active,_this.transitioning,_this.available,_this.enabled,_this.generation,_this.error);
}

@override
String toString() {
  final _this = this as FloatingState;
  return 'FloatingState(active: ${_this.active}, transitioning: ${_this.transitioning}, available: ${_this.available}, enabled: ${_this.enabled}, generation: ${_this.generation}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $FloatingStateCopyWith<$Res>  {
  factory $FloatingStateCopyWith(FloatingState value, $Res Function(FloatingState) _then) = _$FloatingStateCopyWithImpl;
@useResult
$Res call({
 bool active, bool transitioning, bool available, bool enabled, int generation, String? error
});




}
/// @nodoc
class _$FloatingStateCopyWithImpl<$Res>
    implements $FloatingStateCopyWith<$Res> {
  _$FloatingStateCopyWithImpl(this._self, this._then);

  final FloatingState _self;
  final $Res Function(FloatingState) _then;

/// Create a copy of FloatingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? transitioning = null,Object? available = null,Object? enabled = null,Object? generation = null,Object? error = freezed,}) {
  return _then(FloatingState(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FloatingState].
extension FloatingStatePatterns on FloatingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloatingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloatingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloatingState value)  $default,){
final _that = this;
switch (_that) {
case _FloatingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloatingState value)?  $default,){
final _that = this;
switch (_that) {
case _FloatingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active,  bool transitioning,  bool available,  bool enabled,  int generation,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloatingState() when $default != null:
return $default(_that.active,_that.transitioning,_that.available,_that.enabled,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active,  bool transitioning,  bool available,  bool enabled,  int generation,  String? error)  $default,) {final _that = this;
switch (_that) {
case _FloatingState():
return $default(_that.active,_that.transitioning,_that.available,_that.enabled,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active,  bool transitioning,  bool available,  bool enabled,  int generation,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _FloatingState() when $default != null:
return $default(_that.active,_that.transitioning,_that.available,_that.enabled,_that.generation,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FloatingState extends FloatingState {
  const _FloatingState({this.active = false, this.transitioning = false, this.available = false, this.enabled = true, this.generation = 0, this.error}): super._();
  

/// Whether floating mode is active.
@override@JsonKey() final  bool active;
/// Whether floating transition is running.
@override@JsonKey() final  bool transitioning;
/// Whether floating window is supported.
@override@JsonKey() final  bool available;
/// Whether floating mode is enabled.
///
/// Controlled by:
///
/// - user settings
/// - application policy
@override@JsonKey() final  bool enabled;
/// Lifecycle generation.
///
/// Used to ignore stale async callbacks.
@override@JsonKey() final  int generation;
/// Last floating error.
@override final  String? error;

/// Create a copy of FloatingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloatingStateCopyWith<_FloatingState> get copyWith => __$FloatingStateCopyWithImpl<_FloatingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloatingState&&(identical(other.active, active) || other.active == active)&&(identical(other.transitioning, transitioning) || other.transitioning == transitioning)&&(identical(other.available, available) || other.available == available)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,active,transitioning,available,enabled,generation,error);
}

@override
String toString() {
    return 'FloatingState(active: $active, transitioning: $transitioning, available: $available, enabled: $enabled, generation: $generation, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FloatingStateCopyWith<$Res> implements $FloatingStateCopyWith<$Res> {
  factory _$FloatingStateCopyWith(_FloatingState value, $Res Function(_FloatingState) _then) = __$FloatingStateCopyWithImpl;
@override @useResult
$Res call({
 bool active, bool transitioning, bool available, bool enabled, int generation, String? error
});




}
/// @nodoc
class __$FloatingStateCopyWithImpl<$Res>
    implements _$FloatingStateCopyWith<$Res> {
  __$FloatingStateCopyWithImpl(this._self, this._then);

  final _FloatingState _self;
  final $Res Function(_FloatingState) _then;

/// Create a copy of FloatingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? transitioning = null,Object? available = null,Object? enabled = null,Object? generation = null,Object? error = freezed,}) {
  return _then(_FloatingState(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
