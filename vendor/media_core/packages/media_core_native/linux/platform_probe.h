#ifndef MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_
#define MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_

#include <flutter/encodable_value.h>

namespace media_core_native {

/// Reads what this Linux machine can do.
///
/// The answer is a map with up to four sections (info, capabilities, device,
/// codecs) — see `PlatformProbeReport` on the Dart side, which parses it and is
/// the source of truth for the shape.
///
/// Everything here is derived from `/proc`, `/sys` and `uname`, with no GLib or
/// GTK dependency: the channel plumbing next door owns those, and keeping this
/// file to the standard library means it can be type-checked on a machine that
/// is not Linux.
///
/// Only the *absence* of a codec matrix is deliberate — see `ProbeCodecs`.
flutter::EncodableMap ProbePlatform();

}  // namespace media_core_native

#endif  // MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_
