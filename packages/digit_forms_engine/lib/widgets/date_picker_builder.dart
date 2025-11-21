part of 'json_schema_builder.dart';

class JsonSchemaDatePickerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaDatePickerBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.start,
    this.end,
    super.validations,
    super.tooltipText,
    super.readOnly,
    super.isRequired,
    super.innerLabel,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => LabeledField(
        infoText: translateIfPresent(tooltipText, loc),
        label: label,
        isRequired: isRequired ?? false,
        child: DigitDateFormInput(
          firstDate: parseDateValue(start),
          lastDate: parseDateValue(end),
          helpText: helpText,
          onChange: (value) {
            form.control(formControlName).markAsTouched();
            DateTime? parsedDate;
            try {
              parsedDate = DateFormat("dd MMM yyyy").parseStrict(value);
            } catch (e) {
              // Optional: Handle invalid date input
              parsedDate = null;
            }
            form.control(formControlName).value = parsedDate;
          },
          readOnly: readOnly,
          errorMessage: field.errorText,
          innerLabel: innerLabel,
          initialValue: () {
            final rawValue = form.control(formControlName).value;

            if (rawValue == null) return null;

            DateTime? parsed;

            if (rawValue is DateTime) {
              parsed = rawValue;
            } else if (rawValue is String && rawValue.trim().isNotEmpty) {
              try {
                parsed = DateFormat("dd MMM yyyy").parseStrict(rawValue);
              } catch (_) {
                parsed = null;
              }
            }

            return parsed != null
                ? formatDateLocalized(
                    context,
                    parsed,
                    Constants().dateMonthYearFormat,
                  )
                : null;
          }(),
        ),
      ),
    );
  }
}
