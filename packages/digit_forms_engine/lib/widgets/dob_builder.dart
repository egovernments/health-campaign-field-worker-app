part of 'json_schema_builder.dart';

class JsonSchemaDOBBuilder extends JsonSchemaBuilder<String> {
  final DateTime? initialDate;

  const JsonSchemaDOBBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.initialDate,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);

    final minAge = _parseAgeConstraint('minAge');
    final maxAge = _parseAgeConstraint('maxAge');
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

  (int years, int months)? _parseAgeConstraint(String type) {
    final rule = validations?.firstWhere(
      (v) => v.type == type,
      orElse: () => const ValidationRule(type: '', value: null),
    );

    final value = rule?.value?.toString();
    if (value == null) return null;

    final totalMonths = int.tryParse(value);
    if (totalMonths == null) return null;

    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;

    return (years, months);
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
        return loc.translate(rule.message ?? 'Invalid');
      }
    }

    return null;
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
