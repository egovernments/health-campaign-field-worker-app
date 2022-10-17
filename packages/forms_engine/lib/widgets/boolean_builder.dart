part of 'json_schema_builder.dart';

class JsonSchemaBooleanBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaBooleanBuilder({
    required super.formControlName,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final control = formGroup.control(formControlName);
        return DigitCheckboxTile(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
          label: hint ?? 'Some',
          value: (control.value ?? false) as bool,
          onChanged: (value) => control.value = value,
        );
      },
    );
  }
}
