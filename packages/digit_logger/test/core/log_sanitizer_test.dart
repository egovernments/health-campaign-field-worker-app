import 'package:digit_logger/digit_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LogSanitizer', () {
    group('with sanitization enabled', () {
      late LogSanitizer sanitizer;

      setUp(() {
        sanitizer = LogSanitizer(const SanitizationConfig(enabled: true));
      });

      group('sanitizeString', () {
        test('redacts phone numbers', () {
          final result = sanitizer.sanitizeString('Call me at 9876543210');
          expect(result, contains(LogSanitizer.redactedMarker));
          expect(result, isNot(contains('9876543210')));
        });

        test('redacts Aadhaar-like numbers', () {
          final result = sanitizer.sanitizeString('Aadhaar: 1234 5678 9012');
          expect(result, contains(LogSanitizer.redactedMarker));
        });

        test('redacts PAN-like numbers', () {
          final result = sanitizer.sanitizeString('PAN: ABCDE1234F');
          expect(result, contains(LogSanitizer.redactedMarker));
        });

        test('redacts password patterns', () {
          final result = sanitizer.sanitizeString('password=secret123');
          expect(result, contains(LogSanitizer.redactedMarker));
        });

        test('redacts token patterns', () {
          final result = sanitizer.sanitizeString('token: abc123xyz');
          expect(result, contains(LogSanitizer.redactedMarker));
        });

        test('redacts bearer tokens', () {
          final result = sanitizer.sanitizeString('Bearer eyJhbGciOiJIUzI1NiJ9');
          expect(result, contains(LogSanitizer.redactedMarker));
        });

        test('leaves non-sensitive data unchanged', () {
          const message = 'User logged in successfully';
          final result = sanitizer.sanitizeString(message);
          expect(result, equals(message));
        });
      });

      group('sanitizeContext', () {
        test('redacts sensitive keys', () {
          final result = sanitizer.sanitizeContext({
            'password': 'secret123',
            'token': 'abc123',
            'name': 'John',
          });

          expect(result?['password'], equals(LogSanitizer.redactedMarker));
          expect(result?['token'], equals(LogSanitizer.redactedMarker));
          expect(result?['name'], equals('John'));
        });

        test('redacts nested sensitive keys', () {
          final result = sanitizer.sanitizeContext({
            'user': {
              'email': 'test@example.com',
              'password': 'secret',
            },
          });

          final user = result?['user'] as Map<String, dynamic>?;
          expect(user?['email'], equals(LogSanitizer.redactedMarker));
          expect(user?['password'], equals(LogSanitizer.redactedMarker));
        });

        test('handles deep nesting with depth limit', () {
          final deepMap = <String, dynamic>{
            'level1': {
              'level2': {
                'level3': {
                  'level4': {
                    'level5': {
                      'level6': 'too deep',
                    },
                  },
                },
              },
            },
          };

          final result = sanitizer.sanitizeContext(deepMap);
          expect(result, isNotNull);
          // Should have truncation marker at some level
        });

        test('handles circular references', () {
          final map = <String, dynamic>{'name': 'test'};
          map['self'] = map;

          final result = sanitizer.sanitizeContext(map);
          expect(result?['self'], equals({'_circular': true}));
        });

        test('truncates long string values', () {
          final longValue = 'a' * 1000;
          final result = sanitizer.sanitizeContext({'longKey': longValue});

          expect(
            (result?['longKey'] as String).length,
            lessThanOrEqualTo(LogLimits.maxContextValueLength),
          );
        });

        test('redacts sensitive patterns in string values', () {
          final result = sanitizer.sanitizeContext({
            'message': 'Contact me at 9876543210',
          });

          expect(result?['message'], contains(LogSanitizer.redactedMarker));
        });

        test('handles lists in context', () {
          final result = sanitizer.sanitizeContext({
            'items': ['normal', 'password=secret', 'another'],
          });

          final items = result?['items'] as List?;
          expect(items?[0], equals('normal'));
          expect(items?[1], contains(LogSanitizer.redactedMarker));
          expect(items?[2], equals('another'));
        });

        test('returns null for null context', () {
          final result = sanitizer.sanitizeContext(null);
          expect(result, isNull);
        });
      });

      group('sanitizeUserId', () {
        test('hashes user ID when hashUserIds is true', () {
          final result = sanitizer.sanitizeUserId('user123');
          expect(result, startsWith('user_'));
          expect(result, isNot(contains('user123')));
        });

        test('returns null for null user ID', () {
          final result = sanitizer.sanitizeUserId(null);
          expect(result, isNull);
        });

        test('produces consistent hashes within session', () {
          final result1 = sanitizer.sanitizeUserId('user123');
          final result2 = sanitizer.sanitizeUserId('user123');
          expect(result1, equals(result2));
        });

        test('produces different hashes for different users', () {
          final result1 = sanitizer.sanitizeUserId('user1');
          final result2 = sanitizer.sanitizeUserId('user2');
          expect(result1, isNot(equals(result2)));
        });
      });

      group('hash', () {
        test('produces consistent hashes', () {
          final hash1 = sanitizer.hash('test');
          final hash2 = sanitizer.hash('test');
          expect(hash1, equals(hash2));
        });

        test('produces different hashes for different inputs', () {
          final hash1 = sanitizer.hash('test1');
          final hash2 = sanitizer.hash('test2');
          expect(hash1, isNot(equals(hash2)));
        });

        test('returns 16 character hash', () {
          final hash = sanitizer.hash('test');
          expect(hash.length, equals(16));
        });
      });
    });

    group('with sanitization disabled', () {
      late LogSanitizer sanitizer;

      setUp(() {
        sanitizer = LogSanitizer(const SanitizationConfig(enabled: false));
      });

      test('does not redact sensitive patterns', () {
        const phone = '9876543210';
        final result = sanitizer.sanitizeString('Call me at $phone');
        expect(result, contains(phone));
      });

      test('does not redact sensitive keys in context', () {
        final result = sanitizer.sanitizeContext({
          'password': 'secret123',
        });

        expect(result?['password'], equals('secret123'));
      });

      test('does not hash user ID', () {
        final sanitizerNoHash = LogSanitizer(const SanitizationConfig(
          enabled: false,
          hashUserIds: false,
        ));

        final result = sanitizerNoHash.sanitizeUserId('user123');
        expect(result, equals('user123'));
      });
    });

    group('validateContextSize', () {
      late LogSanitizer sanitizer;

      setUp(() {
        sanitizer = LogSanitizer(const SanitizationConfig(enabled: true));
      });

      test('returns context if within size limit', () {
        final context = {'key': 'value'};
        final result = sanitizer.validateContextSize(context);
        expect(result, equals(context));
      });

      test('returns null for null context', () {
        final result = sanitizer.validateContextSize(null);
        expect(result, isNull);
      });

      test('returns error marker for oversized context', () {
        // Create a context that exceeds the size limit
        final largeContext = <String, dynamic>{};
        for (var i = 0; i < 1000; i++) {
          largeContext['key_$i'] = 'a' * 100;
        }

        final result = sanitizer.validateContextSize(largeContext);
        expect(result?['_contextDropped'], isTrue);
      });
    });
  });
}
