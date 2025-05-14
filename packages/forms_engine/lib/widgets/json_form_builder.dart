part of 'json_schema_builder.dart';

class JsonFormBuilder extends LocalizedStatefulWidget {
  final String formControlName;
  final PropertySchema schema;
  final List<Map<String, Widget>>? components;

  const JsonFormBuilder({
    super.key,
    super.appLocalizations,
    required this.formControlName,
    required this.schema,
    this.components,
  });

  @override
  State<JsonFormBuilder> createState() => _JsonFormBuilderState();
}

class _JsonFormBuilderState extends LocalizedState<JsonFormBuilder> {
  @override
  Widget build(BuildContext context) {
    final type = widget.schema.type;
    Widget child;

    final display = widget.schema.displayBehavior;
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
        if (widget.schema.format == PropertySchemaFormat.select) {
          child = LabeledField(
            label: localizations.translate(widget.schema.label ?? ''),
            child: JsonSchemaSelectionBuilder(
              form: form,
              formControlName: widget.formControlName,
              hint: widget.schema.hint,
              enums: (widget.schema.enums ?? []).map((e) => localizations.translate(e)).toList(),
            ),
          );
        } else if (widget.schema.enums?.isNotEmpty ?? false) {
          child = JsonSchemaDropdownBuilder(
            form: form,
            label: localizations.translate(widget.schema.label ?? ''),
            formControlName: widget.formControlName,
            value: widget.schema.value as String?,
            enums: (widget.schema.enums ?? []).map((e) => localizations.translate(e)).toList(),
            helpText: widget.schema.helpText != null ? localizations.translate(widget.schema.helpText!) : null,
            isRequired: widget.schema.required ?? false,
          );
        } else if (widget.schema.format == PropertySchemaFormat.date) {
          child = JsonSchemaDatePickerBuilder(
            label: localizations.translate(widget.schema.label ?? ''),
            form: form,
            formControlName: widget.formControlName,
            hint: widget.schema.hint,
            start: widget.schema.firstDate?.dateValue,
            end: widget.schema.lastDate?.dateValue,
          );
        } else if (widget.schema.format == PropertySchemaFormat.locality) {
          child = LabeledField(
            label: localizations.translate(widget.schema.label ?? ''),
            child: JsonSchemaStringBuilder(
              form: form,
              value: widget.schema.value as String?,
              formControlName: widget.formControlName,
              hint: widget.schema.hint,
              readOnly: true,
            ),
          );
        } else if (widget.schema.format == PropertySchemaFormat.custom) {
          child = Container();
          if (widget.components != null && widget.components!.isNotEmpty) {
            for (var component in widget.components!) {
              if (component.containsKey(widget.formControlName)) {
                child = component[widget.formControlName]!;
                break;
              }
            }
          }
        } else if (widget.schema.format == PropertySchemaFormat.numeric) {
          child = JsonSchemaIntegerBuilder(
            form: form,
            label: localizations.translate(widget.schema.label ?? ''),
            formControlName: widget.formControlName,
            value: widget.schema.value ?? 0,
            maximum: widget.schema.maximum?.toInt(),
            minimum: widget.schema.minimum?.toInt(),
            hint: widget.schema.hint,
          );
        } else if (widget.schema.format == PropertySchemaFormat.latLng) {
          child = JsonSchemaLatLngBuilder(
            formControlName: widget.formControlName,
            form: form,
            label: localizations.translate(widget.schema.label ?? ''),
          );
        } else {
          child = JsonSchemaStringBuilder(
            form: form,
            label: localizations.translate(widget.schema.label ?? ''),
            formControlName: widget.formControlName,
            value: widget.schema.value as String?,
            maxLength: widget.schema.maxLength,
            minLength: widget.schema.minLength,
            hint: widget.schema.helpText!=null ? localizations.translate(widget.schema.helpText!) : null,
            isRequired: widget.schema.required ?? false,
            readOnly: widget.schema.readonly ?? false,
            innerLabel: widget.schema.innerLabel != null ? localizations.translate(widget.schema.innerLabel!) : null,
          );
        }
        break;

      case PropertySchemaType.integer:
        child = JsonSchemaIntegerBuilder(
          form: form,
          label: localizations.translate(widget.schema.label ?? ''),
          formControlName: widget.formControlName,
          value: widget.schema.value as int?,
          maximum: widget.schema.maximum?.toInt(),
          minimum: widget.schema.minimum?.toInt(),
          hint: widget.schema.helpText,
        );
        break;

      case PropertySchemaType.boolean:
        child = JsonSchemaBooleanBuilder(
          form: form,
          formControlName: widget.formControlName,
          value: widget.schema.value as bool?,
          hint: localizations.translate(widget.schema.label ?? ''),
        );
        break;

      case PropertySchemaType.object:
        final entries = widget.schema.properties?.entries.toList() ?? [];

        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(entries.length, (index) {
            final entry = entries[index];
            final subSchema = entry.value;
            final subName = entry.key;

            final field = JsonFormBuilder(
              formControlName: subName,
              schema: subSchema,
              components: widget.components,
            );

            return index < entries.length - 1
                ? Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: field,
            )
                : field;
          }),
        );
        break;
    }

    return child;
  }
}
