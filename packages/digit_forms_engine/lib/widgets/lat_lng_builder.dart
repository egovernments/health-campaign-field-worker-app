part of 'json_schema_builder.dart';

/// Defaults mirror ODK Collect (ActivityGeoDataRequester): a point is
/// auto-saved once accuracy reaches 5 m, and readings worse than 100 m are
/// flagged as unacceptable.
const double kDefaultLocationAccuracyThreshold = 5;
const double kDefaultUnacceptableLocationAccuracyThreshold = 100;

/// Validation rule types used to override the thresholds per field, e.g.
/// `{"type": "accuracyThreshold", "value": 10}`. The validator builder
/// ignores unknown rule types, so these never become form validators.
const String kAccuracyThresholdRule = 'accuracyThreshold';
const String kUnacceptableAccuracyThresholdRule =
    'unacceptableAccuracyThreshold';

enum LocationAccuracyLevel { improving, poor, unacceptable }

/// Port of ODK Collect's FindLocationViewModel.currentAccuracy.
@visibleForTesting
LocationAccuracyLevel classifyLocationAccuracy(
  double accuracy, {
  required double accuracyThreshold,
  required double unacceptableAccuracyThreshold,
}) {
  if (accuracy > unacceptableAccuracyThreshold) {
    return LocationAccuracyLevel.unacceptable;
  }
  if (accuracy > accuracyThreshold + 5) return LocationAccuracyLevel.poor;
  return LocationAccuracyLevel.improving;
}

/// Seconds of capture before the dialog starts suggesting what to do.
const int kLocationHintDelaySeconds = 30;

/// A real GNSS fix needs at least 4 satellites.
const int kMinFixSatellites = 4;

enum LocationCaptureHint { none, checkLocation, openSky, holdStill, almostThere }

/// Field-worker guidance shown when capture is slow to reach the threshold.
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
  // Close to the threshold but too few satellites: a Wi-Fi/network fix that
  // only open sky will improve.
  if (satellites != null && satellites < kMinFixSatellites) {
    return LocationCaptureHint.openSky;
  }

  final level = classifyLocationAccuracy(
    accuracy,
    accuracyThreshold: accuracyThreshold,
    unacceptableAccuracyThreshold: unacceptableAccuracyThreshold,
  );
  if (level == LocationAccuracyLevel.improving) {
    return LocationCaptureHint.almostThere;
  }
  if (satellites == null) return LocationCaptureHint.openSky;
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

  /// Satellites used per constellation (e.g. GPS, Galileo, NavIC).
  final Map<String, int>? satelliteSystems;

  const _CaptureProgress({
    this.latLng,
    this.accuracy,
    this.elapsedSeconds = 0,
    this.satellites,
    this.satelliteSystems,
  });

  bool get hasReading => latLng != null;

  _CaptureProgress copyWith({
    String? latLng,
    double? accuracy,
    int? elapsedSeconds,
    int? satellites,
    Map<String, int>? satelliteSystems,
  }) =>
      _CaptureProgress(
        latLng: latLng ?? this.latLng,
        accuracy: accuracy ?? this.accuracy,
        elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
        satellites: satellites ?? this.satellites,
        satelliteSystems: satelliteSystems ?? this.satelliteSystems,
      );
}

