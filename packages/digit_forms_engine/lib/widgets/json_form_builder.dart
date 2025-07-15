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
      return const SizedBox.shrink();
    }

    return _buildByType(form);
  }

  /// Conditionally hide based on display behavior
  bool _shouldHideField(FormGroup form) {
    final hidden = widget.schema.hidden;
    if (hidden != null && hidden == true) return true;
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
      case PropertySchemaType.dynamic:
        return _buildCustomComponent() ?? const SizedBox.shrink();
    }
  }

  /// Handle `string` type formats
  Widget _buildStringType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.select:
        return LabeledField(
          infoText: translateIfPresent(widget.schema.tooltip, localizations),
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          child: JsonSchemaSelectionBuilder(
            form: form,
            isMultiSelect: widget.schema.isMultiSelect,
            formControlName: widget.formControlName,
            enums: widget.schema.enums ?? [],
            validations: widget.schema.validations,
          ),
        );

      case PropertySchemaFormat.idPopulator:
        return JsonSchemaIdPopulatorBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          isRequired: hasRequiredValidation(widget.schema.validations),
          formControlName: widget.formControlName,
          enums: widget.schema.enums ?? [],
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        );

      case PropertySchemaFormat.dropdown:
        return JsonSchemaDropdownBuilder(
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          enums: widget.schema.enums ?? [],
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        );

      case PropertySchemaFormat.dob:
        return JsonSchemaDOBBuilder(
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          initialDate: parseDateValue(widget.schema.startDate),
        );

      case PropertySchemaFormat.scanner:
        return JsonSchemaScannerBuilder(
          form: form,
          value: widget.schema.value as String?,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
        );

      case PropertySchemaFormat.date:
        return JsonSchemaDatePickerBuilder(
          isRequired: hasRequiredValidation(widget.schema.validations),
          readOnly: widget.schema.readOnly ?? false,
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          start: parseDateValue(widget.schema.startDate),
          end: parseDateValue(widget.schema.endDate),
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        );

      case PropertySchemaFormat.locality:
        return JsonSchemaStringBuilder(
          form: form,
          isRequired: hasRequiredValidation(widget.schema.validations),
          value: widget.schema.value as String?,
          formControlName: widget.formControlName,
          readOnly: true,
          label: translateIfPresent(widget.schema.label, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        );

      case PropertySchemaFormat.radio:
        return JsonSchemaRadioBuilder(
          form: form,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          enums: widget.schema.enums ?? [],
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      case PropertySchemaFormat.latLng:
        return JsonSchemaLatLngBuilder(
          formControlName: widget.formControlName,
          form: form,
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
        );

      default:
        return JsonSchemaStringBuilder(
          form: form,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value?.toString(),
          validations: widget.schema.validations,
          readOnly: widget.schema.readOnly ?? false,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        );
    }
  }

  /// Handle `integer` type formats
  Widget _buildIntegerType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.text:
        return JsonSchemaNumberBuilder(
          form: form,
          prefixText:
          translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
          translateIfPresent(widget.schema.suffixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          inputType: TextInputType.number,
          readOnly: widget.schema.readOnly ?? false,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        );

      case PropertySchemaFormat.mobileNumber:
        return JsonSchemaNumberBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          inputType: TextInputType.number,
          readOnly: widget.schema.readOnly ?? false,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        );

      case PropertySchemaFormat.date:
        return JsonSchemaDatePickerBuilder(
          readOnly: widget.schema.readOnly ?? false,
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          start: parseDateValue(widget.schema.startDate),
          end: parseDateValue(widget.schema.endDate),
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
        );

      case PropertySchemaFormat.numeric:
        return JsonSchemaIntegerBuilder(
          form: form,
          value: parseIntValue(widget.schema.value) ?? 0,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          minValue: widget.schema.minValue,
          maxValue: widget.schema.maxValue,
          readOnly: widget.schema.readOnly ?? false,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      default:
        return JsonSchemaNumberBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          readOnly: widget.schema.readOnly ?? false,
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        );
    }
  }

  /// Handle `boolean` type
  Widget _buildBooleanType(FormGroup form) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.checkbox:
        return JsonSchemaCheckboxBuilder(
          form: form,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
          validations: widget.schema.validations,
          readOnly: widget.schema.readOnly ?? false,
          isRequired: hasRequiredValidation(widget.schema.validations),
        );

      case PropertySchemaFormat.radio:
        return JsonSchemaRadioBuilder(
          form: form,
          isBoolean: true,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          enums: widget.schema.enums ?? [],
          readOnly: widget.schema.readOnly ?? false,
        );

      case PropertySchemaFormat.custom:
        return _buildCustomComponent() ?? const SizedBox.shrink();

      default:
        return JsonSchemaStringBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value as String?,
          readOnly: widget.schema.readOnly ?? false,
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        );
    }
  }

  /// Handle `object` type
  Widget _buildObjectType(FormGroup form) {
    final entries = widget.schema.properties?.entries.toList() ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries
          .where((entry) {
            final subSchema = entry.value;
            return !shouldHideField(subSchema, form);
          })
          .toList()
          .asMap()
          .entries
          .map((entry) {
            final index = entry.key;
            final mapEntry = entry.value;
            final subSchema = mapEntry.value;
            final subName = mapEntry.key;

            final field = JsonFormBuilder(
              formControlName: subName,
              schema: subSchema,
              components: widget.components,
            );

            final isLast = index ==
                entries.where((e) => !shouldHideField(e.value, form)).length -
                    1;

            return isLast
                ? field
                : Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: field,
                  );
          })
          .toList(),
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
