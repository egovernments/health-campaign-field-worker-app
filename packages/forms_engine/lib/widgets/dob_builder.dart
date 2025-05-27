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
        initialDate: initialDate,
        datePickerFormControl: formControlName,
        datePickerLabel: label ?? 'date of birth',
        ageFieldLabel: 'age',
        yearsHintLabel: 'years',
        monthsHintLabel: 'months',
        separatorLabel: 'or',
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

    if (value.endsWith('_months') || value.endsWith('_month')) {
      final m = int.tryParse(value.split('_').first);
      return (0, m ?? 0);
    }

    if (value.endsWith('_years') || value.endsWith('_year')) {
      final y = int.tryParse(value.split('_').first);
      return (y ?? 0, 0);
    }

    return null;
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

    if (dob == null && control.touched) {
      control.setErrors({'required': true});
      return;
    }
    if(dob == null) return;

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

  String? _getDobErrorMessage(AbstractControl<dynamic> control, BuildContext context) {
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

