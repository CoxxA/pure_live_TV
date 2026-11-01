// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkRequest {

/// Target resource URI.
 Uri get uri;/// HTTP method.
 String get method;/// Request headers.
 SourceHeaders? get headers;/// Request body.
///
/// The concrete type is controlled by
/// the network implementation.
 Object? get body;/// Connection timeout.
 Duration? get connectTimeout;/// Response timeout.
 Duration? get receiveTimeout;/// Maximum retry count.
 int get maxRetries;/// Whether this request can use cache.
 bool get cacheable;/// Extra request metadata.
 Map<String, Object?>? get metadata;
/// Create a copy of NetworkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkRequestCopyWith<NetworkRequest> get copyWith => _$NetworkRequestCopyWithImpl<NetworkRequest>(this as NetworkRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NetworkRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkRequest&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.headers, _this.headers) || other.headers == _this.headers)&&const DeepCollectionEquality().equals(other.body, _this.body)&&(identical(other.connectTimeout, _this.connectTimeout) || other.connectTimeout == _this.connectTimeout)&&(identical(other.receiveTimeout, _this.receiveTimeout) || other.receiveTimeout == _this.receiveTimeout)&&(identical(other.maxRetries, _this.maxRetries) || other.maxRetries == _this.maxRetries)&&(identical(other.cacheable, _this.cacheable) || other.cacheable == _this.cacheable)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}


