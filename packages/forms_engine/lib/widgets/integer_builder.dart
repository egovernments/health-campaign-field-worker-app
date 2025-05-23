part of 'json_schema_builder.dart';

class JsonSchemaIntegerBuilder extends JsonSchemaBuilder<int> {
  final int? maxValue;
  final int? minValue;

  const JsonSchemaIntegerBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    this.maxValue,
    this.minValue,
    super.label,
    super.helpText,
    super.innerLabel,
    super.readOnly,
    super.validations,
    super.isRequired,
    super.tooltipText,
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
        tooltipTriggerMode: TooltipTriggerMode.tap,
        label: label,
        isRequired: isRequired ?? false,
        child: DigitNumericFormInput(
          helpText: helpText,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          errorMessage: field.errorText,
          minValue: minValue ?? 0,
          maxValue: maxValue ?? 100,
          maxLength: 5,
          step: 1,
          initialValue: (form.control(formControlName).value ?? 0).toString(),
          onChange: (value) {
            if (value.isEmpty) {
              form.control(formControlName).value = 0;
              return;
            }
            form.control(formControlName).value = int.parse(value);
          },
        ),
      ),
    );
  }
}
