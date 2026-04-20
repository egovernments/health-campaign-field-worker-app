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
  double? _latitude;
  double? _longitude;
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

      // Parse lat, lng, accuracy from comma-separated parts
      final parts = _latLngValue!.split(',');
      if (parts.length >= 2) {
        _latitude = double.tryParse(parts[0]);
        _longitude = double.tryParse(parts[1]);
      }
      if (parts.length == 3) {
        _accuracy = double.tryParse(parts[2]);
      } else {
        _accuracy = null;
      }
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
              // Parse lat/lng from incoming value
              if (incomingLatLng != null) {
                final parts = incomingLatLng.split(',');
                if (parts.length >= 2) {
                  _latitude = double.tryParse(parts[0]);
                  _longitude = double.tryParse(parts[1]);
                }
              }
              _isFetchingLocation = false; // Stop listening after first update
            });

            // Append accuracy to existing lat,lng string
            final combinedValue = incomingAccuracy != null
                ? '$incomingLatLng,$incomingAccuracy'
                : incomingLatLng;

            widget.form.control(widget.formControlName).value = combinedValue;
          }

          // Hide loader dialog if visible
          if (_isDialogOpen && Navigator.canPop(context)) {
            _isDialogOpen = false;
            DigitComponentsUtils.hideDialog(context);
          }
        }
      },
      builder: (context, state) {
        // Determine display text for lat/lng coordinates
        String displayText = '';
        if (_latitude != null && _longitude != null) {
          final latDir = _latitude! >= 0 ? 'N' : 'S';
          final lngDir = _longitude! >= 0 ? 'E' : 'W';
          displayText = '${_latitude!.abs().toStringAsFixed(4)}\u00B0 $latDir ${_longitude!.abs().toStringAsFixed(4)}\u00B0 $lngDir';
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
                child: BaseDigitFormInput(
                  helpText: widget.helpText,
                  readOnly: true,
                  initialValue: displayText,
                  onChange: (value) {},
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
