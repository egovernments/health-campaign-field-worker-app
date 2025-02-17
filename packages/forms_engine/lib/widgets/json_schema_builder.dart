library json_schema_builder;

import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final VoidCallback? onTap;
  final T? value;
  final bool readOnly;

  const JsonSchemaBuilder({
    Key? key,
    required this.formControlName,
    required this.form,
    this.readOnly = false,
    this.onTap,
    this.hint,
    this.value,
  }) : super(key: key);
}
