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
      builder: (field) =>
          LabeledField(
            infoText: translateIfPresent(tooltipText, loc),
            tooltipTriggerMode: TooltipTriggerMode.tap,
            label: label,
            isRequired: isRequired ?? false,
            child: DigitDateFormInput(
              firstDate: parseDateValue(start),
              lastDate: parseDateValue(end),
              readOnly: readOnly,
              errorMessage: field.errorText,
              innerLabel: innerLabel,
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
