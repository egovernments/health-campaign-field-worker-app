part of 'json_schema_builder.dart';

class JsonSchemaIntegerBuilder extends JsonSchemaBuilder<int> {
  final int? minimum;
  final int? maximum;

  const JsonSchemaIntegerBuilder({
    required super.formControlName,
    super.key,
    super.value,
    super.hint,
    this.minimum,
    this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(labelText: hint),
      keyboardType: TextInputType.number,
    );
  }
}
