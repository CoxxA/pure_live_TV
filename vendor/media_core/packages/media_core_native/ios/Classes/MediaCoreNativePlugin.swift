import AVKit
import CoreVideo
import Darwin
import Flutter
import Foundation
import UIKit
import VideoToolbox

/// iOS side of the capability probe.
///
/// Wire protocol (see `PlatformProbeReport` on the Dart side, which is the
/// source of truth): one method, `probe`, answered with a map of up to four
/// sections — info, capabilities, device, codecs.
///
/// The facts come from:
///
/// - `VTIsHardwareDecodeSupported` — the honest answer to "can this device
///   decode HEVC in hardware"; the A-series chips gained it at different
///   generations, and which streams a device can play follows from it;
/// - `AVPictureInPictureController.isPictureInPictureSupported()` — the platform
///   capability, not our ability to use it: entering system picture-in-picture
///   also needs a frame path, which this probe does not provide (see the
///   package README);
/// - `ProcessInfo` — memory and CPU count;
/// - `uname` — the machine identifier (`iPhone14,3`) and the OS version.
public class MediaCoreNativePlugin: NSObject, FlutterPlugin {
  /// Channel name; kept in sync with the Dart side.
  private static let channelName = "media_core_native"

  /// Background-execution channel: its own capability, its own channel.
  private static let backgroundChannelName = "media_core_native/background"

  /// Background task assertions in flight, by session.
  private var tasks: [Int: UIBackgroundTaskIdentifier] = [:]
  private var nextSessionId = 1

