part of 'json_schema_builder.dart';

class JsonSchemaTextAreaBuilder extends JsonSchemaBuilder<String> {
  const JsonSchemaTextAreaBuilder({
    required super.formControlName,
    required super.form,
    super.readOnly,
    super.onTap,
    super.key,
    super.value,
    super.label,
    super.isRequired,
    super.validations,
    super.innerLabel,
    super.helpText,
    super.tooltipText,
    super.charCount,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    final inputFormatter = getPatternFormatter(validations);

    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        return ReactiveWrapperField(
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) => LabeledField(
            infoText: translateIfPresent(tooltipText, loc),
            label: label,
            capitalizedFirstLetter: false,
            isRequired: isRequired ?? false,
            child: DigitTextAreaFormInput(
              textAreaScroll: TextAreaScroll.smart,
              maxLength: getMaxLength(validations),
              charCount: charCount ?? false,
              helpText: helpText,
              innerLabel: innerLabel,
              readOnly: readOnly,
              initialValue: form.control(formControlName).value,
              onChange: (value) {
                form.control(formControlName).markAsTouched();
                form.control(formControlName).value = value;
              },
              errorMessage: field.errorText,
              inputFormatters: inputFormatter != null ? [inputFormatter] : null,
            ),
          ),
        );
      },
    );
  }
}
