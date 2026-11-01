// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterError {

/// Error category.
 PlayerAdapterErrorType get type;/// Human readable message.
 String get message;/// Original backend error.
 Object? get cause;/// Stack trace.
 StackTrace? get stackTrace;/// Whether error can recover automatically.
 bool get recoverable;/// Backend identifier.
 String? get backend;/// Additional metadata.
 Map<String, Object?> get metadata;
/// Create a copy of PlayerAdapterError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterErrorCopyWith<PlayerAdapterError> get copyWith => _$PlayerAdapterErrorCopyWithImpl<PlayerAdapterError>(this as PlayerAdapterError, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerAdapterError;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterError&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.cause, _this.cause)&&(identical(other.stackTrace, _this.stackTrace) || other.stackTrace == _this.stackTrace)&&(identical(other.recoverable, _this.recoverable) || other.recoverable == _this.recoverable)&&(identical(other.backend, _this.backend) || other.backend == _this.backend)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}


@override
int get hashCode {
  final _this = this as PlayerAdapterError;
  return Object.hash(runtimeType,_this.type,_this.message,const DeepCollectionEquality().hash(_this.cause),_this.stackTrace,_this.recoverable,_this.backend,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as PlayerAdapterError;
  return 'PlayerAdapterError(type: ${_this.type}, message: ${_this.message}, cause: ${_this.cause}, stackTrace: ${_this.stackTrace}, recoverable: ${_this.recoverable}, backend: ${_this.backend}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterErrorCopyWith<$Res>  {
  factory $PlayerAdapterErrorCopyWith(PlayerAdapterError value, $Res Function(PlayerAdapterError) _then) = _$PlayerAdapterErrorCopyWithImpl;
@useResult
$Res call({
 PlayerAdapterErrorType type, String message, Object? cause, StackTrace? stackTrace, bool recoverable, String? backend, Map<String, Object?> metadata
});




}
/// @nodoc
class _$PlayerAdapterErrorCopyWithImpl<$Res>
    implements $PlayerAdapterErrorCopyWith<$Res> {
  _$PlayerAdapterErrorCopyWithImpl(this._self, this._then);

  final PlayerAdapterError _self;
  final $Res Function(PlayerAdapterError) _then;

/// Create a copy of PlayerAdapterError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,Object? recoverable = null,Object? backend = freezed,Object? metadata = null,}) {
  return _then(PlayerAdapterError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PlayerAdapterErrorType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,recoverable: null == recoverable ? _self.recoverable : recoverable // ignore: cast_nullable_to_non_nullable
as bool,backend: freezed == backend ? _self.backend : backend // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerAdapterError].
extension PlayerAdapterErrorPatterns on PlayerAdapterError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerAdapterError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerAdapterError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerAdapterError value)  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerAdapterError value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerAdapterErrorType type,  String message,  Object? cause,  StackTrace? stackTrace,  bool recoverable,  String? backend,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerAdapterError() when $default != null:
return $default(_that.type,_that.message,_that.cause,_that.stackTrace,_that.recoverable,_that.backend,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerAdapterErrorType type,  String message,  Object? cause,  StackTrace? stackTrace,  bool recoverable,  String? backend,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterError():
return $default(_that.type,_that.message,_that.cause,_that.stackTrace,_that.recoverable,_that.backend,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerAdapterErrorType type,  String message,  Object? cause,  StackTrace? stackTrace,  bool recoverable,  String? backend,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterError() when $default != null:
return $default(_that.type,_that.message,_that.cause,_that.stackTrace,_that.recoverable,_that.backend,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerAdapterError implements PlayerAdapterError {
  const _PlayerAdapterError({required this.type, required this.message, this.cause, this.stackTrace, this.recoverable = false, this.backend,  Map<String, Object?> metadata = const {}}): _metadata = metadata;
  

/// Error category.
@override final  PlayerAdapterErrorType type;
/// Human readable message.
@override final  String message;
/// Original backend error.
@override final  Object? cause;
/// Stack trace.
@override final  StackTrace? stackTrace;
/// Whether error can recover automatically.
@override@JsonKey() final  bool recoverable;
/// Backend identifier.
@override final  String? backend;
/// Additional metadata.
 final  Map<String, Object?> _metadata;
/// Additional metadata.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PlayerAdapterError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerAdapterErrorCopyWith<_PlayerAdapterError> get copyWith => __$PlayerAdapterErrorCopyWithImpl<_PlayerAdapterError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerAdapterError&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.recoverable, recoverable) || other.recoverable == recoverable)&&(identical(other.backend, backend) || other.backend == backend)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,message,const DeepCollectionEquality().hash(cause),stackTrace,recoverable,backend,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'PlayerAdapterError(type: $type, message: $message, cause: $cause, stackTrace: $stackTrace, recoverable: $recoverable, backend: $backend, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PlayerAdapterErrorCopyWith<$Res> implements $PlayerAdapterErrorCopyWith<$Res> {
  factory _$PlayerAdapterErrorCopyWith(_PlayerAdapterError value, $Res Function(_PlayerAdapterError) _then) = __$PlayerAdapterErrorCopyWithImpl;
@override @useResult
$Res call({
 PlayerAdapterErrorType type, String message, Object? cause, StackTrace? stackTrace, bool recoverable, String? backend, Map<String, Object?> metadata
});




}
/// @nodoc
class __$PlayerAdapterErrorCopyWithImpl<$Res>
    implements _$PlayerAdapterErrorCopyWith<$Res> {
  __$PlayerAdapterErrorCopyWithImpl(this._self, this._then);

  final _PlayerAdapterError _self;
  final $Res Function(_PlayerAdapterError) _then;

/// Create a copy of PlayerAdapterError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,Object? recoverable = null,Object? backend = freezed,Object? metadata = null,}) {
  return _then(_PlayerAdapterError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PlayerAdapterErrorType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,recoverable: null == recoverable ? _self.recoverable : recoverable // ignore: cast_nullable_to_non_nullable
as bool,backend: freezed == backend ? _self.backend : backend // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
