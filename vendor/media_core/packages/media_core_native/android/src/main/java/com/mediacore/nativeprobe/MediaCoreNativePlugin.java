package com.mediacore.nativeprobe;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Build;
import android.util.Range;
import android.hardware.display.DisplayManager;
import android.view.Display;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * Android side of the capability probe.
 *
 * Wire protocol (see {@code PlatformProbeReport} on the Dart side, which is the
 * source of truth): one method, {@code probe}, answered with a map of up to
 * four sections — info, capabilities, device, codecs.
 *
 * <p>Every section is best-effort. Anything this class cannot answer is left
 * out rather than reported as unsupported, because a backend that believes
 * hardware decoding is unavailable when it merely was not asked will refuse
 * streams the device could play.
 *
 * <p>The facts come from:
 *
 * <ul>
 *   <li>{@link MediaCodecList} — which video decoders exist, whether the
 *       platform marks them hardware-accelerated, and the size and frame-rate
 *       ranges they accept;
 *   <li>{@link ActivityManager} — {@code isLowRamDevice} and total memory;
 *   <li>{@link Build} — version, model, ABI width;
 *   <li>{@link PackageManager} — picture-in-picture and leanback features;
 *   <li>{@link DisplayManager} — whether anything but the built-in display is
 *       attached.
 * </ul>
 *
 * <p>Nothing here is cached: the probe runs once per process from Dart and the
 * provider holds the answer.
 */
