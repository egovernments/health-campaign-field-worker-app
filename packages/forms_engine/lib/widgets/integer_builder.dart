part of 'json_schema_builder.dart';

class JsonSchemaIntegerBuilder extends JsonSchemaBuilder<int> {
  final int? minimum;
  final int? maximum;
  final String? label;
  final bool incrementer;

  const JsonSchemaIntegerBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    this.label,
    super.hint,
    this.incrementer = false,
    this.minimum,
    this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveWrapperField(
      formControlName: formControlName,
      builder: (field) => LabeledField(
        label: label,
        child: DigitNumericFormInput(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          minValue: 0,
          maxValue: maximum ?? 100,
          maxLength: 5,
          step: 1,
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
        ),
      ),
    );
  }
}
