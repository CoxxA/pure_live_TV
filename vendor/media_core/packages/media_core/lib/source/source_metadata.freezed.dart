// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SourceMetadata {

/// Display title.
 String? get title;/// Description text.
 String? get description;/// Author or creator.
 String? get author;/// Channel name.
 String? get channel;/// Language code.
///
/// Example:
/// - en
/// - zh-CN
 String? get language;/// Thumbnail or poster URL.
 Uri? get artwork;/// Duration in milliseconds.
 Duration? get duration;/// Additional custom metadata.
 Map<String, Object?> get extras;
/// Create a copy of SourceMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceMetadataCopyWith<SourceMetadata> get copyWith => _$SourceMetadataCopyWithImpl<SourceMetadata>(this as SourceMetadata, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SourceMetadata;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceMetadata&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.channel, _this.channel) || other.channel == _this.channel)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.artwork, _this.artwork) || other.artwork == _this.artwork)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&const DeepCollectionEquality().equals(other.extras, _this.extras));
}


@override
int get hashCode {
  final _this = this as SourceMetadata;
  return Object.hash(runtimeType,_this.title,_this.description,_this.author,_this.channel,_this.language,_this.artwork,_this.duration,const DeepCollectionEquality().hash(_this.extras));
}

@override
String toString() {
  final _this = this as SourceMetadata;
  return 'SourceMetadata(title: ${_this.title}, description: ${_this.description}, author: ${_this.author}, channel: ${_this.channel}, language: ${_this.language}, artwork: ${_this.artwork}, duration: ${_this.duration}, extras: ${_this.extras})';
}


}

/// @nodoc
abstract mixin class $SourceMetadataCopyWith<$Res>  {
  factory $SourceMetadataCopyWith(SourceMetadata value, $Res Function(SourceMetadata) _then) = _$SourceMetadataCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, String? author, String? channel, String? language, Uri? artwork, Duration? duration, Map<String, Object?> extras
});




}
/// @nodoc
class _$SourceMetadataCopyWithImpl<$Res>
    implements $SourceMetadataCopyWith<$Res> {
  _$SourceMetadataCopyWithImpl(this._self, this._then);

  final SourceMetadata _self;
  final $Res Function(SourceMetadata) _then;

/// Create a copy of SourceMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? author = freezed,Object? channel = freezed,Object? language = freezed,Object? artwork = freezed,Object? duration = freezed,Object? extras = null,}) {
  return _then(SourceMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,artwork: freezed == artwork ? _self.artwork : artwork // ignore: cast_nullable_to_non_nullable
as Uri?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceMetadata].
extension SourceMetadataPatterns on SourceMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceMetadata value)  $default,){
final _that = this;
switch (_that) {
case _SourceMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _SourceMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? description,  String? author,  String? channel,  String? language,  Uri? artwork,  Duration? duration,  Map<String, Object?> extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.channel,_that.language,_that.artwork,_that.duration,_that.extras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? description,  String? author,  String? channel,  String? language,  Uri? artwork,  Duration? duration,  Map<String, Object?> extras)  $default,) {final _that = this;
switch (_that) {
case _SourceMetadata():
return $default(_that.title,_that.description,_that.author,_that.channel,_that.language,_that.artwork,_that.duration,_that.extras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? description,  String? author,  String? channel,  String? language,  Uri? artwork,  Duration? duration,  Map<String, Object?> extras)?  $default,) {final _that = this;
switch (_that) {
case _SourceMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.channel,_that.language,_that.artwork,_that.duration,_that.extras);case _:
  return null;

}
}

}

/// @nodoc


class _SourceMetadata implements SourceMetadata {
  const _SourceMetadata({this.title, this.description, this.author, this.channel, this.language, this.artwork, this.duration,  Map<String, Object?> extras = const {}}): _extras = extras;
  

/// Display title.
@override final  String? title;
/// Description text.
@override final  String? description;
/// Author or creator.
@override final  String? author;
/// Channel name.
@override final  String? channel;
/// Language code.
///
/// Example:
/// - en
/// - zh-CN
@override final  String? language;
/// Thumbnail or poster URL.
@override final  Uri? artwork;
/// Duration in milliseconds.
@override final  Duration? duration;
/// Additional custom metadata.
 final  Map<String, Object?> _extras;
/// Additional custom metadata.
@override@JsonKey() Map<String, Object?> get extras {
  if (_extras is EqualUnmodifiableMapView) return _extras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_extras);
}


/// Create a copy of SourceMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceMetadataCopyWith<_SourceMetadata> get copyWith => __$SourceMetadataCopyWithImpl<_SourceMetadata>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.language, language) || other.language == language)&&(identical(other.artwork, artwork) || other.artwork == artwork)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.extras, _extras));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,description,author,channel,language,artwork,duration,const DeepCollectionEquality().hash(_extras));
}

@override
String toString() {
    return 'SourceMetadata(title: $title, description: $description, author: $author, channel: $channel, language: $language, artwork: $artwork, duration: $duration, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$SourceMetadataCopyWith<$Res> implements $SourceMetadataCopyWith<$Res> {
  factory _$SourceMetadataCopyWith(_SourceMetadata value, $Res Function(_SourceMetadata) _then) = __$SourceMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description, String? author, String? channel, String? language, Uri? artwork, Duration? duration, Map<String, Object?> extras
});




}
/// @nodoc
class __$SourceMetadataCopyWithImpl<$Res>
    implements _$SourceMetadataCopyWith<$Res> {
  __$SourceMetadataCopyWithImpl(this._self, this._then);

  final _SourceMetadata _self;
  final $Res Function(_SourceMetadata) _then;

/// Create a copy of SourceMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? author = freezed,Object? channel = freezed,Object? language = freezed,Object? artwork = freezed,Object? duration = freezed,Object? extras = null,}) {
  return _then(_SourceMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,artwork: freezed == artwork ? _self.artwork : artwork // ignore: cast_nullable_to_non_nullable
as Uri?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,extras: null == extras ? _self._extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
