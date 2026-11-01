#include "platform_probe.h"

#include <flutter/encodable_value.h>

#include <dxgi1_6.h>
#include <mfapi.h>
#include <mfidl.h>
#include <windows.h>

#include <string>

namespace media_core_native {
namespace {

using flutter::EncodableMap;
using flutter::EncodableValue;

/// FOURCC-based media subtype GUIDs.
///
/// Declared here rather than taken from `mfapi.h` so the plugin compiles
/// against older Windows SDKs: the constants for newer codecs were added to the
/// SDK over time, and a missing constant must not cost us the codec's entry.
const GUID kSubtypeH264 = {0x34363248, 0x0000, 0x0010, {0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71}};
const GUID kSubtypeHevc = {0x43564548, 0x0000, 0x0010, {0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71}};
const GUID kSubtypeHevcEs = {0x30315648, 0x0000, 0x0010, {0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71}};
const GUID kSubtypeVp9 = {0x30395056, 0x0000, 0x0010, {0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71}};
const GUID kSubtypeAv1 = {0x31305641, 0x0000, 0x0010, {0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71}};

/// One codec the probe asks the Media Foundation about.
struct CodecProbe {
  const char* name;

  /// Primary subtype, and an optional second spelling of the same codec.
  const GUID* subtype;
  const GUID* alternative;
};

/// The four codecs that decide real playback decisions on a desktop.
///
/// If a machine has no hardware HEVC decoder, a 4K HEVC file has to be decoded
/// in software, and the engine should be told before it spends a failed
/// hardware attempt on it.
const CodecProbe kCodecProbes[] = {
    {"h264", &kSubtypeH264, nullptr},
    {"hevc", &kSubtypeHevc, &kSubtypeHevcEs},
    {"vp9", &kSubtypeVp9, nullptr},
    {"av1", &kSubtypeAv1, nullptr},
};

/// Whether a hardware decoder MFT exists for [subtype].
///
/// `MFTEnumEx` with `MFT_ENUM_FLAG_HARDWARE` returns only transforms the
/// platform knows are hardware: the vendor's DXVA/D3D11 decoder for H.264, the
/// GPU's or the OS codec package's for HEVC. The count is what matters; the
/// transforms themselves are released immediately.
bool HasHardwareDecoder(const GUID& subtype) {
  MFT_REGISTER_TYPE_INFO info = {};
  info.guidMajorType = MFMediaType_Video;
  info.guidSubtype = subtype;

  IMFActivate** activates = nullptr;
  UINT32 count = 0;

  const HRESULT result =
      MFTEnumEx(MFT_CATEGORY_VIDEO_DECODER, MFT_ENUM_FLAG_HARDWARE, nullptr, &info, &activates, &count);

  if (FAILED(result)) {
    // A machine without the Media Foundation, or without that codec, is a
    // normal answer rather than an error.
    return false;
  }

  for (UINT32 index = 0; index < count; ++index) {
    if (activates[index] != nullptr) {
      activates[index]->Release();
    }
  }

  if (activates != nullptr) {
    CoTaskMemFree(activates);
  }

  return count > 0;
}

/// The codec section: one entry per codec that has a hardware decoder.
EncodableMap ProbeCodecs() {
  EncodableMap video;

  for (const CodecProbe& probe : kCodecProbes) {
    const bool hardware = HasHardwareDecoder(*probe.subtype) ||
                          (probe.alternative != nullptr && HasHardwareDecoder(*probe.alternative));

    if (!hardware) {
      continue;
    }

    // Windows enumerates decoders but does not report their size limits, so the
    // limits stay 0 — the Dart side reads that as "unknown", and a codec with a
    // hardware decoder is then accepted at any resolution instead of refused.
    EncodableMap entry;
    entry[EncodableValue("hardware")] = EncodableValue(true);
    entry[EncodableValue("maxWidth")] = EncodableValue(0);
    entry[EncodableValue("maxHeight")] = EncodableValue(0);
    entry[EncodableValue("maxFrameRate")] = EncodableValue(0);

    video[EncodableValue(probe.name)] = EncodableValue(entry);
  }

  EncodableMap codecs;
  codecs[EncodableValue("reported")] = EncodableValue(true);
  codecs[EncodableValue("video")] = EncodableValue(video);

  return codecs;
}

/// Memory and CPU counts.
EncodableMap ProbeDevice() {
  EncodableMap device;

  MEMORYSTATUSEX memory = {};
  memory.dwLength = sizeof(MEMORYSTATUSEX);

  if (GlobalMemoryStatusEx(&memory)) {
    device[EncodableValue("totalRamMb")] =
        EncodableValue(static_cast<int>(memory.ullTotalPhys / (1024ULL * 1024ULL)));
  }

  SYSTEM_INFO system = {};
  GetNativeSystemInfo(&system);

  device[EncodableValue("cpuCores")] = EncodableValue(static_cast<int>(system.dwNumberOfProcessors));

  // Every Windows device this app runs on is 64-bit; reporting otherwise would
  // tune playback down for nothing.
  device[EncodableValue("supports64BitAbi")] = EncodableValue(true);
  // `isLowRamDevice` is Android's own classification. Windows has none, and
  // inventing one from a memory number would tune devices down on a guess.
  device[EncodableValue("lowRamDevice")] = EncodableValue(false);
  device[EncodableValue("reported")] = EncodableValue(true);

  return device;
}

/// Whether an attached output reports HDR, and whether more than one is
/// attached.
struct DisplayFacts {
  bool hdr = false;
  bool multipleOutputs = false;
};

DisplayFacts ProbeDisplays() {
  DisplayFacts facts;

  IDXGIFactory1* factory = nullptr;

  if (FAILED(CreateDXGIFactory1(__uuidof(IDXGIFactory1), reinterpret_cast<void**>(&factory))) || factory == nullptr) {
    return facts;
  }

  int outputs = 0;

  for (UINT adapter_index = 0;; ++adapter_index) {
    IDXGIAdapter1* adapter = nullptr;

    if (factory->EnumAdapters1(adapter_index, &adapter) == DXGI_ERROR_NOT_FOUND || adapter == nullptr) {
      break;
    }

    for (UINT output_index = 0;; ++output_index) {
      IDXGIOutput* output = nullptr;

      if (adapter->EnumOutputs(output_index, &output) == DXGI_ERROR_NOT_FOUND || output == nullptr) {
        break;
      }

      ++outputs;

      IDXGIOutput6* output6 = nullptr;

      if (SUCCEEDED(output->QueryInterface(__uuidof(IDXGIOutput6), reinterpret_cast<void**>(&output6))) &&
          output6 != nullptr) {
        DXGI_OUTPUT_DESC1 description = {};

        if (SUCCEEDED(output6->GetDesc1(&description))) {
          // PQ (SMPTE ST 2084) and scRGB are what an HDR display reports; a
          // luminance number alone is not proof of an HDR pipeline.
          const bool pq = description.ColorSpace == DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020;
          const bool scrgb = description.ColorSpace == DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709;

          if (pq || scrgb || description.MaxLuminance > 400.0f) {
            facts.hdr = true;
          }
        }

        output6->Release();
      }

      output->Release();
    }

    adapter->Release();
  }

  factory->Release();

  facts.multipleOutputs = outputs > 1;

  return facts;
}

/// The processor architecture this build targets.
std::string Architecture() {
  SYSTEM_INFO system = {};
  GetNativeSystemInfo(&system);

  switch (system.wProcessorArchitecture) {
    case PROCESSOR_ARCHITECTURE_AMD64:
      return "x86_64";

    case PROCESSOR_ARCHITECTURE_ARM64:
      return "arm64";

    case PROCESSOR_ARCHITECTURE_INTEL:
      return "x86";

    default:
      return "unknown";
  }
}

/// The real OS version.
///
/// `GetVersionEx` reports 6.2 for every process without an application
/// manifest, which is why the probe asks ntdll instead.
std::string WindowsVersion() {
  using RtlGetVersionFn = LONG(WINAPI*)(PRTL_OSVERSIONINFOW);

  HMODULE ntdll = LoadLibraryW(L"ntdll.dll");

  if (ntdll == nullptr) {
    return std::string();
  }

  auto rtl_get_version = reinterpret_cast<RtlGetVersionFn>(GetProcAddress(ntdll, "RtlGetVersion"));

  if (rtl_get_version == nullptr) {
    FreeLibrary(ntdll);
    return std::string();
  }

  RTL_OSVERSIONINFOW version = {};
  version.dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOW);

