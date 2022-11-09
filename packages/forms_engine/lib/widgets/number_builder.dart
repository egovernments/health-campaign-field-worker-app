part of 'json_schema_builder.dart';

class JsonSchemaNumberBuilder extends JsonSchemaBuilder<num> {
  final num? minimum;
  final num? maximum;

  const JsonSchemaNumberBuilder(
      {required super.formControlName,
      required super.form,
      super.key,
      super.value,
      super.hint,
      this.maximum,
      this.minimum});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(labelText: hint),
      keyboardType: TextInputType.number,
    );
  }
}
