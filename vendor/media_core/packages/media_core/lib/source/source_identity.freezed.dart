// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SourceIdentity {

/// Global source identifier.
 SourceId get id;/// Provider identifier.
///
/// Example:
/// - youtube
/// - bilibili
/// - custom
 String? get provider;/// External source identifier.
///
/// Example:
/// - channel id
/// - room id
/// - media id
 String? get externalId;/// Human-readable name.
 String? get name;/// Optional namespace.
///
/// Example:
/// - user
/// - platform
/// - service
 String? get namespace;/// Additional identity attributes.
 Map<String, Object?> get attributes;
/// Create a copy of SourceIdentity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceIdentityCopyWith<SourceIdentity> get copyWith => _$SourceIdentityCopyWithImpl<SourceIdentity>(this as SourceIdentity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SourceIdentity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceIdentity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.provider, _this.provider) || other.provider == _this.provider)&&(identical(other.externalId, _this.externalId) || other.externalId == _this.externalId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.namespace, _this.namespace) || other.namespace == _this.namespace)&&const DeepCollectionEquality().equals(other.attributes, _this.attributes));
}


@override
int get hashCode {
  final _this = this as SourceIdentity;
  return Object.hash(runtimeType,_this.id,_this.provider,_this.externalId,_this.name,_this.namespace,const DeepCollectionEquality().hash(_this.attributes));
}

@override
String toString() {
  final _this = this as SourceIdentity;
  return 'SourceIdentity(id: ${_this.id}, provider: ${_this.provider}, externalId: ${_this.externalId}, name: ${_this.name}, namespace: ${_this.namespace}, attributes: ${_this.attributes})';
}


}

/// @nodoc
abstract mixin class $SourceIdentityCopyWith<$Res>  {
  factory $SourceIdentityCopyWith(SourceIdentity value, $Res Function(SourceIdentity) _then) = _$SourceIdentityCopyWithImpl;
@useResult
$Res call({
 SourceId id, String? provider, String? externalId, String? name, String? namespace, Map<String, Object?> attributes
});




}
/// @nodoc
class _$SourceIdentityCopyWithImpl<$Res>
    implements $SourceIdentityCopyWith<$Res> {
  _$SourceIdentityCopyWithImpl(this._self, this._then);

  final SourceIdentity _self;
  final $Res Function(SourceIdentity) _then;

/// Create a copy of SourceIdentity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provider = freezed,Object? externalId = freezed,Object? name = freezed,Object? namespace = freezed,Object? attributes = null,}) {
  return _then(SourceIdentity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,externalId: freezed == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,namespace: freezed == namespace ? _self.namespace : namespace // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceIdentity].
extension SourceIdentityPatterns on SourceIdentity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceIdentity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceIdentity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceIdentity value)  $default,){
final _that = this;
switch (_that) {
case _SourceIdentity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceIdentity value)?  $default,){
final _that = this;
switch (_that) {
case _SourceIdentity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceId id,  String? provider,  String? externalId,  String? name,  String? namespace,  Map<String, Object?> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceIdentity() when $default != null:
return $default(_that.id,_that.provider,_that.externalId,_that.name,_that.namespace,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceId id,  String? provider,  String? externalId,  String? name,  String? namespace,  Map<String, Object?> attributes)  $default,) {final _that = this;
switch (_that) {
case _SourceIdentity():
return $default(_that.id,_that.provider,_that.externalId,_that.name,_that.namespace,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceId id,  String? provider,  String? externalId,  String? name,  String? namespace,  Map<String, Object?> attributes)?  $default,) {final _that = this;
switch (_that) {
case _SourceIdentity() when $default != null:
return $default(_that.id,_that.provider,_that.externalId,_that.name,_that.namespace,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc


class _SourceIdentity implements SourceIdentity {
  const _SourceIdentity({required this.id, this.provider, this.externalId, this.name, this.namespace,  Map<String, Object?> attributes = const {}}): _attributes = attributes;
  

/// Global source identifier.
@override final  SourceId id;
/// Provider identifier.
///
/// Example:
/// - youtube
/// - bilibili
/// - custom
@override final  String? provider;
/// External source identifier.
///
/// Example:
/// - channel id
/// - room id
/// - media id
@override final  String? externalId;
/// Human-readable name.
@override final  String? name;
/// Optional namespace.
///
/// Example:
/// - user
/// - platform
/// - service
@override final  String? namespace;
/// Additional identity attributes.
 final  Map<String, Object?> _attributes;
/// Additional identity attributes.
@override@JsonKey() Map<String, Object?> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of SourceIdentity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceIdentityCopyWith<_SourceIdentity> get copyWith => __$SourceIdentityCopyWithImpl<_SourceIdentity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.namespace, namespace) || other.namespace == namespace)&&const DeepCollectionEquality().equals(other.attributes, _attributes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,provider,externalId,name,namespace,const DeepCollectionEquality().hash(_attributes));
}

@override
String toString() {
    return 'SourceIdentity(id: $id, provider: $provider, externalId: $externalId, name: $name, namespace: $namespace, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$SourceIdentityCopyWith<$Res> implements $SourceIdentityCopyWith<$Res> {
  factory _$SourceIdentityCopyWith(_SourceIdentity value, $Res Function(_SourceIdentity) _then) = __$SourceIdentityCopyWithImpl;
@override @useResult
$Res call({
 SourceId id, String? provider, String? externalId, String? name, String? namespace, Map<String, Object?> attributes
});




}
/// @nodoc
class __$SourceIdentityCopyWithImpl<$Res>
    implements _$SourceIdentityCopyWith<$Res> {
  __$SourceIdentityCopyWithImpl(this._self, this._then);

  final _SourceIdentity _self;
  final $Res Function(_SourceIdentity) _then;

/// Create a copy of SourceIdentity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = freezed,Object? externalId = freezed,Object? name = freezed,Object? namespace = freezed,Object? attributes = null,}) {
  return _then(_SourceIdentity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SourceId,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,externalId: freezed == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,namespace: freezed == namespace ? _self.namespace : namespace // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
