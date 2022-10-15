part of 'json_schema_builder.dart';

class JsonSchemaDatePickerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaDatePickerBuilder({
    required super.formControlName,
    super.key,
    super.value,
    super.hint,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) => ReactiveDatePicker(
        formControlName: formControlName,
        firstDate: start ?? DateTime(1900),
        lastDate: end ?? DateTime.now(),
        builder: (context, picker, child) {
          return ReactiveTextField<String>(
            formControlName: formControlName,
            readOnly: true,
            decoration: InputDecoration(
              label: hint == null ? null : Text(hint!),
            ),
            onTap: (control) {
              picker.showPicker();
            },
          );
        },
      );
}
