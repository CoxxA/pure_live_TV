// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkResponse {

/// HTTP-like status code.
///
/// May be unavailable for custom transports.
 int? get statusCode;/// Response body.
 Object? get data;/// Response headers.
 Map<String, String>? get headers;/// Request duration.
 Duration? get duration;/// Whether response came from cache.
 bool get fromCache;/// Request timestamp.
 DateTime? get timestamp;
/// Create a copy of NetworkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkResponseCopyWith<NetworkResponse> get copyWith => _$NetworkResponseCopyWithImpl<NetworkResponse>(this as NetworkResponse, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NetworkResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkResponse&&(identical(other.statusCode, _this.statusCode) || other.statusCode == _this.statusCode)&&const DeepCollectionEquality().equals(other.data, _this.data)&&const DeepCollectionEquality().equals(other.headers, _this.headers)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.fromCache, _this.fromCache) || other.fromCache == _this.fromCache)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as NetworkResponse;
  return Object.hash(runtimeType,_this.statusCode,const DeepCollectionEquality().hash(_this.data),const DeepCollectionEquality().hash(_this.headers),_this.duration,_this.fromCache,_this.timestamp);
}

@override
String toString() {
  final _this = this as NetworkResponse;
  return 'NetworkResponse(statusCode: ${_this.statusCode}, data: ${_this.data}, headers: ${_this.headers}, duration: ${_this.duration}, fromCache: ${_this.fromCache}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $NetworkResponseCopyWith<$Res>  {
  factory $NetworkResponseCopyWith(NetworkResponse value, $Res Function(NetworkResponse) _then) = _$NetworkResponseCopyWithImpl;
@useResult
$Res call({
 int? statusCode, Object? data, Map<String, String>? headers, Duration? duration, bool fromCache, DateTime? timestamp
});




}
/// @nodoc
class _$NetworkResponseCopyWithImpl<$Res>
    implements $NetworkResponseCopyWith<$Res> {
  _$NetworkResponseCopyWithImpl(this._self, this._then);

  final NetworkResponse _self;
  final $Res Function(NetworkResponse) _then;

/// Create a copy of NetworkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? data = freezed,Object? headers = freezed,Object? duration = freezed,Object? fromCache = null,Object? timestamp = freezed,}) {
  return _then(NetworkResponse(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data ,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkResponse].
extension NetworkResponsePatterns on NetworkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkResponse value)  $default,){
final _that = this;
switch (_that) {
case _NetworkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? statusCode,  Object? data,  Map<String, String>? headers,  Duration? duration,  bool fromCache,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkResponse() when $default != null:
return $default(_that.statusCode,_that.data,_that.headers,_that.duration,_that.fromCache,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? statusCode,  Object? data,  Map<String, String>? headers,  Duration? duration,  bool fromCache,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _NetworkResponse():
return $default(_that.statusCode,_that.data,_that.headers,_that.duration,_that.fromCache,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? statusCode,  Object? data,  Map<String, String>? headers,  Duration? duration,  bool fromCache,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _NetworkResponse() when $default != null:
return $default(_that.statusCode,_that.data,_that.headers,_that.duration,_that.fromCache,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkResponse implements NetworkResponse {
  const _NetworkResponse({this.statusCode, this.data,  Map<String, String>? headers, this.duration, this.fromCache = false, this.timestamp}): _headers = headers;
  

/// HTTP-like status code.
///
/// May be unavailable for custom transports.
@override final  int? statusCode;
/// Response body.
@override final  Object? data;
/// Response headers.
 final  Map<String, String>? _headers;
/// Response headers.
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Request duration.
@override final  Duration? duration;
/// Whether response came from cache.
@override@JsonKey() final  bool fromCache;
/// Request timestamp.
@override final  DateTime? timestamp;

/// Create a copy of NetworkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkResponseCopyWith<_NetworkResponse> get copyWith => __$NetworkResponseCopyWithImpl<_NetworkResponse>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkResponse&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.headers, _headers)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,statusCode,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(_headers),duration,fromCache,timestamp);
}

@override
String toString() {
    return 'NetworkResponse(statusCode: $statusCode, data: $data, headers: $headers, duration: $duration, fromCache: $fromCache, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$NetworkResponseCopyWith<$Res> implements $NetworkResponseCopyWith<$Res> {
  factory _$NetworkResponseCopyWith(_NetworkResponse value, $Res Function(_NetworkResponse) _then) = __$NetworkResponseCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, Object? data, Map<String, String>? headers, Duration? duration, bool fromCache, DateTime? timestamp
});




}
/// @nodoc
class __$NetworkResponseCopyWithImpl<$Res>
    implements _$NetworkResponseCopyWith<$Res> {
  __$NetworkResponseCopyWithImpl(this._self, this._then);

  final _NetworkResponse _self;
  final $Res Function(_NetworkResponse) _then;

/// Create a copy of NetworkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? data = freezed,Object? headers = freezed,Object? duration = freezed,Object? fromCache = null,Object? timestamp = freezed,}) {
  return _then(_NetworkResponse(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data ,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
