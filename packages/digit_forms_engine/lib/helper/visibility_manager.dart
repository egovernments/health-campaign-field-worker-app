import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  void toggleControlVisibility(
    String key,
    bool isVisible,
    PropertySchema schema,
  ) {
    final control = form.control(key);

    if (isVisible) {
      control.setValidators(buildValidators(schema));
    } else {
      control
        ..clearValidators()
        ..reset(); // 👈 clears value and marks untouched
    }

    control.updateValueAndValidity();
  }
}
