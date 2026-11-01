import 'dart:async';
import 'dart:io';

typedef RemoteSyncAddressLookup = Future<List<String>> Function(String host);

/// Bonsoir 6 exposes one host, which can be a numeric address or a hostname.
/// Resolve hostnames to all IPv4 addresses before applying the LAN preference.
Future<String?> resolveRemoteSyncIpv4({
  required String? host,
  required String localIp,
  String? advertisedIp,
  RemoteSyncAddressLookup? lookup,
  Duration timeout = const Duration(seconds: 2),
}) async {
  final value = host?.trim() ?? '';
  final addresses = <String>[];
  if (value.isNotEmpty) {
    final literal = InternetAddress.tryParse(value);
    if (literal != null) {
      if (literal.type == InternetAddressType.IPv4) {
        addresses.add(literal.address);
      }
    } else {
      try {
        final resolve = lookup ?? _lookupIpv4;
        addresses.addAll(await resolve(value).timeout(timeout));
      } on SocketException {
        // The TXT address remains usable when .local resolution is unavailable.
      } on TimeoutException {
        // Discovery must not wait indefinitely for a failed DNS lookup.
      }
    }
  }
  return selectRemoteSyncIpv4(
    addresses,
    localIp: localIp,
    advertisedIp: advertisedIp,
  );
}

Future<List<String>> _lookupIpv4(String host) async =>
    (await InternetAddress.lookup(
      host,
      type: InternetAddressType.IPv4,
    )).map((address) => address.address).toList();

String? selectRemoteSyncIpv4(
  Iterable<String> addresses, {
  required String localIp,
  String? advertisedIp,
}) {
  final valid = addresses.map((ip) => ip.trim()).where(_isIpv4).toSet();
  final prefix = _prefix(localIp);
  for (final ip in valid) {
    if (prefix != null && _prefix(ip) == prefix) return ip;
  }
  for (final ip in valid) {
    if (_isPrivate(ip)) return ip;
  }
  if (valid.isNotEmpty) return valid.first;
  final advertised = advertisedIp?.trim();
  return advertised != null && _isIpv4(advertised) ? advertised : null;
}

bool _isIpv4(String value) =>
    InternetAddress.tryParse(value)?.type == InternetAddressType.IPv4;

String? _prefix(String value) {
  if (!_isIpv4(value)) return null;
  return value.split('.').take(3).join('.');
}

bool _isPrivate(String value) {
  final parts = value.split('.').map(int.parse).toList();
  return parts[0] == 10 ||
      (parts[0] == 172 && parts[1] >= 16 && parts[1] <= 31) ||
      (parts[0] == 192 && parts[1] == 168);
}
