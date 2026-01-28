import 'package:digit_logger/digit_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CorrelationContext', () {
    test('current returns null outside of correlation context', () {
      expect(CorrelationContext.current, isNull);
    });

    test('generates unique correlation IDs', () {
      final id1 = CorrelationContext.generate();
      final id2 = CorrelationContext.generate();

      expect(id1, isNotEmpty);
      expect(id2, isNotEmpty);
      expect(id1, isNot(equals(id2)));
    });

    test('run propagates correlation ID to nested code', () async {
      const correlationId = 'test-correlation-id';

      await CorrelationContext.run(correlationId, () async {
        expect(CorrelationContext.current, equals(correlationId));
      });
    });

    test('run propagates correlation ID through async boundaries', () async {
      const correlationId = 'test-correlation-id';

      await CorrelationContext.run(correlationId, () async {
        // First check
        expect(CorrelationContext.current, equals(correlationId));

        // Simulate async operation
        await Future.delayed(const Duration(milliseconds: 10));

        // Should still have correlation ID
        expect(CorrelationContext.current, equals(correlationId));

        // Nested async
        await Future.microtask(() {
          expect(CorrelationContext.current, equals(correlationId));
        });
      });
    });

    test('runSync propagates correlation ID', () {
      const correlationId = 'sync-correlation-id';

      CorrelationContext.runSync(correlationId, () {
        expect(CorrelationContext.current, equals(correlationId));
      });
    });

    test('runNew generates ID and returns it with result', () async {
      final (correlationId, result) = await CorrelationContext.runNew(() async {
        expect(CorrelationContext.current, isNotNull);
        return 42;
      });

      expect(correlationId, isNotEmpty);
      expect(result, equals(42));
    });

    test('currentOrGenerate returns current if available', () {
      const correlationId = 'existing-id';

      CorrelationContext.runSync(correlationId, () {
        final result = CorrelationContext.currentOrGenerate();
        expect(result, equals(correlationId));
      });
    });

    test('currentOrGenerate generates new ID if not available', () {
      // Outside correlation context
      final result = CorrelationContext.currentOrGenerate();
      expect(result, isNotEmpty);
    });

    test('nested correlation contexts work correctly', () async {
      const outerCorrelationId = 'outer-id';
      const innerCorrelationId = 'inner-id';

      await CorrelationContext.run(outerCorrelationId, () async {
        expect(CorrelationContext.current, equals(outerCorrelationId));

        await CorrelationContext.run(innerCorrelationId, () async {
          // Inner context overrides
          expect(CorrelationContext.current, equals(innerCorrelationId));
        });

        // Outer context restored
        expect(CorrelationContext.current, equals(outerCorrelationId));
      });
    });
  });

  group('SessionManager', () {
    setUp(() {
      SessionManager.reset();
    });

    test('startSession generates a session ID', () {
      final sessionId = SessionManager.startSession();

      expect(sessionId, isNotEmpty);
      expect(SessionManager.hasActiveSession, isTrue);
    });

    test('current returns existing session ID', () {
      final sessionId = SessionManager.startSession();

      expect(SessionManager.current, equals(sessionId));
    });

    test('current auto-generates session if not started', () {
      expect(SessionManager.hasActiveSession, isFalse);

      final sessionId = SessionManager.current;

      expect(sessionId, isNotEmpty);
      expect(SessionManager.hasActiveSession, isTrue);
    });

    test('endSession clears session', () {
      SessionManager.startSession();
      expect(SessionManager.hasActiveSession, isTrue);

      SessionManager.endSession();
      expect(SessionManager.hasActiveSession, isFalse);
    });

    test('new session after end has different ID', () {
      final sessionId1 = SessionManager.startSession();
      SessionManager.endSession();
      final sessionId2 = SessionManager.startSession();

      expect(sessionId1, isNot(equals(sessionId2)));
    });
  });
}
