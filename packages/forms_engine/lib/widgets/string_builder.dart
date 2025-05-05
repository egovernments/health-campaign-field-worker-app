part of 'json_schema_builder.dart';

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final int? minLength;
  final int? maxLength;
  final List<String>? enums;
  final String? format;
  final String? label;
  
  final Widget? suffix;

  const JsonSchemaStringBuilder({
    required super.formControlName,
    required super.form,
    super.readOnly,
    super.onTap,
    super.key,
    super.value,
    super.hint,
    this.label,
    this.suffix,
    this.enums,
    this.format,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        return ReactiveWrapperField(
          formControlName: formControlName,
          validationMessages: {
            // 'required': (object) =>
            //     localizations.translate(
            //       '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
            //     ),
          },
          builder: (field) => LabeledField(
            label: label,
            capitalizedFirstLetter: false,
            child: DigitTextFormInput(
              readOnly: readOnly,
              initialValue:
              form.control(formControlName).value,
              onChange: (value) {
                form.control(formControlName).value =
                    value;
              },
              errorMessage: field.errorText,
            ),
          ),
        );
      },
    );
  }
}
