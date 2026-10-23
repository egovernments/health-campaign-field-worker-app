part of 'json_schema_builder.dart';

/// Accuracy at or below [kDefaultLocationAccuracyThreshold] is good and can be
/// saved; anything worse is low accuracy. Both default to 5 m, so there is no
/// fair band unless a field sets a wider unacceptableAccuracyThreshold, which
/// only changes the colour and hints, never what can be saved.
const double kDefaultLocationAccuracyThreshold = 5;
const double kDefaultUnacceptableLocationAccuracyThreshold = 5;

/// Validation rule types used to override the thresholds per field, e.g.
/// `{"type": "accuracyThreshold", "value": 3}`. The validator builder
/// ignores unknown rule types, so these never become form validators.
const String kAccuracyThresholdRule = 'accuracyThreshold';
const String kUnacceptableAccuracyThresholdRule =
    'unacceptableAccuracyThreshold';

enum LocationAccuracyLevel { good, fair, low }

@visibleForTesting
LocationAccuracyLevel classifyLocationAccuracy(
  double accuracy, {
  required double accuracyThreshold,
  required double unacceptableAccuracyThreshold,
}) {
  if (accuracy <= accuracyThreshold) return LocationAccuracyLevel.good;
  if (accuracy <= unacceptableAccuracyThreshold) {
    return LocationAccuracyLevel.fair;
  }
  return LocationAccuracyLevel.low;
}

/// Save needs good accuracy (within accuracyThreshold, 5 m by default). With
/// a popup timer ([saveEnabledAfter]), any reading can be saved once it runs
/// out, so a worker is never stuck where accuracy won't improve.
@visibleForTesting
bool canSaveLocation({
  required LocationAccuracyLevel? level,
  required int elapsedSeconds,
  Duration? saveEnabledAfter,
}) {
  if (level == null) return false;
  if (level == LocationAccuracyLevel.good) return true;
  return saveEnabledAfter != null &&
      elapsedSeconds >= saveEnabledAfter.inSeconds;
}

/// Seconds of capture before the dialog starts suggesting what to do.
const int kLocationHintDelaySeconds = 30;

/// A real GNSS fix needs at least 4 satellites.
const int kMinFixSatellites = 4;

enum LocationCaptureHint {
  none,
  checkLocation,
  openSky,
  holdStill,
  almostThere
}

/// Field-worker guidance shown when capture is slow to reach good accuracy.
/// [satellites] is null when the device doesn't report it (e.g. iOS); open
/// sky is then the most useful advice.
@visibleForTesting
LocationCaptureHint locationCaptureHint({
  required int elapsedSeconds,
  required double? accuracy,
  required int? satellites,
  required double accuracyThreshold,
  required double unacceptableAccuracyThreshold,
}) {
  if (elapsedSeconds < kLocationHintDelaySeconds) {
    return LocationCaptureHint.none;
  }
  if (accuracy == null) return LocationCaptureHint.checkLocation;

  final level = classifyLocationAccuracy(
    accuracy,
    accuracyThreshold: accuracyThreshold,
    unacceptableAccuracyThreshold: unacceptableAccuracyThreshold,
  );
  if (level == LocationAccuracyLevel.good) return LocationCaptureHint.none;
  // Too few satellites: a Wi-Fi/network fix that only open sky will improve.
  if (satellites == null || satellites < kMinFixSatellites) {
    return LocationCaptureHint.openSky;
  }
  if (level == LocationAccuracyLevel.fair) {
    return LocationCaptureHint.almostThere;
  }
  return LocationCaptureHint.holdStill;
}

double? _thresholdFromRules(List<ValidationRule>? rules, String type) {
  final rule = rules?.firstWhereOrNull((r) => r.type == type);
  if (rule == null) return null;
  final value = double.tryParse('${rule.value}');
  return (value != null && value > 0) ? value : null;
}

class JsonSchemaLatLngBuilder extends JsonSchemaBuilder<String> {
  final String? label;

  /// From the field's `popupTimer`; null when the timer is off.
  final Duration? saveEnabledAfter;

