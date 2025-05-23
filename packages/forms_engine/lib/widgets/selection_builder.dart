part of 'json_schema_builder.dart';

class JsonSchemaSelectionBuilder extends JsonSchemaBuilder<String> {
  final List<Option> enums;

  const JsonSchemaSelectionBuilder({
    required super.formControlName,
    required super.form,
    required this.enums,
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
        return SelectionCard<String>(
          options: localizedOptions.map((e) => e.name).toList(),
          valueMapper: (name) => name,
          allowMultipleSelection: false,
          equalWidthOptions: true,
          showParentContainer: true,
          initialSelection: field.value != null
              ? [localizedOptions.firstWhere((e) => e.code == field.value,
              orElse: () => Option(code: field.value!, name: field.value!))
              .name]
              : [],
          onSelectionChanged: (selected) {
            field.control.markAsTouched();
            final selectedName = selected.isNotEmpty ? selected.first : null;
            final selectedCode = localizedOptions
                .firstWhere((e) => e.name == selectedName,
                orElse: () => Option(code: selectedName ?? '', name: selectedName ?? ''))
                .code;
            field.didChange(selectedCode);
          },
          errorMessage: field.errorText,
        );
      },
    );
  }
}
