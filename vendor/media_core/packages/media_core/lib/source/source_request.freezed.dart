// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SourceRequest {

/// Request identifier.
 RequestId get id;/// Target source identifier.
 SourceId? get sourceId;/// Source URI.
 Uri? get uri;/// Preferred source type.
 SourceType get type;/// Additional request headers.
 SourceHeaders? get headers;/// Whether this request is for live playback.
 bool get live;/// Whether to prefer low latency.
 bool get lowLatency;/// Whether caching should be enabled.
 bool get enableCache;/// Whether network fallback is allowed.
 bool get allowFallback;/// Optional timeout.
 Duration? get timeout;/// Custom request attributes.
 Map<String, Object?> get attributes;
/// Create a copy of SourceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceRequestCopyWith<SourceRequest> get copyWith => _$SourceRequestCopyWithImpl<SourceRequest>(this as SourceRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SourceRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceRequest&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.headers, _this.headers) || other.headers == _this.headers)&&(identical(other.live, _this.live) || other.live == _this.live)&&(identical(other.lowLatency, _this.lowLatency) || other.lowLatency == _this.lowLatency)&&(identical(other.enableCache, _this.enableCache) || other.enableCache == _this.enableCache)&&(identical(other.allowFallback, _this.allowFallback) || other.allowFallback == _this.allowFallback)&&(identical(other.timeout, _this.timeout) || other.timeout == _this.timeout)&&const DeepCollectionEquality().equals(other.attributes, _this.attributes));
}


@override
int get hashCode {
  final _this = this as SourceRequest;
  return Object.hash(runtimeType,_this.id,_this.sourceId,_this.uri,_this.type,_this.headers,_this.live,_this.lowLatency,_this.enableCache,_this.allowFallback,_this.timeout,const DeepCollectionEquality().hash(_this.attributes));
}

@override
String toString() {
  final _this = this as SourceRequest;
  return 'SourceRequest(id: ${_this.id}, sourceId: ${_this.sourceId}, uri: ${_this.uri}, type: ${_this.type}, headers: ${_this.headers}, live: ${_this.live}, lowLatency: ${_this.lowLatency}, enableCache: ${_this.enableCache}, allowFallback: ${_this.allowFallback}, timeout: ${_this.timeout}, attributes: ${_this.attributes})';
}


}

