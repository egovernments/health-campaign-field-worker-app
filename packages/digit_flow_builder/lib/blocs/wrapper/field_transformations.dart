import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';

/// Pure utility class for field transformations, context flattening,
/// and type conversion operations.
class FieldTransformations {
  /// Flattens context for formula parser by converting model maps to flat key-value pairs.
  /// Also applies configurable field transformations.
  static Map<String, dynamic> flattenContextForFormulaParser(
    Map<String, dynamic> context, {
    Map<String, dynamic>? transformations,
  }) {
    final flat = <String, dynamic>{};

    context.forEach((key, value) {
      if (value == null) {
        // Skip null values
      } else if (value is EntityModel) {
        // Convert EntityModel to map and flatten with prefix
        try {
          final modelMap = value.toMap();
          modelMap.forEach((fieldKey, fieldValue) {
            // Create keys like "Individual.name", "Household.memberCount"
            flat['${key}.${fieldKey}'] = fieldValue;
            // Also add without prefix for backward compatibility
            flat[fieldKey] = fieldValue;
          });
        } catch (e) {
          debugPrint('Error flattening EntityModel $key: $e');
        }
      } else if (value is Map) {
        // Flatten nested maps
        value.forEach((nestedKey, nestedValue) {
          if (nestedValue is EntityModel) {
            // Handle models within maps
            try {
              final modelMap = nestedValue.toMap();
              modelMap.forEach((fieldKey, fieldValue) {
                flat['${key}.${nestedKey}.${fieldKey}'] = fieldValue;
              });
            } catch (e) {
              debugPrint('Error flattening nested EntityModel: $e');
            }
          } else {
            // Regular nested values
            flat['${key}.${nestedKey}'] = nestedValue;
          }
        });
      } else if (value is List) {
        // Handle lists - FormulaParser doesn't directly support lists
        // so we add list length and indexed access
        flat['${key}.length'] = value.length;
        for (int i = 0; i < value.length && i < 10; i++) {
          // Limit to first 10 items
          if (value[i] is EntityModel) {
            try {
              final modelMap = value[i].toMap();
              modelMap.forEach((fieldKey, fieldValue) {
                flat['${key}[$i].${fieldKey}'] = fieldValue;
              });
            } catch (e) {
              debugPrint('Error flattening list EntityModel: $e');
            }
          } else {
            flat['${key}[$i]'] = value[i];
          }
        }
      } else {
        // Simple values
        flat[key] = value;
      }
    });

    // Apply transformations if provided
    if (transformations != null) {
      flat.addAll(applyFieldTransformations(flat, transformations));
    }

    return flat;
  }

  /// Applies configurable field transformations to the flattened context.
  static Map<String, dynamic> applyFieldTransformations(
    Map<String, dynamic> flat,
    Map<String, dynamic> transformations,
  ) {
    final transformed = <String, dynamic>{};

    transformations.forEach((transformedFieldName, config) {
      if (config is! Map<String, dynamic>) return;

      final type = config['type'] as String?;
      final sourceField = config['source'] as String?;

      if (type == null || sourceField == null) return;

      final sourceValue = flat[sourceField];
      if (sourceValue == null) return;

      try {
        switch (type) {
          case 'ageInMonths':
            transformed[transformedFieldName] =
                calculateAgeInMonths(sourceValue);
            break;
          case 'ageInYears':
            transformed[transformedFieldName] =
                calculateAgeInYears(sourceValue);
            break;
          case 'dateString':
            transformed[transformedFieldName] =
                formatDateString(sourceValue, config['format']);
            break;
          case 'uppercase':
            transformed[transformedFieldName] =
                sourceValue.toString().toUpperCase();
            break;
          case 'lowercase':
            transformed[transformedFieldName] =
                sourceValue.toString().toLowerCase();
            break;
          case 'numeric':
            transformed[transformedFieldName] =
                num.tryParse(sourceValue.toString()) ?? 0;
            break;
          case 'boolean':
            transformed[transformedFieldName] = parseBoolean(sourceValue);
            break;
          case 'custom':
            // Allow custom transformation expressions
            final expression = config['expression'] as String?;
            if (expression != null) {
              transformed[transformedFieldName] =
                  evaluateCustomExpression(expression, flat);
            }
            break;
          default:
            debugPrint('Unknown transformation type: $type');
        }
      } catch (e) {
        debugPrint(
            'Error applying transformation $transformedFieldName: $e');
      }
    });

    return transformed;
  }

  /// Calculate age in months from date of birth.
  static int calculateAgeInMonths(dynamic dateValue) {
    DateTime? birthDate;

    if (dateValue is int) {
      // Assume milliseconds since epoch
      birthDate = DateTime.fromMillisecondsSinceEpoch(dateValue);
    } else if (dateValue is String) {
      // Try to parse date string
      birthDate = DateTime.tryParse(dateValue);
    } else if (dateValue is DateTime) {
      birthDate = dateValue;
    }

    if (birthDate == null) return 0;

    final now = DateTime.now();
    final months =
        (now.year - birthDate.year) * 12 + (now.month - birthDate.month);

    // Adjust if the day hasn't occurred yet this month
    if (now.day < birthDate.day) {
      return months - 1;
    }

    return months;
  }

  /// Calculate age in years from date of birth.
  static int calculateAgeInYears(dynamic dateValue) {
    return (calculateAgeInMonths(dateValue) / 12).floor();
  }

  /// Format date as string.
  static String formatDateString(dynamic dateValue, String? format) {
    DateTime? date;

    if (dateValue is int) {
      date = DateTime.fromMillisecondsSinceEpoch(dateValue);
    } else if (dateValue is String) {
      date = DateTime.tryParse(dateValue);
    } else if (dateValue is DateTime) {
      date = dateValue;
    }

    if (date == null) return '';

    // Simple format support - can be extended
    switch (format) {
      case 'yyyy-MM-dd':
        return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      case 'dd/MM/yyyy':
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      default:
        return date.toIso8601String();
    }
  }

  /// Parse boolean from various formats.
  static bool parseBoolean(dynamic value) {
    if (value is bool) return value;
    if (value is String) {
      return value.toLowerCase() == 'true' ||
          value == '1' ||
          value.toLowerCase() == 'yes';
    }
    if (value is num) return value != 0;
    return false;
  }

  /// Evaluate custom transformation expressions (placeholder).
  static dynamic evaluateCustomExpression(
    String expression,
    Map<String, dynamic> context,
  ) {
    // This is a placeholder for custom expressions
    // Could be extended to support simple arithmetic or string operations
    debugPrint('Custom expression evaluation not implemented: $expression');
    return null;
  }
}
