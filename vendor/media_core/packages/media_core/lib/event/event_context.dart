import 'package:clock/clock.dart';
import 'package:media_core/identity/slot_id.dart';
import 'package:media_core/identity/player_id.dart';
import 'package:media_core/identity/source_id.dart';
import 'package:media_core/identity/request_id.dart';
import 'package:media_core/identity/session_id.dart';
import 'package:media_core/identity/operation_id.dart';
import 'package:media_core/identity/generation_id.dart';
import 'package:equatable/equatable.dart';


/// Context associated with a player event.
///
/// Context carries correlation information without forcing every event to
/// define the same set of fields.
///
/// Event context is metadata; it does not contain event-specific payload.
final class EventContext extends Equatable {
  EventContext({
    this.playerId,
    this.sessionId,
    this.slotId,
    this.sourceId,
    this.operationId,
    this.requestId,
    this.generationId,
    this.metadata = const <String, Object?>{},
    DateTime? timestamp,
  }) : timestamp = timestamp ?? clock.now();

  final PlayerId? playerId;

  final SessionId? sessionId;

  final SlotId? slotId;

  final SourceId? sourceId;

  final OperationId? operationId;

  final RequestId? requestId;

  final GenerationId? generationId;

  final Map<String, Object?> metadata;

  final DateTime timestamp;

  bool get hasPlayer => playerId != null;

  bool get hasSession => sessionId != null;

  bool get hasSlot => slotId != null;

  bool get hasSource => sourceId != null;

  bool get hasOperation => operationId != null;

  bool get hasRequest => requestId != null;

  bool get hasGeneration => generationId != null;

  bool get hasMetadata => metadata.isNotEmpty;

  EventContext copyWith({
    PlayerId? playerId,
    SessionId? sessionId,
    SlotId? slotId,
    SourceId? sourceId,
    OperationId? operationId,
    RequestId? requestId,
    GenerationId? generationId,
    Map<String, Object?>? metadata,
    DateTime? timestamp,
  }) {
    return EventContext(
      playerId: playerId ?? this.playerId,
      sessionId: sessionId ?? this.sessionId,
      slotId: slotId ?? this.slotId,
      sourceId: sourceId ?? this.sourceId,
      operationId: operationId ?? this.operationId,
      requestId: requestId ?? this.requestId,
      generationId: generationId ?? this.generationId,
      metadata: metadata ?? this.metadata,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playerId': playerId?.toString(),
      'sessionId': sessionId?.toString(),
      'slotId': slotId?.toString(),
      'sourceId': sourceId?.toString(),
      'operationId': operationId?.toString(),
      'requestId': requestId?.toString(),
      'generationId': generationId?.toString(),
      'metadata': metadata,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => <Object?>[
    playerId,
    sessionId,
    slotId,
    sourceId,
    operationId,
    requestId,
    generationId,
    metadata,
    timestamp,
  ];

  @override
  String toString() {
    return 'EventContext('
        'playerId: $playerId, '
        'sessionId: $sessionId, '
        'slotId: $slotId, '
        'sourceId: $sourceId, '
        'operationId: $operationId, '
        'requestId: $requestId, '
        'generationId: $generationId, '
        'timestamp: $timestamp'
        ')';
  }
}
