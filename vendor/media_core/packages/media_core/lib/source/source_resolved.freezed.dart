// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_resolved.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolvedSource {

/// Identifier of the original source.
 SourceId get sourceId;/// Concrete URI to be passed to the backend.
 Uri get uri;/// Resolved access protocol.
 SourceProtocol get protocol;/// Resolved media type.
 SourceMediaType get mediaType;/// Resolved media format.
 SourceFormat get format;/// Request headers required to access the resolved source.
 SourceHeaders? get headers;/// Original source from which this resolved source was produced.
 PlayerSource? get source;/// Additional resolver-specific metadata.
 Map<String, Object?> get metadata;
/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedSourceCopyWith<ResolvedSource> get copyWith => _$ResolvedSourceCopyWithImpl<ResolvedSource>(this as ResolvedSource, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResolvedSource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedSource&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.protocol, _this.protocol) || other.protocol == _this.protocol)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.headers, _this.headers) || other.headers == _this.headers)&&(identical(other.source, _this.source) || other.source == _this.source)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}


@override
int get hashCode {
  final _this = this as ResolvedSource;
  return Object.hash(runtimeType,_this.sourceId,_this.uri,_this.protocol,_this.mediaType,_this.format,_this.headers,_this.source,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as ResolvedSource;
  return 'ResolvedSource(sourceId: ${_this.sourceId}, uri: ${_this.uri}, protocol: ${_this.protocol}, mediaType: ${_this.mediaType}, format: ${_this.format}, headers: ${_this.headers}, source: ${_this.source}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $ResolvedSourceCopyWith<$Res>  {
  factory $ResolvedSourceCopyWith(ResolvedSource value, $Res Function(ResolvedSource) _then) = _$ResolvedSourceCopyWithImpl;
@useResult
$Res call({
 SourceId sourceId, Uri uri, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, PlayerSource? source, Map<String, Object?> metadata
});


$PlayerSourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$ResolvedSourceCopyWithImpl<$Res>
    implements $ResolvedSourceCopyWith<$Res> {
  _$ResolvedSourceCopyWithImpl(this._self, this._then);

  final ResolvedSource _self;
  final $Res Function(ResolvedSource) _then;

/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? uri = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? source = freezed,Object? metadata = null,}) {
  return _then(ResolvedSource(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as PlayerSource?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $PlayerSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedSource].
extension ResolvedSourcePatterns on ResolvedSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedSource value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedSource value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceId sourceId,  Uri uri,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  PlayerSource? source,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedSource() when $default != null:
return $default(_that.sourceId,_that.uri,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.source,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceId sourceId,  Uri uri,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  PlayerSource? source,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ResolvedSource():
return $default(_that.sourceId,_that.uri,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.source,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceId sourceId,  Uri uri,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  PlayerSource? source,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedSource() when $default != null:
return $default(_that.sourceId,_that.uri,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.source,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedSource extends ResolvedSource {
  const _ResolvedSource({required this.sourceId, required this.uri, this.protocol = SourceProtocol.unknown, this.mediaType = SourceMediaType.unknown, this.format = SourceFormat.unknown, this.headers, this.source,  Map<String, Object?> metadata = const <String, Object?>{}}): _metadata = metadata,super._();
  

/// Identifier of the original source.
@override final  SourceId sourceId;
/// Concrete URI to be passed to the backend.
@override final  Uri uri;
/// Resolved access protocol.
@override@JsonKey() final  SourceProtocol protocol;
/// Resolved media type.
@override@JsonKey() final  SourceMediaType mediaType;
/// Resolved media format.
@override@JsonKey() final  SourceFormat format;
/// Request headers required to access the resolved source.
@override final  SourceHeaders? headers;
/// Original source from which this resolved source was produced.
@override final  PlayerSource? source;
/// Additional resolver-specific metadata.
 final  Map<String, Object?> _metadata;
/// Additional resolver-specific metadata.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedSourceCopyWith<_ResolvedSource> get copyWith => __$ResolvedSourceCopyWithImpl<_ResolvedSource>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedSource&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.format, format) || other.format == format)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sourceId,uri,protocol,mediaType,format,headers,source,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'ResolvedSource(sourceId: $sourceId, uri: $uri, protocol: $protocol, mediaType: $mediaType, format: $format, headers: $headers, source: $source, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ResolvedSourceCopyWith<$Res> implements $ResolvedSourceCopyWith<$Res> {
  factory _$ResolvedSourceCopyWith(_ResolvedSource value, $Res Function(_ResolvedSource) _then) = __$ResolvedSourceCopyWithImpl;
@override @useResult
$Res call({
 SourceId sourceId, Uri uri, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, PlayerSource? source, Map<String, Object?> metadata
});


@override $PlayerSourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$ResolvedSourceCopyWithImpl<$Res>
    implements _$ResolvedSourceCopyWith<$Res> {
  __$ResolvedSourceCopyWithImpl(this._self, this._then);

  final _ResolvedSource _self;
  final $Res Function(_ResolvedSource) _then;

/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? uri = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? source = freezed,Object? metadata = null,}) {
  return _then(_ResolvedSource(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as PlayerSource?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ResolvedSource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $PlayerSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
