import 'package:digit_telemetry_service/digit_telemetry_service.dart';
import 'package:flutter_test/flutter_test.dart';

/// Records the calls DigitTelemetry makes to its provider.
class _RecordingProvider implements TelemetryProvider {
  _RecordingProvider({this.configured = true, this.failing = false});

  final bool configured;
  final bool failing;
  final calls = <String>[];
  TelemetryProperties? lastProperties;

  Future<void> _record(String call, [TelemetryProperties? properties]) async {
    calls.add(call);
    lastProperties = properties;
    if (failing) throw StateError('provider failed');
  }

  @override
  String get name => 'recording';
  @override
  bool get isConfigured => configured;
  @override
  Future<void> start() => _record('start');
  @override
  Future<void> stop() => _record('stop');
  @override
  Future<void> identify(String userId, TelemetryProperties? properties) =>
      _record('identify:$userId', properties);
  @override
  Future<void> reset() => _record('reset');
  @override
  Future<void> screen(String name, TelemetryProperties? properties) =>
      _record('screen:$name', properties);
  @override
  Future<void> capture(String event, TelemetryProperties? properties) =>
      _record('capture:$event', properties);
  @override
  Future<void> register(TelemetryProperties properties) =>
      _record('register', properties);
}

void main() {
  group('DigitTelemetry.instance', () {
    tearDown(DigitTelemetry.resetForTesting);

    test('reading it before initialize() fails in debug builds', () {
      DigitTelemetry.resetForTesting();
      expect(() => DigitTelemetry.instance, throwsA(isA<AssertionError>()));
    });

    test('returns the instance created by initialize()', () {
      final created = DigitTelemetry.initialize(_RecordingProvider());
      expect(identical(DigitTelemetry.instance, created), isTrue);
    });
  });

  test('identity and super properties set before start are applied on start',
      () async {
    final provider = _RecordingProvider();
    final telemetry = DigitTelemetry(provider);

    await telemetry.identify('user-1', properties: {'roles': 'DISTRIBUTOR'});
    await telemetry.setSuperProperties({'tenant_id': 'qa'});
    await telemetry.track('dropped_while_stopped');
    expect(provider.calls, isEmpty);

    await telemetry.start();
    expect(provider.calls, ['start', 'register', 'identify:user-1']);
    expect(telemetry.isEnabled, isTrue);

    await telemetry.track('app_started');
    expect(provider.calls.last, 'capture:app_started');
  });

  test('a provider that is not configured is never started', () async {
    final provider = _RecordingProvider(configured: false);
    final telemetry = DigitTelemetry(provider);

    await telemetry.start();
    await telemetry.track('event');
    expect(provider.calls, isEmpty);
    expect(telemetry.isEnabled, isFalse);
  });

  test('provider errors never reach the caller', () async {
    final telemetry = DigitTelemetry(_RecordingProvider(failing: true));
    await telemetry.start();
    await expectLater(telemetry.track('event'), completes);
    await expectLater(telemetry.screen('screen'), completes);
  });

  test('personal-looking keys and unsupported values are dropped', () {
    final cleaned = DigitTelemetry.clean({
      'name': 'Asha',
      'head_name': 'Ravi',
      'mobile_number': '98765',
      'email': 'a@b.c',
      'screen_name': 'aefiOverview',
      'flow_name': 'AEFI',
      'count': 3,
      'ok': true,
      'list': ['not', 'sent'],
      'long': 'x' * 300,
    })!;

    expect(cleaned.keys, containsAll(['screen_name', 'flow_name', 'count', 'ok']));
    expect(cleaned.keys,
        isNot(anyOf(contains('name'), contains('head_name'),
            contains('mobile_number'), contains('email'), contains('list'))));
    expect((cleaned['long'] as String).length, DigitTelemetry.maxTextLength);
  });

  test('stop and start again', () async {
    final provider = _RecordingProvider();
    final telemetry = DigitTelemetry(provider);
    await telemetry.start();
    await telemetry.stop();
    await telemetry.track('dropped');
    await telemetry.start();
    expect(provider.calls, ['start', 'stop', 'start']);
  });
}
