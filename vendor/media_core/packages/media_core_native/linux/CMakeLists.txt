# The Flutter tooling requires CMake 3.10 or later; do not increase it.
cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME "media_core_native")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin; do not change it.
set(PLUGIN_NAME "media_core_native_plugin")

list(APPEND PLUGIN_SOURCES
  "media_core_native_plugin.cc"
  "platform_probe.cc"
)

add_library(${PLUGIN_NAME} SHARED ${PLUGIN_SOURCES})

apply_standard_settings(${PLUGIN_NAME})

set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
# GLib comes with the Flutter GTK embedder and is what the channel layer uses;
# the probe itself is standard C++ and touches neither.
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)

set(${PROJECT_NAME}_bundled_libraries
  ""
  PARENT_SCOPE
)