  const LONG result = rtl_get_version(&version);

  FreeLibrary(ntdll);

  if (result != 0) {
    return std::string();
  }

  return std::to_string(version.dwMajorVersion) + "." + std::to_string(version.dwMinorVersion) + "." +
         std::to_string(version.dwBuildNumber);
}

}  // namespace

EncodableMap ProbePlatform() {
  EncodableMap payload;

  // The Media Foundation has to be up before MFTEnumEx answers, and DXGI needs
  // COM on this thread.
  const bool com_ready = SUCCEEDED(CoInitializeEx(nullptr, COINIT_MULTITHREADED));
  const bool mf_ready = SUCCEEDED(MFStartup(MF_VERSION, MFSTARTUP_LITE));

  const std::string version = WindowsVersion();

  EncodableMap info;
  info[EncodableValue("type")] = EncodableValue("windows");
  info[EncodableValue("name")] = EncodableValue("Windows");
  info[EncodableValue("version")] = EncodableValue(version.empty() ? std::string("unknown") : version);
  info[EncodableValue("architecture")] = EncodableValue(Architecture());
  info[EncodableValue("isEmulator")] = EncodableValue(false);
  payload[EncodableValue("info")] = EncodableValue(info);

  const DisplayFacts displays = ProbeDisplays();

  EncodableMap capabilities;
  capabilities[EncodableValue("hardwareDecode")] = EncodableValue(true);
  capabilities[EncodableValue("softwareDecode")] = EncodableValue(true);
  capabilities[EncodableValue("videoRendering")] = EncodableValue(true);
  capabilities[EncodableValue("audioPlayback")] = EncodableValue(true);
  capabilities[EncodableValue("subtitleRendering")] = EncodableValue(true);
  capabilities[EncodableValue("fullscreen")] = EncodableValue(true);
  capabilities[EncodableValue("networkPlayback")] = EncodableValue(true);
  capabilities[EncodableValue("localPlayback")] = EncodableValue(true);
  // Windows serves picture-in-picture as an in-app floating window rather than
  // as an OS feature, so the platform itself answers no.
  capabilities[EncodableValue("pictureInPicture")] = EncodableValue(false);
  capabilities[EncodableValue("externalDisplay")] = EncodableValue(displays.multipleOutputs);
  payload[EncodableValue("capabilities")] = EncodableValue(capabilities);

  payload[EncodableValue("device")] = EncodableValue(ProbeDevice());
  // Without the Media Foundation there is no codec answer at all, which the
  // Dart side reads as unknown rather than as "no hardware decoders".
  payload[EncodableValue("codecs")] = EncodableValue(mf_ready ? ProbeCodecs() : EncodableMap{});

  if (mf_ready) {
    MFShutdown();
  }

  if (com_ready) {
    CoUninitialize();
  }

  return payload;
}

}  // namespace media_core_native
