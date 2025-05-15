part of 'json_schema_builder.dart';

class JsonSchemaSelectionBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;

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
  });

  @override
  Widget build(BuildContext context) {

    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveFormField<String, String>(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        return SelectionCard<String>(
          options: enums,
          valueMapper: (e) => e,
          allowMultipleSelection: false,
          equalWidthOptions: true,
          showParentContainer: true,
          initialSelection: field.value != null ? [field.value!] : [],
          onSelectionChanged: (selected) {
            field.control.markAsTouched();
            field.didChange(selected.isNotEmpty ? selected.first : null);
          },
          errorMessage: field.errorText,
        );
      },
    );
  }
}
