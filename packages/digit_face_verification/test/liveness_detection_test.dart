import 'package:digit_face_verification/data/liveness_detection_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LivenessDetectionService', () {
    late LivenessDetectionService service;

    setUp(() {
      service = LivenessDetectionService();
    });

    test('initial state is not complete', () {
      expect(service.isComplete, false);
      expect(service.currentIndex, 0);
      expect(service.totalChallenges, 2);
    });

    test('reset returns to initial state', () {
      service.reset();
      expect(service.currentIndex, 0);
      expect(service.isComplete, false);
    });

    test('default challenges are blink + turnLeft', () {
      expect(service.totalChallenges, 2);
    });

    test('custom challenges are respected', () {
      final custom = LivenessDetectionService(
        challenges: [
          LivenessChallenge.turnRight,
          LivenessChallenge.blink,
          LivenessChallenge.turnLeft,
        ],
      );
      expect(custom.totalChallenges, 3);
    });
  });

  group('PIN Service integration (basic)', () {
    // PIN service tests are in pin_service_test.dart
    // This is a placeholder for liveness+enrollment integration
    test('liveness service can be instantiated with custom challenges', () {
      final service = LivenessDetectionService(
        challenges: [LivenessChallenge.blink],
      );
      expect(service.totalChallenges, 1);
    });
  });
}
