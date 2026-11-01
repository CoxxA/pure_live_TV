// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkCondition {

/// Whether network is available.
 bool get connected;/// Current network type.
 NetworkType get type;/// Current network quality.
 NetworkQuality get quality;/// Estimated download bandwidth in bits per second.
///
/// May be unavailable.
 int? get downloadBandwidth;/// Estimated upload bandwidth in bits per second.
///
/// May be unavailable.
 int? get uploadBandwidth;/// Network latency in milliseconds.
///
/// May be unavailable.
 int? get latency;/// Whether connection is metered.
 bool get metered;/// Whether connection is considered expensive.
 bool get expensive;/// Time when this condition was created.
 DateTime? get timestamp;
/// Create a copy of NetworkCondition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkConditionCopyWith<NetworkCondition> get copyWith => _$NetworkConditionCopyWithImpl<NetworkCondition>(this as NetworkCondition, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NetworkCondition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkCondition&&(identical(other.connected, _this.connected) || other.connected == _this.connected)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.quality, _this.quality) || other.quality == _this.quality)&&(identical(other.downloadBandwidth, _this.downloadBandwidth) || other.downloadBandwidth == _this.downloadBandwidth)&&(identical(other.uploadBandwidth, _this.uploadBandwidth) || other.uploadBandwidth == _this.uploadBandwidth)&&(identical(other.latency, _this.latency) || other.latency == _this.latency)&&(identical(other.metered, _this.metered) || other.metered == _this.metered)&&(identical(other.expensive, _this.expensive) || other.expensive == _this.expensive)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as NetworkCondition;
  return Object.hash(runtimeType,_this.connected,_this.type,_this.quality,_this.downloadBandwidth,_this.uploadBandwidth,_this.latency,_this.metered,_this.expensive,_this.timestamp);
}

