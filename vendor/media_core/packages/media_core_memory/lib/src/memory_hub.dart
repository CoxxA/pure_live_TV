import 'dart:async';

import 'package:media_core_memory/src/memory_account.dart';
import 'package:media_core_memory/src/memory_budget.dart';
import 'package:media_core_memory/src/memory_module.dart';
import 'package:media_core_memory/src/memory_monitor.dart';
import 'package:media_core_memory/src/memory_pressure.dart';
import 'package:media_core_memory/src/memory_registry.dart';
import 'package:media_core_memory/src/memory_report.dart';

/// The framework-wide memory entry point.
///
/// ## Why a global hub and not an injected registry
///
/// Same trade as logging, for the same reason: memory is reported from every
/// layer (the kernel that opens players, the pool that keeps them warm, the
/// queue that buffers a download), and threading a registry through every
/// constructor would touch every public signature in the framework. What the
/// hub buys is a single answer to a cross-module question — "who is using the
/// memory?" — which per-instance registries cannot answer anyway.
///
/// A host that wants isolation builds its own [MemoryRegistry] and passes it
/// where it matters; the hub is a default, not a requirement.
///
/// ## Using it
///
/// A module takes an account once and reports when it holds something:
///
/// ```dart
/// final _memory = MediaCoreMemory.of(MemoryModule.pool);
///
/// // on acquire
/// _memory.add(items: 1, bytes: MemoryEstimates.videoStream(height), note: 'warm player');
///
/// // on release
/// _memory.remove(items: 1, bytes: MemoryEstimates.videoStream(height));
/// ```
///
/// And consults pressure before optional work:
///
/// ```dart
/// if (MediaCoreMemory.pressure.shouldStopPreload) return;
/// ```
///
/// A diagnostics screen or a bug report reads the whole picture:
///
/// ```dart
/// MediaCoreMemory.attachDeviceProvider(myPlatformMemoryReader);
/// print(MediaCoreMemory.report().describe());
/// ```
abstract final class MediaCoreMemory {
  MediaCoreMemory._();

  static MemoryRegistry _registry = MemoryRegistry();
  static MemoryMonitor _monitor = MemoryMonitor();

  /// The default budget.
  ///
  /// 512 MiB of *tracked* memory, warning at 70% and critical at 85%. Tracked
  /// means what modules report, which is the framework's own footprint and not
  /// the process total.
  static const MemoryBudget defaultBudget = MemoryBudget();

  /// The registry every module reports into.
  static MemoryRegistry get registry => _registry;

  /// The device memory monitor.
  static MemoryMonitor get monitor => _monitor;

  /// The ledger of [module], created on first use.
  static MemoryAccount of(MemoryModule module, {int? limitBytes}) =>
      _registry.accountFor(module, limitBytes: limitBytes);

  /// The ledger of [module] if it exists.
  static MemoryAccount? account(MemoryModule module) => _registry.account(module);

  /// Current global pressure.
  static MemoryPressure get pressure => _registry.pressure;

  /// Tracked total across every module.
  static int get totalBytes => _registry.totalBytes;

  /// Remaining tracked budget.
  static int get remainingBytes => _registry.remainingBytes;

  /// Whether [bytes] fits in the remaining budget.
  static bool canAllocate(int bytes) => _registry.canAllocate(bytes);

  /// The budget in force.
  static MemoryBudget get budget => _registry.budget;

  /// Replaces the budget.
  static set budget(MemoryBudget value) => _registry.budget = value;

  /// Builds a report, attaching the latest device measurement.
  static MemoryReport report() => _registry.report(device: _monitor.snapshot);

  /// Reports as they are built.
  static Stream<MemoryReport> get onReport => _registry.onReport;

  /// Installs a platform device-memory provider.
  ///
  /// The framework ships no platform reader on purpose: the dependency (and the
  /// permission) belongs to the host. Until one is installed, reports carry the
  /// declared breakdown and no device line.
  static void attachDeviceProvider(MemorySnapshotProvider provider) => _monitor.setProvider(provider);

  /// Takes a device measurement and publishes a report carrying it.
  static MemoryReport? sampleDevice() {
    _monitor.sample();
    if (!_monitor.hasProvider) {
      return null;
    }
    return report();
  }

  /// Forgets one module's ledger.
  static void remove(MemoryModule module) => _registry.remove(module);

  /// Empties every ledger, keeping peaks.
  static void clear() => _registry.clear();

  /// Restores the default registry, monitor and budget.
  ///
  /// Disposes what it replaces, so a host that calls this repeatedly does not
  /// leak the previous monitor's stream.
  static Future<void> reset() async {
    await _registry.dispose();
    await _monitor.dispose();
    _registry = MemoryRegistry();
    _monitor = MemoryMonitor();
  }
}
