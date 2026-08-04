import 'package:digit_face_verification/data/pin_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PinService pinService;

  setUp(() {
    pinService = PinService();
  });

  group('PinService', () {
    test('generateDefaultPin returns 0000', () {
      expect(pinService.generateDefaultPin(), '0000');
    });

    test('generateSalt returns 32-character hex string', () {
      final salt = pinService.generateSalt();
      expect(salt.length, 32);
      expect(RegExp(r'^[0-9a-f]+$').hasMatch(salt), true);
    });

    test('two salt generations produce different values', () {
      final salt1 = pinService.generateSalt();
      final salt2 = pinService.generateSalt();
      // Extremely unlikely to be the same
      expect(salt1, isNot(equals(salt2)));
    });

    test('hashPin produces consistent output', () {
      const pin = '1234';
      const salt = 'abcdef0123456789abcdef0123456789';
      final hash1 = pinService.hashPin(pin, salt);
      final hash2 = pinService.hashPin(pin, salt);
      expect(hash1, equals(hash2));
    });

    test('hashPin produces different output for different pins', () {
      const salt = 'abcdef0123456789abcdef0123456789';
      final hash1 = pinService.hashPin('0000', salt);
      final hash2 = pinService.hashPin('1234', salt);
      expect(hash1, isNot(equals(hash2)));
    });

    test('hashPin produces different output for different salts', () {
      const pin = '0000';
      final hash1 = pinService.hashPin(pin, 'salt1salt1salt1salt1salt1salt1sa');
      final hash2 = pinService.hashPin(pin, 'salt2salt2salt2salt2salt2salt2sa');
      expect(hash1, isNot(equals(hash2)));
    });

    test('verifyPin returns true for correct pin', () {
      const pin = '5678';
      final salt = pinService.generateSalt();
      final hash = pinService.hashPin(pin, salt);

      expect(pinService.verifyPin(pin, hash, salt), true);
    });

    test('verifyPin returns false for wrong pin', () {
      const pin = '5678';
      final salt = pinService.generateSalt();
      final hash = pinService.hashPin(pin, salt);

      expect(pinService.verifyPin('0000', hash, salt), false);
      expect(pinService.verifyPin('9999', hash, salt), false);
    });

    test('hash round-trip with generated salt', () {
      final pin = pinService.generateDefaultPin();
      final salt = pinService.generateSalt();
      final hash = pinService.hashPin(pin, salt);

      expect(pinService.verifyPin(pin, hash, salt), true);
      expect(pinService.verifyPin('wrong', hash, salt), false);
    });

    test('hash is SHA-256 (64 hex characters)', () {
      const pin = '0000';
      final salt = pinService.generateSalt();
      final hash = pinService.hashPin(pin, salt);

      expect(hash.length, 64);
      expect(RegExp(r'^[0-9a-f]+$').hasMatch(hash), true);
    });
  });
}