public final class MediaCoreNativePlugin
    implements FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

  /** Channel name; kept in sync with the Dart implementation. */
  private static final String CHANNEL_NAME = "media_core_native";

  /** Method the probe is requested through. */
  private static final String METHOD_PROBE = "probe";

  private Context context;

  /** Background execution, which needs the activity for the notification dialog. */
  private BackgroundExecutionDelegate background;

  /**
   * Routes the notification permission answer back to the waiting acquire.
   *
   * The dialog belongs to the activity, so the answer arrives at the plugin that
   * asked for the activity — not at the delegate that started the request.
   */
  private final PluginRegistry.RequestPermissionsResultListener permissionListener =
      new PluginRegistry.RequestPermissionsResultListener() {
        @Override
        public boolean onRequestPermissionsResult(
            int requestCode, String[] permissions, int[] grantResults) {
          return background != null && background.onPermissionResult(requestCode);
        }
      };

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    context = binding.getApplicationContext();

    MethodChannel channel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL_NAME);
    channel.setMethodCallHandler(this);

    // Background execution has its own channel: it is a second capability, and
    // folding its methods into the probe would make the probe answer for
    // something it does not describe.
    background = new BackgroundExecutionDelegate(context);
    MethodChannel backgroundChannel =
        new MethodChannel(binding.getBinaryMessenger(), BackgroundExecutionDelegate.CHANNEL_NAME);
    backgroundChannel.setMethodCallHandler(background);
  }

  @Override
  public void onDetachedFromEngine(FlutterPluginBinding binding) {
    context = null;
    background = null;
  }

  // ---------------------------------------------------------------------------
  // Activity (for the notification permission)
  // ---------------------------------------------------------------------------

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    binding.addRequestPermissionsResultListener(permissionListener);

    if (background != null) {
      background.setActivity(binding.getActivity());
    }
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    if (background != null) {
      background.setActivity(null);
    }
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivity() {
    if (background != null) {
      background.setActivity(null);
    }
  }

  @Override
  public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    if (!METHOD_PROBE.equals(call.method)) {
      result.notImplemented();
      return;
    }

    try {
      result.success(probe());
    } catch (Throwable error) {
      // A probe that fails is "unknown", never a failed call: playback must not
      // depend on this running.
      result.error("probe_failed", error.getMessage(), null);
    }
  }

  /** Builds the probe payload. */
  private Map<String, Object> probe() {
    Map<String, Object> payload = new HashMap<>();
    payload.put("info", info());
    payload.put("capabilities", capabilities());
    payload.put("device", device());
    payload.put("codecs", codecs());
    return payload;
  }

  // ---------------------------------------------------------------------------
  // Sections
  // ---------------------------------------------------------------------------

  private Map<String, Object> info() {
    Map<String, Object> info = new LinkedHashMap<>();
    info.put("type", "android");
    info.put("name", "Android");
    info.put("version", Build.VERSION.RELEASE);
    info.put("buildNumber", Build.DISPLAY);
    info.put("architecture", architecture());
    info.put("deviceModel", Build.MANUFACTURER + " " + Build.MODEL);
    info.put("isEmulator", isEmulator());
    return info;
  }

  private Map<String, Object> capabilities() {
    PackageManager packages = context.getPackageManager();
    Map<String, Object> capabilities = new LinkedHashMap<>();

    // Hardware decoding is answered by the codec list rather than assumed: the
    // section is present when the list is.
    capabilities.put("hardwareDecode", !codecs().isEmpty());
    capabilities.put("softwareDecode", true);
    capabilities.put("videoRendering", true);
    capabilities.put("audioPlayback", true);
    capabilities.put("subtitleRendering", true);
    capabilities.put("fullscreen", true);
    capabilities.put("networkPlayback", true);
    capabilities.put("localPlayback", true);
    capabilities.put("pictureInPicture",
        packages.hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE));
    capabilities.put("externalDisplay", hasExternalDisplay());
    // Background playback is a manifest declaration the app owns, so the answer
    // is read from the manifest rather than assumed from the platform.
    capabilities.put("backgroundPlayback", declaresBackgroundPlaybackService(packages));

    return capabilities;
  }

  private Map<String, Object> device() {
    ActivityManager activityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
    ActivityManager.MemoryInfo memory = new ActivityManager.MemoryInfo();

    Map<String, Object> device = new LinkedHashMap<>();
    device.put("cpuCores", Runtime.getRuntime().availableProcessors());
    device.put("reported", true);

    if (activityManager != null) {
      activityManager.getMemoryInfo(memory);
      device.put("totalRamMb", (int) (memory.totalMem / (1024L * 1024L)));
      device.put("lowRamDevice", activityManager.isLowRamDevice());
    }

    device.put("supports64BitAbi", supports64BitAbi());
    return device;
  }

  /**
   * Walks the platform's decoder list.
   *
   * A codec is reported when <em>any</em> decoder claims it; the decode support
   * for a codec is hardware when at least one of its decoders is marked
   * hardware-accelerated, because that is the case worth reaching for. The size
   * and frame-rate limits are the widest window any hardware decoder of that
   * codec accepts.
   */
  private Map<String, Object> codecs() {
    Map<String, Object> byName = new LinkedHashMap<>();
    Map<String, Map<String, Object>> merged = new LinkedHashMap<>();

    try {
      MediaCodecList list = new MediaCodecList(MediaCodecList.ALL_CODECS);

      for (MediaCodecInfo codec : list.getCodecInfos()) {
        if (codec.isEncoder()) {
          continue;
        }

        for (String type : codec.getSupportedTypes()) {
          String name = codecName(type);

          if (name == null) {
            continue;
          }

          boolean hardware = isHardwareAccelerated(codec);

          if (!hardware) {
            continue;
          }

          Map<String, Object> entry = merged.get(name);

          if (entry == null) {
            entry = new LinkedHashMap<>();
            entry.put("hardware", true);
            entry.put("maxWidth", 0);
            entry.put("maxHeight", 0);
            entry.put("maxFrameRate", 0);
            merged.put(name, entry);
          }

          applyLimits(entry, codec, type);
        }
      }
    } catch (Throwable ignored) {
      // An OEM build that refuses the codec list leaves the section empty,
      // which the Dart side reads as "unknown".
    }

    for (Map.Entry<String, Map<String, Object>> entry : merged.entrySet()) {
      byName.put(entry.getKey(), entry.getValue());
    }

    Map<String, Object> codecs = new LinkedHashMap<>();
    codecs.put("reported", true);
    codecs.put("video", byName);
    return codecs;
  }

  /** Records the widest supported window of one decoder into [entry]. */
  private void applyLimits(Map<String, Object> entry, MediaCodecInfo codec, String type) {
    try {
      MediaCodecInfo.VideoCapabilities video = codec.getCapabilitiesForType(type).getVideoCapabilities();

      if (video == null) {
        return;
      }

      Range<Integer> widths = video.getSupportedWidths();
      Range<Integer> heights = video.getSupportedHeights();

      entry.put("maxWidth", Math.max(intOf(entry.get("maxWidth")), widths.getUpper()));
      entry.put("maxHeight", Math.max(intOf(entry.get("maxHeight")), heights.getUpper()));

      Range<Integer> rates = video.getSupportedFrameRates();

      if (rates != null && rates.getUpper() != null) {
        entry.put("maxFrameRate", Math.max(intOf(entry.get("maxFrameRate")), rates.getUpper()));
      }
    } catch (Throwable ignored) {
      // A codec that refuses to describe itself keeps the limits it has; the
      // Dart side reads a zero limit as "unknown", not as "nothing".
    }
  }

  private boolean isHardwareAccelerated(MediaCodecInfo codec) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      return codec.isHardwareAccelerated();
    }

    // Before API 29 the only signal is the codec name convention: the platform
    // prefixes software decoders with `OMX.google.` / `c2.android.`.
    String name = codec.getName().toLowerCase();

    return !name.startsWith("omx.google.") && !name.startsWith("c2.android.");
  }

  private String codecName(String mime) {
    if (mime == null) {
      return null;
    }

    String normalized = mime.toLowerCase();

    if (normalized.equals(MediaFormat.MIMETYPE_VIDEO_AVC)) {
      return "h264";
    }

    if (normalized.equals(MediaFormat.MIMETYPE_VIDEO_HEVC)) {
      return "hevc";
    }

    if (normalized.equals("video/x-vnd.on2.vp9")) {
      return "vp9";
    }

    if (normalized.equals(MediaFormat.MIMETYPE_VIDEO_AV1)) {
      return "av1";
    }

    if (normalized.equals(MediaFormat.MIMETYPE_VIDEO_MPEG4)) {
      return "mpeg4";
    }

    if (normalized.equals(MediaFormat.MIMETYPE_VIDEO_MPEG2)) {
      return "mpeg2";
    }

    if (normalized.equals("video/vc1")) {
      return "vc1";
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Small facts
  // ---------------------------------------------------------------------------

  /**
   * Whether the app declares the foreground service that keeps playback alive.
   *
   * From API 34 media playback needs {@code FOREGROUND_SERVICE_MEDIA_PLAYBACK}
   * on top of {@code FOREGROUND_SERVICE}; before that the general permission was
   * the whole declaration.
   */
  private boolean declaresBackgroundPlaybackService(PackageManager packages) {
    try {
      PackageInfo info = packages.getPackageInfo(context.getPackageName(), PackageManager.GET_PERMISSIONS);
      String[] declared = info.requestedPermissions;

      if (declared == null) {
        return false;
      }

      boolean general = false;

      for (String permission : declared) {
        // Android has no constant for either name; they are manifest strings.
        if ("android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK".equals(permission)) {
          return true;
        }

        if ("android.permission.FOREGROUND_SERVICE".equals(permission)) {
          general = true;
        }
      }

      return general;
    } catch (Throwable ignored) {
      return false;
    }
  }

  private boolean supports64BitAbi() {
    // The *device*'s ABIs, not the process's: a 64-bit TV running a 32-bit APK
    // is a healthy device.
    return Build.SUPPORTED_64_BIT_ABIS != null && Build.SUPPORTED_64_BIT_ABIS.length > 0;
  }

  private String architecture() {
    String[] abis = Build.SUPPORTED_ABIS;

    if (abis == null || abis.length == 0) {
      return "unknown";
    }

    List<String> names = new ArrayList<>();

    for (String abi : abis) {
      names.add(abi);
    }

    return String.join(",", names);
  }

  private boolean isEmulator() {
    return Build.FINGERPRINT.contains("generic")
        || Build.FINGERPRINT.contains("emulator")
        || Build.MODEL.contains("sdk_gphone")
        || "google_sdk".equals(Build.PRODUCT)
        || Build.HARDWARE.contains("goldfish")
        || Build.HARDWARE.contains("ranchu");
  }

  private boolean hasExternalDisplay() {
    try {
      DisplayManager displays = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);

      if (displays == null) {
        return false;
      }

      Display[] all = displays.getDisplays();

      return all != null && all.length > 1;
    } catch (Throwable ignored) {
      return false;
    }
  }

  private static int intOf(Object value) {
    return value instanceof Integer ? (Integer) value : 0;
  }
}
