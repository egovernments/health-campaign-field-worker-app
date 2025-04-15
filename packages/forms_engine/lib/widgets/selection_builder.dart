part of 'json_schema_builder.dart';

class JsonSchemaSelectionBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;

  const JsonSchemaSelectionBuilder({
    required super.formControlName,
    required super.form,
    required this.enums,
    super.key,
    super.value,
    super.hint,
    super.readOnly,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final control = form.control(formControlName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  
        ReactiveFormField<String, String>(
          formControlName: formControlName,
          builder: (field) {
            return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SelectionCard<String>(
              options: enums,
              valueMapper: (e) => e,
              allowMultipleSelection: false,
              equalWidthOptions: true,
              showParentContainer: false,
              initialSelection: field.value != null ? [field.value!] : [],
              onSelectionChanged: (selected) {
                field.control.markAsTouched();
                field.didChange(selected.isNotEmpty ? selected.first : null);
              },
              errorMessage: control.invalid && control.touched
                  ? control.errors.values.first.toString()
                  : null,
            ));
          },
        ),
      ],
    );
  }
}
