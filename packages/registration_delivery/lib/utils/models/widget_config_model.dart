import 'package:flutter/material.dart';

import '../../blocs/app_localization.dart';

class WidgetConfigModel {
  final Map<String, dynamic> config;
  final dynamic form;
  final Function? func;
  final RegistrationDeliveryLocalization localizations;

  WidgetConfigModel({
    required this.config,
    required this.form,
    this.func,
    required this.localizations
  });
}

class FormConfigModel {
  late String name = '';
  late String type = '';
  late List<FormConfigFieldModel>? fields;
}

class FormConfigFieldModel {
  late String name;
  late int order;
  late bool isRequired;
  late bool isEnabled;
  late bool readOnly;
  late List<String>? regex;
  late String? errorMessage;
}

class FieldConfig {
  final bool isEnabled;
  final bool readOnly;
  final bool isRequired;
  final int order;
  final List<String>? regex;
  final String? errorMessage;

  FieldConfig({
    required this.isEnabled,
    required this.readOnly,
    required this.isRequired,
    required this.order,
    this.regex,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'isEnabled': isEnabled,
      'readOnly': readOnly,
      'isRequired': isRequired,
      'order': order,
      if (regex != null) 'regex': regex,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}


