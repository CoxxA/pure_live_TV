/// The compatibility channel is separate from upstream Android 7+ releases.
const android5UpdateOwner = 'CoxxA';
const android5UpdateRepository = 'pure_live_TV';
const android5UpdateBranch = 'android5-compat';
const android5SupportedAbis = {'armeabi-v7a', 'arm64-v8a'};

String normalizeAndroid5Version(String value) =>
    value.trim().replaceFirst(RegExp(r'^[vV]'), '');

List<int>? _versionParts(String value) {
  final match = RegExp(
    r'^(\d+)\.(\d+)\.(\d+)-android5\.(\d+)$',
  ).firstMatch(normalizeAndroid5Version(value));
  if (match == null) return null;
  final parts = <int>[];
  for (var i = 1; i <= 4; i++) {
    final part = int.tryParse(match.group(i)!);
    if (part == null) return null;
    parts.add(part);
  }
  return parts;
}

bool isAndroid5Version(String value) => _versionParts(value) != null;

bool isNewerAndroid5Version(String latest, String current) {
  final next = _versionParts(latest);
  final installed = _versionParts(current);
  if (next == null || installed == null) return false;
  for (var i = 0; i < next.length; i++) {
    if (next[i] != installed[i]) return next[i] > installed[i];
  }
  return false;
}

String? android5AssetName(String abi) => android5SupportedAbis.contains(abi)
    ? 'PureLive-TV-android5-$abi-skia.apk'
    : null;

String? preferredAndroid5Abi(Iterable<String> deviceAbis) {
  for (final abi in deviceAbis) {
    if (android5SupportedAbis.contains(abi)) return abi;
  }
  return null;
}

/// Accept only the fork's ARM Skia packages under a compatibility release tag.
/// A mirror is added after this check, never supplied by release metadata.
bool isAndroid5Asset(String name, String url, {String? version}) {
  final uri = Uri.tryParse(url);
  if (uri == null ||
      uri.scheme != 'https' ||
      uri.host != 'github.com' ||
      uri.userInfo.isNotEmpty ||
      uri.hasQuery ||
      uri.hasFragment) {
    return false;
  }
  final segments = uri.pathSegments;
  if (segments.length != 6 ||
      segments[0] != android5UpdateOwner ||
      segments[1] != android5UpdateRepository ||
      segments[2] != 'releases' ||
      segments[3] != 'download' ||
      !isAndroid5Version(segments[4])) {
    return false;
  }
  if (version != null &&
      normalizeAndroid5Version(segments[4]) !=
          normalizeAndroid5Version(version)) {
    return false;
  }
  return android5SupportedAbis.any(
    (abi) => name == android5AssetName(abi) && segments[5] == name,
  );
}
