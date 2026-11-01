cmake_minimum_required(VERSION 3.14)
project(media_core_native LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(PLUGIN_NAME "media_core_native_plugin")
add_library(${PLUGIN_NAME} SHARED
  "media_core_native_plugin.cc" "media_core_native_plugin_c_api.cc"
  "platform_probe.cc"
  "background_execution.cc")
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE
  FLUTTER_PLUGIN_IMPL _DISABLE_CONSTEXPR_MUTEX_CONSTRUCTOR)
target_compile_options(${PLUGIN_NAME} PRIVATE "/utf-8")
target_include_directories(${PLUGIN_NAME}
  INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include")
# mfplat (MFTEnumEx), dxgi (output descriptors) and ole32/IMMDeviceEnumerator
# are the three sources the probe reads.
target_link_libraries(${PLUGIN_NAME} PRIVATE
  flutter flutter_wrapper_plugin mfplat mfuuid dxgi ole32)
set(media_core_native_bundled_libraries "" PARENT_SCOPE)
