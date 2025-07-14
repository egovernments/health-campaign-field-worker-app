part of 'json_schema_builder.dart';

class JsonSchemaNumberBuilder extends JsonSchemaBuilder<int> {
  final TextInputType inputType;
  final String? prefixText;
  final String? suffixText;

  const JsonSchemaNumberBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.disabled,
    super.helpText,
    super.innerLabel,
    super.onTap,
    super.label,
    this.prefixText,
    this.suffixText,
    super.readOnly,
    this.inputType = TextInputType.number,
    super.isRequired,
    super.validations,
    super.inputFormatter,
    super.tooltipText,
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
            label: label,
            isRequired: hasRequiredValidation(validations),
            capitalizedFirstLetter: false,
            infoText: translateIfPresent(tooltipText, loc),
            child: DigitTextFormInput(
              maxLength: getMaxLength(validations),
              helpText: helpText,
              innerLabel: innerLabel,
              suffixText: suffixText,
              prefixText: prefixText,
              readOnly: readOnly,
              keyboardType: inputType,
              initialValue: form.control(formControlName).value?.toString(),
              onChange: (value) {
                form.control(formControlName).markAsTouched();
                if (value.isEmpty) {
                  form.control(formControlName).value = null;
                  return;
                }
                form.control(formControlName).value = int.parse(value);
                if(getMinLength(validations) != null && value.length < getMinLength(validations)!) {
                  form.control(formControlName).setErrors({'minLength': true});
                }else{
                  form.control(formControlName).removeError('minLength');
                }
              },
              errorMessage: _getNumberErrorMessage(field.control, context),
              inputFormatters: inputFormatter != null ? [inputFormatter] : null,
            ),
          ),
        );
      },
    );
  }
  String? _getNumberErrorMessage(AbstractControl<dynamic> control, BuildContext context) {
    final loc = FormLocalization.of(context);

    for (final rule in validations ?? []) {
      if (control.hasError(rule.type) && control.touched) {
        return loc.translate(rule.message ?? 'Invalid');
      }
    }

    return null;
  }
}
