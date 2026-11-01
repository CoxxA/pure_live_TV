// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_adapter_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerAdapterMetrics {

/// Current bitrate in bits per second.
 int? get bitrate;/// Current network throughput.
 int? get bandwidth;/// Buffered duration.
 Duration get buffered;/// Current playback latency.
 Duration? get latency;/// Total decoded video frames.
 int get decodedFrames;/// Dropped video frames.
 int get droppedFrames;/// Rendered frames.
 int get renderedFrames;/// Audio buffer level.
 Duration? get audioBuffered;/// Video buffer level.
 Duration? get videoBuffered;/// Decoder name.
 String? get decoder;/// Renderer name.
 String? get renderer;/// Current CPU usage percentage.
 double? get cpuUsage;/// Current memory usage in bytes.
 int? get memoryUsage;/// Timestamp of this sample.
 DateTime? get timestamp;
/// Create a copy of PlayerAdapterMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAdapterMetricsCopyWith<PlayerAdapterMetrics> get copyWith => _$PlayerAdapterMetricsCopyWithImpl<PlayerAdapterMetrics>(this as PlayerAdapterMetrics, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlayerAdapterMetrics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAdapterMetrics&&(identical(other.bitrate, _this.bitrate) || other.bitrate == _this.bitrate)&&(identical(other.bandwidth, _this.bandwidth) || other.bandwidth == _this.bandwidth)&&(identical(other.buffered, _this.buffered) || other.buffered == _this.buffered)&&(identical(other.latency, _this.latency) || other.latency == _this.latency)&&(identical(other.decodedFrames, _this.decodedFrames) || other.decodedFrames == _this.decodedFrames)&&(identical(other.droppedFrames, _this.droppedFrames) || other.droppedFrames == _this.droppedFrames)&&(identical(other.renderedFrames, _this.renderedFrames) || other.renderedFrames == _this.renderedFrames)&&(identical(other.audioBuffered, _this.audioBuffered) || other.audioBuffered == _this.audioBuffered)&&(identical(other.videoBuffered, _this.videoBuffered) || other.videoBuffered == _this.videoBuffered)&&(identical(other.decoder, _this.decoder) || other.decoder == _this.decoder)&&(identical(other.renderer, _this.renderer) || other.renderer == _this.renderer)&&(identical(other.cpuUsage, _this.cpuUsage) || other.cpuUsage == _this.cpuUsage)&&(identical(other.memoryUsage, _this.memoryUsage) || other.memoryUsage == _this.memoryUsage)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as PlayerAdapterMetrics;
  return Object.hash(runtimeType,_this.bitrate,_this.bandwidth,_this.buffered,_this.latency,_this.decodedFrames,_this.droppedFrames,_this.renderedFrames,_this.audioBuffered,_this.videoBuffered,_this.decoder,_this.renderer,_this.cpuUsage,_this.memoryUsage,_this.timestamp);
}

