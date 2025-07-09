part of 'json_schema_builder.dart';

class JsonSchemaRadioBuilder extends JsonSchemaBuilder<bool> {
  final List<Option> enums;
  final bool isBoolean;

  const JsonSchemaRadioBuilder({
    required super.formControlName,
    required super.form,
    this.enums = const [],
    super.key,
    super.value,
    super.label,
    super.readOnly,
    this.isBoolean = false,
    super.validations,
    super.tooltipText,
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
        return LabeledField(
          isRequired: hasRequiredValidation(validations),
          label: label,
          infoText: tooltipText,
          child: RadioList(
            readOnly: readOnly,
            groupValue: form.control(formControlName).value.toString(),
            errorMessage: field.errorText,
            radioDigitButtons: enums
                .map(
                  (e) => RadioButtonModel(
                code: e.code,
                name: loc.translate(e.name),
              ),
            ).toList(),
            onChanged: (value){
              form.control(formControlName).markAsTouched();
              if(isBoolean){
                form.control(formControlName).value = value.code == 'true';
              }else{
                form.control(formControlName).value = value.code;
              }

            },
          ),
        );
      },
    );
  }

}
