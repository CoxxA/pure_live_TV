# Android 5 compatibility patches

Vendored from https://github.com/liuchuancong/media_core at
`34b3cca52323e775e4defe13fc53246be59b4b2b`.

Only the core, logging, memory, native probe, live orchestration and MPV/IJK
adapters used by the TV client are included. Upstream license files are retained.

The packages are ordinary path dependencies instead of workspace members.
They target Flutter 3.32.8 / Dart 3.8.1 and use the Android 5 compatible
media_kit 1.2.0 / media_kit_video 1.3.0 / media_kit_libs_video 1.0.6 set.
The app locks media_kit_libs_android_video to 1.3.7.
FVP and Exo adapters are excluded from this distribution.

Compatibility edits: remove unsupported SurfaceProducer configuration arguments;
use vector_math 2.1-compatible scale/translate calls for surface transforms;
compile the native probe with AGP 8.7.3 and SDK 35. IJK uses ../flv_lzc
(vendored commit 162030d642857109048a8e6858d502b8d73c754a).
