import 'dart:collection';
import 'package:media_core/resource/decoder_budget.dart';
import 'package:media_core/resource/resource_pressure.dart';

/// Manages decoder resource allocation.
///
/// [DecoderManager] controls decoder resource accounting
/// inside the media core resource layer.
///
/// It represents decoder capacity usage,
/// not actual decoder instances.
///
/// Responsibilities:
///
/// - allocate decoder capacity
/// - release decoder capacity
/// - track active decoder owners
/// - track hardware decoder usage
/// - evaluate decoder pressure
/// - enforce decoder budget
///
/// It does not:
///
/// - create decoder instances
/// - initialize codecs
/// - open media sources
/// - control playback
/// - configure hardware acceleration
///
/// Those responsibilities belong to:
///
/// - PlayerEngine
/// - DecoderFactory
/// - Platform media backend
///
/// Decoder flow:
///
/// ```text
///
/// Player
///   |
///   v
/// DecoderManager.acquire()
///   |
///   v
/// DecoderBudget validation
///   |
///   v
/// Decoder allocation record
///
/// ```
final class DecoderManager {
  /// Creates decoder manager.
  DecoderManager({required this.budget});

  /// Decoder resource budget.
  final DecoderBudget budget;

  /// Allocated decoder owners.
  final Set<String> _decoders = <String>{};

  /// Hardware decoder owners.
  final Set<String> _hardwareDecoders = <String>{};

  /// Total allocated decoder count.
  int get decoderCount {
    return _decoders.length;
  }

  /// Allocated hardware decoder count.
  int get hardwareDecoderCount {
    return _hardwareDecoders.length;
  }

  /// Whether decoder capacity exists.
  bool get canAllocate {
    if (!budget.enabled) {
      return true;
    }

    return budget.canAllocateDecoder(decoderCount);
  }

  /// Whether hardware decoder capacity exists.
  bool get canAllocateHardware {
    if (!budget.enabled) {
      return true;
    }

    return budget.canAllocateHardwareDecoder(hardwareDecoderCount);
  }

  /// Current decoder resource pressure.
  ///
  /// Converts decoder usage into
  /// resource pressure level.
  ResourcePressure get pressure {
    if (!budget.enabled) {
      return ResourcePressure.none;
    }

    if (!canAllocate) {
      return ResourcePressure.critical;
    }

    if (!canAllocateHardware) {
      return ResourcePressure.warning;
    }

    return ResourcePressure.none;
  }

  /// Whether decoder pressure exists.
  bool get hasPressure {
    return pressure != ResourcePressure.none;
  }

  /// Allocates decoder capacity.
  ///
  /// Returns true when allocation succeeds.
  ///
  /// This only reserves capacity.
  /// It does not create a decoder.
  bool acquire(String id, {bool hardware = true}) {
    if (_decoders.contains(id)) {
      return true;
    }

    if (!budget.canAllocateDecoder(decoderCount)) {
      return false;
    }

    if (hardware) {
      if (budget.canAllocateHardwareDecoder(hardwareDecoderCount)) {
        _hardwareDecoders.add(id);
      } else {
        if (!budget.allowSoftwareFallback) {
          return false;
        }
      }
    }

    _decoders.add(id);

    return true;
  }

  /// Releases decoder capacity.
  ///
  /// Returns true when the owner existed.
  bool release(String id) {
    final removed = _decoders.remove(id);

    _hardwareDecoders.remove(id);

    return removed;
  }

  /// Releases all decoder allocations.
  ///
  /// This only clears accounting.
  ///
  /// It does not destroy codecs.
  void clear() {
    _decoders.clear();

    _hardwareDecoders.clear();
  }

  /// Checks whether owner has decoder.
  bool contains(String id) {
    return _decoders.contains(id);
  }

  /// Returns decoder owners.
  ///
  /// The collection is read-only.
  UnmodifiableSetView<String> get owners {
    return UnmodifiableSetView(_decoders);
  }

  /// Creates decoder usage snapshot.
  DecoderUsageSnapshot snapshot() {
    return DecoderUsageSnapshot(decoderCount: decoderCount, hardwareDecoderCount: hardwareDecoderCount);
  }

  @override
  String toString() {
    return 'DecoderManager('
        'decoder=$decoderCount, '
        'hardware=$hardwareDecoderCount, '
        'pressure=$pressure'
        ')';
  }
}

/// Immutable decoder usage snapshot.
///
/// This object represents decoder
/// allocation information.
///
/// It does not manage resources.
final class DecoderUsageSnapshot {
  /// Creates decoder snapshot.
  const DecoderUsageSnapshot({required this.decoderCount, required this.hardwareDecoderCount});

  /// Total decoder count.
  final int decoderCount;

  /// Hardware decoder count.
  final int hardwareDecoderCount;

  /// Whether any decoder exists.
  bool get hasDecoder {
    return decoderCount > 0;
  }

  /// Whether hardware decoder exists.
  bool get hasHardwareDecoder {
    return hardwareDecoderCount > 0;
  }

  @override
  String toString() {
    return 'DecoderUsageSnapshot('
        'decoder=$decoderCount, '
        'hardware=$hardwareDecoderCount'
        ')';
  }
}
