/// Configuration for PII sanitization.
///
/// Sanitization protects sensitive data by redacting patterns that match
/// known PII formats (phone numbers, Aadhaar, PAN, etc.) and sensitive keys.
class SanitizationConfig {
  /// Whether sanitization is enabled.
  final bool enabled;

  /// Additional regex patterns to redact (beyond built-in patterns).
  final List<RegExp> customPatterns;

  /// Additional keys to redact in context maps (beyond built-in keys).
  final List<String> customSensitiveKeys;

  /// Whether to hash user IDs instead of logging raw values.
  final bool hashUserIds;

  const SanitizationConfig({
    this.enabled = true,
    this.customPatterns = const [],
    this.customSensitiveKeys = const [],
    this.hashUserIds = true,
  });

  /// Development configuration with sanitization disabled.
  static const SanitizationConfig development = SanitizationConfig(
    enabled: false,
    hashUserIds: false,
  );

  /// Production configuration with full sanitization.
  static const SanitizationConfig production = SanitizationConfig(
    enabled: true,
    hashUserIds: true,
  );

  /// Test configuration with sanitization disabled.
  static const SanitizationConfig test = SanitizationConfig(
    enabled: false,
    hashUserIds: false,
  );

  /// Creates a copy with the given fields replaced.
  SanitizationConfig copyWith({
    bool? enabled,
    List<RegExp>? customPatterns,
    List<String>? customSensitiveKeys,
    bool? hashUserIds,
  }) {
    return SanitizationConfig(
      enabled: enabled ?? this.enabled,
      customPatterns: customPatterns ?? this.customPatterns,
      customSensitiveKeys: customSensitiveKeys ?? this.customSensitiveKeys,
      hashUserIds: hashUserIds ?? this.hashUserIds,
    );
  }
}
