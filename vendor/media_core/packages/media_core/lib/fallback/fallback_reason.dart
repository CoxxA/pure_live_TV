import 'package:equatable/equatable.dart';

/// Reason that caused a fallback operation.
///
/// A fallback reason is descriptive metadata. It does not decide which
/// fallback strategy should be used.
sealed class FallbackReason extends Equatable {
  const FallbackReason();

  const factory FallbackReason.unknown() = FallbackReasonUnknown;
  const factory FallbackReason.backend() = FallbackReasonBackend;
  const factory FallbackReason.line() = FallbackReasonLine;
  const factory FallbackReason.quality() = FallbackReasonQuality;
  const factory FallbackReason.network() = FallbackReasonNetwork;
  const factory FallbackReason.decoder() = FallbackReasonDecoder;
  const factory FallbackReason.renderer() = FallbackReasonRenderer;
  const factory FallbackReason.timeout() = FallbackReasonTimeout;

  bool get isUnknown => this is FallbackReasonUnknown;

  bool get isBackend => this is FallbackReasonBackend;

  bool get isLine => this is FallbackReasonLine;

  bool get isQuality => this is FallbackReasonQuality;

  bool get isNetwork => this is FallbackReasonNetwork;

  bool get isDecoder => this is FallbackReasonDecoder;

  bool get isRenderer => this is FallbackReasonRenderer;

  bool get isTimeout => this is FallbackReasonTimeout;

  @override
  List<Object?> get props => <Object?>[];
}

/// Unknown fallback reason.
final class FallbackReasonUnknown extends FallbackReason {
  const FallbackReasonUnknown();

  @override
  String toString() => 'unknown';
}

/// Backend fallback.
final class FallbackReasonBackend extends FallbackReason {
  const FallbackReasonBackend();

  @override
  String toString() => 'backend';
}

/// Line fallback.
final class FallbackReasonLine extends FallbackReason {
  const FallbackReasonLine();

  @override
  String toString() => 'line';
}

/// Quality fallback.
final class FallbackReasonQuality extends FallbackReason {
  const FallbackReasonQuality();

  @override
  String toString() => 'quality';
}

/// Network fallback.
final class FallbackReasonNetwork extends FallbackReason {
  const FallbackReasonNetwork();

  @override
  String toString() => 'network';
}

/// Decoder fallback.
final class FallbackReasonDecoder extends FallbackReason {
  const FallbackReasonDecoder();

  @override
  String toString() => 'decoder';
}

/// Renderer fallback.
final class FallbackReasonRenderer extends FallbackReason {
  const FallbackReasonRenderer();

  @override
  String toString() => 'renderer';
}

/// Timeout fallback.
final class FallbackReasonTimeout extends FallbackReason {
  const FallbackReasonTimeout();

  @override
  String toString() => 'timeout';
}
