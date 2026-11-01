// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkMetrics {

/// Average latency in milliseconds.
 int? get averageLatency;/// Minimum latency in milliseconds.
 int? get minimumLatency;/// Maximum latency in milliseconds.
 int? get maximumLatency;/// Download throughput in bytes per second.
 int? get downloadSpeed;/// Upload throughput in bytes per second.
 int? get uploadSpeed;/// Total requests performed.
 int get totalRequests;/// Successful request count.
 int get successfulRequests;/// Failed request count.
 int get failedRequests;/// Total received bytes.
 int get receivedBytes;/// Total sent bytes.
 int get sentBytes;/// Timestamp of this metrics snapshot.
 DateTime? get timestamp;
/// Create a copy of NetworkMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkMetricsCopyWith<NetworkMetrics> get copyWith => _$NetworkMetricsCopyWithImpl<NetworkMetrics>(this as NetworkMetrics, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NetworkMetrics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkMetrics&&(identical(other.averageLatency, _this.averageLatency) || other.averageLatency == _this.averageLatency)&&(identical(other.minimumLatency, _this.minimumLatency) || other.minimumLatency == _this.minimumLatency)&&(identical(other.maximumLatency, _this.maximumLatency) || other.maximumLatency == _this.maximumLatency)&&(identical(other.downloadSpeed, _this.downloadSpeed) || other.downloadSpeed == _this.downloadSpeed)&&(identical(other.uploadSpeed, _this.uploadSpeed) || other.uploadSpeed == _this.uploadSpeed)&&(identical(other.totalRequests, _this.totalRequests) || other.totalRequests == _this.totalRequests)&&(identical(other.successfulRequests, _this.successfulRequests) || other.successfulRequests == _this.successfulRequests)&&(identical(other.failedRequests, _this.failedRequests) || other.failedRequests == _this.failedRequests)&&(identical(other.receivedBytes, _this.receivedBytes) || other.receivedBytes == _this.receivedBytes)&&(identical(other.sentBytes, _this.sentBytes) || other.sentBytes == _this.sentBytes)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as NetworkMetrics;
  return Object.hash(runtimeType,_this.averageLatency,_this.minimumLatency,_this.maximumLatency,_this.downloadSpeed,_this.uploadSpeed,_this.totalRequests,_this.successfulRequests,_this.failedRequests,_this.receivedBytes,_this.sentBytes,_this.timestamp);
}

