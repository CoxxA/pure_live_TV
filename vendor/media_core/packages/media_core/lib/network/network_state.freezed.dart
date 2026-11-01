// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkState {

/// Whether network connection is available.
 bool get connected;/// Current network type.
 NetworkType get type;/// Current network quality.
 NetworkQuality get quality;/// Whether the network is metered.
///
/// Examples:
/// - mobile data
/// - restricted hotspot
 bool get metered;/// Whether network is considered expensive.
 bool get expensive;/// Last update timestamp.
 DateTime? get updatedAt;
/// Create a copy of NetworkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkStateCopyWith<NetworkState> get copyWith => _$NetworkStateCopyWithImpl<NetworkState>(this as NetworkState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NetworkState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkState&&(identical(other.connected, _this.connected) || other.connected == _this.connected)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.quality, _this.quality) || other.quality == _this.quality)&&(identical(other.metered, _this.metered) || other.metered == _this.metered)&&(identical(other.expensive, _this.expensive) || other.expensive == _this.expensive)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as NetworkState;
  return Object.hash(runtimeType,_this.connected,_this.type,_this.quality,_this.metered,_this.expensive,_this.updatedAt);
}

@override
String toString() {
  final _this = this as NetworkState;
  return 'NetworkState(connected: ${_this.connected}, type: ${_this.type}, quality: ${_this.quality}, metered: ${_this.metered}, expensive: ${_this.expensive}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $NetworkStateCopyWith<$Res>  {
  factory $NetworkStateCopyWith(NetworkState value, $Res Function(NetworkState) _then) = _$NetworkStateCopyWithImpl;
@useResult
$Res call({
 bool connected, NetworkType type, NetworkQuality quality, bool metered, bool expensive, DateTime? updatedAt
});




}
/// @nodoc
class _$NetworkStateCopyWithImpl<$Res>
    implements $NetworkStateCopyWith<$Res> {
  _$NetworkStateCopyWithImpl(this._self, this._then);

  final NetworkState _self;
  final $Res Function(NetworkState) _then;

/// Create a copy of NetworkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connected = null,Object? type = null,Object? quality = null,Object? metered = null,Object? expensive = null,Object? updatedAt = freezed,}) {
  return _then(NetworkState(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NetworkType,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as NetworkQuality,metered: null == metered ? _self.metered : metered // ignore: cast_nullable_to_non_nullable
as bool,expensive: null == expensive ? _self.expensive : expensive // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkState].
extension NetworkStatePatterns on NetworkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkState value)  $default,){
final _that = this;
switch (_that) {
case _NetworkState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkState value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool connected,  NetworkType type,  NetworkQuality quality,  bool metered,  bool expensive,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkState() when $default != null:
return $default(_that.connected,_that.type,_that.quality,_that.metered,_that.expensive,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool connected,  NetworkType type,  NetworkQuality quality,  bool metered,  bool expensive,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NetworkState():
return $default(_that.connected,_that.type,_that.quality,_that.metered,_that.expensive,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool connected,  NetworkType type,  NetworkQuality quality,  bool metered,  bool expensive,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NetworkState() when $default != null:
return $default(_that.connected,_that.type,_that.quality,_that.metered,_that.expensive,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkState implements NetworkState {
  const _NetworkState({this.connected = false, this.type = NetworkType.unknown, this.quality = NetworkQuality.unknown, this.metered = false, this.expensive = false, this.updatedAt});
  

/// Whether network connection is available.
@override@JsonKey() final  bool connected;
/// Current network type.
@override@JsonKey() final  NetworkType type;
/// Current network quality.
@override@JsonKey() final  NetworkQuality quality;
/// Whether the network is metered.
///
/// Examples:
/// - mobile data
/// - restricted hotspot
@override@JsonKey() final  bool metered;
/// Whether network is considered expensive.
@override@JsonKey() final  bool expensive;
/// Last update timestamp.
@override final  DateTime? updatedAt;

/// Create a copy of NetworkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkStateCopyWith<_NetworkState> get copyWith => __$NetworkStateCopyWithImpl<_NetworkState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkState&&(identical(other.connected, connected) || other.connected == connected)&&(identical(other.type, type) || other.type == type)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.metered, metered) || other.metered == metered)&&(identical(other.expensive, expensive) || other.expensive == expensive)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,connected,type,quality,metered,expensive,updatedAt);
}

@override
String toString() {
    return 'NetworkState(connected: $connected, type: $type, quality: $quality, metered: $metered, expensive: $expensive, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NetworkStateCopyWith<$Res> implements $NetworkStateCopyWith<$Res> {
  factory _$NetworkStateCopyWith(_NetworkState value, $Res Function(_NetworkState) _then) = __$NetworkStateCopyWithImpl;
@override @useResult
$Res call({
 bool connected, NetworkType type, NetworkQuality quality, bool metered, bool expensive, DateTime? updatedAt
});




}
/// @nodoc
class __$NetworkStateCopyWithImpl<$Res>
    implements _$NetworkStateCopyWith<$Res> {
  __$NetworkStateCopyWithImpl(this._self, this._then);

  final _NetworkState _self;
  final $Res Function(_NetworkState) _then;

/// Create a copy of NetworkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connected = null,Object? type = null,Object? quality = null,Object? metered = null,Object? expensive = null,Object? updatedAt = freezed,}) {
  return _then(_NetworkState(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NetworkType,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as NetworkQuality,metered: null == metered ? _self.metered : metered // ignore: cast_nullable_to_non_nullable
as bool,expensive: null == expensive ? _self.expensive : expensive // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
