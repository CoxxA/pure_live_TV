// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerTask {

/// Unique task identity.
@TaskIdJsonConverter() TaskId get id;/// Type of work represented by this task.
@TaskTypeJsonConverter() TaskType get type;/// Current lifecycle state.
@TaskStateJsonConverter() TaskState get state;/// Scheduling priority.
@TaskPriorityJsonConverter() TaskPriority get priority;/// Task-specific execution context.
 TaskContext? get context;/// Operation context associated with this task.
///
/// The task may carry operation-level identity, but it does not own
/// operation lifecycle management.
@OperationContextJsonConverter() OperationContext? get operationContext;/// Player associated with this task.
@PlayerIdJsonConverter() PlayerId? get playerId;/// Request associated with this task.
@RequestIdJsonConverter() RequestId? get requestId;/// Generation associated with this task.
///
/// Generation identity is used to prevent stale work from affecting a
/// newer playback generation.
@GenerationIdJsonConverter() GenerationId? get generationId;/// Time at which the task was created.
 DateTime? get createdAt;/// Time at which the task entered the queue.
 DateTime? get queuedAt;/// Time at which execution started.
 DateTime? get startedAt;/// Time at which the task reached a terminal state.
 DateTime? get completedAt;/// Failure associated with the task, when available.
 Object? get error;/// Result produced by the task, when available.
 Object? get result;
