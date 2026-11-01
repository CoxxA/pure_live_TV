import 'package:media_core/fallback/fallback_reason.dart';
import 'package:equatable/equatable.dart';

/// Result of a fallback operation.
///
/// A successful result contains the target that should be used.
///
/// A failed result may contain a diagnostic message but does not contain a
/// target.
final class FallbackResult extends Equatable {
  const FallbackResult._({required this.successful, required this.reason, required this.target, required this.message});

  const FallbackResult.success({required FallbackReason reason, required String target})
    : this._(successful: true, reason: reason, target: target, message: null);

  const FallbackResult.failure({required FallbackReason reason, String? message})
    : this._(successful: false, reason: reason, target: null, message: message);

  final bool successful;

  final FallbackReason reason;

  final String? target;

  final String? message;

  bool get failed => !successful;

  bool get hasTarget => target != null && target!.isNotEmpty;

  bool get hasMessage => message != null && message!.isNotEmpty;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'successful': successful,
      'reason': reason.toString(),
      'target': target,
      'message': message,
    };
  }

  @override
  List<Object?> get props => <Object?>[successful, reason, target, message];

  @override
  String toString() {
    return 'FallbackResult('
        'successful: $successful, '
        'reason: $reason, '
        'target: $target, '
        'message: $message'
        ')';
  }
}
