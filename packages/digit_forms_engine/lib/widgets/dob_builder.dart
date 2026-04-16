part of 'json_schema_builder.dart';

class JsonSchemaDOBBuilder extends JsonSchemaBuilder<String> {
  final DateTime? initialDate;
  final Map<String, dynamic>? navigationParams;

  const JsonSchemaDOBBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.initialDate,
    this.navigationParams,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);

    final minAge = _parseAgeConstraint('minAge', form, navigationParams);
    final maxAge = _parseAgeConstraint('maxAge', form, navigationParams);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => DigitDobPicker(
        initialDate: initialDate ?? DateTime(1900),
        datePickerFormControl: formControlName,
        datePickerLabel: label ?? 'date of birth',
        ageFieldLabel: loc.translate('AGE_LABEL_TEXT'),
        yearsHintLabel: loc.translate(
          'YEARS_HINT_TEXT',
        ),
        monthsHintLabel: loc.translate(
          'MONTHS_HINT_TEXT',
        ),
        separatorLabel: loc.translate(
          'SEPARATOR_LABEL_TEXT',
        ),
        cancelText: loc.translate('CORE_COMMON_CANCEL'),
        confirmText: loc.translate('CORE_COMMON_OK'),
        initialValue: form.control(formControlName).value != null &&
                (form.control(formControlName).value as String)
                    .trim()
                    .isNotEmpty
            ? form.control(formControlName).value as String
            : null,
        yearsAndMonthsErrMsg: '',
        errorMessage: _getDobErrorMessage(field.control, context),
        onChangeOfFormControl: (value) {
          _handleDobValidation(
            value,
            form.control(formControlName),
            minAge,
            maxAge,
          );
        },
      ),
    );
  }

  (int years, int months)? _parseAgeConstraint(
    String type,
    FormGroup formGroup,
    Map<String, dynamic>? navParams,
  ) {
    final rule = validations?.firstWhere(
      (v) => v.type == type,
      orElse: () => const ValidationRule(type: '', value: null),
    );

    final raw = rule?.value?.toString();
    if (raw == null) return null;

    String evaluated = raw.trim();

    // Handle templated expressions like {{isHead ? 1800 : 60}}
    if (evaluated.startsWith('{{') && evaluated.endsWith('}}')) {
      final expr = evaluated.substring(2, evaluated.length - 2).trim();

      // Check for ternary: condition ? trueValue : falseValue
      final qIndex = expr.indexOf('?');
      final colonIndex = expr.lastIndexOf(':');

      if (qIndex > 0 && colonIndex > qIndex) {
        final condition = expr.substring(0, qIndex).trim();
        final truePart = expr.substring(qIndex + 1, colonIndex).trim();
        final falsePart = expr.substring(colonIndex + 1).trim();

        bool conditionResult =
            _evaluateCondition(condition, formGroup, navParams);
        evaluated = conditionResult ? truePart : falsePart;
      } else {
        // Not a ternary — use inner expression directly
        evaluated = expr;
      }
    }

    final totalMonths = int.tryParse(evaluated.trim());
    if (totalMonths == null) return null;

    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;

    return (years, months);
  }

  /// Evaluate a condition variable from form controls or navigation params.
  /// Examples: "isHead", "gender", etc.
  bool _evaluateCondition(
    String variable,
    FormGroup formGroup,
    Map<String, dynamic>? navParams,
  ) {
    // First check navigation params
    if (navParams != null && navParams.containsKey(variable)) {
      final value = navParams[variable];
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
      if (value is num) return value != 0;
    }

    // Then check form controls
    if (formGroup.contains(variable)) {
      final value = formGroup.control(variable).value;
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
      if (value is num) return value != 0;
    }

    // Default to false if not found
    return false;
  }

  void _handleDobValidation(
    DateTime? dob,
    AbstractControl control,
    (int years, int months)? minAge,
    (int years, int months)? maxAge,
  ) {
    control.removeError('required');
    control.removeError('minAge');
    control.removeError('maxAge');
    control.markAsTouched();

    final isRequired = validations?.any((v) => v.type == 'required') ?? false;

    if (dob == null) {
      if (isRequired && control.touched) {
        control.setErrors({'required': true});
      }
      return;
    }

    final age = DigitDateUtils.calculateAge(dob);

    if (minAge != null) {
      final minValid = age.years > minAge.$1 ||
          (age.years == minAge.$1 && age.months >= minAge.$2);
      if (!minValid) {
        control.setErrors({'minAge': true});
        return;
      }
    }

    if (maxAge != null) {
      final maxValid = age.years < maxAge.$1 ||
          (age.years == maxAge.$1 && age.months <= maxAge.$2);
      if (!maxValid) {
        control.setErrors({'maxAge': true});
        return;
      }
    }

    // Store as string in "dd/MM/yyyy" format
    final formatted = DateFormat('dd/MM/yyyy').format(dob);
    control.value = formatted;
  }

  String? _getDobErrorMessage(
      AbstractControl<dynamic> control, BuildContext context) {
    final loc = FormLocalization.of(context);

    for (final rule in validations ?? []) {
      if (control.hasError(rule.type) && control.touched) {
        final messageKey = rule.message ?? 'Invalid';
        // Evaluate templated messages like {{isHead ? AGE_VALIDATION_ADDMEMBER_HEAD : AGE_VALIDATION_ADDMEMBER}}
        final resolvedMessage =
            _evaluateTemplatedMessage(messageKey, form, navigationParams);
        return loc.translate(resolvedMessage);
      }
    }

    return null;
  }

  /// Evaluate templated message strings with ternary expressions.
  /// Example: "{{isHead ? AGE_VALIDATION_ADDMEMBER_HEAD : AGE_VALIDATION_ADDMEMBER}}"
  String _evaluateTemplatedMessage(
    String message,
    FormGroup formGroup,
    Map<String, dynamic>? navParams,
  ) {
    String result = message.trim();

    // Handle templated expressions
    if (result.startsWith('{{') && result.endsWith('}}')) {
      final expr = result.substring(2, result.length - 2).trim();

      // Check for ternary: condition ? trueValue : falseValue
      final qIndex = expr.indexOf('?');
      final colonIndex = expr.lastIndexOf(':');

      if (qIndex > 0 && colonIndex > qIndex) {
        final condition = expr.substring(0, qIndex).trim();
        final truePart = expr.substring(qIndex + 1, colonIndex).trim();
        final falsePart = expr.substring(colonIndex + 1).trim();

        bool conditionResult =
            _evaluateCondition(condition, formGroup, navParams);
        result = conditionResult ? truePart : falsePart;
      } else {
        // Not a ternary — use inner expression directly
        result = expr;
      }
    }

    return result;
  }

  DateTime? _parseDate(String? value) {
    if (value == null) return null;
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(value);
    } catch (_) {
      return null;
    }
  }
}
