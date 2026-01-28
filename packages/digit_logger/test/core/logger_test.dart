import 'package:digit_logger/digit_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DigitLogger', () {
    late MemoryTarget memoryTarget;
    late MemoryStorage memoryStorage;

    setUp(() async {
      DigitLogger.reset();
      memoryTarget = MemoryTarget();
      memoryStorage = MemoryStorage();
    });

    tearDown(() async {
      await DigitLogger.dispose();
      DigitLogger.reset();
    });

    group('initialization', () {
      test('initializes successfully with test config', () async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        expect(DigitLogger.isInitialized, isTrue);
      });

      test('throws on double initialization', () async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        expect(
          () => DigitLogger.init(
            config: LogConfig.test(
              memoryTarget: memoryTarget,
              memoryStorage: memoryStorage,
            ),
          ),
          throwsStateError,
        );
      });

      test('instance throws if not initialized', () {
        expect(() => DigitLogger.instance, throwsStateError);
      });
    });

    group('pre-init buffer', () {
      test('buffers logs before init', () async {
        // Log before init
        DigitLogger.info('Pre-init log 1');
        DigitLogger.warn('Pre-init log 2');
        DigitLogger.error('Pre-init log 3');

        // Initialize
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        // Check that buffered logs were written
        expect(memoryTarget.entries.length, equals(3));
        expect(memoryTarget.entries[0].message, equals('Pre-init log 1'));
        expect(memoryTarget.entries[1].message, equals('Pre-init log 2'));
        expect(memoryTarget.entries[2].message, equals('Pre-init log 3'));
      });

      test('preserves log levels in buffer', () async {
        DigitLogger.trace('Trace log');
        DigitLogger.debug('Debug log');
        DigitLogger.info('Info log');

        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        expect(memoryTarget.entries[0].level, equals(LogLevel.trace));
        expect(memoryTarget.entries[1].level, equals(LogLevel.debug));
        expect(memoryTarget.entries[2].level, equals(LogLevel.info));
      });
    });

    group('logging', () {
      setUp(() async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );
      });

      test('logs at all levels', () {
        DigitLogger.trace('Trace message');
        DigitLogger.debug('Debug message');
        DigitLogger.info('Info message');
        DigitLogger.warn('Warn message');
        DigitLogger.error('Error message');
        DigitLogger.fatal('Fatal message');

        expect(memoryTarget.entries.length, equals(6));
      });

      test('includes category in logs', () {
        DigitLogger.info('Test message', category: LogCategory.schema);

        expect(memoryTarget.lastEntry?.category, equals(LogCategory.schema));
      });

      test('includes context in logs', () {
        DigitLogger.info(
          'Test message',
          context: {'key': 'value', 'number': 42},
        );

        expect(memoryTarget.lastEntry?.context?['key'], equals('value'));
        expect(memoryTarget.lastEntry?.context?['number'], equals(42));
      });

      test('includes error and stack trace in error logs', () {
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        DigitLogger.error(
          'Error occurred',
          error: error,
          stackTrace: stackTrace,
        );

        expect(memoryTarget.lastEntry?.error, equals(error));
        expect(memoryTarget.lastEntry?.stackTrace, isNotNull);
      });

      test('assigns sequential sequence numbers', () {
        DigitLogger.info('Log 1');
        DigitLogger.info('Log 2');
        DigitLogger.info('Log 3');

        expect(memoryTarget.entries[0].sequenceNumber, equals(0));
        expect(memoryTarget.entries[1].sequenceNumber, equals(1));
        expect(memoryTarget.entries[2].sequenceNumber, equals(2));
      });

      test('all logs share the same session ID', () {
        DigitLogger.info('Log 1');
        DigitLogger.info('Log 2');

        final sessionId = memoryTarget.entries[0].sessionId;
        expect(memoryTarget.entries[1].sessionId, equals(sessionId));
      });
    });

    group('category loggers', () {
      setUp(() async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );
      });

      test('schema logger uses schema category', () {
        DigitLogger.schema.info('Schema log');

        expect(memoryTarget.lastEntry?.category, equals(LogCategory.schema));
      });

      test('network logger uses network category', () {
        DigitLogger.network.error('Network log');

        expect(memoryTarget.lastEntry?.category, equals(LogCategory.network));
      });
    });

    group('scoped logger', () {
      setUp(() async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );
      });

      test('scoped logger shares correlation ID', () {
        final scopedLog = DigitLogger.scope(
          operation: 'testOperation',
          correlationId: 'test-correlation-id',
        );

        scopedLog.info('Log 1');
        scopedLog.info('Log 2');

        expect(
          memoryTarget.entries[0].correlationId,
          equals('test-correlation-id'),
        );
        expect(
          memoryTarget.entries[1].correlationId,
          equals('test-correlation-id'),
        );
      });

      test('scoped logger includes base context', () {
        final scopedLog = DigitLogger.scope(
          operation: 'testOperation',
          context: {'baseKey': 'baseValue'},
        );

        scopedLog.info('Log message', context: {'extraKey': 'extraValue'});

        expect(
          memoryTarget.lastEntry?.context?['baseKey'],
          equals('baseValue'),
        );
        expect(
          memoryTarget.lastEntry?.context?['extraKey'],
          equals('extraValue'),
        );
        expect(
          memoryTarget.lastEntry?.context?['operation'],
          equals('testOperation'),
        );
      });
    });

    group('health check', () {
      test('returns uninitialized status before init', () async {
        final health = await DigitLogger.healthCheck();

        expect(health.isInitialized, isFalse);
      });

      test('returns healthy status after init', () async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        final health = await DigitLogger.healthCheck();

        expect(health.isInitialized, isTrue);
        expect(health.isHealthy, isTrue);
      });

      test('tracks total logs written', () async {
        await DigitLogger.init(
          config: LogConfig.test(
            memoryTarget: memoryTarget,
            memoryStorage: memoryStorage,
          ),
        );

        DigitLogger.info('Log 1');
        DigitLogger.info('Log 2');
        DigitLogger.info('Log 3');

        final health = await DigitLogger.healthCheck();

        expect(health.totalLogsWritten, equals(3));
      });
    });
  });
}
