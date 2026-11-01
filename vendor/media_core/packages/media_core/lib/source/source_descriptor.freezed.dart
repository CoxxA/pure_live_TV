// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_descriptor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SourceDescriptor {

/// Unique source identifier.
 SourceId get id;/// Source location.
 SourceLocation get location;/// Source category.
 SourceType get type;/// Transport protocol.
 SourceProtocol get protocol;/// Media content type.
 SourceMediaType get mediaType;/// Container format.
 SourceFormat get format;/// Request headers.
 SourceHeaders? get headers;/// Source metadata.
 SourceMetadata? get metadata;/// Whether source is live.
 bool get live;/// Whether seeking is supported.
 bool get seekable;/// Optional priority.
///
/// Higher value means preferred source.
 int get priority;/// Custom attributes.
 Map<String, Object?> get attributes;
/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceDescriptorCopyWith<SourceDescriptor> get copyWith => _$SourceDescriptorCopyWithImpl<SourceDescriptor>(this as SourceDescriptor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SourceDescriptor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceDescriptor&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.protocol, _this.protocol) || other.protocol == _this.protocol)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.headers, _this.headers) || other.headers == _this.headers)&&(identical(other.metadata, _this.metadata) || other.metadata == _this.metadata)&&(identical(other.live, _this.live) || other.live == _this.live)&&(identical(other.seekable, _this.seekable) || other.seekable == _this.seekable)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&const DeepCollectionEquality().equals(other.attributes, _this.attributes));
}


@override
int get hashCode {
  final _this = this as SourceDescriptor;
  return Object.hash(runtimeType,_this.id,_this.location,_this.type,_this.protocol,_this.mediaType,_this.format,_this.headers,_this.metadata,_this.live,_this.seekable,_this.priority,const DeepCollectionEquality().hash(_this.attributes));
}

@override
String toString() {
  final _this = this as SourceDescriptor;
  return 'SourceDescriptor(id: ${_this.id}, location: ${_this.location}, type: ${_this.type}, protocol: ${_this.protocol}, mediaType: ${_this.mediaType}, format: ${_this.format}, headers: ${_this.headers}, metadata: ${_this.metadata}, live: ${_this.live}, seekable: ${_this.seekable}, priority: ${_this.priority}, attributes: ${_this.attributes})';
}


}

