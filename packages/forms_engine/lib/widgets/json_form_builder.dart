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
    final form = ReactiveForm.of(context) as FormGroup;

    // Handle conditional display logic
    if (_shouldHideField(form)) {
      return const Offstage();
    }

    return _buildByType(form);
  }

  /// Conditionally hide based on display behavior
  bool _shouldHideField(FormGroup form) {
    final display = widget.schema.displayBehavior;
    if (display == null) return false;

    final oneOf = display.oneOf;
    final allOf = display.allOf;

    final values = (oneOf ?? allOf!).map((e) {
      final value = form.control(e).value;
      if (value is bool?) return !(value ?? false);
      if (value is String?) return value?.isNotEmpty ?? false;
      return false;
    }).toList();

    final result = oneOf != null && oneOf.isNotEmpty
        ? values.fold(true, (prev, curr) => prev && curr)
        : values.fold(false, (prev, curr) => prev || curr);

    return display.behavior == FormulaBehavior.hide && result;
  }

  /// Dispatch to builder based on property type
  Widget _buildByType(FormGroup form) {
    switch (widget.schema.type) {
      case PropertySchemaType.string:
        return _buildStringType(form);
      case PropertySchemaType.integer:
        return _buildIntegerType(form);
      case PropertySchemaType.boolean:
        return _buildBooleanType(form);
      case PropertySchemaType.object:
        return _buildObjectType(form);
    }
  }

  /// Handle `string` type formats
  Widget _buildStringType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.select:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaSelectionBuilder(
            form: form,
            formControlName: widget.formControlName,
            enums: (widget.schema.enums ?? [])
                .map(localizations.translate)
                .toList(),
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.dropdown:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaDropdownBuilder(
            form: form,
            formControlName: widget.formControlName,
            enums: (widget.schema.enums ?? [])
                .map(localizations.translate)
                .toList(),
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.date:
        return JsonSchemaDatePickerBuilder(
          label: localizations.translate(widget.schema.label ?? ''),
          form: form,
          formControlName: widget.formControlName,
          start: widget.schema.firstDate?.dateValue,
          end: widget.schema.lastDate?.dateValue,
          validations: widget.schema.validations,
        );

      case PropertySchemaFormat.locality:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaStringBuilder(
            form: form,
            value: widget.schema.value as String?,
            formControlName: widget.formControlName,
            readOnly: true,
          ),
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      case PropertySchemaFormat.latLng:
        return JsonSchemaLatLngBuilder(
          formControlName: widget.formControlName,
          form: form,
          label: localizations.translate(widget.schema.label ?? ''),
        );

      default:

        return JsonSchemaStringBuilder(
          form: form,
          label: localizations.translate(widget.schema.label ?? ''),
          formControlName: widget.formControlName,
          value: widget.schema.value as String?,
          validations: widget.schema.validations,
        );
    }
  }

  /// Handle `integer` type formats
  Widget _buildIntegerType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.text:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaNumberBuilder(
            form: form,
            formControlName: widget.formControlName,
            inputType: TextInputType.number,
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.numeric:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaIntegerBuilder(
            form: form,
            value: widget.schema.value as int?,
            formControlName: widget.formControlName,
            readOnly: true,
            minValue: widget.schema.minValue,
            maxValue: widget.schema.maxValue,
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      default:
        return JsonSchemaNumberBuilder(
          form: form,
          label: localizations.translate(widget.schema.label ?? ''),
          formControlName: widget.formControlName,
          value: widget.schema.value as int?,
          validations: widget.schema.validations,
        );
    }
  }

  /// Handle `boolean` type
  Widget _buildBooleanType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.checkbox:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaCheckboxBuilder(
            form: form,
            formControlName: widget.formControlName,
            label: localizations.translate(widget.schema.label ?? ''),
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.radio:
        return LabeledField(
          label: localizations.translate(widget.schema.label ?? ''),
          child: JsonSchemaRadioBuilder(
            form: form,
            formControlName: widget.formControlName,
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      default:

        return JsonSchemaStringBuilder(
          form: form,
          label: localizations.translate(widget.schema.label ?? ''),
          formControlName: widget.formControlName,
          value: widget.schema.value as String?,
          readOnly: widget.schema.readonly ?? false,
          validations: widget.schema.validations,
        );
    }
  }

  /// Handle `object` type
  Widget _buildObjectType(FormGroup form) {
    final entries = widget.schema.properties?.entries.toList() ?? [];

    return Column(
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
  }

  /// Handle `custom` format
  Widget? _buildCustomComponent() {
    if (widget.components == null || widget.components!.isEmpty) return null;
    for (var component in widget.components!) {
      if (component.containsKey(widget.formControlName)) {
        return component[widget.formControlName]!;
      }
    }
    return null;
  }
}

