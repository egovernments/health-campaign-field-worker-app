library json_forms;

import 'package:flutter/material.dart';
import 'package:forms_engine/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'models/property_schema/property_schema.dart';

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;
final List<Map <String, Widget>>? childrens;
  const JsonForms({
    super.key,
    required this.propertySchema, 
    this.childrens,
  });

  static Map<String, FormControl> getFormControls(
 
    PropertySchema propertySchema,
       final List<Map <String, Widget>>? childrens, {
    String? defaultLatlng,
  }
  ) {
    assert(propertySchema.properties != null);
    final controls = Map.fromEntries(
      propertySchema.properties!.entries
          .map((e) => _getControls(
                e.key,
                e.value,
                propertySchema,
                defaultLatlng: defaultLatlng,
              ))
          .expand((element) => element),
    );
    return controls;
  }

  static Map<String, dynamic> getFormValues(
    FormGroup form,
    PropertySchema schema,
  ) {
    final values = schema.properties!.entries
        .map((e) => _getParsedValues(form, e.key, e.value))
        .toList();

    return Map.fromEntries(values.whereType<MapEntry<String, dynamic>>());
  }

  static List<MapEntry<String, FormControl>> _getControls(
    String name,
    PropertySchema schema,
    PropertySchema parentSchema, {
    String? defaultLatlng,
  }) {
    final List<MapEntry<String, FormControl>> entries = [];
    final type = schema.type;

    final requiredValidators = [
      if ((parentSchema.required ?? []).contains(name)) Validators.required,
      if (schema.maxLength != null) Validators.maxLength(schema.maxLength!),
      if (schema.minLength != null) Validators.minLength(schema.minLength!),
    ];

    if (type == PropertySchemaType.object) {
      final properties = schema.properties;
      assert(properties != null);
      final result = properties!.entries
          .map((e) => _getControls(e.key, e.value, parentSchema))
          .expand((element) => element)
          .toList();

      entries.addAll(result);
    } else {
      late FormControl control;
      switch (type) {
        case PropertySchemaType.integer:
        
          control = FormControl<int>(
   
            value: schema.format == PropertySchemaFormat.incrementer
                ? schema.value ?? 0
                : schema.value,
            validators: requiredValidators,
            
          );
          break;
        case PropertySchemaType.numeric:
          control = FormControl<num>(
            value: schema.value,
            validators: requiredValidators,
          );
          break;
        case PropertySchemaType.boolean:
          control = FormControl<bool>(
            value: schema.value,
            validators: requiredValidators,
          );
          break;
        default:
          if (schema.format == PropertySchemaFormat.date) {
            control = FormControl<String>(
              value: schema.value,
              validators: requiredValidators,
            );
          } else if (schema.format == PropertySchemaFormat.latLng) {
            control = FormControl<String>(value: defaultLatlng);
          } else {
            control = FormControl<String>(
              value: schema.value,
              validators: requiredValidators,
            );
          }
          break;
      }
      entries.add(MapEntry(name, control));

      if (schema.conditions != null) {
        final condition = schema.conditions!['isVisible'];
        final regexCondition = schema.conditions!['regex'];

        WidgetsBinding.instance.addPostFrameCallback((_) {
          final form = control.parent as FormGroup?;
          if (form == null) return;

          // 🔥 Handle Visibility Condition
          if (condition != null) {
            final controllingField = condition['field'];
            final expectedValue = condition['value'];

            if (controllingField != null && form.contains(controllingField)) {
              final parentControl = form.control(controllingField);

              void updateVisibility(dynamic value) {
                bool shouldShow = expectedValue is List
                    ? expectedValue.contains(value)
                    : value == expectedValue;

                if (shouldShow) {
                  control.markAsEnabled();
                } else {
                  control.reset();
                  control.markAsDisabled();
                }
              }

              updateVisibility(parentControl.value);
              parentControl.valueChanges.listen(updateVisibility);
            }
          }

          // 🔥 Handle Dynamic Regex Condition
          if (regexCondition != null) {
            final controllingField = regexCondition['field'];
            final regexRules = regexCondition[
                'regexRules']; // Expected to be Map<String, String>

            if (controllingField != null &&
                regexRules is Map<String, String> &&
                form.contains(controllingField)) {
              final parentControl = form.control(controllingField);

              void updateRegex(dynamic value) {
                if (regexRules.containsKey(value)) {
                  final newPattern = regexRules[value]!;
                  control
                      .setValidators([Validators.pattern(RegExp(newPattern))]);
                } else {
                  control.setValidators(
                      []); // Reset validators if no matching rule
                }
                control.updateValueAndValidity(); // Apply changes
              }

              updateRegex(parentControl.value);
              parentControl.valueChanges.listen(updateRegex);
            }
          }
        });
      }
    }
    return entries;
  }

  static MapEntry<String, dynamic>? _getParsedValues(
    FormGroup form,
    String name,
    PropertySchema schema,
  ) {
    if (schema.type == PropertySchemaType.object) {
      final results = schema.properties!.entries.map((e) {
        return _getParsedValues(form, e.key, e.value);
      });
      return MapEntry(
        name,
        Map.fromEntries(results.whereType<MapEntry<String, dynamic>>()),
      );
    } else {
      final value = form.control(name).value;
      if (value == null) return null;
      return MapEntry(name, value);
    }
  }

  @override
  Widget build(BuildContext context) => JsonFormBuilder(
    schema: propertySchema,
    formControlName: '/',
    components: childrens,
  );
      
}
