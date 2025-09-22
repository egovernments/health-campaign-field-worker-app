import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'form_builder_helper.dart';

typedef FormData = Map<String, dynamic>;

class VisibilityManager {
  final Map<String, PropertySchema> schemaMap;
  final FormGroup form;
  final Map<String, dynamic> formData;

  VisibilityManager({
    required this.schemaMap,
    required this.form,
    required this.formData,
  });

  void evaluateVisibility() {
    final flatValues = flattenMap(formData);

    for (final entry in schemaMap.entries) {
      final key = entry.key;
      final schema = entry.value;

      final expression =
          schema.conditions?['visibilityCondition']?['expression'];
      if (expression is! String) continue;

      final isVisible = evaluateVisibilityExpression(expression, flatValues);

      toggleControlVisibility(key, isVisible, schema);
    }
  }

  Map<String, dynamic> flattenMap(Map<String, dynamic> map,
      [String parentKey = '']) {
    final result = <String, dynamic>{};
    map.forEach((key, value) {
      final fullKey = parentKey.isEmpty ? key : '$parentKey.$key';
      if (value is Map<String, dynamic>) {
        result.addAll(flattenMap(value, fullKey));
      } else {
        result[fullKey] = value;
      }
    });
    return result;
  }

  dynamic getDefaultValue(
      PropertySchema schema, dynamic value, dynamic rawValue) {
    final format = schema.format;

    switch (schema.type) {
      case PropertySchemaType.integer:
        return parseIntValue(value) ?? parseIntValue(rawValue);

      case PropertySchemaType.boolean:
        return value ?? parseBoolValue(rawValue);

      case PropertySchemaType.string:
        if (format == PropertySchemaFormat.date) {
          return parseDateValue(value) ??
              (schema.systemDate == true
                  ? DateTime.now()
                  : parseDateValue(rawValue));
        } else if (format == PropertySchemaFormat.idPopulator) {
          final availableIDs = rawValue?['availableIDs'];
          final selectedLabel = availableIDs?['UNIQUE_BENEFICIARY_ID'] != null
              ? 'UNIQUE_BENEFICIARY_ID'
              : 'DEFAULT';
          final selectedId = availableIDs?[selectedLabel]?.toString();
          return schema.hidden == true
              ? '$selectedLabel, $selectedId'
              : rawValue?.toString();
        } else if (format == PropertySchemaFormat.latLng ||
            format == PropertySchemaFormat.locality) {
          return value ?? rawValue?.toString();
        } else if (format == PropertySchemaFormat.numeric) {
          return parseIntValue(value) ?? parseIntValue(rawValue);
        } else {
          return value ??
              (rawValue?.toString().isEmpty ?? true
                  ? null
                  : rawValue.toString());
        }

      case PropertySchemaType.dynamic:
        return value;

      default:
        return value ??
            (rawValue?.toString().isEmpty ?? true ? null : rawValue.toString());
    }
  }

  void toggleControlVisibility(
    String key,
    bool isVisible,
    PropertySchema schema,
  ) {
    final control = form.control(key);

    if (isVisible) {
      control.setValidators(buildValidators(schema));
    } else {
      control.clearValidators();

      if (schema.value != null) {
        control.value = getDefaultValue(schema, schema.value,
            schema.value); // Assign default value if present
      } else {
        control
            .markAsUntouched(); // Otherwise, just mark untouched without changing value
      }
    }

    control.updateValueAndValidity();
  }
}
