part of 'json_schema_builder.dart';


class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;
  final String? label;

  const JsonSchemaDropdownBuilder({
    required super.formControlName,
    required super.form,
    required this.enums,
    this.label,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: const {
        // 'required': (_) => localizations.translate(
        //   i18.common.corecommonRequired,
        // ),
      },
      builder: (field) => LabeledField(
        label: label,
        capitalizedFirstLetter: false,
        isRequired: true,
        child: DigitDropdown<String>(
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