  /// Method the probe is requested through.
  private static let probeMethod = "probe"

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())

    let instance = MediaCoreNativePlugin()

    registrar.addMethodCallDelegate(instance, channel: channel)

    let background = FlutterMethodChannel(name: backgroundChannelName, binaryMessenger: registrar.messenger())

    background.setMethodCallHandler { [weak instance] call, result in
      instance?.handleBackground(call, result: result) ?? result(nil)
    }
  }

  // ---------------------------------------------------------------------------
  // Background execution
  // ---------------------------------------------------------------------------

  /// Asks for a background task assertion.
  ///
  /// This is what iOS gives an app that has no background mode: a bounded
  /// window (about thirty seconds, and it ends earlier under memory pressure)
  /// rather than unlimited time, which is exactly what a recording needs to
  /// survive the app *transitioning* to the background instead of being frozen
  /// mid-segment.
  ///
  /// A recording that must keep running for minutes needs the app to declare
  /// the `audio` background mode, and only the app can do that — so this
  /// method does not pretend to cover it, and the recording module documents
  /// the limit.
  private func handleBackground(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "acquire":
      let sessionId = nextSessionId

      nextSessionId += 1

      let identifier = UIApplication.shared.beginBackgroundTask(withName: "media_core background job") {
        // Expiration: the platform is about to suspend us. The writer's own
        // finalization is what protects the segments already written, and the
        // assertion cannot be extended from here.
        self.endTask(sessionId)
      }

      tasks[sessionId] = identifier

      result(sessionId)

    case "release":
      if let arguments = call.arguments as? [String: Any],
        let sessionId = arguments["id"] as? Int {
        endTask(sessionId)
      }

      result(nil)

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func endTask(_ sessionId: Int) {
    guard let identifier = tasks.removeValue(forKey: sessionId) else {
      return
    }

    UIApplication.shared.endBackgroundTask(identifier)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == Self.probeMethod else {
      result(FlutterMethodNotImplemented)

      return
    }

    result(probe())
  }

  // ---------------------------------------------------------------------------
  // The report
  // ---------------------------------------------------------------------------

  private func probe() -> [String: Any] {
    return [
      "info": info(),
      "capabilities": capabilities(),
      "device": device(),
      "codecs": codecs(),
    ]
  }

  private func info() -> [String: Any] {
    let device = UIDevice.current

    return [
      "type": "ios",
      "name": device.systemName,
      "version": device.systemVersion,
      "architecture": architecture(),
      "deviceModel": machineIdentifier(),
      "isEmulator": isSimulator(),
    ]
  }

  private func capabilities() -> [String: Any] {
    return [
      "hardwareDecode": anyHardwareDecoder(),
      "softwareDecode": true,
      "videoRendering": true,
      "audioPlayback": true,
      "subtitleRendering": true,
      "fullscreen": true,
      "networkPlayback": true,
      "localPlayback": true,
      // Background audio needs the platform *and* the app's declaration to
      // agree, and only the bundle knows the second half: without the `audio`
      // background mode iOS suspends the process, and reporting the platform
      // half alone would promise something the app cannot deliver.
      "backgroundPlayback": declaresBackgroundAudio(),
      // The system feature, as the platform reports it.
      "pictureInPicture": AVPictureInPictureController.isPictureInPictureSupported(),
      "externalDisplay": UIScreen.screens.count > 1,
    ]
  }

  private func device() -> [String: Any] {
    var device: [String: Any] = [
      // No iOS build of this app runs on a 32-bit device: iOS 11 dropped
      // 32-bit support entirely, and every device that can decode video with
      // VideoToolbox is 64-bit.
      "supports64BitAbi": true,
      // `isLowRamDevice` is Android's own classification. iOS has none, and
      // inventing one from a memory number would tune devices down on a guess.
      "lowRamDevice": false,
      "reported": true,
    ]

    let cores = ProcessInfo.processInfo.processorCount

    if cores > 0 {
      device["cpuCores"] = cores
    }

    let memory = ProcessInfo.processInfo.physicalMemory

    if memory > 0 {
      device["totalRamMb"] = Int(memory / 1024 / 1024)
    }

    return device
  }

  /// The codec section.
  ///
  /// VideoToolbox answers per codec, so this probe can fill the matrix in. It
  /// reports no size limits: the ceiling is a property of the chip rather than
  /// of a documented capability API, and a fabricated number would refuse
  /// streams the device can play — the Dart side reads a zero limit as
  /// "unknown" and accepts the codec.
  private func codecs() -> [String: Any] {
    var video: [String: Any] = [:]

    for (name, codec) in videoCodecs() where VTIsHardwareDecodeSupported(codec) {
      video[name] = [
        "hardware": true,
        "maxWidth": 0,
        "maxHeight": 0,
        "maxFrameRate": 0,
      ]
    }

    return [
      "reported": true,
      "video": video,
    ]
  }

  private func videoCodecs() -> [String: CMVideoCodecType] {
    return [
      "h264": kCMVideoCodecType_H264,
      "hevc": kCMVideoCodecType_HEVC,
    ]
  }

  /// Whether VideoToolbox has a hardware decoder for any codec we name.
  private func anyHardwareDecoder() -> Bool {
    for (_, codec) in videoCodecs() where VTIsHardwareDecodeSupported(codec) {
      return true
    }

    return false
  }

  /// The architecture this build targets.
  ///
  /// Compile-time rather than queried: it is the slice the app was built for,
  /// which is what decides whether a 64-bit-only decoder path is even present.
  private func architecture() -> String {
    #if arch(arm64)
      return "arm64"
    #elseif arch(x86_64)
      return "x86_64"
    #else
      return "unknown"
    #endif
  }

  /// The machine identifier, e.g. `iPhone14,3`.
  ///
  /// `uname` rather than `sysctl("hw.machine")`: the former is available to
  /// every app, and the identifier is what tells an iPhone 11 from an iPhone 13
  /// when a decode question has to be explained after the fact.
  private func machineIdentifier() -> String {
    var system = utsname()
    uname(&system)

    let machine = withUnsafePointer(to: &system.machine) { pointer in
      pointer.withMemoryRebound(to: CChar.self, capacity: Int(_SYS_NAMELEN)) { name in
        String(cString: name)
      }
    }

    return machine
  }

  /// Whether the app declares the `audio` background mode.
  private func declaresBackgroundAudio() -> Bool {
    let modes = Bundle.main.object(forInfoDictionaryKey: "UIBackgroundModes") as? [String] ?? []

    return modes.contains("audio")
  }

  private func isSimulator() -> Bool {
    #if targetEnvironment(simulator)
      return true
    #else
      return false
    #endif
  }
}
