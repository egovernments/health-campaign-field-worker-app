import 'package:digit_telemetry_service/digit_telemetry_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class _Event {
  _Event(this.name, this.properties);
  final String name;
  final TelemetryProperties properties;
}

/// Records what the tracker sends.
class _FakeTelemetry implements TelemetryService {
  final events = <_Event>[];
  final screens = <String>[];

  @override
  bool get isEnabled => true;
  @override
  Future<void> start() async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> identify(String userId,
      {TelemetryProperties? properties}) async {}
  @override
  Future<void> reset() async {}
  @override
  Future<void> screen(String name, {TelemetryProperties? properties}) async =>
      screens.add(name);
  @override
  Future<void> track(String event, {TelemetryProperties? properties}) async =>
      events.add(_Event(event, properties ?? const {}));
  @override
  Future<void> setSuperProperties(TelemetryProperties properties) async {}

  List<String> steps() => [
        for (final e in events)
          '${e.properties['from']} → ${e.properties['to']} '
              '(${e.properties['direction']})',
      ];
}

TrackingPolicy _policy({List<String> exclude = const []}) =>
    TrackingPolicy.fromJson({
      'enabled': true,
      'modules': ['AEFI'],
      'track': ['screens', 'navigation', 'backNavigation', 'timeOnScreen'],
      'screens': {
        'include': ['*'],
        'exclude': exclude,
      },
    });

void main() {
  testWidgets('AEFI report: screens, steps and a back press', (tester) async {
    final fake = _FakeTelemetry();
    final tracker = NavigationTracker(service: fake, policy: _policy());

    tracker.moduleOpened('AEFI');
    for (final (key, forward) in [
      ('aefiOverview', true),
      ('AEFI_CREATE/aefiLocation', true),
      ('AEFI_CREATE/childDetails', true),
      ('AEFI_CREATE/aefiCaseDetails', true),
      ('AEFI_CREATE/childDetails', false), // phone back button
      ('AEFI_CREATE/aefiCaseDetails', true),
      ('AEFI_CREATE/summary', true),
    ]) {
      tracker.screenShown(key, forward: forward);
      await tester.pump();
    }
    // Submit: the form pages close and the acknowledgement opens.
    tracker.screenShown('aefiOverview', forward: false);
    tracker.screenShown('aefiAcknowledgement', forward: true);
    await tester.pump();
    tracker.homeShown();
    await tester.pump();

    expect(fake.screens, [
      'aefiOverview',
      'AEFI_CREATE/aefiLocation',
      'AEFI_CREATE/childDetails',
      'AEFI_CREATE/aefiCaseDetails',
      'AEFI_CREATE/childDetails',
      'AEFI_CREATE/aefiCaseDetails',
      'AEFI_CREATE/summary',
      'aefiAcknowledgement',
    ]);
    expect(fake.steps(), [
      'aefiOverview → AEFI_CREATE/aefiLocation (forward)',
      'AEFI_CREATE/aefiLocation → AEFI_CREATE/childDetails (forward)',
      'AEFI_CREATE/childDetails → AEFI_CREATE/aefiCaseDetails (forward)',
      'AEFI_CREATE/aefiCaseDetails → AEFI_CREATE/childDetails (back)',
      'AEFI_CREATE/childDetails → AEFI_CREATE/aefiCaseDetails (forward)',
      'AEFI_CREATE/aefiCaseDetails → AEFI_CREATE/summary (forward)',
      'AEFI_CREATE/summary → aefiAcknowledgement (forward)',
      'aefiAcknowledgement → HOME (back)',
    ]);
    expect(fake.events.every((e) => e.properties['module'] == 'AEFI'), isTrue);
    expect(fake.events.every((e) => e.properties['seconds_on_screen'] is num),
        isTrue);
  });

  testWidgets('time on screen stops while the app is in the background',
      (tester) async {
    final fake = _FakeTelemetry();
    final tracker = NavigationTracker(service: fake, policy: _policy());

    tracker.moduleOpened('AEFI');
    tracker.screenShown('aefiOverview', forward: true);
    await tester.pump();
    tracker.didChangeAppLifecycleState(AppLifecycleState.paused);
    // Real time passes while paused; it must not count.
    await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 400)));
    tracker.didChangeAppLifecycleState(AppLifecycleState.resumed);
    tracker.screenShown('AEFI_CREATE/aefiLocation', forward: true);
    await tester.pump();

    final seconds = fake.events.single.properties['seconds_on_screen'] as num;
    expect(seconds, lessThan(0.3));
  });

  testWidgets('other modules and excluded screens are not sent',
      (tester) async {
    final fake = _FakeTelemetry();
    final tracker = NavigationTracker(
      service: fake,
      policy: _policy(exclude: ['AEFI_CREATE/child*']),
    );

    tracker.moduleOpened('REGISTRATION');
    tracker.screenShown('searchBeneficiary', forward: true);
    await tester.pump();
    tracker.homeShown();
    await tester.pump();
    expect(fake.screens, isEmpty);
    expect(fake.events, isEmpty);

    tracker.moduleOpened('AEFI');
    tracker.screenShown('AEFI_CREATE/aefiLocation', forward: true);
    await tester.pump();
    tracker.screenShown('AEFI_CREATE/childDetails', forward: true);
    await tester.pump();

    expect(fake.screens, ['AEFI_CREATE/aefiLocation']);
    // The step is still sent: its `from` screen is not excluded.
    expect(fake.steps(),
        ['AEFI_CREATE/aefiLocation → AEFI_CREATE/childDetails (forward)']);
  });

  testWidgets('nothing is sent with the default (off) policy', (tester) async {
    final fake = _FakeTelemetry();
    final tracker = NavigationTracker(service: fake);

    tracker.moduleOpened('AEFI');
    tracker.screenShown('aefiOverview', forward: true);
    await tester.pump();
    tracker.screenShown('AEFI_CREATE/aefiLocation', forward: true);
    await tester.pump();

    expect(fake.screens, isEmpty);
    expect(fake.events, isEmpty);
  });

  test('wildcard patterns', () {
    expect(TrackingPolicy.matches('*', 'anything'), isTrue);
    expect(TrackingPolicy.matches('AEFI_CREATE/*', 'AEFI_CREATE/childDetails'),
        isTrue);
    expect(TrackingPolicy.matches('*/childDetails', 'AEFI_CREATE/childDetails'),
        isTrue);
    expect(TrackingPolicy.matches('aefi*', 'AEFI_CREATE'), isFalse);
    expect(TrackingPolicy.off.tracksModule('AEFI'), isFalse);
  });
}