@override
String toString() {
  final _this = this as NetworkMetrics;
  return 'NetworkMetrics(averageLatency: ${_this.averageLatency}, minimumLatency: ${_this.minimumLatency}, maximumLatency: ${_this.maximumLatency}, downloadSpeed: ${_this.downloadSpeed}, uploadSpeed: ${_this.uploadSpeed}, totalRequests: ${_this.totalRequests}, successfulRequests: ${_this.successfulRequests}, failedRequests: ${_this.failedRequests}, receivedBytes: ${_this.receivedBytes}, sentBytes: ${_this.sentBytes}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $NetworkMetricsCopyWith<$Res>  {
  factory $NetworkMetricsCopyWith(NetworkMetrics value, $Res Function(NetworkMetrics) _then) = _$NetworkMetricsCopyWithImpl;
@useResult
$Res call({
 int? averageLatency, int? minimumLatency, int? maximumLatency, int? downloadSpeed, int? uploadSpeed, int totalRequests, int successfulRequests, int failedRequests, int receivedBytes, int sentBytes, DateTime? timestamp
});




}
/// @nodoc
class _$NetworkMetricsCopyWithImpl<$Res>
    implements $NetworkMetricsCopyWith<$Res> {
  _$NetworkMetricsCopyWithImpl(this._self, this._then);

  final NetworkMetrics _self;
  final $Res Function(NetworkMetrics) _then;

/// Create a copy of NetworkMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? averageLatency = freezed,Object? minimumLatency = freezed,Object? maximumLatency = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? totalRequests = null,Object? successfulRequests = null,Object? failedRequests = null,Object? receivedBytes = null,Object? sentBytes = null,Object? timestamp = freezed,}) {
  return _then(NetworkMetrics(
averageLatency: freezed == averageLatency ? _self.averageLatency : averageLatency // ignore: cast_nullable_to_non_nullable
as int?,minimumLatency: freezed == minimumLatency ? _self.minimumLatency : minimumLatency // ignore: cast_nullable_to_non_nullable
as int?,maximumLatency: freezed == maximumLatency ? _self.maximumLatency : maximumLatency // ignore: cast_nullable_to_non_nullable
as int?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,successfulRequests: null == successfulRequests ? _self.successfulRequests : successfulRequests // ignore: cast_nullable_to_non_nullable
as int,failedRequests: null == failedRequests ? _self.failedRequests : failedRequests // ignore: cast_nullable_to_non_nullable
as int,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,sentBytes: null == sentBytes ? _self.sentBytes : sentBytes // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkMetrics].
extension NetworkMetricsPatterns on NetworkMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkMetrics value)  $default,){
final _that = this;
switch (_that) {
case _NetworkMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? averageLatency,  int? minimumLatency,  int? maximumLatency,  int? downloadSpeed,  int? uploadSpeed,  int totalRequests,  int successfulRequests,  int failedRequests,  int receivedBytes,  int sentBytes,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkMetrics() when $default != null:
return $default(_that.averageLatency,_that.minimumLatency,_that.maximumLatency,_that.downloadSpeed,_that.uploadSpeed,_that.totalRequests,_that.successfulRequests,_that.failedRequests,_that.receivedBytes,_that.sentBytes,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? averageLatency,  int? minimumLatency,  int? maximumLatency,  int? downloadSpeed,  int? uploadSpeed,  int totalRequests,  int successfulRequests,  int failedRequests,  int receivedBytes,  int sentBytes,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _NetworkMetrics():
return $default(_that.averageLatency,_that.minimumLatency,_that.maximumLatency,_that.downloadSpeed,_that.uploadSpeed,_that.totalRequests,_that.successfulRequests,_that.failedRequests,_that.receivedBytes,_that.sentBytes,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? averageLatency,  int? minimumLatency,  int? maximumLatency,  int? downloadSpeed,  int? uploadSpeed,  int totalRequests,  int successfulRequests,  int failedRequests,  int receivedBytes,  int sentBytes,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _NetworkMetrics() when $default != null:
return $default(_that.averageLatency,_that.minimumLatency,_that.maximumLatency,_that.downloadSpeed,_that.uploadSpeed,_that.totalRequests,_that.successfulRequests,_that.failedRequests,_that.receivedBytes,_that.sentBytes,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkMetrics implements NetworkMetrics {
  const _NetworkMetrics({this.averageLatency, this.minimumLatency, this.maximumLatency, this.downloadSpeed, this.uploadSpeed, this.totalRequests = 0, this.successfulRequests = 0, this.failedRequests = 0, this.receivedBytes = 0, this.sentBytes = 0, this.timestamp});
  

/// Average latency in milliseconds.
@override final  int? averageLatency;
/// Minimum latency in milliseconds.
@override final  int? minimumLatency;
/// Maximum latency in milliseconds.
@override final  int? maximumLatency;
/// Download throughput in bytes per second.
@override final  int? downloadSpeed;
/// Upload throughput in bytes per second.
@override final  int? uploadSpeed;
/// Total requests performed.
@override@JsonKey() final  int totalRequests;
/// Successful request count.
@override@JsonKey() final  int successfulRequests;
/// Failed request count.
@override@JsonKey() final  int failedRequests;
/// Total received bytes.
@override@JsonKey() final  int receivedBytes;
/// Total sent bytes.
@override@JsonKey() final  int sentBytes;
/// Timestamp of this metrics snapshot.
@override final  DateTime? timestamp;

/// Create a copy of NetworkMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkMetricsCopyWith<_NetworkMetrics> get copyWith => __$NetworkMetricsCopyWithImpl<_NetworkMetrics>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkMetrics&&(identical(other.averageLatency, averageLatency) || other.averageLatency == averageLatency)&&(identical(other.minimumLatency, minimumLatency) || other.minimumLatency == minimumLatency)&&(identical(other.maximumLatency, maximumLatency) || other.maximumLatency == maximumLatency)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.successfulRequests, successfulRequests) || other.successfulRequests == successfulRequests)&&(identical(other.failedRequests, failedRequests) || other.failedRequests == failedRequests)&&(identical(other.receivedBytes, receivedBytes) || other.receivedBytes == receivedBytes)&&(identical(other.sentBytes, sentBytes) || other.sentBytes == sentBytes)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,averageLatency,minimumLatency,maximumLatency,downloadSpeed,uploadSpeed,totalRequests,successfulRequests,failedRequests,receivedBytes,sentBytes,timestamp);
}

@override
String toString() {
    return 'NetworkMetrics(averageLatency: $averageLatency, minimumLatency: $minimumLatency, maximumLatency: $maximumLatency, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, totalRequests: $totalRequests, successfulRequests: $successfulRequests, failedRequests: $failedRequests, receivedBytes: $receivedBytes, sentBytes: $sentBytes, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$NetworkMetricsCopyWith<$Res> implements $NetworkMetricsCopyWith<$Res> {
  factory _$NetworkMetricsCopyWith(_NetworkMetrics value, $Res Function(_NetworkMetrics) _then) = __$NetworkMetricsCopyWithImpl;
@override @useResult
$Res call({
 int? averageLatency, int? minimumLatency, int? maximumLatency, int? downloadSpeed, int? uploadSpeed, int totalRequests, int successfulRequests, int failedRequests, int receivedBytes, int sentBytes, DateTime? timestamp
});




}
/// @nodoc
class __$NetworkMetricsCopyWithImpl<$Res>
    implements _$NetworkMetricsCopyWith<$Res> {
  __$NetworkMetricsCopyWithImpl(this._self, this._then);

  final _NetworkMetrics _self;
  final $Res Function(_NetworkMetrics) _then;

/// Create a copy of NetworkMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? averageLatency = freezed,Object? minimumLatency = freezed,Object? maximumLatency = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? totalRequests = null,Object? successfulRequests = null,Object? failedRequests = null,Object? receivedBytes = null,Object? sentBytes = null,Object? timestamp = freezed,}) {
  return _then(_NetworkMetrics(
averageLatency: freezed == averageLatency ? _self.averageLatency : averageLatency // ignore: cast_nullable_to_non_nullable
as int?,minimumLatency: freezed == minimumLatency ? _self.minimumLatency : minimumLatency // ignore: cast_nullable_to_non_nullable
as int?,maximumLatency: freezed == maximumLatency ? _self.maximumLatency : maximumLatency // ignore: cast_nullable_to_non_nullable
as int?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,successfulRequests: null == successfulRequests ? _self.successfulRequests : successfulRequests // ignore: cast_nullable_to_non_nullable
as int,failedRequests: null == failedRequests ? _self.failedRequests : failedRequests // ignore: cast_nullable_to_non_nullable
as int,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,sentBytes: null == sentBytes ? _self.sentBytes : sentBytes // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
