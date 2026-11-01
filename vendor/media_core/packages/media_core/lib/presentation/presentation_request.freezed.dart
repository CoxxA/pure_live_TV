// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresentationRequest {

/// Target presentation mode.
///
/// Example:
///
/// normal -> fullscreen
///
 PresentationMode get mode;/// Whether transition animation
/// should be used.
///
/// The platform adapter decides
/// whether animation is supported.
 bool get animated;/// Whether this request is generated
/// automatically.
///
/// Examples:
///
/// - device rotation
/// - app lifecycle
/// - playback policy
 bool get automatic;/// Request source.
///
/// Examples:
///
/// - user
/// - system
/// - lifecycle
/// - orientation
 String? get source;/// Request generation.
///
/// Used to match async
/// platform callbacks.
 int get generation;/// Unique request identifier.
///
/// Useful for debugging
/// and tracing lifecycle.
 String? get requestId;/// Request creation timestamp.
 DateTime? get createdAt;
/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationRequestCopyWith<PresentationRequest> get copyWith => _$PresentationRequestCopyWithImpl<PresentationRequest>(this as PresentationRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PresentationRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationRequest&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.animated, _this.animated) || other.animated == _this.animated)&&(identical(other.automatic, _this.automatic) || other.automatic == _this.automatic)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.generation, _this.generation) || other.generation == _this.generation)&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as PresentationRequest;
  return Object.hash(runtimeType,_this.mode,_this.animated,_this.automatic,_this.source,_this.generation,_this.requestId,_this.createdAt);
}

@override
String toString() {
  final _this = this as PresentationRequest;
  return 'PresentationRequest(mode: ${_this.mode}, animated: ${_this.animated}, automatic: ${_this.automatic}, source: ${_this.source}, generation: ${_this.generation}, requestId: ${_this.requestId}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $PresentationRequestCopyWith<$Res>  {
  factory $PresentationRequestCopyWith(PresentationRequest value, $Res Function(PresentationRequest) _then) = _$PresentationRequestCopyWithImpl;
@useResult
$Res call({
 PresentationMode mode, bool animated, bool automatic, String? source, int generation, String? requestId, DateTime? createdAt
});




}
/// @nodoc
class _$PresentationRequestCopyWithImpl<$Res>
    implements $PresentationRequestCopyWith<$Res> {
  _$PresentationRequestCopyWithImpl(this._self, this._then);

  final PresentationRequest _self;
  final $Res Function(PresentationRequest) _then;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? animated = null,Object? automatic = null,Object? source = freezed,Object? generation = null,Object? requestId = freezed,Object? createdAt = freezed,}) {
  return _then(PresentationRequest(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,animated: null == animated ? _self.animated : animated // ignore: cast_nullable_to_non_nullable
as bool,automatic: null == automatic ? _self.automatic : automatic // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationRequest].
extension PresentationRequestPatterns on PresentationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationRequest value)  $default,){
final _that = this;
switch (_that) {
case _PresentationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PresentationMode mode,  bool animated,  bool automatic,  String? source,  int generation,  String? requestId,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that.mode,_that.animated,_that.automatic,_that.source,_that.generation,_that.requestId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PresentationMode mode,  bool animated,  bool automatic,  String? source,  int generation,  String? requestId,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PresentationRequest():
return $default(_that.mode,_that.animated,_that.automatic,_that.source,_that.generation,_that.requestId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PresentationMode mode,  bool animated,  bool automatic,  String? source,  int generation,  String? requestId,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that.mode,_that.animated,_that.automatic,_that.source,_that.generation,_that.requestId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PresentationRequest extends PresentationRequest {
  const _PresentationRequest({this.mode = PresentationMode.normal, this.animated = true, this.automatic = false, this.source, this.generation = 0, this.requestId, this.createdAt}): super._();
  

/// Target presentation mode.
///
/// Example:
///
/// normal -> fullscreen
///
@override@JsonKey() final  PresentationMode mode;
/// Whether transition animation
/// should be used.
///
/// The platform adapter decides
/// whether animation is supported.
@override@JsonKey() final  bool animated;
/// Whether this request is generated
/// automatically.
///
/// Examples:
///
/// - device rotation
/// - app lifecycle
/// - playback policy
@override@JsonKey() final  bool automatic;
/// Request source.
///
/// Examples:
///
/// - user
/// - system
/// - lifecycle
/// - orientation
@override final  String? source;
/// Request generation.
///
/// Used to match async
/// platform callbacks.
@override@JsonKey() final  int generation;
/// Unique request identifier.
///
/// Useful for debugging
/// and tracing lifecycle.
@override final  String? requestId;
/// Request creation timestamp.
@override final  DateTime? createdAt;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationRequestCopyWith<_PresentationRequest> get copyWith => __$PresentationRequestCopyWithImpl<_PresentationRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationRequest&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.animated, animated) || other.animated == animated)&&(identical(other.automatic, automatic) || other.automatic == automatic)&&(identical(other.source, source) || other.source == source)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,animated,automatic,source,generation,requestId,createdAt);
}

@override
String toString() {
    return 'PresentationRequest(mode: $mode, animated: $animated, automatic: $automatic, source: $source, generation: $generation, requestId: $requestId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PresentationRequestCopyWith<$Res> implements $PresentationRequestCopyWith<$Res> {
  factory _$PresentationRequestCopyWith(_PresentationRequest value, $Res Function(_PresentationRequest) _then) = __$PresentationRequestCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode mode, bool animated, bool automatic, String? source, int generation, String? requestId, DateTime? createdAt
});




}
/// @nodoc
class __$PresentationRequestCopyWithImpl<$Res>
    implements _$PresentationRequestCopyWith<$Res> {
  __$PresentationRequestCopyWithImpl(this._self, this._then);

  final _PresentationRequest _self;
  final $Res Function(_PresentationRequest) _then;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? animated = null,Object? automatic = null,Object? source = freezed,Object? generation = null,Object? requestId = freezed,Object? createdAt = freezed,}) {
  return _then(_PresentationRequest(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,animated: null == animated ? _self.animated : animated // ignore: cast_nullable_to_non_nullable
as bool,automatic: null == automatic ? _self.automatic : automatic // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
