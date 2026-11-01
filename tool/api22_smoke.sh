#!/usr/bin/env bash
set -Eeuo pipefail

output="${1:-dist}"
package="com.coxxa.purelive.tv.android5"
mkdir -p "$output"

# Keep startup evidence even when installation, launch, or a later check fails.
# Saving evidence must not replace the exit status of the failing check.
capture_evidence() {
  local status=$?
  trap - EXIT
  adb logcat -d > "$output/api22-logcat.txt" 2>&1 || true
  adb exec-out screencap -p > "$output/api22-startup.png" || true
  exit "$status"
}
trap capture_evidence EXIT

adb install "$output/PureLive-TV-android5-x86_64-skia.apk"
adb logcat -c
# An explicit component avoids implicit-intent resolution on the API22 image.
adb shell am start -W -n "$package/.MainActivity" | tee "$output/api22-launch.txt"
grep -Eq '^Status: ok' "$output/api22-launch.txt"
sleep 20
adb shell ps > "$output/api22-processes.txt"
grep -F "$package" "$output/api22-processes.txt"
adb logcat -d > "$output/api22-logcat.txt"
! grep -E 'FATAL EXCEPTION|dlopen failed|cannot locate symbol' "$output/api22-logcat.txt"
