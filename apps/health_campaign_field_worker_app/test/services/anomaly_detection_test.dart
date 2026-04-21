import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:health_campaign_field_worker_app/services/anomaly_detection_service.dart';

FaceAuthEventModel _makeEvent({
  double latitude = 9.0,
  double longitude = 7.0,
  int timestamp = 1000000000000,
  String outcome = 'FACE_SUCCESS',
  String eventType = 'CHECK_IN',
}) {
  return FaceAuthEventModel(
    clientReferenceId: 'test-${timestamp.hashCode}',
    individualId: 'user1',
    deviceId: 'device1',
    eventType: eventType,
    outcome: outcome,
    confidence: 0.85,
    latitude: latitude,
    longitude: longitude,
    locationAccuracy: 10.0,
    timestamp: timestamp,
    failedAttemptCount: 0,
    projectId: 'proj1',
    isSync: false,
    boundaryCode: 'bc1',
  );
}

void main() {
  late AnomalyDetectionService service;

  setUp(() {
    service = const AnomalyDetectionService();
  });

  group('Location Velocity', () {
    test('flags events with impossible travel speed', () {
      // Two events 100km apart but only 1 minute apart
      final prev = _makeEvent(
        latitude: 9.0,
        longitude: 7.0,
        timestamp: 1000000000000,
      );
      final current = _makeEvent(
        latitude: 9.9, // ~100km north
        longitude: 7.0,
        timestamp: 1000000060000, // 1 minute later
      );

      final flags = service.analyze(current, [prev]);
      expect(flags, contains(AnomalyFlags.locationVelocity));
    });

    test('does not flag events with reasonable travel speed', () {
      final prev = _makeEvent(
        latitude: 9.0,
        longitude: 7.0,
        timestamp: 1000000000000,
      );
      final current = _makeEvent(
        latitude: 9.001, // ~100m north
        longitude: 7.0,
        timestamp: 1000003600000, // 1 hour later
      );

      final flags = service.analyze(current, [prev]);
      expect(flags, isNot(contains(AnomalyFlags.locationVelocity)));
    });
  });

  group('Repeated PIN Use', () {
    test('flags consecutive PIN fallbacks', () {
      final recent = List.generate(
        3,
        (i) => _makeEvent(
          outcome: 'PIN_FALLBACK',
          timestamp: 1000000000000 + i * 60000,
        ),
      );
      final current =
          _makeEvent(outcome: 'PIN_FALLBACK', timestamp: 1000000180000);

      final flags = service.analyze(current, recent);
      expect(flags, contains(AnomalyFlags.repeatedPinUse));
    });

    test('does not flag when PIN use is not consecutive', () {
      final recent = [
        _makeEvent(outcome: 'PIN_FALLBACK', timestamp: 1000000000000),
        _makeEvent(outcome: 'FACE_SUCCESS', timestamp: 1000000060000),
      ];
      final current =
          _makeEvent(outcome: 'PIN_FALLBACK', timestamp: 1000000120000);

      final flags = service.analyze(current, recent);
      expect(flags, isNot(contains(AnomalyFlags.repeatedPinUse)));
    });
  });

  group('Missed Re-Verification', () {
    test('flags when MISSED events exist today', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final recent = [
        _makeEvent(outcome: 'MISSED', timestamp: now - 3600000),
      ];
      final current = _makeEvent(outcome: 'FACE_SUCCESS', timestamp: now);

      final flags = service.analyze(current, recent);
      expect(flags, contains(AnomalyFlags.missedReVerification));
    });
  });

  group('Fallback Overuse', () {
    test('flags when fallback rate exceeds threshold', () {
      // 6 out of 10 events are fallbacks = 60% > 50%
      final recent = List.generate(9, (i) {
        return _makeEvent(
          outcome: i < 6 ? 'PIN_FALLBACK' : 'FACE_SUCCESS',
          timestamp: 1000000000000 + i * 60000,
        );
      });
      final current =
          _makeEvent(outcome: 'PIN_FALLBACK', timestamp: 1000000600000);

      final flags = service.analyze(current, recent);
      expect(flags, contains(AnomalyFlags.fallbackOveruse));
    });

    test('does not flag when fallback rate is low', () {
      final recent = List.generate(9, (i) {
        return _makeEvent(
          outcome: i < 2 ? 'PIN_FALLBACK' : 'FACE_SUCCESS',
          timestamp: 1000000000000 + i * 60000,
        );
      });
      final current =
          _makeEvent(outcome: 'FACE_SUCCESS', timestamp: 1000000600000);

      final flags = service.analyze(current, recent);
      expect(flags, isNot(contains(AnomalyFlags.fallbackOveruse)));
    });
  });
}
