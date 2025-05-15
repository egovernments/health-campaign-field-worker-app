part of 'json_schema_builder.dart';


class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;

  const JsonSchemaDropdownBuilder({
    required super.formControlName,
    required super.form,
    required this.enums,
    super.label,
    super.key,
    super.value,
    super.isRequired,
    super.helpText,
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
      builder: (field) => LabeledField(
        label: label,
        capitalizedFirstLetter: false,
        isRequired: isRequired ?? false,
        child: DigitDropdown<String>(
          helpText: helpText,
          errorMessage: field.errorText,
          selectedOption:
          (form.control(formControlName).value != null)
              ? DropdownItem(
              name: form.control(formControlName).value,
              code: form.control(formControlName).value)
              : null,
          items: enums
              .map(
                (e) => DropdownItem(
                name: e,
                code: e),
          )
              .toList(),
          onSelect: (value) {
            form.control(formControlName).value = value.code;
              // if (value.code == 'DEFAULT') {
              //   form.control(formControlName).value =
              //       IdGen.i.identifier.toString();
              // } else {
              //   form.control(formControlName).value = null;
              // }
          },
        ),
      ),
    );
  }
}