  const JsonSchemaLatLngBuilder({
    super.key,
    required super.formControlName,
    required super.form,
    this.label,
    this.saveEnabledAfter,
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
      saveEnabledAfter: saveEnabledAfter,
      accuracyThreshold:
          _thresholdFromRules(validations, kAccuracyThresholdRule) ??
              kDefaultLocationAccuracyThreshold,
      unacceptableAccuracyThreshold: _thresholdFromRules(
              validations, kUnacceptableAccuracyThresholdRule) ??
          kDefaultUnacceptableLocationAccuracyThreshold,
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
  final double accuracyThreshold;
  final double unacceptableAccuracyThreshold;
  final Duration? saveEnabledAfter;

  const _LatLngBuilderStatefulWrapper({
    required this.form,
    required this.formControlName,
    required this.label,
    required this.readOnly,
    required this.accuracyThreshold,
    required this.unacceptableAccuracyThreshold,
    this.helpText,
    this.isRequired,
    this.tooltipText,
    this.saveEnabledAfter,
  });

  @override
  State<_LatLngBuilderStatefulWrapper> createState() =>
      _LatLngBuilderStatefulWrapperState();
}

/// Latest reading plus elapsed time, observed by the capture dialog.
class _CaptureProgress {
  final String? latLng;
  final double? accuracy;
  final int elapsedSeconds;

  /// Satellites used in the current GNSS fix; null until the host app reports
  /// it (see [_gnssSatellitesChannel]), in which case the line is hidden.
  final int? satellites;

  const _CaptureProgress({
    this.latLng,
    this.accuracy,
    this.elapsedSeconds = 0,
    this.satellites,
  });

  bool get hasReading => latLng != null;

  _CaptureProgress copyWith({
    String? latLng,
    double? accuracy,
    int? elapsedSeconds,
    int? satellites,
  }) =>
      _CaptureProgress(
        latLng: latLng ?? this.latLng,
        accuracy: accuracy ?? this.accuracy,
        elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
        satellites: satellites ?? this.satellites,
      );
}

/// Keeps listening to location updates while the capture dialog shows live
/// accuracy, status, elapsed time and satellites. A reading within
/// [accuracyThreshold] is saved and the dialog closed automatically; once the
/// popup timer runs out, Save takes any reading (see [canSaveLocation]). The
/// close icon closes the dialog without a value; a required field then fails
/// validation until it is captured again.
class _LatLngBuilderStatefulWrapperState
    extends State<_LatLngBuilderStatefulWrapper> {
  double? _accuracy;
  String? _latLngValue;

  bool _isCapturing = false;
  bool _holdsGpsWarmup = false;
  StreamSubscription<dynamic>? _satelliteSub;

  /// Satellite counts from the host app's native GnssStatus listener (Android:
  /// GnssSatelliteStreamHandler in the HCM app). Fused location fixes don't
  /// carry a satellite count, so the location plugin can't provide it.
  static const EventChannel _gnssSatellitesChannel =
      EventChannel('digit_forms_engine/gnss_satellites');
  BuildContext? _dialogContext;
  Timer? _elapsedTimer;
  final ValueNotifier<_CaptureProgress> _progress =
      ValueNotifier(const _CaptureProgress());

  @override
  void initState() {
    super.initState();

    // If control already has a value (prefill), keep it and don't recapture
    final controlValue = widget.form.control(widget.formControlName).value;
    final isLatLngPreFilled =
        controlValue != null && controlValue.toString().isNotEmpty;

    if (isLatLngPreFilled) {
      _latLngValue = controlValue.toString();

      // Parse accuracy if present (3rd comma-separated part)
      final parts = _latLngValue!.split(',');
      _accuracy = parts.length == 3 ? double.tryParse(parts[2]) : null;
    } else if (!widget.readOnly) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _startCapture());
    }
  }

  @override
  void dispose() {
    _satelliteSub?.cancel();
    _releaseGpsWarmup();
    _elapsedTimer?.cancel();
    _progress.dispose();
    super.dispose();
  }