@override
String toString() {
  final _this = this as PlayerAdapterMetrics;
  return 'PlayerAdapterMetrics(bitrate: ${_this.bitrate}, bandwidth: ${_this.bandwidth}, buffered: ${_this.buffered}, latency: ${_this.latency}, decodedFrames: ${_this.decodedFrames}, droppedFrames: ${_this.droppedFrames}, renderedFrames: ${_this.renderedFrames}, audioBuffered: ${_this.audioBuffered}, videoBuffered: ${_this.videoBuffered}, decoder: ${_this.decoder}, renderer: ${_this.renderer}, cpuUsage: ${_this.cpuUsage}, memoryUsage: ${_this.memoryUsage}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $PlayerAdapterMetricsCopyWith<$Res>  {
  factory $PlayerAdapterMetricsCopyWith(PlayerAdapterMetrics value, $Res Function(PlayerAdapterMetrics) _then) = _$PlayerAdapterMetricsCopyWithImpl;
@useResult
$Res call({
 int? bitrate, int? bandwidth, Duration buffered, Duration? latency, int decodedFrames, int droppedFrames, int renderedFrames, Duration? audioBuffered, Duration? videoBuffered, String? decoder, String? renderer, double? cpuUsage, int? memoryUsage, DateTime? timestamp
});




}
/// @nodoc
class _$PlayerAdapterMetricsCopyWithImpl<$Res>
    implements $PlayerAdapterMetricsCopyWith<$Res> {
  _$PlayerAdapterMetricsCopyWithImpl(this._self, this._then);

  final PlayerAdapterMetrics _self;
  final $Res Function(PlayerAdapterMetrics) _then;

/// Create a copy of PlayerAdapterMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bitrate = freezed,Object? bandwidth = freezed,Object? buffered = null,Object? latency = freezed,Object? decodedFrames = null,Object? droppedFrames = null,Object? renderedFrames = null,Object? audioBuffered = freezed,Object? videoBuffered = freezed,Object? decoder = freezed,Object? renderer = freezed,Object? cpuUsage = freezed,Object? memoryUsage = freezed,Object? timestamp = freezed,}) {
  return _then(PlayerAdapterMetrics(
bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,bandwidth: freezed == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int?,buffered: null == buffered ? _self.buffered : buffered // ignore: cast_nullable_to_non_nullable
as Duration,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration?,decodedFrames: null == decodedFrames ? _self.decodedFrames : decodedFrames // ignore: cast_nullable_to_non_nullable
as int,droppedFrames: null == droppedFrames ? _self.droppedFrames : droppedFrames // ignore: cast_nullable_to_non_nullable
as int,renderedFrames: null == renderedFrames ? _self.renderedFrames : renderedFrames // ignore: cast_nullable_to_non_nullable
as int,audioBuffered: freezed == audioBuffered ? _self.audioBuffered : audioBuffered // ignore: cast_nullable_to_non_nullable
as Duration?,videoBuffered: freezed == videoBuffered ? _self.videoBuffered : videoBuffered // ignore: cast_nullable_to_non_nullable
as Duration?,decoder: freezed == decoder ? _self.decoder : decoder // ignore: cast_nullable_to_non_nullable
as String?,renderer: freezed == renderer ? _self.renderer : renderer // ignore: cast_nullable_to_non_nullable
as String?,cpuUsage: freezed == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double?,memoryUsage: freezed == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerAdapterMetrics].
extension PlayerAdapterMetricsPatterns on PlayerAdapterMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerAdapterMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerAdapterMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerAdapterMetrics value)  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerAdapterMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerAdapterMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? bitrate,  int? bandwidth,  Duration buffered,  Duration? latency,  int decodedFrames,  int droppedFrames,  int renderedFrames,  Duration? audioBuffered,  Duration? videoBuffered,  String? decoder,  String? renderer,  double? cpuUsage,  int? memoryUsage,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerAdapterMetrics() when $default != null:
return $default(_that.bitrate,_that.bandwidth,_that.buffered,_that.latency,_that.decodedFrames,_that.droppedFrames,_that.renderedFrames,_that.audioBuffered,_that.videoBuffered,_that.decoder,_that.renderer,_that.cpuUsage,_that.memoryUsage,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? bitrate,  int? bandwidth,  Duration buffered,  Duration? latency,  int decodedFrames,  int droppedFrames,  int renderedFrames,  Duration? audioBuffered,  Duration? videoBuffered,  String? decoder,  String? renderer,  double? cpuUsage,  int? memoryUsage,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterMetrics():
return $default(_that.bitrate,_that.bandwidth,_that.buffered,_that.latency,_that.decodedFrames,_that.droppedFrames,_that.renderedFrames,_that.audioBuffered,_that.videoBuffered,_that.decoder,_that.renderer,_that.cpuUsage,_that.memoryUsage,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? bitrate,  int? bandwidth,  Duration buffered,  Duration? latency,  int decodedFrames,  int droppedFrames,  int renderedFrames,  Duration? audioBuffered,  Duration? videoBuffered,  String? decoder,  String? renderer,  double? cpuUsage,  int? memoryUsage,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _PlayerAdapterMetrics() when $default != null:
return $default(_that.bitrate,_that.bandwidth,_that.buffered,_that.latency,_that.decodedFrames,_that.droppedFrames,_that.renderedFrames,_that.audioBuffered,_that.videoBuffered,_that.decoder,_that.renderer,_that.cpuUsage,_that.memoryUsage,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerAdapterMetrics implements PlayerAdapterMetrics {
  const _PlayerAdapterMetrics({this.bitrate, this.bandwidth, this.buffered = Duration.zero, this.latency, this.decodedFrames = 0, this.droppedFrames = 0, this.renderedFrames = 0, this.audioBuffered, this.videoBuffered, this.decoder, this.renderer, this.cpuUsage, this.memoryUsage, this.timestamp});
  

/// Current bitrate in bits per second.
@override final  int? bitrate;
/// Current network throughput.
@override final  int? bandwidth;
/// Buffered duration.
@override@JsonKey() final  Duration buffered;
/// Current playback latency.
@override final  Duration? latency;
/// Total decoded video frames.
@override@JsonKey() final  int decodedFrames;
/// Dropped video frames.
@override@JsonKey() final  int droppedFrames;
/// Rendered frames.
@override@JsonKey() final  int renderedFrames;
/// Audio buffer level.
@override final  Duration? audioBuffered;
/// Video buffer level.
@override final  Duration? videoBuffered;
/// Decoder name.
@override final  String? decoder;
/// Renderer name.
@override final  String? renderer;
/// Current CPU usage percentage.
@override final  double? cpuUsage;
/// Current memory usage in bytes.
@override final  int? memoryUsage;
/// Timestamp of this sample.
@override final  DateTime? timestamp;

/// Create a copy of PlayerAdapterMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerAdapterMetricsCopyWith<_PlayerAdapterMetrics> get copyWith => __$PlayerAdapterMetricsCopyWithImpl<_PlayerAdapterMetrics>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerAdapterMetrics&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.buffered, buffered) || other.buffered == buffered)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.decodedFrames, decodedFrames) || other.decodedFrames == decodedFrames)&&(identical(other.droppedFrames, droppedFrames) || other.droppedFrames == droppedFrames)&&(identical(other.renderedFrames, renderedFrames) || other.renderedFrames == renderedFrames)&&(identical(other.audioBuffered, audioBuffered) || other.audioBuffered == audioBuffered)&&(identical(other.videoBuffered, videoBuffered) || other.videoBuffered == videoBuffered)&&(identical(other.decoder, decoder) || other.decoder == decoder)&&(identical(other.renderer, renderer) || other.renderer == renderer)&&(identical(other.cpuUsage, cpuUsage) || other.cpuUsage == cpuUsage)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bitrate,bandwidth,buffered,latency,decodedFrames,droppedFrames,renderedFrames,audioBuffered,videoBuffered,decoder,renderer,cpuUsage,memoryUsage,timestamp);
}

@override
String toString() {
    return 'PlayerAdapterMetrics(bitrate: $bitrate, bandwidth: $bandwidth, buffered: $buffered, latency: $latency, decodedFrames: $decodedFrames, droppedFrames: $droppedFrames, renderedFrames: $renderedFrames, audioBuffered: $audioBuffered, videoBuffered: $videoBuffered, decoder: $decoder, renderer: $renderer, cpuUsage: $cpuUsage, memoryUsage: $memoryUsage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$PlayerAdapterMetricsCopyWith<$Res> implements $PlayerAdapterMetricsCopyWith<$Res> {
  factory _$PlayerAdapterMetricsCopyWith(_PlayerAdapterMetrics value, $Res Function(_PlayerAdapterMetrics) _then) = __$PlayerAdapterMetricsCopyWithImpl;
@override @useResult
$Res call({
 int? bitrate, int? bandwidth, Duration buffered, Duration? latency, int decodedFrames, int droppedFrames, int renderedFrames, Duration? audioBuffered, Duration? videoBuffered, String? decoder, String? renderer, double? cpuUsage, int? memoryUsage, DateTime? timestamp
});




}
/// @nodoc
class __$PlayerAdapterMetricsCopyWithImpl<$Res>
    implements _$PlayerAdapterMetricsCopyWith<$Res> {
  __$PlayerAdapterMetricsCopyWithImpl(this._self, this._then);

  final _PlayerAdapterMetrics _self;
  final $Res Function(_PlayerAdapterMetrics) _then;

/// Create a copy of PlayerAdapterMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bitrate = freezed,Object? bandwidth = freezed,Object? buffered = null,Object? latency = freezed,Object? decodedFrames = null,Object? droppedFrames = null,Object? renderedFrames = null,Object? audioBuffered = freezed,Object? videoBuffered = freezed,Object? decoder = freezed,Object? renderer = freezed,Object? cpuUsage = freezed,Object? memoryUsage = freezed,Object? timestamp = freezed,}) {
  return _then(_PlayerAdapterMetrics(
bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,bandwidth: freezed == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int?,buffered: null == buffered ? _self.buffered : buffered // ignore: cast_nullable_to_non_nullable
as Duration,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration?,decodedFrames: null == decodedFrames ? _self.decodedFrames : decodedFrames // ignore: cast_nullable_to_non_nullable
as int,droppedFrames: null == droppedFrames ? _self.droppedFrames : droppedFrames // ignore: cast_nullable_to_non_nullable
as int,renderedFrames: null == renderedFrames ? _self.renderedFrames : renderedFrames // ignore: cast_nullable_to_non_nullable
as int,audioBuffered: freezed == audioBuffered ? _self.audioBuffered : audioBuffered // ignore: cast_nullable_to_non_nullable
as Duration?,videoBuffered: freezed == videoBuffered ? _self.videoBuffered : videoBuffered // ignore: cast_nullable_to_non_nullable
as Duration?,decoder: freezed == decoder ? _self.decoder : decoder // ignore: cast_nullable_to_non_nullable
as String?,renderer: freezed == renderer ? _self.renderer : renderer // ignore: cast_nullable_to_non_nullable
as String?,cpuUsage: freezed == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double?,memoryUsage: freezed == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
