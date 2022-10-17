part of 'json_schema_builder.dart';

class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;

  const JsonSchemaDropdownBuilder({
    required super.formControlName,
    required this.enums,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null)
          Text(
            hint!,
            style: Theme.of(context).textTheme.caption,
          ),
        ReactiveDropdownField(
          formControlName: formControlName,
          items: enums
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
