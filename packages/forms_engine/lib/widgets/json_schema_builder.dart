library json_schema_builder;

import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dob_picker.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:forms_engine/helper/form_builder_helper.dart';
import 'localized.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/app_localization.dart';
import 'package:forms_engine/helper/validator_helper.dart';
import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../helper/validation_message_helper.dart';
import '../utils/utils.dart';

part 'integer_builder.dart';
part 'number_builder.dart';
part 'date_picker_builder.dart';
part 'dropdown_builder.dart';
part 'string_builder.dart';
part 'json_form_builder.dart';
part 'selection_builder.dart';
part 'lat_lng_builder.dart';
part 'checkbox_builder.dart';
part 'radio_builder.dart';
part 'dob_builder.dart';
part 'scanner_builder.dart';

abstract class JsonSchemaBuilder<T> extends StatelessWidget {
  final FormGroup form;
  final String formControlName;
  final String? label;
  final VoidCallback? onTap;
  final T? value;
  final bool readOnly;
  final bool disabled;
  final String? helpText;
  final String? tooltipText;
  final String? innerLabel;
  final bool? isRequired;
  final List<ValidationRule>? validations;
  final List<TextInputFormatter>? inputFormatter;

  const JsonSchemaBuilder({
    Key? key,
    required this.formControlName,
    required this.form,
    this.readOnly = false,
    this.onTap,
    this.label,
    this.disabled = false,
    this.helpText,
    this.tooltipText,
    this.innerLabel,
    this.value,
    this.isRequired = false,
    this.validations,
    this.inputFormatter,
  }) : super(key: key);
}
