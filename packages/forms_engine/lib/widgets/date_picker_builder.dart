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
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) =>
          LabeledField(
            label: label,
            child: DigitDateFormInput(
              readOnly: true,
              errorMessage: field.errorText,
              initialValue: DateFormat(
                  Constants().dateMonthYearFormat)
                  .format(form
                  .control(formControlName)
                  .value)
                  .toString(),
            ),
          ),
    );
  }
}
