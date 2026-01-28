import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../core/log_limits.dart';
import 'sanitization_config.dart';

/// Sanitizer for protecting PII and sensitive data in logs.
///
/// Automatically detects and redacts:
/// - Phone numbers
/// - Aadhaar-like numbers
/// - PAN-like numbers
/// - Passwords, tokens, secrets, API keys
/// - Other sensitive context keys
class LogSanitizer {
  final SanitizationConfig _config;

  // Session-unique salt for hashing (different each app session for privacy)
  static final String _salt = DateTime.now().microsecondsSinceEpoch.toString();

  /// Built-in patterns to detect sensitive data in strings.
  static final List<RegExp> _builtInPatterns = [
    RegExp(r'\b\d{10,12}\b'), // Phone numbers
    RegExp(r'\b\d{4}[-\s]?\d{4}[-\s]?\d{4}\b'), // Aadhaar-like
    RegExp(r'\b[A-Z]{5}\d{4}[A-Z]\b'), // PAN-like
    RegExp(r'password["\s:=]+\S+', caseSensitive: false),
    RegExp(r'token["\s:=]+\S+', caseSensitive: false),
    RegExp(r'secret["\s:=]+\S+', caseSensitive: false),
    RegExp(r'api[_-]?key["\s:=]+\S+', caseSensitive: false),
    RegExp(r'bearer\s+\S+', caseSensitive: false),
  ];

  /// Built-in keys that indicate sensitive data in context maps.
  static const List<String> _builtInSensitiveKeys = [
    'password',
    'token',
    'secret',
    'apikey',
    'api_key',
    'apiKey',
    'authorization',
    'aadhaar',
    'pan',
    'phonenumber',
    'phone_number',
    'phoneNumber',
    'mobilenumber',
    'mobile_number',
    'mobileNumber',
    'email',
    'dateofbirth',
    'date_of_birth',
    'dateOfBirth',
    'dob',
    'address',
    'biometric',
    'ssn',
    'creditcard',
    'credit_card',
    'creditCard',
  ];

  /// The redaction marker used to replace sensitive data.
  static const String redactedMarker = '***REDACTED***';

  LogSanitizer(this._config);

  /// Creates a sanitizer with default production configuration.
  factory LogSanitizer.production() =>
      LogSanitizer(SanitizationConfig.production);

  /// Creates a sanitizer with sanitization disabled.
  factory LogSanitizer.disabled() => LogSanitizer(SanitizationConfig.test);

  /// All patterns to check (built-in + custom).
  List<RegExp> get _allPatterns => [
        ..._builtInPatterns,
        ..._config.customPatterns,
      ];

  /// All sensitive keys to check (built-in + custom).
  List<String> get _allSensitiveKeys => [
        ..._builtInSensitiveKeys,
        ..._config.customSensitiveKeys,
      ];

  /// Sanitizes a string value by redacting sensitive patterns.
  String sanitizeString(String value) {
    if (!_config.enabled) return value;

    var result = value;
    for (final pattern in _allPatterns) {
      result = result.replaceAll(pattern, redactedMarker);
    }
    return result;
  }

  /// Sanitizes a message string.
  String sanitizeMessage(String message) => sanitizeString(message);

