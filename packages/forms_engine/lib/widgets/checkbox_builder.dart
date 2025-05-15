part of 'json_schema_builder.dart';

class JsonSchemaCheckboxBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaCheckboxBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.label,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      builder: (field){
        return DigitCheckbox(
          label: label ?? 'checkbox label',
          value: (field.value ?? false) as bool,
          onChanged: (value) => field.control.value = value,
        );
      },
    );
  }
}