/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerTaskCopyWith<PlayerTask> get copyWith => _$PlayerTaskCopyWithImpl<PlayerTask>(this as PlayerTask, _$identity);

  /// Serializes this PlayerTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerTask;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerTask&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.context, _this.context) || other.context == _this.context)&&(identical(other.operationContext, _this.operationContext) || other.operationContext == _this.operationContext)&&(identical(other.playerId, _this.playerId) || other.playerId == _this.playerId)&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.generationId, _this.generationId) || other.generationId == _this.generationId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.queuedAt, _this.queuedAt) || other.queuedAt == _this.queuedAt)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&const DeepCollectionEquality().equals(other.error, _this.error)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerTask;
  return Object.hash(runtimeType,_this.id,_this.type,_this.state,_this.priority,_this.context,_this.operationContext,_this.playerId,_this.requestId,_this.generationId,_this.createdAt,_this.queuedAt,_this.startedAt,_this.completedAt,const DeepCollectionEquality().hash(_this.error),const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as PlayerTask;
  return 'PlayerTask(id: ${_this.id}, type: ${_this.type}, state: ${_this.state}, priority: ${_this.priority}, context: ${_this.context}, operationContext: ${_this.operationContext}, playerId: ${_this.playerId}, requestId: ${_this.requestId}, generationId: ${_this.generationId}, createdAt: ${_this.createdAt}, queuedAt: ${_this.queuedAt}, startedAt: ${_this.startedAt}, completedAt: ${_this.completedAt}, error: ${_this.error}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $PlayerTaskCopyWith<$Res>  {
  factory $PlayerTaskCopyWith(PlayerTask value, $Res Function(PlayerTask) _then) = _$PlayerTaskCopyWithImpl;
@useResult
$Res call({
@TaskIdJsonConverter() TaskId id,@TaskTypeJsonConverter() TaskType type,@TaskStateJsonConverter() TaskState state,@TaskPriorityJsonConverter() TaskPriority priority, TaskContext? context,@OperationContextJsonConverter() OperationContext? operationContext,@PlayerIdJsonConverter() PlayerId? playerId,@RequestIdJsonConverter() RequestId? requestId,@GenerationIdJsonConverter() GenerationId? generationId, DateTime? createdAt, DateTime? queuedAt, DateTime? startedAt, DateTime? completedAt, Object? error, Object? result
});


$TaskContextCopyWith<$Res>? get context;

}
/// @nodoc
class _$PlayerTaskCopyWithImpl<$Res>
    implements $PlayerTaskCopyWith<$Res> {
  _$PlayerTaskCopyWithImpl(this._self, this._then);

  final PlayerTask _self;
  final $Res Function(PlayerTask) _then;

/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? state = null,Object? priority = null,Object? context = freezed,Object? operationContext = freezed,Object? playerId = freezed,Object? requestId = freezed,Object? generationId = freezed,Object? createdAt = freezed,Object? queuedAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? error = freezed,Object? result = freezed,}) {
  return _then(PlayerTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TaskState,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as TaskContext?,operationContext: freezed == operationContext ? _self.operationContext : operationContext // ignore: cast_nullable_to_non_nullable
as OperationContext?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as RequestId?,generationId: freezed == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,queuedAt: freezed == queuedAt ? _self.queuedAt : queuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,error: freezed == error ? _self.error : error ,result: freezed == result ? _self.result : result ,
  ));
}
/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $TaskContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerTask].
extension PlayerTaskPatterns on PlayerTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerTask value)  $default,){
final _that = this;
switch (_that) {
case _PlayerTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerTask value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@TaskIdJsonConverter()  TaskId id, @TaskTypeJsonConverter()  TaskType type, @TaskStateJsonConverter()  TaskState state, @TaskPriorityJsonConverter()  TaskPriority priority,  TaskContext? context, @OperationContextJsonConverter()  OperationContext? operationContext, @PlayerIdJsonConverter()  PlayerId? playerId, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId,  DateTime? createdAt,  DateTime? queuedAt,  DateTime? startedAt,  DateTime? completedAt,  Object? error,  Object? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerTask() when $default != null:
return $default(_that.id,_that.type,_that.state,_that.priority,_that.context,_that.operationContext,_that.playerId,_that.requestId,_that.generationId,_that.createdAt,_that.queuedAt,_that.startedAt,_that.completedAt,_that.error,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@TaskIdJsonConverter()  TaskId id, @TaskTypeJsonConverter()  TaskType type, @TaskStateJsonConverter()  TaskState state, @TaskPriorityJsonConverter()  TaskPriority priority,  TaskContext? context, @OperationContextJsonConverter()  OperationContext? operationContext, @PlayerIdJsonConverter()  PlayerId? playerId, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId,  DateTime? createdAt,  DateTime? queuedAt,  DateTime? startedAt,  DateTime? completedAt,  Object? error,  Object? result)  $default,) {final _that = this;
switch (_that) {
case _PlayerTask():
return $default(_that.id,_that.type,_that.state,_that.priority,_that.context,_that.operationContext,_that.playerId,_that.requestId,_that.generationId,_that.createdAt,_that.queuedAt,_that.startedAt,_that.completedAt,_that.error,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@TaskIdJsonConverter()  TaskId id, @TaskTypeJsonConverter()  TaskType type, @TaskStateJsonConverter()  TaskState state, @TaskPriorityJsonConverter()  TaskPriority priority,  TaskContext? context, @OperationContextJsonConverter()  OperationContext? operationContext, @PlayerIdJsonConverter()  PlayerId? playerId, @RequestIdJsonConverter()  RequestId? requestId, @GenerationIdJsonConverter()  GenerationId? generationId,  DateTime? createdAt,  DateTime? queuedAt,  DateTime? startedAt,  DateTime? completedAt,  Object? error,  Object? result)?  $default,) {final _that = this;
switch (_that) {
case _PlayerTask() when $default != null:
return $default(_that.id,_that.type,_that.state,_that.priority,_that.context,_that.operationContext,_that.playerId,_that.requestId,_that.generationId,_that.createdAt,_that.queuedAt,_that.startedAt,_that.completedAt,_that.error,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerTask extends PlayerTask {
  const _PlayerTask({@TaskIdJsonConverter() required this.id, @TaskTypeJsonConverter() required this.type, @TaskStateJsonConverter() this.state = TaskState.created, @TaskPriorityJsonConverter() this.priority = TaskPriority.normal, this.context, @OperationContextJsonConverter() this.operationContext, @PlayerIdJsonConverter() this.playerId, @RequestIdJsonConverter() this.requestId, @GenerationIdJsonConverter() this.generationId, this.createdAt, this.queuedAt, this.startedAt, this.completedAt, this.error, this.result}): super._();
  factory _PlayerTask.fromJson(Map<String, dynamic> json) => _$PlayerTaskFromJson(json);

/// Unique task identity.
@override@TaskIdJsonConverter() final  TaskId id;
/// Type of work represented by this task.
@override@TaskTypeJsonConverter() final  TaskType type;
/// Current lifecycle state.
@override@JsonKey()@TaskStateJsonConverter() final  TaskState state;
/// Scheduling priority.
@override@JsonKey()@TaskPriorityJsonConverter() final  TaskPriority priority;
/// Task-specific execution context.
@override final  TaskContext? context;
/// Operation context associated with this task.
///
/// The task may carry operation-level identity, but it does not own
/// operation lifecycle management.
@override@OperationContextJsonConverter() final  OperationContext? operationContext;
/// Player associated with this task.
@override@PlayerIdJsonConverter() final  PlayerId? playerId;
/// Request associated with this task.
@override@RequestIdJsonConverter() final  RequestId? requestId;
/// Generation associated with this task.
///
/// Generation identity is used to prevent stale work from affecting a
/// newer playback generation.
@override@GenerationIdJsonConverter() final  GenerationId? generationId;
/// Time at which the task was created.
@override final  DateTime? createdAt;
/// Time at which the task entered the queue.
@override final  DateTime? queuedAt;
/// Time at which execution started.
@override final  DateTime? startedAt;
/// Time at which the task reached a terminal state.
@override final  DateTime? completedAt;
/// Failure associated with the task, when available.
@override final  Object? error;
/// Result produced by the task, when available.
@override final  Object? result;

/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerTaskCopyWith<_PlayerTask> get copyWith => __$PlayerTaskCopyWithImpl<_PlayerTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerTaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerTask&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.state, state) || other.state == state)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.context, context) || other.context == context)&&(identical(other.operationContext, operationContext) || other.operationContext == operationContext)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.generationId, generationId) || other.generationId == generationId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.queuedAt, queuedAt) || other.queuedAt == queuedAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.result, result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,state,priority,context,operationContext,playerId,requestId,generationId,createdAt,queuedAt,startedAt,completedAt,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(result));
}

