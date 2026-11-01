import 'package:media_core/identity/slot_id.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/source_id.dart';
import 'package:media_core/identity/request_id.dart';
import 'package:media_core/identity/session_id.dart';
import 'package:media_core/identity/operation_id.dart';
import 'package:media_core/identity/generation_id.dart';
import 'package:json_annotation/json_annotation.dart';

class PlayerIdJsonConverter extends JsonConverter<PlayerId, String> {
  const PlayerIdJsonConverter();

  @override
  PlayerId fromJson(String json) => PlayerId.fromJson(json);

  @override
  String toJson(PlayerId object) => object.toJson();
}

class SessionIdJsonConverter extends JsonConverter<SessionId, String> {
  const SessionIdJsonConverter();

  @override
  SessionId fromJson(String json) => SessionId.fromJson(json);

  @override
  String toJson(SessionId object) => object.toJson();
}

class SlotIdJsonConverter extends JsonConverter<SlotId, String> {
  const SlotIdJsonConverter();

  @override
  SlotId fromJson(String json) => SlotId.fromJson(json);

  @override
  String toJson(SlotId object) => object.toJson();
}

class SourceIdJsonConverter extends JsonConverter<SourceId, String> {
  const SourceIdJsonConverter();

  @override
  SourceId fromJson(String json) => SourceId.fromJson(json);

  @override
  String toJson(SourceId object) => object.toJson();
}

class OperationIdJsonConverter extends JsonConverter<OperationId, String> {
  const OperationIdJsonConverter();

  @override
  OperationId fromJson(String json) => OperationId.fromJson(json);

  @override
  String toJson(OperationId object) => object.toJson();
}

class RequestIdJsonConverter extends JsonConverter<RequestId, String> {
  const RequestIdJsonConverter();

  @override
  RequestId fromJson(String json) => RequestId.fromJson(json);

  @override
  String toJson(RequestId object) => object.toJson();
}

class GenerationIdJsonConverter extends JsonConverter<GenerationId, String> {
  const GenerationIdJsonConverter();

  @override
  GenerationId fromJson(String json) => GenerationId.fromJson(json);

  @override
  String toJson(GenerationId object) => object.toJson();
}
