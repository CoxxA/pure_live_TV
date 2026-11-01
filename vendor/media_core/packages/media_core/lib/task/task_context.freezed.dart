// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskContext {

/// Optional task metadata.
///
/// Values should be JSON-compatible when this context is serialized.
 Map<String, Object?> get metadata;/// Human-readable description of the task.
 String? get description;/// Optional human-readable or domain-specific source description.
 String? get source;/// Optional reason for creating or scheduling the task.
 String? get reason;/// Identifier of the request that created the task.
///
/// Multiple tasks may belong to the same request.
@RequestIdJsonConverter() RequestId? get requestId;/// Identifier of the current player/task generation.
///
/// This is used to detect stale asynchronous operations.
@GenerationIdJsonConverter() GenerationId? get generationId;/// Stable identifier of the media source associated with the task.
@SourceIdJsonConverter() SourceId? get sourceId;/// Identifier of the playback line associated with the task.
 String? get lineId;/// Requested quality associated with the task.
 String? get quality;/// Number of retries already performed.
 int get retryCount;/// Maximum number of retries allowed.
///
/// A `null` value means unlimited retries.
 int? get maxRetries;
/// Create a copy of TaskContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskContextCopyWith<TaskContext> get copyWith => _$TaskContextCopyWithImpl<TaskContext>(this as TaskContext, _$identity);

  /// Serializes this TaskContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskContext&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.generationId, _this.generationId) || other.generationId == _this.generationId)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.lineId, _this.lineId) || other.lineId == _this.lineId)&&(identical(other.quality, _this.quality) || other.quality == _this.quality)&&(identical(other.retryCount, _this.retryCount) || other.retryCount == _this.retryCount)&&(identical(other.maxRetries, _this.maxRetries) || other.maxRetries == _this.maxRetries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskContext;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.metadata),_this.description,_this.source,_this.reason,_this.requestId,_this.generationId,_this.sourceId,_this.lineId,_this.quality,_this.retryCount,_this.maxRetries);
}

@override
String toString() {
  final _this = this as TaskContext;
  return 'TaskContext(metadata: ${_this.metadata}, description: ${_this.description}, source: ${_this.source}, reason: ${_this.reason}, requestId: ${_this.requestId}, generationId: ${_this.generationId}, sourceId: ${_this.sourceId}, lineId: ${_this.lineId}, quality: ${_this.quality}, retryCount: ${_this.retryCount}, maxRetries: ${_this.maxRetries})';
}


}

