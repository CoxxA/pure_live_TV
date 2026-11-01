// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SourceLocation {

/// Resource URI.
 Uri? get uri;/// Local filesystem path.
 String? get path;/// Asset identifier.
 String? get asset;/// Custom location value.
 String? get custom;/// Location scheme.
 SourceLocationType get type;
/// Create a copy of SourceLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceLocationCopyWith<SourceLocation> get copyWith => _$SourceLocationCopyWithImpl<SourceLocation>(this as SourceLocation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SourceLocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceLocation&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.path, _this.path) || other.path == _this.path)&&(identical(other.asset, _this.asset) || other.asset == _this.asset)&&(identical(other.custom, _this.custom) || other.custom == _this.custom)&&(identical(other.type, _this.type) || other.type == _this.type));
}


@override
int get hashCode {
  final _this = this as SourceLocation;
  return Object.hash(runtimeType,_this.uri,_this.path,_this.asset,_this.custom,_this.type);
}

@override
String toString() {
  final _this = this as SourceLocation;
  return 'SourceLocation(uri: ${_this.uri}, path: ${_this.path}, asset: ${_this.asset}, custom: ${_this.custom}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $SourceLocationCopyWith<$Res>  {
  factory $SourceLocationCopyWith(SourceLocation value, $Res Function(SourceLocation) _then) = _$SourceLocationCopyWithImpl;
@useResult
$Res call({
 Uri? uri, String? path, String? asset, String? custom, SourceLocationType type
});




}
/// @nodoc
class _$SourceLocationCopyWithImpl<$Res>
    implements $SourceLocationCopyWith<$Res> {
  _$SourceLocationCopyWithImpl(this._self, this._then);

  final SourceLocation _self;
  final $Res Function(SourceLocation) _then;

/// Create a copy of SourceLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = freezed,Object? path = freezed,Object? asset = freezed,Object? custom = freezed,Object? type = null,}) {
  return _then(SourceLocation(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,asset: freezed == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as String?,custom: freezed == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceLocationType,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceLocation].
extension SourceLocationPatterns on SourceLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceLocation value)  $default,){
final _that = this;
switch (_that) {
case _SourceLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceLocation value)?  $default,){
final _that = this;
switch (_that) {
case _SourceLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri? uri,  String? path,  String? asset,  String? custom,  SourceLocationType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceLocation() when $default != null:
return $default(_that.uri,_that.path,_that.asset,_that.custom,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri? uri,  String? path,  String? asset,  String? custom,  SourceLocationType type)  $default,) {final _that = this;
switch (_that) {
case _SourceLocation():
return $default(_that.uri,_that.path,_that.asset,_that.custom,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri? uri,  String? path,  String? asset,  String? custom,  SourceLocationType type)?  $default,) {final _that = this;
switch (_that) {
case _SourceLocation() when $default != null:
return $default(_that.uri,_that.path,_that.asset,_that.custom,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _SourceLocation implements SourceLocation {
  const _SourceLocation({this.uri, this.path, this.asset, this.custom, this.type = SourceLocationType.unknown});
  

/// Resource URI.
@override final  Uri? uri;
/// Local filesystem path.
@override final  String? path;
/// Asset identifier.
@override final  String? asset;
/// Custom location value.
@override final  String? custom;
/// Location scheme.
@override@JsonKey() final  SourceLocationType type;

/// Create a copy of SourceLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceLocationCopyWith<_SourceLocation> get copyWith => __$SourceLocationCopyWithImpl<_SourceLocation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceLocation&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.path, path) || other.path == path)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.custom, custom) || other.custom == custom)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uri,path,asset,custom,type);
}

@override
String toString() {
    return 'SourceLocation(uri: $uri, path: $path, asset: $asset, custom: $custom, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SourceLocationCopyWith<$Res> implements $SourceLocationCopyWith<$Res> {
  factory _$SourceLocationCopyWith(_SourceLocation value, $Res Function(_SourceLocation) _then) = __$SourceLocationCopyWithImpl;
@override @useResult
$Res call({
 Uri? uri, String? path, String? asset, String? custom, SourceLocationType type
});




}
/// @nodoc
class __$SourceLocationCopyWithImpl<$Res>
    implements _$SourceLocationCopyWith<$Res> {
  __$SourceLocationCopyWithImpl(this._self, this._then);

  final _SourceLocation _self;
  final $Res Function(_SourceLocation) _then;

/// Create a copy of SourceLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = freezed,Object? path = freezed,Object? asset = freezed,Object? custom = freezed,Object? type = null,}) {
  return _then(_SourceLocation(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,asset: freezed == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as String?,custom: freezed == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceLocationType,
  ));
}


}

// dart format on
