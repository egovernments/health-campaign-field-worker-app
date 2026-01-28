import 'package:digit_logger/digit_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompactFormatter', () {
    late CompactFormatter formatter;
    late LogEntry testEntry;

    setUp(() {
      formatter = const CompactFormatter();
      testEntry = LogEntry(
        level: LogLevel.info,
        category: LogCategory.general,
        message: 'Test message',
        sessionId: 'test-session',
        sequenceNumber: 1,
      );
    });

    test('formats log entry as single line', () {
      final result = formatter.format(testEntry);
      expect(result.contains('\n'), isFalse);
    });

    test('includes timestamp in ISO 8601 format', () {
      final result = formatter.format(testEntry);
      expect(
        result,
        matches(RegExp(r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}')),
      );
    });

    test('includes level code', () {
      final result = formatter.format(testEntry);
      expect(result, contains('INF'));
    });

    test('includes category code', () {
      final result = formatter.format(testEntry);
      expect(result, contains('[GEN]'));
    });

    test('includes message', () {
      final result = formatter.format(testEntry);
      expect(result, contains('Test message'));
    });

    test('includes correlation ID when present', () {
      final entryWithCorr = testEntry.copyWith(correlationId: 'test-corr-123');
      final result = formatter.format(entryWithCorr);
      expect(result, contains('[corr:test-cor'));
    });

    test('includes context as JSON', () {
      final entryWithContext = testEntry.copyWith(
        context: {'key': 'value'},
      );
      final result = formatter.format(entryWithContext);
      expect(result, contains('"key":"value"'));
    });

    test('truncates long context', () {
      final longContext = <String, String>{};
      for (var i = 0; i < 50; i++) {
        longContext['key_$i'] = 'value_$i';
      }
      final entryWithLongContext = testEntry.copyWith(context: longContext);

      final result = formatter.format(entryWithLongContext);
      expect(result.length, lessThanOrEqualTo(600)); // max line + some buffer
    });

    test('formats different levels correctly', () {
      final levels = {
        LogLevel.trace: 'TRC',
        LogLevel.debug: 'DBG',
        LogLevel.info: 'INF',
        LogLevel.warn: 'WRN',
        LogLevel.error: 'ERR',
        LogLevel.fatal: 'FTL',
      };

      for (final entry in levels.entries) {
        final logEntry = testEntry.copyWith(level: entry.key);
        final result = formatter.format(logEntry);
        expect(result, contains(entry.value));
      }
    });
  });

  group('PrettyFormatter', () {
    late PrettyFormatter formatter;
    late LogEntry testEntry;

    setUp(() {
      formatter = const PrettyFormatter(useColors: false);
      testEntry = LogEntry(
        level: LogLevel.info,
        category: LogCategory.general,
        message: 'Test message',
        sessionId: 'test-session',
        sequenceNumber: 1,
      );
    });

    test('formats log entry with box characters', () {
      final result = formatter.format(testEntry);
      expect(result, contains('┌'));
      expect(result, contains('└'));
      expect(result, contains('│'));
    });

    test('includes time in HH:MM:SS.mmm format', () {
      final result = formatter.format(testEntry);
      expect(result, matches(RegExp(r'\d{2}:\d{2}:\d{2}\.\d{3}')));
    });

    test('includes level code', () {
      final result = formatter.format(testEntry);
      expect(result, contains('INF'));
    });

    test('includes category code', () {
      final result = formatter.format(testEntry);
      expect(result, contains('GEN'));
    });

    test('includes message', () {
      final result = formatter.format(testEntry);
      expect(result, contains('Test message'));
    });

    test('includes sequence number', () {
      final result = formatter.format(testEntry);
      expect(result, contains('seq: 1'));
    });

    test('includes session ID (truncated)', () {
      final result = formatter.format(testEntry);
      expect(result, contains('session:'));
    });

    test('includes source when present', () {
      final entryWithSource = testEntry.copyWith(source: 'test_file.dart:42');
      final result = formatter.format(entryWithSource);
      expect(result, contains('source: test_file.dart:42'));
    });

    test('includes context when present', () {
      final entryWithContext = testEntry.copyWith(
        context: {'key': 'value'},
      );
      final result = formatter.format(entryWithContext);
      expect(result, contains('context:'));
      expect(result, contains('key:'));
    });

    test('includes error when present', () {
      final error = Exception('Test error');
      final entryWithError = testEntry.copyWith(error: error);
      final result = formatter.format(entryWithError);
      expect(result, contains('error:'));
    });

    test('includes stack trace when present', () {
      final entryWithStack = testEntry.copyWith(
        stackTrace: '#0 main (test.dart:1)\n#1 other (test.dart:2)',
      );
      final result = formatter.format(entryWithStack);
      expect(result, contains('stackTrace:'));
    });
  });
}
