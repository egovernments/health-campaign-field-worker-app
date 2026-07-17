import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// Service for PIN generation, hashing, and verification.
class PinService {
  static const String defaultPin = '0000';

  /// Generate a default PIN (configurable).
  String generateDefaultPin() => defaultPin;

  /// Generate a crypto-random salt (16 bytes, hex-encoded).
  String generateSalt() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  /// Hash a PIN with the given salt using SHA-256.
  String hashPin(String pin, String salt) {
    final bytes = utf8.encode('$salt:$pin');
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Verify a PIN input against a stored hash and salt.
  bool verifyPin(String input, String storedHash, String salt) {
    final inputHash = hashPin(input, salt);
    return inputHash == storedHash;
  }
}
