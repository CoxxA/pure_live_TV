import 'package:media_core/fallback/fallback_reason.dart';
import 'package:media_core/identity/source_id.dart';
import 'package:media_core/identity/request_id.dart';
import 'package:media_core/identity/operation_id.dart';
import 'package:media_core/identity/generation_id.dart';
import 'package:equatable/equatable.dart';

/// Context associated with a fallback operation.
///
/// The context identifies why fallback was requested and which operation,
/// request, source, or renderer generation it belongs to.
///
/// Context is descriptive data only. It does not execute fallback logic.
final class FallbackContext extends Equatable {
  const FallbackContext({
    required this.reason,
    this.operationId,
    this.requestId,
    this.sourceId,
    this.generationId,
    this.message,
    this.metadata = const <String, Object?>{},
  });

  final FallbackReason reason;

  final OperationId? operationId;

  final RequestId? requestId;

  final SourceId? sourceId;

  final GenerationId? generationId;

  final String? message;

  final Map<String, Object?> metadata;

  bool get hasOperation => operationId != null;

  bool get hasRequest => requestId != null;

  bool get hasSource => sourceId != null;

  bool get hasGeneration => generationId != null;

  bool get hasMessage => message != null && message!.isNotEmpty;

  bool get hasMetadata => metadata.isNotEmpty;

  FallbackContext copyWith({
    FallbackReason? reason,
    OperationId? operationId,
    RequestId? requestId,
    SourceId? sourceId,
    GenerationId? generationId,
    String? message,
    Map<String, Object?>? metadata,
  }) {
    return FallbackContext(
      reason: reason ?? this.reason,
      operationId: operationId ?? this.operationId,
      requestId: requestId ?? this.requestId,
      sourceId: sourceId ?? this.sourceId,
      generationId: generationId ?? this.generationId,
      message: message ?? this.message,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reason': reason.toString(),
      'operationId': operationId?.toString(),
      'requestId': requestId?.toString(),
      'sourceId': sourceId?.toString(),
      'generationId': generationId?.toString(),
      'message': message,
      'metadata': Map<String, dynamic>.from(metadata),
    };
  }

  @override
  List<Object?> get props => <Object?>[reason, operationId, requestId, sourceId, generationId, message, metadata];

  @override
  String toString() {
    return 'FallbackContext('
        'reason: $reason, '
        'operationId: $operationId, '
        'requestId: $requestId, '
        'sourceId: $sourceId, '
        'generationId: $generationId, '
        'message: $message, '
        'metadata: $metadata'
        ')';
  }
}
