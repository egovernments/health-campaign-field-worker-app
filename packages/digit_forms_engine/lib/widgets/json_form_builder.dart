part of 'json_schema_builder.dart';

class JsonFormBuilder extends LocalizedStatefulWidget {
  final String formControlName;
  final PropertySchema schema;
  final List<Map<String, Widget>>? components;
  final String pageName;
  final String currentSchemaKey;

  final bool? isView;

  const JsonFormBuilder({
    super.key,
    super.appLocalizations,
    required this.formControlName,
    required this.schema,
    this.components,
    required this.pageName,
    required this.currentSchemaKey,
    this.isView,
  });

  @override
  State<JsonFormBuilder> createState() => _JsonFormBuilderState();
}

class _JsonFormBuilderState extends LocalizedState<JsonFormBuilder> {
  bool _autoReadOnly = false; // ← runtime overlay

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    // Handle conditional display logic
    if (_shouldHideField(form)) {
      return const SizedBox.shrink();
    }

    _checkAutoFill(form);

    return _buildByType(form, widget.isView);
  }

  bool get _isReadOnly => (widget.schema.readOnly ?? false) || _autoReadOnly;

  void _checkAutoFill(FormGroup form) {
    final autoFillConditions = widget.schema.autoFillCondition;

    if (autoFillConditions == null || autoFillConditions.isEmpty) return;

    final formState = context.read<FormsBloc>().state;
    final currentPageKey = widget.pageName;
    final currentSchemaKey = widget.currentSchemaKey;

    final values = buildVisibilityEvaluationContext(
      currentPageKey: currentPageKey,
      currentForm: form,
      pages: formState.cachedSchemas[currentSchemaKey]!.pages,
    );

    bool matched = false;

    for (final condition in autoFillConditions) {
      final result = evaluateVisibilityExpression(condition.expression, values);
      if (result) {
        matched = true;

        // Access defaultValues via Provider
        final defaultValues = context.read<Map<String, dynamic>>();

        final key = _stripCurlyBraces(condition.value);
        final filledValue = defaultValues[key];

        form.control(widget.formControlName).value = filledValue;

        _autoReadOnly = true;

        /// make field as non editable

        break;
      }
    }

    if (!matched && _autoReadOnly) {
      // Condition not met — reset to default
      form.control(widget.formControlName).value = widget.schema.value;
      _autoReadOnly = widget.schema.readOnly ?? false; // ← back to editable
    }
  }

  String _stripCurlyBraces(String value) {
    final regex = RegExp(r'^\{\{(.+)\}\}$'); // Matches {{...}}
    final match = regex.firstMatch(value.trim());
    return match != null
        ? match.group(1)!
        : value; // Return inside if matched, else original
  }

  /// Conditionally hide based on display behavior
  bool _shouldHideField(FormGroup form) {
    final hidden = widget.schema.hidden;
    if (hidden != null && hidden == true) return true;

    final visibility = widget.schema.visibilityCondition;
    if (visibility != null && visibility.expression.isNotEmpty) {
      final formState = context.read<FormsBloc>().state;
      final currentPageKey = widget.pageName;

      final currentSchemaKey = widget.currentSchemaKey;

      final values = buildVisibilityEvaluationContext(
        currentPageKey: currentPageKey,
        currentForm: form,
        pages: formState.cachedSchemas[currentSchemaKey]!.pages,

        /// TODO: fix hardcode not null condition
      );

      final result =
          evaluateVisibilityExpression(visibility.expression, values);
      VisibilityManager(schemaMap: {
        widget.formControlName: widget.schema,
      }, formData: form.rawValue, form: form)
          .toggleControlVisibility(
              widget.formControlName, result, widget.schema);

      return !result;
    }

    return false;
  }

  /// Dispatch to builder based on property type
  Widget _buildByType(FormGroup form, bool? isViewType) {
    switch (widget.schema.type) {
      case PropertySchemaType.string:
        return _buildStringType(form, isViewType);
      case PropertySchemaType.integer:
        return _buildIntegerType(form, isViewType);
      case PropertySchemaType.boolean:
        return _buildBooleanType(form, isViewType);
      case PropertySchemaType.object:
        return _buildObjectType(form);
      case PropertySchemaType.dynamic:
        return _buildCustomComponent() ?? const SizedBox.shrink();
    }
  }

  /// Handle `string` type formats
  Widget _buildStringType(FormGroup form, bool? isView) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.select:
        return _wrapWithSection(LabeledField(
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
        ));

      case PropertySchemaFormat.idPopulator:
        return _wrapWithSection(
          JsonSchemaIdPopulatorBuilder(
            form: form,
            label: translateIfPresent(widget.schema.label, localizations),
            isRequired: hasRequiredValidation(widget.schema.validations),
            formControlName: widget.formControlName,
            enums: widget.schema.enums ?? [],
            validations: widget.schema.validations,
            helpText: translateIfPresent(widget.schema.helpText, localizations),
            tooltipText:
                translateIfPresent(widget.schema.tooltip, localizations),
            innerLabel:
                translateIfPresent(widget.schema.innerLabel, localizations),
          ),
        );

      case PropertySchemaFormat.dropdown:
        return _wrapWithSection(
          JsonSchemaDropdownBuilder(
            tooltipText:
                translateIfPresent(widget.schema.tooltip, localizations),
            isRequired: hasRequiredValidation(widget.schema.validations),
            label: translateIfPresent(widget.schema.label, localizations),
            form: form,
            readOnly: isView ?? _isReadOnly,
            formControlName: widget.formControlName,
            enums: widget.schema.enums ?? [],
            validations: widget.schema.validations,
            helpText: translateIfPresent(widget.schema.helpText, localizations),
          ),
        );

      case PropertySchemaFormat.mobileNumber:
        return _wrapWithSection(JsonSchemaStringBuilder(
          form: form,
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          inputType: TextInputType.number,
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));

      case PropertySchemaFormat.dob:
        return _wrapWithSection(JsonSchemaDOBBuilder(
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          initialDate: parseDateValue(widget.schema.startDate),
        ));

      case PropertySchemaFormat.scanner:
        return _wrapWithSection(JsonSchemaScannerBuilder(
          form: form,
          value: widget.schema.value as String?,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
          validations: widget.schema.validations,
        ));

      case PropertySchemaFormat.date:
        return _wrapWithSection(JsonSchemaDatePickerBuilder(
          isRequired: hasRequiredValidation(widget.schema.validations),
          readOnly: isView ?? _isReadOnly,
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
        ));

      case PropertySchemaFormat.locality:
        return _wrapWithSection(JsonSchemaStringBuilder(
          form: form,
          isRequired: hasRequiredValidation(widget.schema.validations),
          value: widget.schema.value as String?,
          formControlName: widget.formControlName,
          readOnly: true,
          label: translateIfPresent(widget.schema.label, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        ));

      case PropertySchemaFormat.radio:
        return _wrapWithSection(JsonSchemaRadioBuilder(
          form: form,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          enums: widget.schema.enums ?? [],
        ));

      case PropertySchemaFormat.custom:
        return _wrapWithSection(
            _buildCustomComponent() ?? const SizedBox.shrink());

      case PropertySchemaFormat.latLng:
        return _wrapWithSection(JsonSchemaLatLngBuilder(
          formControlName: widget.formControlName,
          form: form,
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
        ));

      case PropertySchemaFormat.textArea:
        return _wrapWithSection(JsonSchemaTextAreaBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value?.toString(),
          validations: widget.schema.validations,
          readOnly: isView ?? _isReadOnly,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));

      case PropertySchemaFormat.mobileNumber:
        return _wrapWithSection(JsonSchemaStringBuilder(
          form: form,
          inputType: TextInputType.number,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value?.toString(),
          validations: widget.schema.validations,
          readOnly: isView ?? _isReadOnly,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));

      default:
        return _wrapWithSection(JsonSchemaStringBuilder(
          form: form,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value?.toString(),
          validations: widget.schema.validations,
          readOnly: isView ?? _isReadOnly,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));
    }
  }

  /// Handle `integer` type formats
  Widget _buildIntegerType(FormGroup form, bool? isView) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.text:
        return _wrapWithSection(JsonSchemaNumberBuilder(
          form: form,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          inputType: TextInputType.number,
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));

      case PropertySchemaFormat.mobileNumber:
        return _wrapWithSection(JsonSchemaNumberBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          inputType: TextInputType.number,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));

      case PropertySchemaFormat.date:
        return _wrapWithSection(JsonSchemaDatePickerBuilder(
          readOnly: isView ?? _isReadOnly,
          isRequired: hasRequiredValidation(widget.schema.validations),
          label: translateIfPresent(widget.schema.label, localizations),
          form: form,
          formControlName: widget.formControlName,
          start: parseDateValue(widget.schema.startDate),
          end: parseDateValue(widget.schema.endDate),
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
        ));

      case PropertySchemaFormat.numeric:
        return _wrapWithSection(JsonSchemaIntegerBuilder(
          form: form,
          value: parseIntValue(widget.schema.value) ?? 0,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          minValue: widget.schema.minValue,
          maxValue: widget.schema.maxValue,
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          isRequired: hasRequiredValidation(widget.schema.validations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        ));

      case PropertySchemaFormat.custom:
        return _wrapWithSection(
            _buildCustomComponent() ?? const SizedBox.shrink());

      default:
        return _wrapWithSection(JsonSchemaNumberBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          prefixText:
              translateIfPresent(widget.schema.prefixText, localizations),
          suffixText:
              translateIfPresent(widget.schema.suffixText, localizations),
          helpText: translateIfPresent(widget.schema.helpText, localizations),
        ));
    }
  }

  /// Handle `boolean` type
  Widget _buildBooleanType(FormGroup form, bool? isView) {
    final format = widget.schema.format;

    switch (format) {
      case PropertySchemaFormat.checkbox:
        return _wrapWithSection(JsonSchemaCheckboxBuilder(
          form: form,
          formControlName: widget.formControlName,
          label: translateIfPresent(widget.schema.label, localizations),
          validations: widget.schema.validations,
          readOnly: isView ?? _isReadOnly,
          isRequired: hasRequiredValidation(widget.schema.validations),
        ));

      case PropertySchemaFormat.radio:
        return _wrapWithSection(JsonSchemaRadioBuilder(
          form: form,
          isBoolean: true,
          formControlName: widget.formControlName,
          validations: widget.schema.validations,
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          label: translateIfPresent(widget.schema.label, localizations),
          enums: widget.schema.enums ?? [],
          readOnly: isView ?? _isReadOnly,
        ));

      case PropertySchemaFormat.custom:
        return _wrapWithSection(
            _buildCustomComponent() ?? const SizedBox.shrink());

      default:
        return _wrapWithSection(JsonSchemaStringBuilder(
          form: form,
          label: translateIfPresent(widget.schema.label, localizations),
          formControlName: widget.formControlName,
          value: widget.schema.value as String?,
          readOnly: isView ?? _isReadOnly,
          validations: widget.schema.validations,
          helpText: translateIfPresent(widget.schema.helpText, localizations),
          tooltipText: translateIfPresent(widget.schema.tooltip, localizations),
          innerLabel:
              translateIfPresent(widget.schema.innerLabel, localizations),
        ));
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
              pageName: widget.pageName,
              currentSchemaKey: widget.currentSchemaKey,
              formControlName: subName,
              schema: subSchema,
              components: widget.components,
              isView: widget.isView,
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
        return _wrapWithSection(component[widget.formControlName]!);
      }
    }
    return null;
  }

  Widget _wrapWithSection(Widget child) {
    final sectionKey =
        widget.schema.section; // ← String? section on PropertySchema
    final translated = sectionKey == null
        ? null
        : translateIfPresent(sectionKey, localizations);

    if (translated == null || translated.isEmpty) return child;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: spacer2,
            bottom: spacer2,
          ),
          child: DigitDivider(),
        ),
        const SizedBox(
          height: spacer2,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: spacer2,
            bottom: spacer2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translated,
                style: Theme.of(context)
                    .digitTextTheme(context)
                    .headingXl
                    .copyWith(
                        color: Theme.of(context).colorTheme.primary.primary2),
              ),
              if (widget.schema.sectionDescription != null &&
                  translateIfPresent(
                          widget.schema.sectionDescription, localizations) !=
                      null &&
                  translateIfPresent(
                          widget.schema.sectionDescription, localizations)!
                      .isNotEmpty) ...[
                const SizedBox(
                  height: spacer1,
                ),
                Text(
                  localizations.translate(widget.schema.sectionDescription!),
                  style: Theme.of(context)
                      .digitTextTheme(context)
                      .bodyS
                      .copyWith(
                          color: Theme.of(context).colorTheme.text.secondary),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: spacer2),
        child,
      ],
    );
  }
}
