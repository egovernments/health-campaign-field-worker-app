part of 'json_schema_builder.dart';


class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<Option> enums;

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
    super.tooltipText,
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
        infoText: translateIfPresent(tooltipText, loc),
        tooltipTriggerMode: TooltipTriggerMode.tap,
        label: label,
        capitalizedFirstLetter: false,
        isRequired: isRequired ?? false,
        child: DigitDropdown<String>(
          helpText: helpText,
          errorMessage: field.errorText,
          selectedOption: field.value != null
              ? DropdownItem(
            code: field.value!,
            name: loc.translate(
              enums.firstWhere(
                    (e) => e.code == field.value,
                orElse: () => Option(code: field.value!, name: field.value!),
              ).name,
            ),
          ) : null,
          items: enums
              .map(
                (e) => DropdownItem(
                code: e.code,
                name: loc.translate(e.name)),
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
          onChange: (value) {
            if (value.isEmpty) {
              form.control(formControlName).value = null;
            }
          },
        ),
      ),
    );
  }
}
