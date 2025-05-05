part of 'json_schema_builder.dart';

class JsonSchemaDatePickerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final String? label;
  final DateTime? end;

  const JsonSchemaDatePickerBuilder({
    required super.formControlName,
    required super.form,
    this.label,
    super.key,
    super.value,
    super.hint,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) => ReactiveWrapperField(
    formControlName: formControlName,
    builder: (field) => LabeledField(
      label: label,
      child: DigitDateFormInput(
        readOnly: true,
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
