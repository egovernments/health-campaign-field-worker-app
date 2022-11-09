library json_forms;

import 'package:flutter/material.dart';
import 'package:forms_engine/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'models/property_schema/property_schema.dart';

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;

  const JsonForms({
    super.key,
    required this.propertySchema,
  });

  static Map<String, FormControl> getFormControls(
    PropertySchema propertySchema, {
    String? defaultLatlng,
  }) {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          JsonFormBuilder(
            schema: propertySchema,
            formControlName: '/',
            indexKey: '',
          ),
        ],
      ),
    );
  }
}
