part of 'json_schema_builder.dart';

class JsonFormBuilder extends StatelessWidget {
  final String formControlName;
  final PropertySchema schema;

  const JsonFormBuilder({
    Key? key,
    required this.formControlName,
    required this.schema,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = schema.type;
    Widget? child;

    final display = schema.displayBehavior;
    final form = ReactiveForm.of(context) as FormGroup;

    if (display != null) {
      final oneOf = display.oneOf;
      final allOf = display.allOf;

      final values = (oneOf ?? allOf!).map((e) {
        final value = form.control(e).value;
        if (value is bool?) return !(value ?? false);
        if (value is String?) {
          return value?.isNotEmpty ?? false;
        }
        return false;
      }).toList();

      bool result;

      if (oneOf != null && oneOf.isNotEmpty) {
        result = values.fold(
          true,
          (previousValue, element) => previousValue && element,
        );
      } else {
        result = values.fold(
          false,
          (previousValue, element) => previousValue || element,
        );
      }

      if (display.behavior == FormulaBehavior.hide && result) {
        return const Offstage();
      }
    }

    switch (type) {
      case PropertySchemaType.string:
        if (schema.enums?.isNotEmpty ?? false) {
          child = LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaDropdownBuilder(
              form: form,
              formControlName: formControlName,
              value: schema.value as String?,
              enums: schema.enums!,
              hint: schema.hint,
            ),
          );
          break;
        } else if (schema.format == PropertySchemaFormat.date) {
          child = LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaDatePickerBuilder(
              form: form,
              formControlName: formControlName,
              hint: schema.hint,
              value: schema.value,
              start: schema.firstDate?.dateValue,
              end: schema.lastDate?.dateValue,
            ),
          );
          break;
        } else if (schema.format == PropertySchemaFormat.latLng) {
          child = BlocConsumer<LocationBloc, LocationState>(
            listener: (_, state) {
              form.control(formControlName).value = state.latLngString;
            },
            builder: (context, state) {
              return LabeledField(
                label: schema.label ?? '',
                child: JsonSchemaStringBuilder(
                  form: form,
                  formControlName: formControlName,
                  hint: schema.hint,
                  readOnly: true,
                  suffix: Container(
                    padding: const EdgeInsets.only(right: 8),
                    height: 18,
                    child: state.loading
                        ? const AspectRatio(
                            aspectRatio: 1,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.my_location),
                  ),
                  onTap: state.loading
                      ? null
                      : () => context.read<LocationBloc>().add(
                            const LoadLocationEvent(),
                          ),
                ),
              );
            },
          );
        } else {
          child = LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaStringBuilder(
              form: form,
              formControlName: formControlName,
              value: schema.value as String?,
              maxLength: schema.maxLength,
              minLength: schema.minLength,
              hint: schema.hint,
            ),
          );
        }
        break;
      case PropertySchemaType.integer:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaIntegerBuilder(
            form: form,
            formControlName: formControlName,
            value: schema.value as int?,
            incrementer: schema.format == PropertySchemaFormat.incrementer,
            maximum: schema.maximum?.toInt(),
            minimum: schema.minimum?.toInt(),
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.numeric:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaNumberBuilder(
            form: form,
            formControlName: formControlName,
            value: schema.value as num?,
            maximum: schema.maximum,
            minimum: schema.minimum,
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.boolean:
        child = JsonSchemaBooleanBuilder(
          form: form,
          formControlName: formControlName,
          value: schema.value as bool?,
          hint: schema.label,
        );
        break;
      case PropertySchemaType.object:
        child = Column(
          children: schema.properties?.entries.map<Widget>((e) {
                final subSchema = e.value;
                final subName = e.key;

                return JsonFormBuilder(
                  formControlName: subName,
                  schema: subSchema,
                );
              }).toList() ??
              [const Text('No schema')],
        );
    }
    return child;
  }
}
