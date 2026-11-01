/// media_kit backend adapter for media_core.
///
/// Before using this adapter, call [MediaKitPlayerAdapter.ensureInitialized]
/// (typically in `main`) to load the native media_kit libraries.
///
/// ```dart
/// void main() {
///   MediaKitPlayerAdapter.ensureInitialized();
///   runApp(const MyApp());
/// }
/// ```
///
/// The engines themselves are re-exported below: depending on this adapter is
/// enough to reach `Media`, `Video`, `VideoController`, `PlayerConfiguration`
/// and the rest of media_kit / media_kit_video. The Android 5 distribution
/// supplies native libraries through the pinned media_kit_libs_video package.
library;

// Adapter, configs, factory, view.
export 'package:media_core_media_kit/src/media_kit_player_adapter.dart';
export 'package:media_core_media_kit/src/media_kit_player_config.dart';
export 'package:media_core_media_kit/src/media_kit_video_config.dart';
export 'package:media_core_media_kit/src/media_kit_adapter_factory.dart';
export 'package:media_core_media_kit/src/media_kit_video_view.dart';

// Public utils: settings UIs, diagnostics, tuning.
export 'package:media_core_media_kit/src/utils/player_consts.dart' show PlayerConsts;
export 'package:media_core_media_kit/src/utils/mpv_platform_profile.dart' show MpvPlatformProfile;
export 'package:media_core_media_kit/src/utils/mpv_decode_policy.dart' show MpvDecodePolicy;
export 'package:media_core_media_kit/src/utils/live_buffer_policy.dart' show LiveBufferPolicy;

// The upstream packages this adapter is built on, re-exported so a host gets
// them from its single dependency on this adapter.
//
// `Player` and `PlayerState` are hidden because media_core exports its own
// types under those names; an importer of both barrels would be ambiguous
// about them. (Prefixed re-exports are not a thing in Dart, so a host that
// needs the upstream `Player`/`PlayerState` spells them out by importing
// package:media_kit/media_kit.dart itself.)
export 'package:media_kit/media_kit.dart' hide Player, PlayerState;
export 'package:media_kit_video/media_kit_video.dart';
