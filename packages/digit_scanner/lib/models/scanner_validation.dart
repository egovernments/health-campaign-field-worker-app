import 'package:collection/collection.dart';

/// Model class representing a scanner validation rule.
/// This mirrors the validation structure from JSON config:
/// ```json
/// {
///   "type": "scanLimit",
///   "value": 4,
///   "message": "SCANLIMIT_VALIDATION_MESSAGE"
/// }
/// ```
class ScannerValidation {
  final String type;
  final dynamic value;
  final String? message;

  const ScannerValidation({
    required this.type,
    this.value,
    this.message,
  });

  factory ScannerValidation.fromJson(Map<String, dynamic> json) {
    return ScannerValidation(
      type: json['type'] as String,
      value: json['value'],
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() =>
      'ScannerValidation(type: $type, value: $value, message: $message)';
}

/// Helper extension for List<ScannerValidation>
extension ScannerValidationListExt on List<ScannerValidation>? {
  /// Gets the scan limit value, defaults to 1
  int get scanLimit {
    final validation = this?.firstWhereOrNull((v) => v.type == 'scanLimit');
    final value = validation?.value;
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 1;
    return 1;
  }

  /// Gets whether GS1 code scanning is enabled
  bool get isGS1 {
    final validation = this?.firstWhereOrNull((v) => v.type == 'isGS1');
    final value = validation?.value;
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    return false;
  }

  /// Gets the regex pattern for validation
  String? get pattern {
    return this?.firstWhereOrNull((v) => v.type == 'pattern')?.value as String?;
  }

  /// Gets the scan limit validation message
  String? get scanLimitMessage {
    return this?.firstWhereOrNull((v) => v.type == 'scanLimit')?.message;
  }

  /// Gets the GS1 validation message
  String? get gs1Message {
    return this?.firstWhereOrNull((v) => v.type == 'isGS1')?.message;
  }

  /// Gets the pattern validation message
  String? get patternMessage {
    return this?.firstWhereOrNull((v) => v.type == 'pattern')?.message;
  }

  /// Whether single value mode is enabled (scan limit is 1)
  bool get isSingleValue => scanLimit == 1;
}
