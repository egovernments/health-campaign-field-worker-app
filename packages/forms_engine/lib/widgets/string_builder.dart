part of 'json_schema_builder.dart';

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final int? minLength;
  final int? maxLength;
  final GlobalObjectKey? indexkey;
  final List<String>? enums;
  final String? format;
  final Widget? suffix;

  const JsonSchemaStringBuilder({
    super.key,
    required super.formControlName,
    required super.form,
    super.readOnly,
    super.onTap,
    this.indexkey,
    super.value,
    super.hint,
    this.suffix,
    this.enums,
    this.format,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        key: indexkey!,
        child: ReactiveTextField(
          readOnly: readOnly,
          formControlName: formControlName,
          decoration: InputDecoration(
            labelText: hint,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 48,
              maxWidth: 48,
            ),
            suffixIcon: suffix == null
                ? null
                : InkWell(
                    onTap: onTap,
                    child: suffix,
                  ),
          ),
        ));
  }
}