@override
int get hashCode {
  final _this = this as NetworkRequest;
  return Object.hash(runtimeType,_this.uri,_this.method,_this.headers,const DeepCollectionEquality().hash(_this.body),_this.connectTimeout,_this.receiveTimeout,_this.maxRetries,_this.cacheable,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as NetworkRequest;
  return 'NetworkRequest(uri: ${_this.uri}, method: ${_this.method}, headers: ${_this.headers}, body: ${_this.body}, connectTimeout: ${_this.connectTimeout}, receiveTimeout: ${_this.receiveTimeout}, maxRetries: ${_this.maxRetries}, cacheable: ${_this.cacheable}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $NetworkRequestCopyWith<$Res>  {
  factory $NetworkRequestCopyWith(NetworkRequest value, $Res Function(NetworkRequest) _then) = _$NetworkRequestCopyWithImpl;
@useResult
$Res call({
 Uri uri, String method, SourceHeaders? headers, Object? body, Duration? connectTimeout, Duration? receiveTimeout, int maxRetries, bool cacheable, Map<String, Object?>? metadata
});




}
/// @nodoc
class _$NetworkRequestCopyWithImpl<$Res>
    implements $NetworkRequestCopyWith<$Res> {
  _$NetworkRequestCopyWithImpl(this._self, this._then);

  final NetworkRequest _self;
  final $Res Function(NetworkRequest) _then;

/// Create a copy of NetworkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? method = null,Object? headers = freezed,Object? body = freezed,Object? connectTimeout = freezed,Object? receiveTimeout = freezed,Object? maxRetries = null,Object? cacheable = null,Object? metadata = freezed,}) {
  return _then(NetworkRequest(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,body: freezed == body ? _self.body : body ,connectTimeout: freezed == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,receiveTimeout: freezed == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,maxRetries: null == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int,cacheable: null == cacheable ? _self.cacheable : cacheable // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkRequest].
extension NetworkRequestPatterns on NetworkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkRequest value)  $default,){
final _that = this;
switch (_that) {
case _NetworkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri uri,  String method,  SourceHeaders? headers,  Object? body,  Duration? connectTimeout,  Duration? receiveTimeout,  int maxRetries,  bool cacheable,  Map<String, Object?>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkRequest() when $default != null:
return $default(_that.uri,_that.method,_that.headers,_that.body,_that.connectTimeout,_that.receiveTimeout,_that.maxRetries,_that.cacheable,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri uri,  String method,  SourceHeaders? headers,  Object? body,  Duration? connectTimeout,  Duration? receiveTimeout,  int maxRetries,  bool cacheable,  Map<String, Object?>? metadata)  $default,) {final _that = this;
switch (_that) {
case _NetworkRequest():
return $default(_that.uri,_that.method,_that.headers,_that.body,_that.connectTimeout,_that.receiveTimeout,_that.maxRetries,_that.cacheable,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri uri,  String method,  SourceHeaders? headers,  Object? body,  Duration? connectTimeout,  Duration? receiveTimeout,  int maxRetries,  bool cacheable,  Map<String, Object?>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _NetworkRequest() when $default != null:
return $default(_that.uri,_that.method,_that.headers,_that.body,_that.connectTimeout,_that.receiveTimeout,_that.maxRetries,_that.cacheable,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkRequest implements NetworkRequest {
  const _NetworkRequest({required this.uri, this.method = 'GET', this.headers, this.body, this.connectTimeout, this.receiveTimeout, this.maxRetries = 0, this.cacheable = false,  Map<String, Object?>? metadata}): _metadata = metadata;
  

/// Target resource URI.
@override final  Uri uri;
/// HTTP method.
@override@JsonKey() final  String method;
/// Request headers.
@override final  SourceHeaders? headers;
/// Request body.
///
/// The concrete type is controlled by
/// the network implementation.
@override final  Object? body;
/// Connection timeout.
@override final  Duration? connectTimeout;
/// Response timeout.
@override final  Duration? receiveTimeout;
/// Maximum retry count.
@override@JsonKey() final  int maxRetries;
/// Whether this request can use cache.
@override@JsonKey() final  bool cacheable;
/// Extra request metadata.
 final  Map<String, Object?>? _metadata;
/// Extra request metadata.
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NetworkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkRequestCopyWith<_NetworkRequest> get copyWith => __$NetworkRequestCopyWithImpl<_NetworkRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkRequest&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.method, method) || other.method == method)&&(identical(other.headers, headers) || other.headers == headers)&&const DeepCollectionEquality().equals(other.body, body)&&(identical(other.connectTimeout, connectTimeout) || other.connectTimeout == connectTimeout)&&(identical(other.receiveTimeout, receiveTimeout) || other.receiveTimeout == receiveTimeout)&&(identical(other.maxRetries, maxRetries) || other.maxRetries == maxRetries)&&(identical(other.cacheable, cacheable) || other.cacheable == cacheable)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uri,method,headers,const DeepCollectionEquality().hash(body),connectTimeout,receiveTimeout,maxRetries,cacheable,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'NetworkRequest(uri: $uri, method: $method, headers: $headers, body: $body, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout, maxRetries: $maxRetries, cacheable: $cacheable, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$NetworkRequestCopyWith<$Res> implements $NetworkRequestCopyWith<$Res> {
  factory _$NetworkRequestCopyWith(_NetworkRequest value, $Res Function(_NetworkRequest) _then) = __$NetworkRequestCopyWithImpl;
@override @useResult
$Res call({
 Uri uri, String method, SourceHeaders? headers, Object? body, Duration? connectTimeout, Duration? receiveTimeout, int maxRetries, bool cacheable, Map<String, Object?>? metadata
});




}
/// @nodoc
class __$NetworkRequestCopyWithImpl<$Res>
    implements _$NetworkRequestCopyWith<$Res> {
  __$NetworkRequestCopyWithImpl(this._self, this._then);

  final _NetworkRequest _self;
  final $Res Function(_NetworkRequest) _then;

/// Create a copy of NetworkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? method = null,Object? headers = freezed,Object? body = freezed,Object? connectTimeout = freezed,Object? receiveTimeout = freezed,Object? maxRetries = null,Object? cacheable = null,Object? metadata = freezed,}) {
  return _then(_NetworkRequest(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,body: freezed == body ? _self.body : body ,connectTimeout: freezed == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,receiveTimeout: freezed == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,maxRetries: null == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int,cacheable: null == cacheable ? _self.cacheable : cacheable // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

// dart format on
