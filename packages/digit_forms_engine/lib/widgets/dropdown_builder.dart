part of 'json_schema_builder.dart';

class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<Option> enums;
  final bool isMultiselect;

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
    this.isMultiselect = false,
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
        label: label,
        capitalizedFirstLetter: false,
        isRequired: isRequired ?? false,
        child: isMultiselect
            ? MultiSelectDropDown(
                helpText: helpText,
                errorMessage: field.errorText,
                initialOptions: field.value != null
                    ? (field.value as String)
                        .split('.')
                        .map(
                          (val) => DropdownItem(
                            code: val,
                            name: loc.translate(
                              enums
                                  .firstWhere(
                                    (e) => e.code == val,
                                    orElse: () => Option(code: val, name: val),
                                  )
                                  .name,
                            ),
                          ),
                        )
                        .toList()
                    : null,
                options: enums
                    .map(
                      (e) => DropdownItem(
                          code: e.code, name: loc.translate(e.name)),
                    )
                    .toList(),
                onOptionSelected: (selectedValues) {
                  form.control(formControlName).markAsTouched();
                  // join selected values into dot-separated string
                  form.control(formControlName).value =
                      selectedValues.map((e) => e.code).join('.');
                },
              )
            : DigitDropdown<String>(
                helpText: helpText,
                errorMessage: field.errorText,
                selectedOption: field.value != null
                    ? DropdownItem(
                        code: field.value!,
                        name: loc.translate(
                          enums
                              .firstWhere(
                                (e) => e.code == field.value,
                                orElse: () => Option(
                                    code: field.value!, name: field.value!),
                              )
                              .name,
                        ),
                      )
                    : null,
                items: enums
                    .map(
                      (e) => DropdownItem(
                          code: e.code, name: loc.translate(e.name)),
                    )
                    .toList(),
                onSelect: (value) {
                  form.control(formControlName).markAsTouched();
                  form.control(formControlName).value = value.code;
                },
                onChange: (value) {
                  form.control(formControlName).markAsTouched();
                  if (value.isEmpty) {
                    form.control(formControlName).value = null;
                  }
                },
              ),
      ),
    );
  }
}
