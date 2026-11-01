#include "include/media_core_native/media_core_native_plugin.h"

#include <flutter_linux/flutter_linux.h>

#include <cstring>

#include "platform_probe.h"

#define MEDIA_CORE_NATIVE_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), media_core_native_plugin_get_type(), \
                              MediaCoreNativePlugin))

namespace {

/// Channel name; kept in sync with the Dart side.
constexpr char kChannelName[] = "media_core_native";

/// Method the probe is requested through.
constexpr char kProbeMethod[] = "probe";

/// Converts one probe value into the Linux embedder's value type.
///
/// The probe speaks `flutter::EncodableValue` — the same shape the Windows
/// plugin hands to its codec — so this bridge is what keeps the probe file free
/// of GLib and therefore type-checkable anywhere. Numbers keep their width
/// (`int64` stays `int64`): the report carries RAM in megabytes and frame
/// rates, and a downcast there would be a silent lie.
///
/// Returns a value with a floating reference, or nullptr for a value the report
/// never produces.
FlValue* ToFlValue(const flutter::EncodableValue& value) {
  if (const auto* boolean = std::get_if<bool>(&value)) {
    return fl_value_new_bool(*boolean);
  }

  if (const auto* integer = std::get_if<int32_t>(&value)) {
    return fl_value_new_int(*integer);
  }

  if (const auto* integer = std::get_if<int64_t>(&value)) {
    return fl_value_new_int(*integer);
  }

  if (const auto* decimal = std::get_if<double>(&value)) {
    return fl_value_new_float(*decimal);
  }

  if (const auto* text = std::get_if<std::string>(&value)) {
    return fl_value_new_string(text->c_str());
  }

  if (const auto* list = std::get_if<flutter::EncodableList>(&value)) {
    FlValue* result = fl_value_new_list();

    for (const auto& item : *list) {
      FlValue* converted = ToFlValue(item);

      if (converted == nullptr) {
        continue;
      }

      fl_value_append(result, converted);

      fl_value_unref(converted);
    }

    return result;
  }

  if (const auto* map = std::get_if<flutter::EncodableMap>(&value)) {
    FlValue* result = fl_value_new_map();

    for (const auto& entry : *map) {
      const auto* key = std::get_if<std::string>(&entry.first);

      if (key == nullptr) {
        continue;
      }

      FlValue* converted = ToFlValue(entry.second);

      if (converted == nullptr) {
        continue;
      }

      fl_value_set_string(result, key->c_str(), converted);

      fl_value_unref(converted);
    }

    return result;
  }

  return nullptr;
}

}  // namespace

struct _MediaCoreNativePlugin {
  GObject parent_instance;

  FlMethodChannel* channel;
};

G_DEFINE_TYPE(MediaCoreNativePlugin, media_core_native_plugin, g_object_get_type())

// ---------------------------------------------------------------------------
// Method calls
// ---------------------------------------------------------------------------

/// Answers `probe` with the platform report.
///
/// The probe is synchronous and reads pseudo-files, and the channel call
/// arrives on the GTK main thread — the thread Flutter's Linux embedder uses
/// for platform channels — so there is nothing to marshal and no reason to
/// bounce the answer through another thread.
static void media_core_native_plugin_handle_method_call(
    MediaCoreNativePlugin* self,
    FlMethodCall* method_call) {
  const gchar* method = fl_method_call_get_name(method_call);

  if (strcmp(method, kProbeMethod) != 0) {
    g_autoptr(FlMethodResponse) not_implemented =
        FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());

    fl_method_call_respond(method_call, not_implemented, nullptr);

    return;
  }

  const flutter::EncodableMap report = media_core_native::ProbePlatform();

  g_autoptr(FlValue) payload = fl_value_new_map();

  for (const auto& entry : report) {
    const auto* key = std::get_if<std::string>(&entry.first);

    if (key == nullptr) {
      continue;
    }

    g_autoptr(FlValue) converted = ToFlValue(entry.second);

    if (converted == nullptr) {
      continue;
    }

    // The map takes its own reference; the autoptr releases ours.
    fl_value_set_string(payload, key->c_str(), converted);
  }

  g_autoptr(FlMethodResponse) response =
      FL_METHOD_RESPONSE(fl_method_success_response_new(payload));

  fl_method_call_respond(method_call, response, nullptr);
}

static void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  MediaCoreNativePlugin* self = MEDIA_CORE_NATIVE_PLUGIN(user_data);

  media_core_native_plugin_handle_method_call(self, method_call);
}

// ---------------------------------------------------------------------------
// GObject plumbing
// ---------------------------------------------------------------------------

static void media_core_native_plugin_dispose(GObject* object) {
  MediaCoreNativePlugin* self = MEDIA_CORE_NATIVE_PLUGIN(object);

  g_clear_object(&self->channel);

  G_OBJECT_CLASS(media_core_native_plugin_parent_class)->dispose(object);
}

static void media_core_native_plugin_class_init(
    MediaCoreNativePluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = media_core_native_plugin_dispose;
}

static void media_core_native_plugin_init(MediaCoreNativePlugin* self) {
  self->channel = nullptr;
}

void media_core_native_plugin_register_with_registrar(
    FlPluginRegistrar* registrar) {
  MediaCoreNativePlugin* plugin = MEDIA_CORE_NATIVE_PLUGIN(
      g_object_new(media_core_native_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();

  plugin->channel = fl_method_channel_new(
      fl_plugin_registrar_get_messenger(registrar), kChannelName,
      FL_METHOD_CODEC(codec));

  fl_method_channel_set_method_call_handler(
      plugin->channel, method_call_cb, g_object_ref(plugin), g_object_unref);

  g_object_unref(plugin);
}
