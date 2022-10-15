part of 'json_schema_builder.dart';

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final int? minLength;
  final int? maxLength;
  final List<String>? enums;
  final String? format;

  const JsonSchemaStringBuilder({
    required super.formControlName,
    super.key,
    super.value,
    super.hint,
    this.enums,
    this.format,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(labelText: hint),
    );
  }
}