/// @nodoc
abstract mixin class $SourceRequestCopyWith<$Res>  {
  factory $SourceRequestCopyWith(SourceRequest value, $Res Function(SourceRequest) _then) = _$SourceRequestCopyWithImpl;
@useResult
$Res call({
 RequestId id, SourceId? sourceId, Uri? uri, SourceType type, SourceHeaders? headers, bool live, bool lowLatency, bool enableCache, bool allowFallback, Duration? timeout, Map<String, Object?> attributes
});




}
/// @nodoc
class _$SourceRequestCopyWithImpl<$Res>
    implements $SourceRequestCopyWith<$Res> {
  _$SourceRequestCopyWithImpl(this._self, this._then);

  final SourceRequest _self;
  final $Res Function(SourceRequest) _then;

/// Create a copy of SourceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sourceId = freezed,Object? uri = freezed,Object? type = null,Object? headers = freezed,Object? live = null,Object? lowLatency = null,Object? enableCache = null,Object? allowFallback = null,Object? timeout = freezed,Object? attributes = null,}) {
  return _then(SourceRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as RequestId,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as bool,lowLatency: null == lowLatency ? _self.lowLatency : lowLatency // ignore: cast_nullable_to_non_nullable
as bool,enableCache: null == enableCache ? _self.enableCache : enableCache // ignore: cast_nullable_to_non_nullable
as bool,allowFallback: null == allowFallback ? _self.allowFallback : allowFallback // ignore: cast_nullable_to_non_nullable
as bool,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceRequest].
extension SourceRequestPatterns on SourceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceRequest value)  $default,){
final _that = this;
switch (_that) {
case _SourceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SourceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestId id,  SourceId? sourceId,  Uri? uri,  SourceType type,  SourceHeaders? headers,  bool live,  bool lowLatency,  bool enableCache,  bool allowFallback,  Duration? timeout,  Map<String, Object?> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceRequest() when $default != null:
return $default(_that.id,_that.sourceId,_that.uri,_that.type,_that.headers,_that.live,_that.lowLatency,_that.enableCache,_that.allowFallback,_that.timeout,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestId id,  SourceId? sourceId,  Uri? uri,  SourceType type,  SourceHeaders? headers,  bool live,  bool lowLatency,  bool enableCache,  bool allowFallback,  Duration? timeout,  Map<String, Object?> attributes)  $default,) {final _that = this;
switch (_that) {
case _SourceRequest():
return $default(_that.id,_that.sourceId,_that.uri,_that.type,_that.headers,_that.live,_that.lowLatency,_that.enableCache,_that.allowFallback,_that.timeout,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestId id,  SourceId? sourceId,  Uri? uri,  SourceType type,  SourceHeaders? headers,  bool live,  bool lowLatency,  bool enableCache,  bool allowFallback,  Duration? timeout,  Map<String, Object?> attributes)?  $default,) {final _that = this;
switch (_that) {
case _SourceRequest() when $default != null:
return $default(_that.id,_that.sourceId,_that.uri,_that.type,_that.headers,_that.live,_that.lowLatency,_that.enableCache,_that.allowFallback,_that.timeout,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc


class _SourceRequest implements SourceRequest {
  const _SourceRequest({required this.id, this.sourceId, this.uri, this.type = SourceType.unknown, this.headers, this.live = false, this.lowLatency = false, this.enableCache = true, this.allowFallback = true, this.timeout,  Map<String, Object?> attributes = const {}}): _attributes = attributes;
  

/// Request identifier.
@override final  RequestId id;
/// Target source identifier.
@override final  SourceId? sourceId;
/// Source URI.
@override final  Uri? uri;
/// Preferred source type.
@override@JsonKey() final  SourceType type;
/// Additional request headers.
@override final  SourceHeaders? headers;
/// Whether this request is for live playback.
@override@JsonKey() final  bool live;
/// Whether to prefer low latency.
@override@JsonKey() final  bool lowLatency;
/// Whether caching should be enabled.
@override@JsonKey() final  bool enableCache;
/// Whether network fallback is allowed.
@override@JsonKey() final  bool allowFallback;
/// Optional timeout.
@override final  Duration? timeout;
/// Custom request attributes.
 final  Map<String, Object?> _attributes;
/// Custom request attributes.
@override@JsonKey() Map<String, Object?> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of SourceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceRequestCopyWith<_SourceRequest> get copyWith => __$SourceRequestCopyWithImpl<_SourceRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.type, type) || other.type == type)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.live, live) || other.live == live)&&(identical(other.lowLatency, lowLatency) || other.lowLatency == lowLatency)&&(identical(other.enableCache, enableCache) || other.enableCache == enableCache)&&(identical(other.allowFallback, allowFallback) || other.allowFallback == allowFallback)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&const DeepCollectionEquality().equals(other.attributes, _attributes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,sourceId,uri,type,headers,live,lowLatency,enableCache,allowFallback,timeout,const DeepCollectionEquality().hash(_attributes));
}

@override
String toString() {
    return 'SourceRequest(id: $id, sourceId: $sourceId, uri: $uri, type: $type, headers: $headers, live: $live, lowLatency: $lowLatency, enableCache: $enableCache, allowFallback: $allowFallback, timeout: $timeout, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$SourceRequestCopyWith<$Res> implements $SourceRequestCopyWith<$Res> {
  factory _$SourceRequestCopyWith(_SourceRequest value, $Res Function(_SourceRequest) _then) = __$SourceRequestCopyWithImpl;
@override @useResult
$Res call({
 RequestId id, SourceId? sourceId, Uri? uri, SourceType type, SourceHeaders? headers, bool live, bool lowLatency, bool enableCache, bool allowFallback, Duration? timeout, Map<String, Object?> attributes
});




}
/// @nodoc
class __$SourceRequestCopyWithImpl<$Res>
    implements _$SourceRequestCopyWith<$Res> {
  __$SourceRequestCopyWithImpl(this._self, this._then);

  final _SourceRequest _self;
  final $Res Function(_SourceRequest) _then;

/// Create a copy of SourceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sourceId = freezed,Object? uri = freezed,Object? type = null,Object? headers = freezed,Object? live = null,Object? lowLatency = null,Object? enableCache = null,Object? allowFallback = null,Object? timeout = freezed,Object? attributes = null,}) {
  return _then(_SourceRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as RequestId,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as bool,lowLatency: null == lowLatency ? _self.lowLatency : lowLatency // ignore: cast_nullable_to_non_nullable
as bool,enableCache: null == enableCache ? _self.enableCache : enableCache // ignore: cast_nullable_to_non_nullable
as bool,allowFallback: null == allowFallback ? _self.allowFallback : allowFallback // ignore: cast_nullable_to_non_nullable
as bool,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
