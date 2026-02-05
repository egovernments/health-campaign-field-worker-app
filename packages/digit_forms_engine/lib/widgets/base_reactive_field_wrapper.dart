import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_localization.dart';
import '../helper/validation_message_helper.dart';
import '../models/property_schema/property_schema.dart';

/// A base widget that wraps ReactiveWrapperField and automatically handles
/// validation messages from PropertySchema.
///
/// Custom widgets should use this instead of manually handling validation messages.
///
/// Example usage:
/// ```dart
/// BaseReactiveFieldWrapper(
///   formControlName: 'myField',
///   schema: myPropertySchema, // Pass the full schema
///   builder: (field) {
///     return YourCustomWidget(
///       errorMessage: field.errorText,
///       // ... other props
///     );
///   },
/// )
/// ```
class BaseReactiveFieldWrapper extends StatelessWidget {
  /// The form control name (field name)
  final String formControlName;

  /// The property schema containing validation rules
  final PropertySchema? schema;

  /// Additional custom validation messages to merge with schema validations
  final Map<String, String Function(Object)>? customValidationMessages;

  /// Function to determine when to show errors
  final ShowErrorsFunction? showErrors;

  /// Builder function that receives the field state
  final Widget Function(dynamic) builder;

  const BaseReactiveFieldWrapper({
    super.key,
    required this.formControlName,
    required this.builder,
    this.schema,
    this.customValidationMessages,
    this.showErrors,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);

    // Build validation messages from schema
    final validationMessages = schema?.validations != null
        ? buildValidationMessages(schema!.validations!, loc)
        : <String, String Function(Object)>{};

    // Merge with custom validation messages if provided
    if (customValidationMessages != null) {
      validationMessages.addAll(customValidationMessages!);
    }

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: showErrors ?? (control) => control.invalid && control.touched,
      builder: builder,
    );
  }
}
