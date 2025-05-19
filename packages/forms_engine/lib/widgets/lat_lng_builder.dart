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
  });

  @override
  Widget build(BuildContext context) {
    return _LatLngBuilderStatefulWrapper(
      form: form,
      formControlName: formControlName,
      label: label,
      readOnly: readOnly,
      helpText: helpText,
    );
  }
}

class _LatLngBuilderStatefulWrapper extends StatefulWidget {
  final String formControlName;
  final FormGroup form;
  final String? label;
  final bool readOnly;
  final String? helpText;

  const _LatLngBuilderStatefulWrapper({
    required this.form,
    required this.formControlName,
    required this.label,
    required this.readOnly,
    this.helpText,
  });

  @override
  State<_LatLngBuilderStatefulWrapper> createState() => _LatLngBuilderStatefulWrapperState();
}

class _LatLngBuilderStatefulWrapperState extends State<_LatLngBuilderStatefulWrapper> {
  bool _dialogShown = false;
  bool _valueSet = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state.loading && !_dialogShown) {
          _dialogShown = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            DigitComponentsUtils.showDialog(context, '', DialogType.inProgress);
          });
        } else if (state.longitude != null && !_valueSet) {
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
                label: widget.label,
                isRequired: true,
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
