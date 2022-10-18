library json_schema_builder;

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'boolean_builder.dart';
part 'integer_builder.dart';
part 'number_builder.dart';
part 'date_picker_builder.dart';
part 'dropdown_builder.dart';
part 'string_builder.dart';
part 'json_form_builder.dart';

abstract class JsonSchemaBuilder<T> extends StatelessWidget {
  final FormGroup form;
  final String formControlName;
  final String? hint;
  final T? value;
  final bool readOnly;

  const JsonSchemaBuilder({
    Key? key,
    required this.formControlName,
    required this.form,
    this.readOnly = false,
    this.hint,
    this.value,
  }) : super(key: key);
}
