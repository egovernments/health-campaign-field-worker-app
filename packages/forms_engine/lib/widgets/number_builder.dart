part of 'json_schema_builder.dart';

class JsonSchemaNumberBuilder extends JsonSchemaBuilder<int> {
  final TextInputType inputType;

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
    super.readOnly,
    this.inputType = TextInputType.number,
    super.isRequired,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {

    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        return ReactiveWrapperField(
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) => LabeledField(
            label: label,
            capitalizedFirstLetter: false,
            isRequired: isRequired ?? false,
            child: DigitTextFormInput(
              helpText: helpText,
              innerLabel: innerLabel,
              readOnly: readOnly,
              keyboardType: inputType,
              initialValue:  form
                  .control(formControlName)
                  .value
                  .toString(),
              onChange: (value) {
                if (value.isEmpty) {
                  form.control(formControlName).value = 0;
                  return;
                }
                form.control(formControlName).value = int.parse(value);
              },
              errorMessage: field.errorText,
            ),
          ),
        );
      },
    );
  }
}
