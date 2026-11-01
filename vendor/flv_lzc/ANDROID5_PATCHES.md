# Android 5 compatibility patches

Source: https://github.com/liuchuancong/flv_lzc
Commit: `162030d642857109048a8e6858d502b8d73c754a`.

This distribution retains the Android implementation, Dart API, MIT license,
contributors, and bundled IJK/FFmpeg AAR with its LGPL notice and patch files.
The iOS implementation and development caches are omitted.
The package targets Flutter 3.32.8 / Dart 3.8.1; Android compile SDK is 35.
The Android implementation uses SurfaceTexture and declares minSdk 16.
The parent app has minSdk 21 and targets API22; device validation is tracked in the app release notes.
