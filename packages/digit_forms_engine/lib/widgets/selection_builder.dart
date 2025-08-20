part of 'json_schema_builder.dart';

class JsonSchemaSelectionBuilder extends JsonSchemaBuilder<String> {
  final List<Option> enums;
  final bool? isMultiSelect;

  const JsonSchemaSelectionBuilder({
    required super.formControlName,
    required super.form,
    required this.enums,
    this.isMultiSelect = false,
    super.key,
    super.value,
    super.helpText,
    super.readOnly,
    super.onTap,
    super.validations,
    super.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    // Map each option to its localized name for display
    final localizedOptions = enums
        .map((e) => Option(code: e.code, name: loc.translate(e.name)))
        .toList();

    return ReactiveFormField<String, String>(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        return SelectionCard<Option>(
          options: localizedOptions,
          valueMapper: (val) => val.name,
          allowMultipleSelection: isMultiSelect ?? false,
          equalWidthOptions: true,
          showParentContainer: true,
          initialSelection: field.value != null
              ? field.value!.split('.').map((code) {
            return localizedOptions.firstWhere(
                  (e) => e.code == code,
              orElse: () => Option(code: code, name: code),
            );
          }).toList()
              : [],
          onSelectionChanged: (selected) {
            field.control.markAsTouched();

            final selectedCodes = (isMultiSelect ?? false)
                ? selected.map((e) => e.code).toList()
                : [selected.first.code];

            final joinedCodeString = selectedCodes.join('.');
            field.didChange(joinedCodeString);
          },
          errorMessage: field.errorText,
        );
      },
    );
  }
}