  void _startCapture() {
    if (!mounted || _isCapturing) return;

    _isCapturing = true;
    _progress.value = const _CaptureProgress();
    final startedAt = DateTime.now();
    _elapsedTimer?.cancel();
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _progress.value = _progress.value.copyWith(
        elapsedSeconds: DateTime.now().difference(startedAt).inSeconds,
      );
    });

    _showCaptureDialog();
    context.read<LocationBloc>().add(const LoadLocationEvent());
    // High accuracy every 1 s while capturing (ODK Collect's rate). Usually
    // already active because the form page warmed the GPS on open.
    _holdsGpsWarmup = true;
    GpsWarmup.instance.acquire();
  }

  void _releaseGpsWarmup() {
    if (!_holdsGpsWarmup) return;
    _holdsGpsWarmup = false;
    GpsWarmup.instance.release();
  }

  /// Started from the first reading, once permission is known to be granted
  /// (the native side stays silent without it). Hosts without the native
  /// handler simply never send events, so the satellite line stays hidden.
  void _listenForSatellites() {
    if (_satelliteSub != null || !_isCapturing) return;
    _satelliteSub = _gnssSatellitesChannel.receiveBroadcastStream().listen(
      (event) {
        if (event is! Map || event['used'] is! int) return;
        _progress.value =
            _progress.value.copyWith(satellites: event['used'] as int);
      },
      onError: (_) {},
    );
  }

  void _stopCapture() {
    _isCapturing = false;
    _satelliteSub?.cancel();
    _satelliteSub = null;
    _releaseGpsWarmup();
    _elapsedTimer?.cancel();
    _elapsedTimer = null;

    final dialogContext = _dialogContext;
    _dialogContext = null;
    if (dialogContext != null && dialogContext.mounted) {
      Navigator.of(dialogContext, rootNavigator: true).pop();
    }
  }

  void _onReading(LocationState state) {
    if (!_isCapturing || state.latitude == null || state.longitude == null) {
      return;
    }
    // Permission is granted by now, so retry if it wasn't at capture start.
    GpsWarmup.instance.ensureActive();
    _listenForSatellites();

    _progress.value = _progress.value.copyWith(
      latLng: state.latLngString,
      accuracy: state.accuracy,
    );

    // Good accuracy (accuracyThreshold, 5 m by default) needs no
    // confirmation: save the reading and close the popup straight away.
    final accuracy = state.accuracy;
    if (accuracy != null &&
        classifyLocationAccuracy(
              accuracy,
              accuracyThreshold: widget.accuracyThreshold,
              unacceptableAccuracyThreshold:
                  widget.unacceptableAccuracyThreshold,
            ) ==
            LocationAccuracyLevel.good) {
      _acceptCurrentReading();
    }
  }

  void _acceptCurrentReading() {
    final reading = _progress.value;
    if (!_isCapturing || !reading.hasReading) return;

    _stopCapture();

    setState(() {
      _latLngValue = reading.latLng;
      _accuracy = reading.accuracy;
    });

    // Append accuracy to the "lat, lng" string
    widget.form.control(widget.formControlName).value = reading.accuracy != null
        ? '${reading.latLng},${reading.accuracy}'
        : reading.latLng;

    final loc = FormLocalization.of(context);
    final accuracy = reading.accuracy;
    Toast.showToast(
      context,
      message: accuracy == null
          ? _t(loc, 'LOCATION_SAVED', 'Location saved')
          : _t(loc, 'LOCATION_SAVED_WITH_ACCURACY', 'Location saved ({})',
              _formatAccuracy(loc, accuracy)),
      type: ToastType.success,
    );
  }

  /// Translates [key], falling back to [fallback] when the key is missing
  /// from localization. `{}` in the result is replaced by [arg].
  String _t(FormLocalization loc, String key, String fallback, [String? arg]) {
    final translated = loc.translate(key);
    final text = translated == key ? fallback : translated;
    return arg == null ? text : text.replaceAll('{}', arg);
  }

  String _formatMeters(FormLocalization loc, double meters) =>
      '${meters.toStringAsFixed(2)} ${loc.translate('CORE_COMMON_METERS')}';

  String _formatElapsed(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  /// Up to two decimals, trailing zeros dropped ("5 m", "7.5 m").
  String _formatAccuracy(FormLocalization loc, double meters) {
    final value = meters
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
    return _t(loc, 'LOCATION_ACCURACY_M', '{} m', value);
  }

  /// Save rule with the save threshold in bold: "You can save once accuracy
  /// is **5 m or less**." or, with a popup timer, "You can save once accuracy
  /// is **5 m or less**, or when the timer ends."
  TextSpan _saveRuleSpan(FormLocalization loc, TextStyle boldStyle) {
    final template = widget.saveEnabledAfter != null
        ? _t(loc, 'LOCATION_CAPTURE_SAVE_RULE_TIMER',
            'You can save once accuracy is {save}, or when the timer ends.')
        : _t(loc, 'LOCATION_CAPTURE_SAVE_RULE_GOOD',
            'You can save once accuracy is {save}.');
    final save = _t(loc, 'LOCATION_ACCURACY_OR_LESS', '{} or less',
        _formatAccuracy(loc, widget.accuracyThreshold));
    final parts = template.split('{save}');
    return TextSpan(children: [
      TextSpan(text: parts.first),
      for (final rest in parts.skip(1)) ...[
        TextSpan(text: save, style: boldStyle),
        TextSpan(text: rest),
      ],
    ]);
  }

  String? _hintText(FormLocalization loc, _CaptureProgress progress) {
    switch (locationCaptureHint(
      elapsedSeconds: progress.elapsedSeconds,
      accuracy: progress.accuracy,
      satellites: progress.satellites,
      accuracyThreshold: widget.accuracyThreshold,
      unacceptableAccuracyThreshold: widget.unacceptableAccuracyThreshold,
    )) {
      case LocationCaptureHint.none:
        return null;
      case LocationCaptureHint.checkLocation:
        return _t(loc, 'LOCATION_HINT_CHECK_LOCATION',
            'Still no location. Check that location is turned on, then move to an open area.');
      case LocationCaptureHint.openSky:
        return _t(loc, 'LOCATION_HINT_OPEN_SKY',
            'Move to an open area with a clear view of the sky, away from buildings and trees.');
      case LocationCaptureHint.holdStill:
        return _t(loc, 'LOCATION_HINT_HOLD_STILL',
            "Hold the phone up, keep still, and don't cover the top of the phone.");
      case LocationCaptureHint.almostThere:
        return _t(
            loc, 'LOCATION_HINT_ALMOST_THERE', 'Almost there. Keep still.');
    }
  }

  /// Shown with the shared [Popup], like the app's other popups: title with
  /// a close icon, the save rule, a reading card with a pulsing pin, the
  /// current accuracy and a status chip coloured by level, elapsed time and
  /// satellites, and Save as the only action (enabled per [canSaveLocation]).
  /// The close icon closes without a value, as Cancel did.
  void _showCaptureDialog() {
    final loc = FormLocalization.of(context);
    final isRequired = widget.isRequired ?? false;

    showCustomPopup(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        _dialogContext = dialogContext;
        final theme = Theme.of(dialogContext);
        final textTheme = theme.digitTextTheme(dialogContext);
        final colors = theme.colorTheme;
        final mutedStyle =
            textTheme.bodyS.copyWith(color: colors.text.secondary);

        return PopScope(
          canPop: false,
          child: ValueListenableBuilder<_CaptureProgress>(
            valueListenable: _progress,
            builder: (context, progress, _) {
                  final accuracy = progress.accuracy;
                  final level = accuracy == null
                      ? null
                      : classifyLocationAccuracy(
                          accuracy,
                          accuracyThreshold: widget.accuracyThreshold,
                          unacceptableAccuracyThreshold:
                              widget.unacceptableAccuracyThreshold,
                        );
                  final canSave = progress.hasReading &&
                      canSaveLocation(
                        level: level,
                        elapsedSeconds: progress.elapsedSeconds,
                        saveEnabledAfter: widget.saveEnabledAfter,
                      );
                  final saveTimer = widget.saveEnabledAfter;
                  final saveTimerLeft = saveTimer == null || canSave
                      ? null
                      : saveTimer.inSeconds - progress.elapsedSeconds;
                  final hint = _hintText(loc, progress);

                  final Color color;
                  final Color softColor;
                  final IconData? statusIcon;
                  final String status;
                  switch (level) {
                    case null:
                      color = colors.text.secondary;
                      softColor = colors.generic.background;
                      statusIcon = null;
                      status = _t(loc, 'LOCATION_SEARCHING', 'Searching…');
                      break;
                    case LocationAccuracyLevel.low:
                      color = colors.alert.error;
                      softColor = colors.alert.errorBg;
                      statusIcon = Icons.error;
                      status = _t(loc, 'LOCATION_ACCURACY_LOW', 'Low accuracy');
                      break;
                    case LocationAccuracyLevel.fair:
                      color = colors.alert.warning;
                      softColor = colors.alert.warningBg;
                      statusIcon = Icons.contrast;
                      status =
                          _t(loc, 'LOCATION_ACCURACY_FAIR', 'Fair accuracy');
                      break;
                    case LocationAccuracyLevel.good:
                      color = colors.alert.success;
                      softColor = colors.alert.successBg;
                      statusIcon = Icons.check_circle;
                      status =
                          _t(loc, 'LOCATION_ACCURACY_GOOD', 'Good accuracy');
                      break;
                  }

                  return Popup(
                    title: _t(loc, 'CAPTURING_LOCATION', 'Capturing location'),
                    onCrossTap: _stopCapture,
                    // One stretched column, as in the old dialog: Popup lays
                    // its content out start-aligned, which would shrink the
                    // reading card and left-align the centred countdown.
                    additionalWidgets: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: isRequired
                                ? _t(loc, 'LOCATION_CAPTURE_REQUIRED',
                                    'Location is required for this form, so please wait while we capture it.')
                                : _t(loc, 'LOCATION_CAPTURE_WAIT',
                                    'Please wait while we capture your location.'),
                          ),
                          const TextSpan(text: ' '),
                          _saveRuleSpan(
                            loc,
                            TextStyle(
                              color: colors.text.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                        style: mutedStyle,
                      ),
                      const SizedBox(height: spacer3),
                      Container(
                        padding: const EdgeInsets.all(spacer3),
                        decoration: BoxDecoration(
                          color: colors.paper.secondary,
                          border: Border.all(color: colors.generic.divider),
                          borderRadius: BorderRadius.circular(spacer2),
                        ),
                        child: Column(
                          children: [
                            _PulsingPin(color: color),
                            const SizedBox(height: spacer1),
                            Semantics(
                              liveRegion: true,
                              label: accuracy == null
                                  ? status
                                  : '$status, ${_formatAccuracy(loc, accuracy)}',
                              excludeSemantics: true,
                              child: Column(
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: accuracy == null
                                            ? '--'
                                            : accuracy.toStringAsFixed(1),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${_t(loc, 'LOCATION_UNIT_M', 'm')}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                                    style: textTheme.headingL.copyWith(
                                      color: color,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      fontFeatures: const [
                                        FontFeature.tabularFigures()
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: spacer2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: softColor,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (statusIcon != null) ...[
                                          Icon(statusIcon,
                                              size: 14, color: color),
                                          const SizedBox(width: spacer1),
                                        ],
                                        Text(
                                          status,
                                          style: textTheme.captionS.copyWith(
                                            color: color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: spacer2),
                            DefaultTextStyle.merge(
                              style: textTheme.captionS.copyWith(
                                color: colors.text.secondary,
                                fontSize: 12,
                                fontFeatures: const [
                                  FontFeature.tabularFigures()
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Semantics(
                                    label: _t(
                                        loc,
                                        'LOCATION_TIME_ELAPSED',
                                        'Time elapsed: {}',
                                        _formatElapsed(
                                            progress.elapsedSeconds)),
                                    excludeSemantics: true,
                                    child: Row(children: [
                                      Icon(Icons.schedule,
                                          size: 14,
                                          color: colors.text.secondary),
                                      const SizedBox(width: spacer1),
                                      Text(_formatElapsed(
                                          progress.elapsedSeconds)),
                                    ]),
                                  ),
                                  if (progress.satellites != null) ...[
                                    Container(
                                      width: 1,
                                      height: 14,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: spacer4),
                                      color: colors.generic.inputBorder,
                                    ),
                                    Icon(Icons.satellite_alt,
                                        size: 14, color: colors.text.secondary),
                                    const SizedBox(width: spacer1),
                                    Text(_t(
                                        loc,
                                        'LOCATION_SATELLITES_COUNT',
                                        '{} satellites',
                                        '${progress.satellites}')),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (hint != null) ...[
                        const SizedBox(height: spacer3),
                        Semantics(
                          liveRegion: true,
                          child: Container(
                            padding: const EdgeInsets.all(spacer2),
                            decoration: BoxDecoration(
                              color: colors.alert.infoBg,
                              borderRadius: BorderRadius.circular(spacer1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  size: spacer5,
                                  color: colors.alert.info,
                                ),
                                const SizedBox(width: spacer2),
                                Expanded(
                                  child: Text(
                                    hint,
                                    style: textTheme.bodyS
                                        .copyWith(color: colors.text.primary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      // Save sits at the end of the content rather than in
                      // Popup.actions, which only takes buttons, so the
                      // countdown can follow it. Same side padding and full
                      // width as the other popups' primary button.
                      const SizedBox(height: spacer4),
                      DigitButton(
                        label: _t(loc, 'LOCATION_SAVE_POINT', 'Save'),
                        isDisabled: !canSave,
                        onPressed: _acceptCurrentReading,
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      if (saveTimerLeft != null && saveTimerLeft > 0) ...[
                        const SizedBox(height: spacer2),
                        Text(
                          _t(loc, 'LOCATION_SAVE_ENABLED_IN',
                              'Save will be enabled in {}',
                              _formatElapsed(saveTimerLeft)),
                          textAlign: TextAlign.center,
                          style: mutedStyle.copyWith(
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                        ],
                      ),
                    ],
                  );
                },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final theme = Theme.of(context);

    // Only react to actual reading changes; loading/permission flag toggles
    // re-emit the previous (possibly stale) coordinates.
    return BlocListener<LocationBloc, LocationState>(
      listenWhen: (prev, curr) =>
          prev.latitude != curr.latitude ||
          prev.longitude != curr.longitude ||
          prev.accuracy != curr.accuracy,
      listener: (context, state) => _onReading(state),
      child: Builder(builder: (context) {
        String displayText = '';
        Color? textColor;
        final accuracy = _accuracy;
        if (accuracy != null) {
          displayText = _formatMeters(loc, accuracy);
          if (accuracy <= widget.accuracyThreshold) {
            textColor = theme.colorTheme.alert.success;
          } else if (accuracy > widget.unacceptableAccuracyThreshold) {
            textColor = theme.colorTheme.alert.error;
          } else {
            textColor = theme.colorTheme.alert.warning;
          }
        }

        final canRecapture = !widget.readOnly &&
            (_latLngValue == null ||
                accuracy == null ||
                accuracy > widget.accuracyThreshold);

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
                  clipBehavior: Clip.none,
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
                    if (canRecapture)
                      Positioned(
                        right: 0,
                        top: -4,
                        child: IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: theme.colorTheme.primary.primary1,
                          ),
                          onPressed: _startCapture,
                          tooltip: _t(loc, 'LOCATION_RECAPTURE',
                              'Capture location again'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

/// Location pin with two rings pinging outwards, half a cycle apart, in the
/// current accuracy colour. Slowed down when the platform asks for reduced
/// motion.
class _PulsingPin extends StatefulWidget {
  final Color color;

  const _PulsingPin({required this.color});

  @override
  State<_PulsingPin> createState() => _PulsingPinState();
}

class _PulsingPinState extends State<_PulsingPin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    _controller
      ..duration = Duration(seconds: reduceMotion ? 5 : 2)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _ring(double t) {
    final progress = Curves.easeOut.transform(t);
    return Transform.scale(
      scale: 0.4 + 0.7 * progress,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color.withOpacity(0.35 * (1 - progress)),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        width: 52,
        height: 52,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Stack(
            alignment: Alignment.center,
            children: [
              _ring(_controller.value),
              _ring((_controller.value + 0.5) % 1),
              child!,
            ],
          ),
          child: Icon(Icons.location_on, size: 30, color: widget.color),
        ),
      ),
    );
  }
}
