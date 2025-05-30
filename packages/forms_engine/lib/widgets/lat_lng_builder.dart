part of 'json_schema_builder.dart';

class JsonSchemaLatLngBuilder extends JsonSchemaBuilder<String> {
  final String? label;

  const JsonSchemaLatLngBuilder({
    super.key,
    required super.formControlName,
    required super.form,
    this.label,
    super.validations,
    super.helpText,
    super.isRequired,
    super.tooltipText
  });

  @override
  Widget build(BuildContext context) {
    return _LatLngBuilderStatefulWrapper(
      form: form,
      formControlName: formControlName,
      label: label,
      readOnly: readOnly,
      helpText: helpText,
      isRequired: isRequired,
      tooltipText: tooltipText,
    );
  }
}

class _LatLngBuilderStatefulWrapper extends StatefulWidget {
  final String formControlName;
  final FormGroup form;
  final String? label;
  final bool readOnly;
  final String? helpText;
  final bool? isRequired;
  final String? tooltipText;

  const _LatLngBuilderStatefulWrapper({
    required this.form,
    required this.formControlName,
    required this.label,
    required this.readOnly,
    this.helpText,
    this.isRequired,
    this.tooltipText,
  });

  @override
  State<_LatLngBuilderStatefulWrapper> createState() => _LatLngBuilderStatefulWrapperState();
}

class _LatLngBuilderStatefulWrapperState extends State<_LatLngBuilderStatefulWrapper> {
  bool _valueSet = false;

  @override
  void initState() {
    super.initState();
    // Triggered once the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DigitComponentsUtils.showDialog(context, '', DialogType.inProgress);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state.longitude != null && !_valueSet) {
          _valueSet = true;
          widget.form.control(widget.formControlName).value = state.latLngString;

          if (Navigator.canPop(context)) {
            DigitComponentsUtils.hideDialog(context);
          }
        }
      },
      builder: (context, state) {
        return ReactiveFormConsumer(
          builder: (context, formGroup, child) {
            return ReactiveWrapperField(
              formControlName: widget.formControlName,
              builder: (field) => LabeledField(
                infoText: translateIfPresent(widget.tooltipText, loc),
                label: widget.label,
                isRequired: widget.isRequired ?? false,
                capitalizedFirstLetter: false,
                child: DigitTextFormInput(
                  helpText: widget.helpText,
                  readOnly: widget.readOnly,
                  initialValue: widget.form.control(widget.formControlName).value,
                  onChange: (value) {
                    widget.form.control(widget.formControlName).value = value;
                  },
                  errorMessage: field.errorText,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

