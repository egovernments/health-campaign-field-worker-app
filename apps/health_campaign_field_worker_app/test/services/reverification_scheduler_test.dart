import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/services/reverification_scheduler.dart';

void main() {
  group('ReVerificationScheduler', () {
    test('can be instantiated', () {
      final scheduler = ReVerificationScheduler();
      expect(scheduler, isNotNull);
    });

    test('triggers stream is a broadcast stream', () {
      final scheduler = ReVerificationScheduler();
      expect(scheduler.triggers.isBroadcast, true);
      scheduler.dispose();
    });

    test('currentSchedule is initially empty', () {
      final scheduler = ReVerificationScheduler();
      expect(scheduler.currentSchedule, isEmpty);
      scheduler.dispose();
    });
  });

  group('ReVerificationTrigger', () {
    test('holds scheduled time and index', () {
      final trigger = ReVerificationTrigger(
        scheduledTime: DateTime(2026, 3, 13, 10, 30),
        triggerIndex: 0,
      );
      expect(trigger.scheduledTime.hour, 10);
      expect(trigger.scheduledTime.minute, 30);
      expect(trigger.triggerIndex, 0);
    });
  });
}
