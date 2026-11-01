#include "include/media_core_native/media_core_native_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "media_core_native_plugin.h"

void MediaCoreNativePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  media_core_native::MediaCoreNativePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
