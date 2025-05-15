part of 'json_schema_builder.dart';

class JsonSchemaRadioBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaRadioBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.label,
    super.readOnly,
    super.validations,
  });

  /// TODO: need to check if they are sending as list or a single radio button
  @override
  Widget build(BuildContext context) {

    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field){
        return RadioList(
          errorMessage: field.errorText,
          radioDigitButtons: const [],
          onChanged: (value) => field.control.value = value,
        );
      },
    );
  }

}