/// Follows ODK Collect's geopoint flow: keep listening to location updates,
/// show live accuracy/status/elapsed time, auto-save the first reading within
/// [accuracyThreshold], and let the user save the current reading early or
/// cancel.
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
        final systems = event['systems'];
        _progress.value = _progress.value.copyWith(
          satellites: event['used'] as int,
          satelliteSystems: systems is Map
              ? {
                  for (final e in systems.entries)
                    if (e.value is int) e.key.toString(): e.value as int
                }
              : const {},
        );
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

    final accuracy = state.accuracy;
    if (accuracy != null && accuracy <= widget.accuracyThreshold) {
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
    widget.form.control(widget.formControlName).value =
        reading.accuracy != null
            ? '${reading.latLng},${reading.accuracy}'
            : reading.latLng;
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

  /// "12 (GPS 4 · Galileo 3 · BeiDou 3 · NavIC 2)", largest system first.
  String _formatSatellites(_CaptureProgress progress) {
    final systems = (progress.satelliteSystems ?? const {}).entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    if (systems.isEmpty) return '${progress.satellites}';
    final breakdown = systems.map((e) => '${e.key} ${e.value}').join(' · ');
    return '${progress.satellites} ($breakdown)';
  }

  String _formatElapsed(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  /// ODK-style accuracy: up to two decimals, trailing zeros dropped
  /// ("5.82 m", "19.8 m", "5 m").
  String _formatAccuracy(FormLocalization loc, double meters) {
    final value = meters
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
    return _t(loc, 'LOCATION_ACCURACY_M', '{} m', value);
  }

  /// Laid out like ODK Collect's GeoPointDialogFragment: a coloured header
  /// (title, large current accuracy, status, strength bar), then threshold,
  /// elapsed time and satellites, with Cancel/Save at the bottom right. The
  /// header turns red for unacceptable accuracy, as in ODK.
  void _showCaptureDialog() {
    final loc = FormLocalization.of(context);

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        _dialogContext = dialogContext;
        final theme = Theme.of(dialogContext);
        final textTheme = theme.digitTextTheme(dialogContext);

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

              final String? hint;
              switch (locationCaptureHint(
                elapsedSeconds: progress.elapsedSeconds,
                accuracy: accuracy,
                satellites: progress.satellites,
                accuracyThreshold: widget.accuracyThreshold,
                unacceptableAccuracyThreshold:
                    widget.unacceptableAccuracyThreshold,
              )) {
                case LocationCaptureHint.none:
                  hint = null;
                  break;
                case LocationCaptureHint.checkLocation:
                  hint = _t(loc, 'LOCATION_HINT_CHECK_LOCATION',
                      'Still no location. Check that location is turned on, then move to an open area.');
                  break;
                case LocationCaptureHint.openSky:
                  hint = _t(loc, 'LOCATION_HINT_OPEN_SKY',
                      'Move to an open area with a clear view of the sky, away from buildings and trees.');
                  break;
                case LocationCaptureHint.holdStill:
                  hint = _t(loc, 'LOCATION_HINT_HOLD_STILL',
                      "Hold the phone up, keep still, and don't cover the top of the phone.");
                  break;
                case LocationCaptureHint.almostThere:
                  hint = _t(loc, 'LOCATION_HINT_ALMOST_THERE',
                      'Almost there. Keep still.');
                  break;
              }

              // Status text and strength bar values follow ODK's
              // AccuracyProgressView (20 % while waiting for a first fix).
              final String status;
              final double strength;
              switch (level) {
                case null:
                  status = _t(loc, 'LOCATION_WAITING_FOR_FIX',
                      'Trying to get location. Please wait.');
                  strength = 0.2;
                  break;
                case LocationAccuracyLevel.unacceptable:
                  status = _t(loc, 'LOCATION_ACCURACY_UNACCEPTABLE',
                      'Unacceptable accuracy. Please wait.');
                  strength = 0.4;
                  break;
                case LocationAccuracyLevel.poor:
                  status = _t(loc, 'LOCATION_ACCURACY_POOR',
                      'Poor accuracy. Please wait.');
                  strength = 0.6;
                  break;
                case LocationAccuracyLevel.improving:
                  status = _t(loc, 'LOCATION_ACCURACY_IMPROVING',
                      'Improving accuracy. Please wait.');
                  strength = 0.8;
                  break;
              }

              final unacceptable = level == LocationAccuracyLevel.unacceptable;
              final headerColor = unacceptable
                  ? theme.colorTheme.alert.error
                  : theme.colorTheme.primary.primary2;
              final onHeader = theme.colorTheme.paper.primary;
              final bodyStyle = textTheme.bodyS
                  .copyWith(color: theme.colorTheme.text.primary);

              return Dialog(
                clipBehavior: Clip.antiAlias,
                backgroundColor: theme.colorTheme.paper.primary,
                insetPadding: const EdgeInsets.symmetric(
                    horizontal: spacer6, vertical: spacer6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(spacer6),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: headerColor,
                        padding: const EdgeInsets.fromLTRB(
                            spacer4, spacer4, spacer4, spacer6),
                        child: Semantics(
                          liveRegion: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                loc.translate('CAPTURING_LOCATION').toUpperCase(),
                                style: textTheme.captionS.copyWith(
                                  color: onHeader,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: spacer4),
                              Text(
                                accuracy == null
                                    ? '--'
                                    : _formatAccuracy(loc, accuracy),
                                textAlign: TextAlign.center,
                                style: textTheme.headingXl.copyWith(
                                  color: onHeader,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: spacer1),
                              Text(
                                status,
                                textAlign: TextAlign.center,
                                style: textTheme.bodyL.copyWith(color: onHeader),
                              ),
                              const SizedBox(height: spacer2),
                              Center(
                                child: SizedBox(
                                  width: 240,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(spacer2),
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween(end: strength),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      builder: (context, value, _) =>
                                          LinearProgressIndicator(
                                        value: value,
                                        minHeight: spacer4,
                                        color: onHeader,
                                        backgroundColor:
                                            onHeader.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            spacer4, spacer4, spacer4, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (hint != null) ...[
                              Semantics(
                                liveRegion: true,
                                child: Container(
                                  padding: const EdgeInsets.all(spacer2),
                                  decoration: BoxDecoration(
                                    color: theme.colorTheme.alert.infoBg,
                                    borderRadius:
                                        BorderRadius.circular(spacer1),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.lightbulb_outline,
                                        size: spacer5,
                                        color: theme.colorTheme.alert.info,
                                      ),
                                      const SizedBox(width: spacer2),
                                      Expanded(
                                        child: Text(hint, style: bodyStyle),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: spacer3),
                            ],
                            Text(
                              _t(loc, 'LOCATION_POINT_WILL_BE_SAVED',
                                  'Point will be saved at {}',
                                  _formatAccuracy(
                                      loc, widget.accuracyThreshold)),
                              style: bodyStyle,
                            ),
                            const SizedBox(height: spacer2),
                            Text(
                              _t(loc, 'LOCATION_TIME_ELAPSED',
                                  'Time elapsed: {}',
                                  _formatElapsed(progress.elapsedSeconds)),
                              style: bodyStyle,
                            ),
                            if (progress.satellites != null) ...[
                              const SizedBox(height: spacer2),
                              Text(
                                _t(loc, 'LOCATION_SATELLITES',
                                    'Satellites: {}',
                                    _formatSatellites(progress)),
                                style: bodyStyle,
                              ),
                            ],
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(spacer4),
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: spacer2,
                          runSpacing: spacer2,
                          children: [
                            DigitButton(
                              label:
                                  _t(loc, 'LOCATION_CANCEL_CAPTURE', 'Cancel'),
                              onPressed: _stopCapture,
                              type: DigitButtonType.tertiary,
                              size: DigitButtonSize.large,
                            ),
                            DigitButton(
                              label: _t(loc, 'LOCATION_SAVE_POINT', 'Save'),
                              isDisabled: !progress.hasReading,
                              onPressed: _acceptCurrentReading,
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
