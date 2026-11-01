// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerSource {

/// Unique identifier of this source.
 SourceId get id;/// URI used to access the source.
 Uri get uri;/// General source category.
 SourceType get type;/// Protocol used to access the source.
 SourceProtocol get protocol;/// Known media content type.
///
/// This is a source-level hint and may remain [SourceMediaType.unknown]
/// until the source is inspected.
 SourceMediaType get mediaType;/// Known media format.
///
/// This is a source-level hint and may remain [SourceFormat.unknown]
/// until the source is inspected.
 SourceFormat get format;/// Optional HTTP or transport request headers.
 SourceHeaders? get headers;/// Optional human-readable source title.
 String? get title;/// Additional source-specific metadata.
 Map<String, Object?> get metadata;/// Optional source creation timestamp.
 DateTime? get createdAt;
/// Create a copy of PlayerSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSourceCopyWith<PlayerSource> get copyWith => _$PlayerSourceCopyWithImpl<PlayerSource>(this as PlayerSource, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerSource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSource&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.protocol, _this.protocol) || other.protocol == _this.protocol)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.headers, _this.headers) || other.headers == _this.headers)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as PlayerSource;
  return Object.hash(runtimeType,_this.id,_this.uri,_this.type,_this.protocol,_this.mediaType,_this.format,_this.headers,_this.title,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt);
}

@override
String toString() {
  final _this = this as PlayerSource;
  return 'PlayerSource(id: ${_this.id}, uri: ${_this.uri}, type: ${_this.type}, protocol: ${_this.protocol}, mediaType: ${_this.mediaType}, format: ${_this.format}, headers: ${_this.headers}, title: ${_this.title}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $PlayerSourceCopyWith<$Res>  {
  factory $PlayerSourceCopyWith(PlayerSource value, $Res Function(PlayerSource) _then) = _$PlayerSourceCopyWithImpl;
@useResult
$Res call({
 SourceId id, Uri uri, SourceType type, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, String? title, Map<String, Object?> metadata, DateTime? createdAt
});




}
/// @nodoc
class _$PlayerSourceCopyWithImpl<$Res>
    implements $PlayerSourceCopyWith<$Res> {
  _$PlayerSourceCopyWithImpl(this._self, this._then);

  final PlayerSource _self;
  final $Res Function(PlayerSource) _then;

/// Create a copy of PlayerSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uri = null,Object? type = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? title = freezed,Object? metadata = null,Object? createdAt = freezed,}) {
  return _then(PlayerSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerSource].
extension PlayerSourcePatterns on PlayerSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerSource value)  $default,){
final _that = this;
switch (_that) {
case _PlayerSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerSource value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceId id,  Uri uri,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  String? title,  Map<String, Object?> metadata,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerSource() when $default != null:
return $default(_that.id,_that.uri,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.title,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceId id,  Uri uri,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  String? title,  Map<String, Object?> metadata,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PlayerSource():
return $default(_that.id,_that.uri,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.title,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceId id,  Uri uri,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  String? title,  Map<String, Object?> metadata,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PlayerSource() when $default != null:
return $default(_that.id,_that.uri,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.title,_that.metadata,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerSource implements PlayerSource {
  const _PlayerSource({required this.id, required this.uri, this.type = SourceType.unknown, this.protocol = SourceProtocol.unknown, this.mediaType = SourceMediaType.unknown, this.format = SourceFormat.unknown, this.headers, this.title,  Map<String, Object?> metadata = const <String, Object?>{}, this.createdAt}): _metadata = metadata;
  

/// Unique identifier of this source.
@override final  SourceId id;
/// URI used to access the source.
@override final  Uri uri;
/// General source category.
@override@JsonKey() final  SourceType type;
/// Protocol used to access the source.
@override@JsonKey() final  SourceProtocol protocol;
/// Known media content type.
///
/// This is a source-level hint and may remain [SourceMediaType.unknown]
/// until the source is inspected.
@override@JsonKey() final  SourceMediaType mediaType;
/// Known media format.
///
/// This is a source-level hint and may remain [SourceFormat.unknown]
/// until the source is inspected.
@override@JsonKey() final  SourceFormat format;
/// Optional HTTP or transport request headers.
@override final  SourceHeaders? headers;
/// Optional human-readable source title.
@override final  String? title;
/// Additional source-specific metadata.
 final  Map<String, Object?> _metadata;
/// Additional source-specific metadata.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

/// Optional source creation timestamp.
@override final  DateTime? createdAt;

/// Create a copy of PlayerSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerSourceCopyWith<_PlayerSource> get copyWith => __$PlayerSourceCopyWithImpl<_PlayerSource>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerSource&&(identical(other.id, id) || other.id == id)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.type, type) || other.type == type)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.format, format) || other.format == format)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,uri,type,protocol,mediaType,format,headers,title,const DeepCollectionEquality().hash(_metadata),createdAt);
}

@override
String toString() {
    return 'PlayerSource(id: $id, uri: $uri, type: $type, protocol: $protocol, mediaType: $mediaType, format: $format, headers: $headers, title: $title, metadata: $metadata, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PlayerSourceCopyWith<$Res> implements $PlayerSourceCopyWith<$Res> {
  factory _$PlayerSourceCopyWith(_PlayerSource value, $Res Function(_PlayerSource) _then) = __$PlayerSourceCopyWithImpl;
@override @useResult
$Res call({
 SourceId id, Uri uri, SourceType type, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, String? title, Map<String, Object?> metadata, DateTime? createdAt
});




}
/// @nodoc
class __$PlayerSourceCopyWithImpl<$Res>
    implements _$PlayerSourceCopyWith<$Res> {
  __$PlayerSourceCopyWithImpl(this._self, this._then);

  final _PlayerSource _self;
  final $Res Function(_PlayerSource) _then;

/// Create a copy of PlayerSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uri = null,Object? type = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? title = freezed,Object? metadata = null,Object? createdAt = freezed,}) {
  return _then(_PlayerSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
