import 'package:flutter/foundation.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/property_schema/property_schema.dart';
import 'validator_helper.dart';

/// Manages validation context and dependencies for cross-field validation
///
/// This class tracks which fields depend on other fields (via template variables)
/// and automatically re-validates dependent fields when source fields change.
///
/// Example:
/// ```json
/// {
///   "maxAllowedStock": {
///     "type": "integer",
///     "value": 100
///   },
///   "stockReceived": {
///     "type": "integer",
///     "validations": [
///       {
///         "type": "max",
///         "value": "{{maxAllowedStock}}"
///       }
///     ]
///   }
/// }
/// ```
///
/// When maxAllowedStock changes, stockReceived validators will be rebuilt
/// with the new value.
class ValidationContextManager {
  final FormGroup formGroup;
  final Map<String, PropertySchema> schemas;

  /// Maps source field -> Set of dependent fields
  /// e.g., {"maxAllowedStock": {"stockReceived", "stockIssued"}}
  final Map<String, Set<String>> _dependencyMap = {};

  ValidationContextManager({
    required this.formGroup,
    required this.schemas,
  }) {
    _analyzeDependencies();
    _setupListeners();
  }

  /// Analyze all schemas to find template variable dependencies
  void _analyzeDependencies() {
    schemas.forEach((fieldName, schema) {
      final validations = schema.validations;
      if (validations == null) return;

      for (final rule in validations) {
        final value = rule.value;
        if (value is String && value.contains('{{')) {
          // Extract dependencies from template variables
          final deps = _extractDependencies(value);

          for (final dep in deps) {
            _dependencyMap.putIfAbsent(dep, () => {}).add(fieldName);
          }

          if (kDebugMode && deps.isNotEmpty) {
            print(
                'ValidationContextManager: Field "$fieldName" depends on: ${deps.join(", ")}');
          }
        }
      }
    });

    if (kDebugMode && _dependencyMap.isNotEmpty) {
      print('ValidationContextManager: Dependency map: $_dependencyMap');
    }
  }

  /// Extract field names from template variables like {{fieldName}}
  /// Supports both simple {{field}} and nested {{parent.child}}
  Set<String> _extractDependencies(String template) {
    final regex = RegExp(r'\{\{([^}]+)\}\}');
    final matches = regex.allMatches(template);

    return matches
        .map((m) {
          final fullPath = m.group(1)?.trim();
          if (fullPath == null) return null;

          // For nested paths like "parent.child", extract root field name
          final rootField = fullPath.split('.').first;
          return rootField;
        })
        .whereType<String>()
        .toSet();
  }

  /// Set up value change listeners for fields that others depend on
  void _setupListeners() {
    _dependencyMap.forEach((sourceField, dependentFields) {
      try {
        final sourceControl = formGroup.control(sourceField);

        // Listen to value changes and re-validate dependents
        sourceControl.valueChanges.listen((_) {
          _revalidateDependents(sourceField, dependentFields);
        });

        if (kDebugMode) {
          print(
              'ValidationContextManager: Set up listener for "$sourceField" -> ${dependentFields.join(", ")}');
        }
      } catch (e) {
        // Field doesn't exist in form, skip
        if (kDebugMode) {
          print(
              'ValidationContextManager: Warning - Source field "$sourceField" not found in form');
        }
      }
    });
  }

  /// Re-validate fields that depend on the changed field
  void _revalidateDependents(String sourceField, Set<String> dependentFields) {
    // Build current validation context from all form values
    final context = _buildValidationContext();

    if (kDebugMode) {
      print(
          'ValidationContextManager: Re-validating dependents of "$sourceField": ${dependentFields.join(", ")}');
    }

    for (final dependentField in dependentFields) {
      try {
        final control = formGroup.control(dependentField);
        final schema = schemas[dependentField];

        if (schema != null) {
          // Rebuild validators with updated context
          final newValidators = buildValidators(
            schema,
            validationContext: context,
          );

          // Update validators and re-validate
          control.setValidators(newValidators);
          control.updateValueAndValidity();

          if (kDebugMode) {
            print(
                'ValidationContextManager: Re-validated "$dependentField" with context: $context');
          }
        }
      } catch (e) {
        // Skip if field doesn't exist
        if (kDebugMode) {
          print(
              'ValidationContextManager: Warning - Dependent field "$dependentField" not found: $e');
        }
      }
    }
  }

  /// Build validation context from current form values
  /// Returns a flat map of field -> value
  Map<String, dynamic> _buildValidationContext() {
    final context = <String, dynamic>{};

    formGroup.controls.forEach((key, control) {
      if (control is FormGroup) {
        // Nested form group - flatten with dot notation
        final nestedContext = _buildNestedContext(control);
        nestedContext.forEach((nestedKey, nestedValue) {
          context['$key.$nestedKey'] = nestedValue;
        });
      } else {
        context[key] = control.value;
      }
    });

    return context;
  }

  /// Build context for nested FormGroup
  Map<String, dynamic> _buildNestedContext(FormGroup formGroup) {
    final context = <String, dynamic>{};

    formGroup.controls.forEach((key, control) {
      if (control is FormGroup) {
        final nestedContext = _buildNestedContext(control);
        nestedContext.forEach((nestedKey, nestedValue) {
          context['$key.$nestedKey'] = nestedValue;
        });
      } else {
        context[key] = control.value;
      }
    });

    return context;
  }

  /// Get the dependency map (for debugging)
  Map<String, Set<String>> get dependencyMap => _dependencyMap;
}
