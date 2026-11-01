#include "platform_probe.h"

#include <flutter/encodable_value.h>

#include <cstddef>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#if defined(__linux__)
#include <dirent.h>
#include <sys/utsname.h>
#include <unistd.h>
#endif

namespace media_core_native {
namespace {

using flutter::EncodableMap;
using flutter::EncodableValue;

/// Reads a whole file, or an empty string when it cannot be read.
///
/// Every fact on this platform comes from a pseudo-file, and a missing one is a
/// normal state (no `/dev/dri` on a headless server, no `/sys/class/drm` in a
/// container), so absence is answered rather than thrown.
std::string ReadFile(const std::string& path) {
#if defined(__linux__)
  std::ifstream file(path);

  if (!file.is_open()) {
    return std::string();
  }

  std::stringstream buffer;
  buffer << file.rdbuf();

  return buffer.str();
#else
  (void)path;

  return std::string();
#endif
}

/// Value of a `KEY=value` line in a file, or an empty string.
///
/// `/etc/os-release` and `/proc/meminfo` both answer this shape; the second one
/// is why the key is matched with the separator included, so `MemTotal` cannot
/// be satisfied by `MemTotalSomething`.
std::string ValueOfKey(const std::string& text, const std::string& key, const std::string& separator) {
  const std::string needle = key + separator;
  std::istringstream stream(text);
  std::string line;

  while (std::getline(stream, line)) {
    if (line.compare(0, needle.size(), needle) != 0) {
      continue;
    }

    return line.substr(needle.size());
  }

  return std::string();
}

/// Trims spaces and quotes from both ends.
std::string Trim(const std::string& value) {
  const std::string whitespace = " \t\r\n\"";

  const std::size_t first = value.find_first_not_of(whitespace);

  if (first == std::string::npos) {
    return std::string();
  }

  const std::size_t last = value.find_last_not_of(whitespace);

  return value.substr(first, last - first + 1);
}

/// Whether a path exists.
bool Exists(const std::string& path) {
#if defined(__linux__)
  return access(path.c_str(), F_OK) == 0;
#else
  (void)path;

  return false;
#endif
}

/// Whether any node of [prefix] starts with [needle].
///
/// Used for `/dev/dri/renderD*` and for counting connected DRM outputs, both of
/// which are "some entry in this directory" questions.
std::vector<std::string> EntriesWithPrefix(const std::string& directory, const std::string& needle) {
  std::vector<std::string> matches;

#if defined(__linux__)
  DIR* handle = opendir(directory.c_str());

  if (handle == nullptr) {
    return matches;
  }

  while (dirent* entry = readdir(handle)) {
    const std::string name = entry->d_name;

    if (name.compare(0, needle.size(), needle) == 0) {
      matches.push_back(name);
    }
  }

  closedir(handle);
#else
  (void)directory;
  (void)needle;
#endif

  return matches;
}

/// The processor architecture, as `uname -m` spells it.
std::string Architecture() {
#if defined(__linux__)
  struct utsname info = {};

  if (uname(&info) == 0) {
    return std::string(info.machine);
  }
#endif

  return std::string("unknown");
}

/// Logical cores.
int CpuCores() {
#if defined(__linux__)
  const long cores = sysconf(_SC_NPROCESSORS_ONLN);

  if (cores > 0) {
    return static_cast<int>(cores);
  }
#endif

  // Fall back to counting the processor blocks in `/proc/cpuinfo`, which is
  // what a container without `sysconf` reporting anything still answers.
  const std::string cpuinfo = ReadFile("/proc/cpuinfo");
  int count = 0;
  std::istringstream stream(cpuinfo);
  std::string line;

  while (std::getline(stream, line)) {
    if (line.compare(0, 9, "processor") == 0) {
      ++count;
    }
  }

  return count;
}

/// Total physical memory in megabytes, or 0 when unknown.
int TotalRamMb() {
  const std::string meminfo = ReadFile("/proc/meminfo");
  const std::string value = Trim(ValueOfKey(meminfo, "MemTotal", ":"));

  if (value.empty()) {
    return 0;
  }

  // `/proc/meminfo` reports kilobytes, with a " kB" suffix.
  std::istringstream stream(value);
  long kilobytes = 0;

  if (!(stream >> kilobytes) || kilobytes <= 0) {
    return 0;
  }

  return static_cast<int>(kilobytes / 1024);
}

/// Whether a GPU render node is present.
///
/// This is the platform-level answer to "can this machine decode in hardware".
/// It is a *proxy*: the node says a GPU driver with a render engine is loaded,
/// not that any particular codec has a decoder there — which is exactly why the
/// codec matrix below is left empty rather than filled with guesses.
bool HasRenderNode() {
  return !EntriesWithPrefix("/dev/dri", "renderD").empty();
}

/// Connected displays, counted through DRM connector status.
int ConnectedDisplays() {
  const std::vector<std::string> connectors = EntriesWithPrefix("/sys/class/drm", "card");

  int connected = 0;

  for (const std::string& connector : connectors) {
    const std::string status = Trim(ReadFile("/sys/class/drm/" + connector + "/status"));

    if (status == "connected") {
      ++connected;
    }
  }

  return connected;
}

/// The distribution's display name, version and build.
void ProbeDistro(std::string* name, std::string* version, std::string* build) {
  const std::string release = ReadFile("/etc/os-release");

  *name = Trim(ValueOfKey(release, "PRETTY_NAME", "="));
  *version = Trim(ValueOfKey(release, "VERSION_ID", "="));
  *build = Trim(ValueOfKey(release, "BUILD_ID", "="));

  if (name->empty()) {
    // A distribution without os-release is old or custom; the kernel version is
    // the next best identity.
    *name = std::string("Linux");
  }
}

EncodableMap ProbeInfo() {
  std::string name;
  std::string version;
  std::string build;

  ProbeDistro(&name, &version, &build);

  EncodableMap info;
  info[EncodableValue("type")] = EncodableValue("linux");
  info[EncodableValue("name")] = EncodableValue(name);
  info[EncodableValue("version")] = EncodableValue(version);
  info[EncodableValue("buildNumber")] = EncodableValue(build);
  info[EncodableValue("architecture")] = EncodableValue(Architecture());
  info[EncodableValue("isEmulator")] = EncodableValue(false);

  return info;
}

EncodableMap ProbeCapabilities() {
  EncodableMap capabilities;

  capabilities[EncodableValue("hardwareDecode")] = EncodableValue(HasRenderNode());
  capabilities[EncodableValue("softwareDecode")] = EncodableValue(true);
  capabilities[EncodableValue("videoRendering")] = EncodableValue(true);
  capabilities[EncodableValue("audioPlayback")] = EncodableValue(true);
  capabilities[EncodableValue("subtitleRendering")] = EncodableValue(true);
  capabilities[EncodableValue("fullscreen")] = EncodableValue(true);
  capabilities[EncodableValue("networkPlayback")] = EncodableValue(true);
  capabilities[EncodableValue("localPlayback")] = EncodableValue(true);
  // Desktop playback is not suspended when the window loses focus, and nothing
  // in the platform takes it away.
  capabilities[EncodableValue("backgroundPlayback")] = EncodableValue(true);
  // Linux serves the small window in-app (media_core_floating) rather than as a
  // system feature, so the platform itself answers no — same convention as
  // Windows.
  capabilities[EncodableValue("pictureInPicture")] = EncodableValue(false);
  capabilities[EncodableValue("externalDisplay")] = EncodableValue(ConnectedDisplays() > 1);

  return capabilities;
}

EncodableMap ProbeDevice() {
  const int cores = CpuCores();
  const int ram = TotalRamMb();
  const std::string architecture = Architecture();

  EncodableMap device;
  device[EncodableValue("cpuCores")] = EncodableValue(cores);
  device[EncodableValue("reported")] = EncodableValue(true);
  device[EncodableValue("supports64BitAbi")] = EncodableValue(architecture.find("64") != std::string::npos);
  // Linux has no platform classification for a low-memory device, and deriving
  // one from a memory number would tune devices down on a guess.
  device[EncodableValue("lowRamDevice")] = EncodableValue(false);

  if (ram > 0) {
    device[EncodableValue("totalRamMb")] = EncodableValue(ram);
  }

  return device;
}

/// The codec section, which on Linux stays empty on purpose.
///
/// Answering "does this machine have a hardware H.264 decoder" needs libva (or
/// V4L2 M2M), and the two alternatives are both wrong: linking libva makes the
/// plugin unbuildable where it is absent, and inferring per-codec support from
/// the presence of a render node is precisely the capability lie this layer
/// exists to prevent. So the platform-level answer travels in `capabilities`
/// and the per-codec one stays unknown, which keeps the engine's own behaviour
/// in place.
EncodableMap ProbeCodecs() {
  EncodableMap codecs;
  codecs[EncodableValue("reported")] = EncodableValue(false);
  codecs[EncodableValue("video")] = EncodableValue(EncodableMap());

  return codecs;
}

}  // namespace

EncodableMap ProbePlatform() {
  EncodableMap payload;

  payload[EncodableValue("info")] = EncodableValue(ProbeInfo());
  payload[EncodableValue("capabilities")] = EncodableValue(ProbeCapabilities());
  payload[EncodableValue("device")] = EncodableValue(ProbeDevice());
  payload[EncodableValue("codecs")] = EncodableValue(ProbeCodecs());

  return payload;
}

}  // namespace media_core_native