/// @nodoc
abstract mixin class $TaskContextCopyWith<$Res>  {
  factory $TaskContextCopyWith(TaskContext value, $Res Function(TaskContext) _then) = _$TaskContextCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> metadata, String? description, String? source, String? reason,@RequestIdJsonConverter() RequestId? requestId,@GenerationIdJsonConverter() GenerationId? generationId,@SourceIdJsonConverter() SourceId? sourceId, String? lineId, String? quality, int retryCount, int? maxRetries
});




}
/// @nodoc
class _$TaskContextCopyWithImpl<$Res>
    implements $TaskContextCopyWith<$Res> {
  _$TaskContextCopyWithImpl(this._self, this._then);

  final TaskContext _self;
  final $Res Function(TaskContext) _then;

/// Create a copy of TaskContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? description = freezed,Object? source = freezed,Object? reason = freezed,Object? requestId = freezed,Object? generationId = freezed,Object? sourceId = freezed,Object? lineId = freezed,Object? quality = freezed,Object? retryCount = null,Object? maxRetries = freezed,}) {
  return _then(TaskContext(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as RequestId?,generationId: freezed == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,lineId: freezed == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String?,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,maxRetries: freezed == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskContext].
extension TaskContextPatterns on TaskContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskContext value)  $default,){
final _that = this;
switch (_that) {
case _TaskContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskContext value)?  $default,){
final _that = this;
switch (_that) {
case _TaskContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Object?> metadata,  String? description,  String? source,  String? reason, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId, @SourceIdJsonConverter()  SourceId? sourceId,  String? lineId,  String? quality,  int retryCount,  int? maxRetries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskContext() when $default != null:
return $default(_that.metadata,_that.description,_that.source,_that.reason,_that.requestId,_that.generationId,_that.sourceId,_that.lineId,_that.quality,_that.retryCount,_that.maxRetries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Object?> metadata,  String? description,  String? source,  String? reason, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId, @SourceIdJsonConverter()  SourceId? sourceId,  String? lineId,  String? quality,  int retryCount,  int? maxRetries)  $default,) {final _that = this;
switch (_that) {
case _TaskContext():
return $default(_that.metadata,_that.description,_that.source,_that.reason,_that.requestId,_that.generationId,_that.sourceId,_that.lineId,_that.quality,_that.retryCount,_that.maxRetries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Object?> metadata,  String? description,  String? source,  String? reason, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId, @SourceIdJsonConverter()  SourceId? sourceId,  String? lineId,  String? quality,  int retryCount,  int? maxRetries)?  $default,) {final _that = this;
switch (_that) {
case _TaskContext() when $default != null:
return $default(_that.metadata,_that.description,_that.source,_that.reason,_that.requestId,_that.generationId,_that.sourceId,_that.lineId,_that.quality,_that.retryCount,_that.maxRetries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskContext extends TaskContext {
  const _TaskContext({ Map<String, Object?> metadata = const <String, Object?>{}, this.description, this.source, this.reason, @RequestIdJsonConverter() this.requestId, @GenerationIdJsonConverter() this.generationId, @SourceIdJsonConverter() this.sourceId, this.lineId, this.quality, this.retryCount = 0, this.maxRetries}): _metadata = metadata,super._();
  factory _TaskContext.fromJson(Map<String, dynamic> json) => _$TaskContextFromJson(json);

/// Optional task metadata.
///
/// Values should be JSON-compatible when this context is serialized.
 final  Map<String, Object?> _metadata;
/// Optional task metadata.
///
/// Values should be JSON-compatible when this context is serialized.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

/// Human-readable description of the task.
@override final  String? description;
/// Optional human-readable or domain-specific source description.
@override final  String? source;
/// Optional reason for creating or scheduling the task.
@override final  String? reason;
/// Identifier of the request that created the task.
///
/// Multiple tasks may belong to the same request.
@override@RequestIdJsonConverter() final  RequestId? requestId;
/// Identifier of the current player/task generation.
///
/// This is used to detect stale asynchronous operations.
@override@GenerationIdJsonConverter() final  GenerationId? generationId;
/// Stable identifier of the media source associated with the task.
@override@SourceIdJsonConverter() final  SourceId? sourceId;
/// Identifier of the playback line associated with the task.
@override final  String? lineId;
/// Requested quality associated with the task.
@override final  String? quality;
/// Number of retries already performed.
@override@JsonKey() final  int retryCount;
/// Maximum number of retries allowed.
///
/// A `null` value means unlimited retries.
@override final  int? maxRetries;

/// Create a copy of TaskContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskContextCopyWith<_TaskContext> get copyWith => __$TaskContextCopyWithImpl<_TaskContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskContextToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskContext&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.generationId, generationId) || other.generationId == generationId)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount)&&(identical(other.maxRetries, maxRetries) || other.maxRetries == maxRetries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_metadata),description,source,reason,requestId,generationId,sourceId,lineId,quality,retryCount,maxRetries);
}

@override
String toString() {
    return 'TaskContext(metadata: $metadata, description: $description, source: $source, reason: $reason, requestId: $requestId, generationId: $generationId, sourceId: $sourceId, lineId: $lineId, quality: $quality, retryCount: $retryCount, maxRetries: $maxRetries)';
}


}

/// @nodoc
abstract mixin class _$TaskContextCopyWith<$Res> implements $TaskContextCopyWith<$Res> {
  factory _$TaskContextCopyWith(_TaskContext value, $Res Function(_TaskContext) _then) = __$TaskContextCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Object?> metadata, String? description, String? source, String? reason,@RequestIdJsonConverter() RequestId? requestId,@GenerationIdJsonConverter() GenerationId? generationId,@SourceIdJsonConverter() SourceId? sourceId, String? lineId, String? quality, int retryCount, int? maxRetries
});




}
/// @nodoc
class __$TaskContextCopyWithImpl<$Res>
    implements _$TaskContextCopyWith<$Res> {
  __$TaskContextCopyWithImpl(this._self, this._then);

  final _TaskContext _self;
  final $Res Function(_TaskContext) _then;

/// Create a copy of TaskContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? description = freezed,Object? source = freezed,Object? reason = freezed,Object? requestId = freezed,Object? generationId = freezed,Object? sourceId = freezed,Object? lineId = freezed,Object? quality = freezed,Object? retryCount = null,Object? maxRetries = freezed,}) {
  return _then(_TaskContext(
metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as RequestId?,generationId: freezed == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,lineId: freezed == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String?,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,maxRetries: freezed == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
