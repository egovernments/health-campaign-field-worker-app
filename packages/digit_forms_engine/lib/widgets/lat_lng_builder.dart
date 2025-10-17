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
    super.tooltipText,
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
  State<_LatLngBuilderStatefulWrapper> createState() =>
      _LatLngBuilderStatefulWrapperState();
}

class _LatLngBuilderStatefulWrapperState
    extends State<_LatLngBuilderStatefulWrapper> {
  double? _accuracy;
  String? _latLngValue;
  bool _isDialogOpen = false;
  bool _isFetchingLocation = false;

  @override
  void initState() {
    super.initState();

    // If control already has a value (prefill), keep it so we can compare later
    final controlValue = widget.form.control(widget.formControlName).value;
    final isLatLngPreFilled =
        controlValue != null && controlValue.toString().isNotEmpty;

    if (isLatLngPreFilled) {
      _latLngValue = controlValue.toString();
      // accuracy unknown in this case; keep as null
    } else {
      // Show loader dialog for initial fetch and then trigger location fetch
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isDialogOpen = true;
        _isFetchingLocation = true;
        DigitComponentsUtils.showDialog(context, '', DialogType.inProgress);

        // Give dialog time to appear before dispatching fetch
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            context.read<LocationBloc>().add(const LoadLocationEvent());
          }
        });
      });
    }
  }

  void _retryLocationFetch() {
    // We intentionally do NOT clear stored _latLngValue here. We want to compare incoming
    // values and update when lat/lng or accuracy actually changes. Clearing would cause
    // unnecessary differences; comparing prevents missed updates vs duplicate updates.
    _accuracy = null;
    _isFetchingLocation = true;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      // If a dialog is already open, avoid reopening; otherwise show it
      if (!_isDialogOpen) {
        _isDialogOpen = true;
        DigitComponentsUtils.showDialog(context, '', DialogType.inProgress);
      }

      // Small delay to ensure dialog has time to mount
      await Future.delayed(const Duration(milliseconds: 200));

      if (mounted) {
        context.read<LocationBloc>().add(const LoadLocationEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final theme = Theme.of(context);

    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        // Only process location updates when we're actively fetching
        if (!_isFetchingLocation) return;

        // If a valid location is present, decide whether to update UI/form
        if (state.longitude != null) {
          final incomingLatLng = state.latLngString;
          final incomingAccuracy = state.accuracy;

          // Should update if either the lat/lng changed or accuracy changed
          final bool shouldUpdate = (incomingLatLng != null) &&
              (incomingLatLng != _latLngValue ||
                  (incomingAccuracy != null && incomingAccuracy != _accuracy));

          if (shouldUpdate) {
            setState(() {
              _latLngValue = incomingLatLng;
              _accuracy = incomingAccuracy;
              _isFetchingLocation = false; // Stop listening after first update
            });

            // Update form control
            widget.form.control(widget.formControlName).value = incomingLatLng;
          }

          // Hide loader dialog if visible
          if (_isDialogOpen && Navigator.canPop(context)) {
            _isDialogOpen = false;
            DigitComponentsUtils.hideDialog(context);
          }
        }
      },
      builder: (context, state) {
        // Determine display text for accuracy
        String displayText = '';
        if (_accuracy != null) {
          final accuracyValue = _accuracy!.toStringAsFixed(2);
          displayText = '$accuracyValue ${loc.translate('CORE_COMMON_METERS')}';
        }

        // Determine color based on accuracy
        Color? textColor;
        if (_accuracy != null && _accuracy! < 5) {
          textColor = theme.colorTheme.alert.success;
        } else if (_accuracy != null) {
          textColor = theme.colorTheme.alert.error;
        }

        return ReactiveFormConsumer(
          builder: (context, formGroup, child) {
            return ReactiveWrapperField(
              formControlName: widget.formControlName,
              builder: (field) => LabeledField(
                infoText: translateIfPresent(widget.tooltipText, loc),
                label: widget.label,
                isRequired: widget.isRequired ?? false,
                capitalizedFirstLetter: false,
                child: Stack(
                  children: [
                    BaseDigitFormInput(
                      helpText: widget.helpText,
                      readOnly: true,
                      initialValue: displayText,
                      textStyle: textColor != null
                          ? TextStyle(color: textColor)
                          : null,
                      onChange: (value) {},
                      errorMessage: field.errorText,
                    ),
                    if (_accuracy != null && _accuracy! > 5)
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 40,
                        child: IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: theme.colorTheme.primary.primary1,
                          ),
                          onPressed: _retryLocationFetch,
                          tooltip: 'Retry',
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