/// @nodoc
abstract mixin class $SourceDescriptorCopyWith<$Res>  {
  factory $SourceDescriptorCopyWith(SourceDescriptor value, $Res Function(SourceDescriptor) _then) = _$SourceDescriptorCopyWithImpl;
@useResult
$Res call({
 SourceId id, SourceLocation location, SourceType type, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, SourceMetadata? metadata, bool live, bool seekable, int priority, Map<String, Object?> attributes
});


$SourceLocationCopyWith<$Res> get location;$SourceMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$SourceDescriptorCopyWithImpl<$Res>
    implements $SourceDescriptorCopyWith<$Res> {
  _$SourceDescriptorCopyWithImpl(this._self, this._then);

  final SourceDescriptor _self;
  final $Res Function(SourceDescriptor) _then;

/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? location = null,Object? type = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? metadata = freezed,Object? live = null,Object? seekable = null,Object? priority = null,Object? attributes = null,}) {
  return _then(SourceDescriptor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SourceLocation,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as SourceMetadata?,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as bool,seekable: null == seekable ? _self.seekable : seekable // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceLocationCopyWith<$Res> get location {
  
  return $SourceLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $SourceMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [SourceDescriptor].
extension SourceDescriptorPatterns on SourceDescriptor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceDescriptor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceDescriptor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceDescriptor value)  $default,){
final _that = this;
switch (_that) {
case _SourceDescriptor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceDescriptor value)?  $default,){
final _that = this;
switch (_that) {
case _SourceDescriptor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceId id,  SourceLocation location,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  SourceMetadata? metadata,  bool live,  bool seekable,  int priority,  Map<String, Object?> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceDescriptor() when $default != null:
return $default(_that.id,_that.location,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.metadata,_that.live,_that.seekable,_that.priority,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceId id,  SourceLocation location,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  SourceMetadata? metadata,  bool live,  bool seekable,  int priority,  Map<String, Object?> attributes)  $default,) {final _that = this;
switch (_that) {
case _SourceDescriptor():
return $default(_that.id,_that.location,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.metadata,_that.live,_that.seekable,_that.priority,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceId id,  SourceLocation location,  SourceType type,  SourceProtocol protocol,  SourceMediaType mediaType,  SourceFormat format,  SourceHeaders? headers,  SourceMetadata? metadata,  bool live,  bool seekable,  int priority,  Map<String, Object?> attributes)?  $default,) {final _that = this;
switch (_that) {
case _SourceDescriptor() when $default != null:
return $default(_that.id,_that.location,_that.type,_that.protocol,_that.mediaType,_that.format,_that.headers,_that.metadata,_that.live,_that.seekable,_that.priority,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc


class _SourceDescriptor implements SourceDescriptor {
  const _SourceDescriptor({required this.id, required this.location, this.type = SourceType.unknown, this.protocol = SourceProtocol.unknown, this.mediaType = SourceMediaType.unknown, this.format = SourceFormat.unknown, this.headers, this.metadata, this.live = false, this.seekable = false, this.priority = 0,  Map<String, Object?> attributes = const {}}): _attributes = attributes;
  

/// Unique source identifier.
@override final  SourceId id;
/// Source location.
@override final  SourceLocation location;
/// Source category.
@override@JsonKey() final  SourceType type;
/// Transport protocol.
@override@JsonKey() final  SourceProtocol protocol;
/// Media content type.
@override@JsonKey() final  SourceMediaType mediaType;
/// Container format.
@override@JsonKey() final  SourceFormat format;
/// Request headers.
@override final  SourceHeaders? headers;
/// Source metadata.
@override final  SourceMetadata? metadata;
/// Whether source is live.
@override@JsonKey() final  bool live;
/// Whether seeking is supported.
@override@JsonKey() final  bool seekable;
/// Optional priority.
///
/// Higher value means preferred source.
@override@JsonKey() final  int priority;
/// Custom attributes.
 final  Map<String, Object?> _attributes;
/// Custom attributes.
@override@JsonKey() Map<String, Object?> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceDescriptorCopyWith<_SourceDescriptor> get copyWith => __$SourceDescriptorCopyWithImpl<_SourceDescriptor>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceDescriptor&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.type, type) || other.type == type)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.format, format) || other.format == format)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.live, live) || other.live == live)&&(identical(other.seekable, seekable) || other.seekable == seekable)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.attributes, _attributes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,location,type,protocol,mediaType,format,headers,metadata,live,seekable,priority,const DeepCollectionEquality().hash(_attributes));
}

@override
String toString() {
    return 'SourceDescriptor(id: $id, location: $location, type: $type, protocol: $protocol, mediaType: $mediaType, format: $format, headers: $headers, metadata: $metadata, live: $live, seekable: $seekable, priority: $priority, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$SourceDescriptorCopyWith<$Res> implements $SourceDescriptorCopyWith<$Res> {
  factory _$SourceDescriptorCopyWith(_SourceDescriptor value, $Res Function(_SourceDescriptor) _then) = __$SourceDescriptorCopyWithImpl;
@override @useResult
$Res call({
 SourceId id, SourceLocation location, SourceType type, SourceProtocol protocol, SourceMediaType mediaType, SourceFormat format, SourceHeaders? headers, SourceMetadata? metadata, bool live, bool seekable, int priority, Map<String, Object?> attributes
});


@override $SourceLocationCopyWith<$Res> get location;@override $SourceMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$SourceDescriptorCopyWithImpl<$Res>
    implements _$SourceDescriptorCopyWith<$Res> {
  __$SourceDescriptorCopyWithImpl(this._self, this._then);

  final _SourceDescriptor _self;
  final $Res Function(_SourceDescriptor) _then;

/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? location = null,Object? type = null,Object? protocol = null,Object? mediaType = null,Object? format = null,Object? headers = freezed,Object? metadata = freezed,Object? live = null,Object? seekable = null,Object? priority = null,Object? attributes = null,}) {
  return _then(_SourceDescriptor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SourceLocation,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as SourceProtocol,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as SourceMediaType,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as SourceFormat,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as SourceHeaders?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as SourceMetadata?,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as bool,seekable: null == seekable ? _self.seekable : seekable // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceLocationCopyWith<$Res> get location {
  
  return $SourceLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of SourceDescriptor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $SourceMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
