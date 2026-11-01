import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pure_live/services/remote_sync/remote_sync_address.dart';

void main() {
  test('Bonjour numeric host is used without another DNS request', () async {
    final ip = await resolveRemoteSyncIpv4(
      host: '192.168.6.8',
      localIp: '192.168.6.2',
      advertisedIp: '10.0.0.8',
      lookup: (_) => throw StateError('numeric hosts must not use DNS'),
    );
    expect(ip, '192.168.6.8');
  });

  test(
    'all resolved addresses participate in same-network selection',
    () async {
      final ip = await resolveRemoteSyncIpv4(
        host: 'peer.local',
        localIp: '192.168.6.2',
        lookup: (host) async {
          expect(host, 'peer.local');
          return ['2001:db8::8', '8.8.8.8', '10.0.0.8', '192.168.6.8'];
        },
      );
      expect(ip, '192.168.6.8');
    },
  );

  test('prefers private IPv4 and otherwise retains the first IPv4', () {
    expect(
      selectRemoteSyncIpv4([
        '2001:db8::8',
        '8.8.8.8',
        '172.16.0.8',
      ], localIp: '192.168.6.2'),
      '172.16.0.8',
    );
    expect(
      selectRemoteSyncIpv4(['8.8.8.8', '1.1.1.1'], localIp: '192.168.6.2'),
      '8.8.8.8',
    );
  });

  test(
    'unresolved and IPv6-only services fall back to the advertised IPv4',
    () async {
      expect(
        await resolveRemoteSyncIpv4(
          host: null,
          localIp: '192.168.6.2',
          advertisedIp: '192.168.6.9',
        ),
        '192.168.6.9',
      );
      expect(
        await resolveRemoteSyncIpv4(
          host: '2001:db8::8',
          localIp: '192.168.6.2',
          advertisedIp: '192.168.6.9',
        ),
        '192.168.6.9',
      );
      expect(
        await resolveRemoteSyncIpv4(
          host: null,
          localIp: '192.168.6.2',
          advertisedIp: 'not-an-ip',
        ),
        isNull,
      );
    },
  );

  test(
    'DNS failure or timeout does not discard a usable TXT address',
    () async {
      expect(
        await resolveRemoteSyncIpv4(
          host: 'unreachable.local',
          localIp: '192.168.6.2',
          advertisedIp: '192.168.6.9',
          lookup: (_) => Future.error(const SocketException('not found')),
        ),
        '192.168.6.9',
      );
      expect(
        await resolveRemoteSyncIpv4(
          host: 'slow.local',
          localIp: '192.168.6.2',
          advertisedIp: '192.168.6.9',
          lookup: (_) => Completer<List<String>>().future,
          timeout: const Duration(milliseconds: 1),
        ),
        '192.168.6.9',
      );
    },
  );
}