@override
String toString() {
  final _this = this as NetworkCondition;
  return 'NetworkCondition(connected: ${_this.connected}, type: ${_this.type}, quality: ${_this.quality}, downloadBandwidth: ${_this.downloadBandwidth}, uploadBandwidth: ${_this.uploadBandwidth}, latency: ${_this.latency}, metered: ${_this.metered}, expensive: ${_this.expensive}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $NetworkConditionCopyWith<$Res>  {
  factory $NetworkConditionCopyWith(NetworkCondition value, $Res Function(NetworkCondition) _then) = _$NetworkConditionCopyWithImpl;
@useResult
$Res call({
 bool connected, NetworkType type, NetworkQuality quality, int? downloadBandwidth, int? uploadBandwidth, int? latency, bool metered, bool expensive, DateTime? timestamp
});




}
/// @nodoc
class _$NetworkConditionCopyWithImpl<$Res>
    implements $NetworkConditionCopyWith<$Res> {
  _$NetworkConditionCopyWithImpl(this._self, this._then);

  final NetworkCondition _self;
  final $Res Function(NetworkCondition) _then;

/// Create a copy of NetworkCondition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connected = null,Object? type = null,Object? quality = null,Object? downloadBandwidth = freezed,Object? uploadBandwidth = freezed,Object? latency = freezed,Object? metered = null,Object? expensive = null,Object? timestamp = freezed,}) {
  return _then(NetworkCondition(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NetworkType,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as NetworkQuality,downloadBandwidth: freezed == downloadBandwidth ? _self.downloadBandwidth : downloadBandwidth // ignore: cast_nullable_to_non_nullable
as int?,uploadBandwidth: freezed == uploadBandwidth ? _self.uploadBandwidth : uploadBandwidth // ignore: cast_nullable_to_non_nullable
as int?,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as int?,metered: null == metered ? _self.metered : metered // ignore: cast_nullable_to_non_nullable
as bool,expensive: null == expensive ? _self.expensive : expensive // ignore: cast_nullable_to_non_nullable
as bool,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkCondition].
extension NetworkConditionPatterns on NetworkCondition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkCondition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkCondition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkCondition value)  $default,){
final _that = this;
switch (_that) {
case _NetworkCondition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkCondition value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkCondition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool connected,  NetworkType type,  NetworkQuality quality,  int? downloadBandwidth,  int? uploadBandwidth,  int? latency,  bool metered,  bool expensive,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkCondition() when $default != null:
return $default(_that.connected,_that.type,_that.quality,_that.downloadBandwidth,_that.uploadBandwidth,_that.latency,_that.metered,_that.expensive,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool connected,  NetworkType type,  NetworkQuality quality,  int? downloadBandwidth,  int? uploadBandwidth,  int? latency,  bool metered,  bool expensive,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _NetworkCondition():
return $default(_that.connected,_that.type,_that.quality,_that.downloadBandwidth,_that.uploadBandwidth,_that.latency,_that.metered,_that.expensive,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool connected,  NetworkType type,  NetworkQuality quality,  int? downloadBandwidth,  int? uploadBandwidth,  int? latency,  bool metered,  bool expensive,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _NetworkCondition() when $default != null:
return $default(_that.connected,_that.type,_that.quality,_that.downloadBandwidth,_that.uploadBandwidth,_that.latency,_that.metered,_that.expensive,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkCondition implements NetworkCondition {
  const _NetworkCondition({this.connected = false, this.type = NetworkType.unknown, this.quality = NetworkQuality.unknown, this.downloadBandwidth, this.uploadBandwidth, this.latency, this.metered = false, this.expensive = false, this.timestamp});
  

/// Whether network is available.
@override@JsonKey() final  bool connected;
/// Current network type.
@override@JsonKey() final  NetworkType type;
/// Current network quality.
@override@JsonKey() final  NetworkQuality quality;
/// Estimated download bandwidth in bits per second.
///
/// May be unavailable.
@override final  int? downloadBandwidth;
/// Estimated upload bandwidth in bits per second.
///
/// May be unavailable.
@override final  int? uploadBandwidth;
/// Network latency in milliseconds.
///
/// May be unavailable.
@override final  int? latency;
/// Whether connection is metered.
@override@JsonKey() final  bool metered;
/// Whether connection is considered expensive.
@override@JsonKey() final  bool expensive;
/// Time when this condition was created.
@override final  DateTime? timestamp;

/// Create a copy of NetworkCondition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkConditionCopyWith<_NetworkCondition> get copyWith => __$NetworkConditionCopyWithImpl<_NetworkCondition>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkCondition&&(identical(other.connected, connected) || other.connected == connected)&&(identical(other.type, type) || other.type == type)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.downloadBandwidth, downloadBandwidth) || other.downloadBandwidth == downloadBandwidth)&&(identical(other.uploadBandwidth, uploadBandwidth) || other.uploadBandwidth == uploadBandwidth)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.metered, metered) || other.metered == metered)&&(identical(other.expensive, expensive) || other.expensive == expensive)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,connected,type,quality,downloadBandwidth,uploadBandwidth,latency,metered,expensive,timestamp);
}

@override
String toString() {
    return 'NetworkCondition(connected: $connected, type: $type, quality: $quality, downloadBandwidth: $downloadBandwidth, uploadBandwidth: $uploadBandwidth, latency: $latency, metered: $metered, expensive: $expensive, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$NetworkConditionCopyWith<$Res> implements $NetworkConditionCopyWith<$Res> {
  factory _$NetworkConditionCopyWith(_NetworkCondition value, $Res Function(_NetworkCondition) _then) = __$NetworkConditionCopyWithImpl;
@override @useResult
$Res call({
 bool connected, NetworkType type, NetworkQuality quality, int? downloadBandwidth, int? uploadBandwidth, int? latency, bool metered, bool expensive, DateTime? timestamp
});




}
/// @nodoc
class __$NetworkConditionCopyWithImpl<$Res>
    implements _$NetworkConditionCopyWith<$Res> {
  __$NetworkConditionCopyWithImpl(this._self, this._then);

  final _NetworkCondition _self;
  final $Res Function(_NetworkCondition) _then;

/// Create a copy of NetworkCondition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connected = null,Object? type = null,Object? quality = null,Object? downloadBandwidth = freezed,Object? uploadBandwidth = freezed,Object? latency = freezed,Object? metered = null,Object? expensive = null,Object? timestamp = freezed,}) {
  return _then(_NetworkCondition(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NetworkType,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as NetworkQuality,downloadBandwidth: freezed == downloadBandwidth ? _self.downloadBandwidth : downloadBandwidth // ignore: cast_nullable_to_non_nullable
as int?,uploadBandwidth: freezed == uploadBandwidth ? _self.uploadBandwidth : uploadBandwidth // ignore: cast_nullable_to_non_nullable
as int?,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as int?,metered: null == metered ? _self.metered : metered // ignore: cast_nullable_to_non_nullable
as bool,expensive: null == expensive ? _self.expensive : expensive // ignore: cast_nullable_to_non_nullable
as bool,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
