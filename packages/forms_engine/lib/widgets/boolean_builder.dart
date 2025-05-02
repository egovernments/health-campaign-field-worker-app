part of 'json_schema_builder.dart';

class JsonSchemaBooleanBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaBooleanBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final control = formGroup.control(formControlName);
        return DigitCheckbox(
          label: hint ?? 'checkbox label',
          value: (control.value ?? false) as bool,
          onChanged: (value) => control.value = value,
        );
      },
    );
  }
}
