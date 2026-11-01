import 'package:media_core/task/task_id.dart';
import 'package:media_core/task/task_type.dart';
import 'package:media_core/task/task_state.dart';
import 'package:media_core/task/task_priority.dart';
import 'package:media_core/operation/operation_context.dart';
import 'package:json_annotation/json_annotation.dart';

class TaskIdJsonConverter extends JsonConverter<TaskId, String> {
  const TaskIdJsonConverter();

  @override
  TaskId fromJson(String json) => TaskId.fromJson(json);

  @override
  String toJson(TaskId object) => object.toJson();
}

class TaskTypeJsonConverter extends JsonConverter<TaskType, String> {
  const TaskTypeJsonConverter();

  @override
  TaskType fromJson(String json) => TaskType.fromJson(json);

  @override
  String toJson(TaskType object) => object.toJson();
}

class TaskStateJsonConverter extends JsonConverter<TaskState, String> {
  const TaskStateJsonConverter();

  @override
  TaskState fromJson(String json) => TaskState.fromJson(json);

  @override
  String toJson(TaskState object) => object.toJson();
}

class TaskPriorityJsonConverter extends JsonConverter<TaskPriority, int> {
  const TaskPriorityJsonConverter();

  @override
  TaskPriority fromJson(int json) => TaskPriority.fromJson(json);

  @override
  int toJson(TaskPriority object) => object.toJson();
}

class OperationContextJsonConverter extends JsonConverter<OperationContext, Map<String, dynamic>> {
  const OperationContextJsonConverter();

  @override
  OperationContext fromJson(Map<String, dynamic> json) {
    return OperationContext.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(OperationContext object) {
    return object.toJson();
  }
}
