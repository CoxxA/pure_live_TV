#ifndef FLUTTER_PLUGIN_MEDIA_CORE_NATIVE_PLUGIN_H_
#define FLUTTER_PLUGIN_MEDIA_CORE_NATIVE_PLUGIN_H_

#include <flutter_plugin_registrar.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>

namespace media_core_native {

/// Windows side of the capability probe.
///
/// Wire protocol (see {@code PlatformProbeReport} on the Dart side, which is
/// the source of truth): one method, {@code probe}, answered with a map of up
/// to four sections — info, capabilities, device, codecs.
///
/// The facts come from:
///
/// - {@code MFTEnumEx} with {@code MFT_ENUM_FLAG_HARDWARE} — which video
///   decoder transforms the OS ships for a codec, which is the only portable
///   answer to "does this machine decode HEVC in hardware";
/// - {@code GlobalMemoryStatusEx} and {@code GetNativeSystemInfo} — memory and
///   core count;
/// - {@code IDXGIOutput6::GetDesc1} — HDR capability and whether more than one
///   output is attached;
/// - {@code RtlGetVersion} — the real OS version, since
///   {@code GetVersionEx} lies without a manifest.
class MediaCoreNativePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

  MediaCoreNativePlugin();
  ~MediaCoreNativePlugin() override;

  MediaCoreNativePlugin(const MediaCoreNativePlugin&) = delete;
  MediaCoreNativePlugin& operator=(const MediaCoreNativePlugin&) = delete;

 private:
  void HandleMethodCall(const flutter::MethodCall<flutter::EncodableValue>& method_call,
                        std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel_;
  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> background_channel_;
};

}  // namespace media_core_native

#endif  // FLUTTER_PLUGIN_MEDIA_CORE_NATIVE_PLUGIN_H_
