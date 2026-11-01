#ifndef MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_
#define MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_

#include <flutter/encodable_value.h>

namespace media_core_native {

/// Reads what this Windows machine can do.
///
/// The answer is a map with up to four sections (info, capabilities, device,
/// codecs) — see `PlatformProbeReport` on the Dart side, which parses it and is
/// the source of truth for the shape.
///
/// Everything here is best-effort: a section that cannot be read is left out or
/// left empty, which the Dart side reads as "unknown" rather than as
/// "unsupported". That distinction is the whole point of the probe — a backend
/// that thinks hardware decoding is unavailable when it merely was not asked
/// will refuse streams this machine could play.
flutter::EncodableMap ProbePlatform();

}  // namespace media_core_native

#endif  // MEDIA_CORE_NATIVE_PLATFORM_PROBE_H_
