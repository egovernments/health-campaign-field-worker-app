library json_forms;

import 'package:flutter/material.dart';
import 'package:forms_engine/utils/utils.dart';
import 'package:forms_engine/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'helper/form_builder_helper.dart';
import 'models/property_schema/property_schema.dart';

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;
  final List<Map<String, Widget>>? childrens;
  final Map<String, dynamic>? defaultValues;

  const JsonForms({
    super.key,
    required this.propertySchema,
    this.childrens,
    this.defaultValues,
  });

  static Map<String, AbstractControl<dynamic>> getFormControls(
    PropertySchema schema, {
    String? defaultLatlng,
    Map<String, dynamic>? defaultValues,
  }) {
    assert(schema.properties != null);

    final Map<String, AbstractControl<dynamic>> controls = {
      for (final entry in schema.properties!.entries)
        if (!isHidden(entry.value) || entry.value.includeInForm == true)
          entry.key: buildFormControl(
            entry.key,
            entry.value,
            schema,
            defaultLatlng: defaultLatlng,
            defaultValues: defaultValues,
          ),
    };

    return controls;
  }

  static Map<String, dynamic> getFormValues(
    FormGroup form,
    PropertySchema schema,
  ) {
    final values = schema.properties!.entries
        .where((entry) => (!isHidden(entry.value) ||
            entry.value.includeInForm == true)) // Skip hidden fields
        .map((e) => _getParsedValues(form, e.key, e.value))
        .whereType<MapEntry<String, dynamic>>()
        .toList();

    return Map.fromEntries(values);
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
