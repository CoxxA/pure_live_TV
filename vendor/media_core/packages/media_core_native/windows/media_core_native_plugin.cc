#include "media_core_native_plugin.h"

#include <flutter/plugin_registrar_windows.h>

#include "background_execution.h"
#include "platform_probe.h"

namespace media_core_native {

namespace {

/// Method the probe is requested through; kept in sync with the Dart side.
constexpr char kProbeMethod[] = "probe";

/// Channel name; kept in sync with the Dart side.
constexpr char kChannelName[] = "media_core_native";

/// Background-execution channel; its own capability, its own channel.
constexpr char kBackgroundChannelName[] = "media_core_native/background";

}  // namespace

namespace {

/// Answers the background-execution channel.
///
/// Sessions are the platform's own accounting (see background_execution.h):
/// the id handed back is the number of jobs holding the system awake, which is
/// all a caller needs to release exactly what it acquired. A refused acquire
/// is answered with null rather than an error — the job then runs unprotected,
/// which is better than failing it over a power-management detail.
void HandleBackgroundCall(const flutter::MethodCall<flutter::EncodableValue>& method_call,
                          std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  const std::string& method = method_call.method_name();

  if (method == "acquire") {
    result->Success(flutter::EncodableValue(background_execution::Acquire()));

    return;
  }

  if (method == "release") {
    background_execution::Release();

    result->Success();

    return;
  }

  result->NotImplemented();
}

}  // namespace

void MediaCoreNativePlugin::RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar) {
  auto plugin = std::make_unique<MediaCoreNativePlugin>();

  plugin->channel_ = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      registrar->messenger(), kChannelName, &flutter::StandardMethodCodec::GetInstance());

  plugin->channel_->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto& call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  plugin->background_channel_ = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      registrar->messenger(), kBackgroundChannelName, &flutter::StandardMethodCodec::GetInstance());

  plugin->background_channel_->SetMethodCallHandler(
      [](const flutter::MethodCall<flutter::EncodableValue>& call,
         std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        HandleBackgroundCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

MediaCoreNativePlugin::MediaCoreNativePlugin() = default;

MediaCoreNativePlugin::~MediaCoreNativePlugin() = default;

void MediaCoreNativePlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue>& method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name() != kProbeMethod) {
    result->NotImplemented();
    return;
  }

  result->Success(flutter::EncodableValue(ProbePlatform()));
}

}  // namespace media_core_native