@override
String toString() {
    return 'PlayerTask(id: $id, type: $type, state: $state, priority: $priority, context: $context, operationContext: $operationContext, playerId: $playerId, requestId: $requestId, generationId: $generationId, createdAt: $createdAt, queuedAt: $queuedAt, startedAt: $startedAt, completedAt: $completedAt, error: $error, result: $result)';
}


}

/// @nodoc
abstract mixin class _$PlayerTaskCopyWith<$Res> implements $PlayerTaskCopyWith<$Res> {
  factory _$PlayerTaskCopyWith(_PlayerTask value, $Res Function(_PlayerTask) _then) = __$PlayerTaskCopyWithImpl;
@override @useResult
$Res call({
@TaskIdJsonConverter() TaskId id,@TaskTypeJsonConverter() TaskType type,@TaskStateJsonConverter() TaskState state,@TaskPriorityJsonConverter() TaskPriority priority, TaskContext? context,@OperationContextJsonConverter() OperationContext? operationContext,@PlayerIdJsonConverter() PlayerId? playerId,@RequestIdJsonConverter() RequestId? requestId,@GenerationIdJsonConverter() GenerationId? generationId, DateTime? createdAt, DateTime? queuedAt, DateTime? startedAt, DateTime? completedAt, Object? error, Object? result
});


@override $TaskContextCopyWith<$Res>? get context;

}
/// @nodoc
class __$PlayerTaskCopyWithImpl<$Res>
    implements _$PlayerTaskCopyWith<$Res> {
  __$PlayerTaskCopyWithImpl(this._self, this._then);

  final _PlayerTask _self;
  final $Res Function(_PlayerTask) _then;

/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? state = null,Object? priority = null,Object? context = freezed,Object? operationContext = freezed,Object? playerId = freezed,Object? requestId = freezed,Object? generationId = freezed,Object? createdAt = freezed,Object? queuedAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? error = freezed,Object? result = freezed,}) {
  return _then(_PlayerTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TaskId,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TaskState,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as TaskContext?,operationContext: freezed == operationContext ? _self.operationContext : operationContext // ignore: cast_nullable_to_non_nullable
as OperationContext?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as RequestId?,generationId: freezed == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,queuedAt: freezed == queuedAt ? _self.queuedAt : queuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,error: freezed == error ? _self.error : error ,result: freezed == result ? _self.result : result ,
  ));
}

/// Create a copy of PlayerTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $TaskContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}

// dart format on