  /// Sanitizes a context map, handling nested structures and circular references.
  ///
  /// This method:
  /// - Redacts sensitive keys
  /// - Applies pattern matching to string values
  /// - Handles nested maps up to [LogLimits.maxContextDepth]
  /// - Detects and marks circular references
  /// - Truncates keys and values that exceed length limits
  Map<String, dynamic>? sanitizeContext(
    Map<String, dynamic>? context, {
    Set<Object>? seen,
    int depth = 0,
  }) {
    if (context == null) return null;
    if (!_config.enabled) return context;

    seen ??= <Object>{};

    // Circular reference check
    if (seen.contains(context)) {
      return {'_circular': true};
    }
    seen.add(context);

    // Depth limit check
    if (depth > LogLimits.maxContextDepth) {
      return {'_truncated': 'max depth exceeded'};
    }

    final result = <String, dynamic>{};

    for (final entry in context.entries) {
      // Truncate key if needed
      final key = LogLimits.truncateKey(entry.key);

      // Check if key is sensitive
      if (_isSensitiveKey(entry.key)) {
        result[key] = redactedMarker;
        continue;
      }

      // Handle different value types
      final value = entry.value;
      if (value == null) {
        result[key] = null;
      } else if (value is Map<String, dynamic>) {
        result[key] = sanitizeContext(value, seen: seen, depth: depth + 1);
      } else if (value is Map) {
        // Convert non-string-keyed maps
        final stringKeyedMap = value.map(
          (k, v) => MapEntry(k.toString(), v),
        );
        result[key] = sanitizeContext(
          stringKeyedMap,
          seen: seen,
          depth: depth + 1,
        );
      } else if (value is List) {
        result[key] = _sanitizeList(value, seen: seen, depth: depth + 1);
      } else if (value is String) {
        var sanitized = sanitizeString(value);
        if (sanitized.length > LogLimits.maxContextValueLength) {
          sanitized = LogLimits.truncateValue(sanitized);
        }
        result[key] = sanitized;
      } else {
        // Primitives (int, double, bool) are safe
        result[key] = value;
      }
    }

    seen.remove(context);
    return result;
  }

  /// Sanitizes a list, handling nested structures.
  List<dynamic> _sanitizeList(
    List<dynamic> list, {
    required Set<Object> seen,
    required int depth,
  }) {
    if (depth > LogLimits.maxContextDepth) {
      return ['[truncated: max depth exceeded]'];
    }

    return list.map((item) {
      if (item == null) {
        return null;
      } else if (item is Map<String, dynamic>) {
        return sanitizeContext(item, seen: seen, depth: depth + 1);
      } else if (item is Map) {
        final stringKeyedMap = item.map(
          (k, v) => MapEntry(k.toString(), v),
        );
        return sanitizeContext(stringKeyedMap, seen: seen, depth: depth + 1);
      } else if (item is List) {
        return _sanitizeList(item, seen: seen, depth: depth + 1);
      } else if (item is String) {
        var sanitized = sanitizeString(item);
        if (sanitized.length > LogLimits.maxContextValueLength) {
          sanitized = LogLimits.truncateValue(sanitized);
        }
        return sanitized;
      } else {
        return item;
      }
    }).toList();
  }

  /// Checks if a key indicates sensitive data.
  bool _isSensitiveKey(String key) {
    final lowerKey = key.toLowerCase();
    return _allSensitiveKeys
        .any((sensitive) => lowerKey.contains(sensitive.toLowerCase()));
  }

  /// Hashes a value using SHA-256 with session salt.
  ///
  /// The same input produces the same output within a session, but different
  /// outputs between sessions for privacy.
  String hash(String value) {
    final bytes = utf8.encode('$_salt:$value');
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 16);
  }

  /// Hashes a user ID if [SanitizationConfig.hashUserIds] is enabled.
  String? sanitizeUserId(String? userId) {
    if (userId == null) return null;
    if (!_config.enabled) return userId;
    if (!_config.hashUserIds) return userId;
    return 'user_${hash(userId)}';
  }

  /// Validates that a context map doesn't exceed size limits.
  ///
  /// Returns the context if valid, or null with a marker if too large.
  Map<String, dynamic>? validateContextSize(Map<String, dynamic>? context) {
    if (context == null) return null;

    try {
      final encoded = jsonEncode(context);
      if (encoded.length > LogLimits.maxContextSize) {
        return {'_contextDropped': true, '_reason': 'exceeded size limit'};
      }
      return context;
    } catch (e) {
      return {'_contextDropped': true, '_reason': 'serialization failed'};
    }
  }
}
