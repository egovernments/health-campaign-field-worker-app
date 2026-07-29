import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:location/location.dart';
import '../services/location_service.dart';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/face_auth/face_gate_bloc.dart';
import '../blocs/project/project.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../data/remote_client.dart';
import '../services/face_auth_event_logger.dart';
import '../services/worker_registry_service.dart';
import '../blocs/localization/app_localization.dart';
import '../utils/environment_config.dart';
import '../utils/extensions/extensions.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/face_auth/reverification_popup.dart';

/// Face identity gate page — shown after login/boundary selection.
/// Handles both enrollment (first time) and verification (subsequent times).
@RoutePage()
class FaceGatePage extends StatefulWidget {
  final VoidCallback onVerified;

  const FaceGatePage({
    super.key,
    required this.onVerified,
  });

  @override
  State<FaceGatePage> createState() => _FaceGatePageState();
}

class _FaceGatePageState extends State<FaceGatePage> {
  bool _showEnrollment = false;
  bool _enrollmentDeclined = false;
  bool _fetchingLocation = false;
  FaceAuthEventLogger? _logger;
  String? _pinErrorMessage;
  int _pinAttemptCount = 0;

  // Stored when FaceGateBloc emits passed — consumed in _onVerified once
  // _SuccessView has had a chance to fetch location.
  String? _pendingLogMethod;
  double _pendingConfidence = 0.0;
  Uint8List? _pendingFaceImageBytes;

  @override
  void initState() {
    super.initState();
    faceEnrollmentActiveNotifier.value = true;
    final individualId = context.loggedInIndividualIdOrNull;
    debugPrint('FaceGatePage: checking enrollment for individualId=$individualId');
    if (individualId == null) {
      debugPrint('FaceGatePage: no individual ID, closing gate');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pop();
          widget.onVerified();
        }
      });
      return;
    }
    _initLogger();
    context.read<FaceGateBloc>().add(
          FaceGateEvent.checkEnrollment(
            individualId: individualId,
            skipWorkerCheck: true,
          ),
        );
  }

  void _initLogger() {
    try {
      // Read project ID directly from bloc state — context.projectId throws
      // if selectedProject is null, which happens when the gate opens before
      // project selection completes.
      final projectId =
          context.read<ProjectBloc>().state.selectedProject?.id ?? '';
      _logger = FaceAuthEventLogger(
        repository: context.read<LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
        userId: context.loggedInIndividualIdOrNull ?? '',
        userUuid: context.loggedInUserUuid,
        projectId: projectId,
        boundaryCode: context.boundaryOrNull?.code ?? '',
      );
    } catch (e) {
      debugPrint('FaceGatePage: failed to init logger: $e');
    }
  }

  @override
  void dispose() {
    faceEnrollmentActiveNotifier.value = false;
    super.dispose();
  }

  bool _isDismissing = false;

  Future<void> _onEnrollmentComplete(bool success, String? pin) async {
    debugPrint('FaceGatePage: _onEnrollmentComplete called success=$success mounted=$mounted');
    if (!success || !mounted || _isDismissing) return;
    _isDismissing = true;
    // Replace the enrollment screen with a location-fetching screen so the
    // user sees progress and can't tap Continue again.
    if (mounted) setState(() => _fetchingLocation = true);
    final loc = await _fetchLocation();
    await _logger?.logEnrollment(
      success: true,
      latitude: loc?.latitude ?? 0.0,
      longitude: loc?.longitude ?? 0.0,
      locationAccuracy: loc?.accuracy ?? 0.0,
    );
    _updateWorkerRegistry(context.loggedInIndividualIdOrNull ?? "");
    LocalSecureStore.instance.setFaceEnrollmentComplete(true);
    LocalSecureStore.instance.setFaceGatePassed(true);
    if (!mounted) return;
    Navigator.of(context).pop();
    widget.onVerified();
  }

  /// Fetches current device location with permission handling.
  /// Returns null only if location service/permission is unavailable.
  static Future<LocationData?> _fetchLocation() async {
    try {
      // Read the current fix from the shared, continuously-tracking client so
      // we get an up-to-date location instantly (as the worker moves) without
      // starting a competing getLocation() that churns the GPS.
      return await LocationService.instance
          .currentOrNext(timeout: const Duration(seconds: 4));
    } catch (e) {
      debugPrint('FaceGatePage: location fetch failed: $e');
      return null;
    }
  }

  void _updateWorkerRegistry(String individualId) {
    final repository = context.read<FaceEmbeddingRepository>();
    final appInit =
        context.read<AppInitializationBloc>().state as AppInitialized;
    final service = WorkerRegistryService.fromServiceRegistry(
      dio: DioClient().dio,
      tenantId: envConfig.variables.tenantId,
      serviceRegistry: appInit.serviceRegistryList,
    );
    // Save pending flag before attempting so authenticated page can retry
    // if this call fails while offline.
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setString('face_registry_sync_pending', individualId),
    );
    // updateWorkerWithFaceEnrollment now returns bool — true only on a
    // confirmed server response. Only clear the pending key on true so an
    // offline call doesn't lose its retry marker.
    service.updateWorkerWithFaceEnrollment(
      individualId: individualId,
      repository: repository,
    ).then((ok) {
      if (ok) {
        SharedPreferences.getInstance().then(
          (prefs) => prefs.remove('face_registry_sync_pending'),
        );
        debugPrint('FaceGatePage: worker registry sync succeeded');
      } else {
        debugPrint(
            'FaceGatePage: worker registry sync failed offline — kept pending for retry');
      }
    });
  }

  Future<void> _onVerified({LocationData? location}) async {
    if (_isDismissing) return;
    _isDismissing = true;
    // Log with the location the success screen fetched so coordinates are real.
    try {
      final method = _pendingLogMethod;
      if (method == 'FACE_SUCCESS') {
        await _logger?.logFaceSuccess(
          eventType: FaceAuthEventType.login,
          confidence: _pendingConfidence,
          faceImageBytes: _pendingFaceImageBytes,
          latitude: location?.latitude ?? 0.0,
          longitude: location?.longitude ?? 0.0,
          locationAccuracy: location?.accuracy ?? 0.0,
        );
      } else if (method == 'PIN_FALLBACK') {
        await _logger?.logPinFallback(
          eventType: FaceAuthEventType.login,
          latitude: location?.latitude ?? 0.0,
          longitude: location?.longitude ?? 0.0,
          locationAccuracy: location?.accuracy ?? 0.0,
        );
      }
    } catch (e) {
      debugPrint('FaceGatePage: login event log failed: $e');
    }
    await LocalSecureStore.instance.setFaceGatePassed(true);
    if (mounted) Navigator.of(context).pop();
    widget.onVerified();
  }

  /// Logs a failed (rejected) login face attempt with the captured image so
  /// failed attempts are auditable. Fire-and-forget; best-effort.
  Future<void> _logRejected(
      double confidence, int attempt, Uint8List? faceImageBytes) async {
    try {
      await _logger?.logFaceRejected(
        eventType: FaceAuthEventType.login,
        confidence: confidence,
        faceImageBytes: faceImageBytes,
        failedAttemptCount: attempt,
      );
    } catch (e) {
      debugPrint('FaceGatePage: rejected event log failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    if (_fetchingLocation) {
      return const _LocationFetchingView();
    }

    if (_showEnrollment) {
      return _EnrollmentWrapper(
        onResult: _onEnrollmentComplete,
        onCancel: () {
          setState(() {
            _enrollmentDeclined = true;
            _showEnrollment = false;
          });
          context.read<FaceGateBloc>().add(const FaceGateEvent.goToPinEntry());
        },
      );
    }

    return BlocConsumer<FaceGateBloc, FaceGateState>(
      listener: (context, state) {
        state.maybeWhen(
          notEnrolled: () {
            if (!_enrollmentDeclined) {
              setState(() => _showEnrollment = true);
            }
          },
          passed: (individualId, method, confidence, faceImageBytes) {
            // Store for logging in _onVerified once location has been fetched.
            _pendingLogMethod = method;
            _pendingConfidence = confidence;
            _pendingFaceImageBytes = faceImageBytes;
            // Don't navigate immediately — let the builder show the success screen
          },
          rejected: (attempt, max, confidence, faceImageBytes) {
            // Log each failed face attempt (with the captured image) for audit.
            _logRejected(confidence, attempt, faceImageBytes);
          },
          error: (message) {
            if (mounted) setState(() {
              _pinErrorMessage = message;
              _pinAttemptCount++;
            });
          },
          // pinEntry is emitted right after error to keep the form visible.
          // Handling it here (no-op) prevents orElse from clearing the error.
          pinEntry: () {},
          orElse: () {
            if (mounted && _pinErrorMessage != null) {
              setState(() => _pinErrorMessage = null);
            }
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorTheme.paper.primary,
          body: state.maybeWhen(
            passed: (individualId, method, confidence, faceImageBytes) {
              String name = '';
              try {
                name = context.loggedInUser.name ?? '';
              } catch (_) {}
              return _SuccessView(
                method: method,
                confidence: confidence,
                name: name,
                onDone: (loc) => _onVerified(location: loc),
              );
            },
            scanning: () => _ScanningView(
              key: const ValueKey('gate_scan_0'),
              onCaptured: (embedding, quality, {faceImageBytes}) {
                context.read<FaceGateBloc>().add(
                      FaceGateEvent.attemptFaceVerify(
                        embedding: embedding,
                        faceImageBytes: faceImageBytes,
                      ),
                    );
              },
            ),
            rejected: (attempt, max, confidence, faceImageBytes) => _ScanningView(
              key: ValueKey('gate_scan_$attempt'),
              attemptNumber: attempt,
              maxAttempts: max,
              lastConfidence: confidence,
              onCaptured: (embedding, quality, {faceImageBytes}) {
                context.read<FaceGateBloc>().add(
                      FaceGateEvent.attemptFaceVerify(
                        embedding: embedding,
                        faceImageBytes: faceImageBytes,
                      ),
                    );
              },
            ),
            fallbackRequired: (reason) => _FallbackView(
              reason: reason,
              onPinEntry: () {
                context
                    .read<FaceGateBloc>()
                    .add(const FaceGateEvent.goToPinEntry());
              },
            ),
            pinEntry: () => _PinEntryView(
              errorMessage: _pinErrorMessage,
              attemptCount: _pinAttemptCount,
              onSubmit: (pin) {
                if (mounted) setState(() => _pinErrorMessage = null);
                context.read<FaceGateBloc>().add(
                      FaceGateEvent.pinFallback(
                        pin: pin,
                        individualId: context.loggedInIndividualIdOrNull ?? '',
                      ),
                    );
              },
            ),
            workerNotFound: () => _WorkerNotFoundView(
              onRetry: () => context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
                    individualId: context.loggedInIndividualIdOrNull ?? "",
                  )),
            ),
            error: (message) => _ErrorView(
              message: message,
              onRetry: () => context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
                    individualId: context.loggedInIndividualIdOrNull ?? "",
                  )),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

// ── Enrollment Wrapper ──

class _EnrollmentWrapper extends StatelessWidget {
  final void Function(bool success, String? pin) onResult;
  final VoidCallback onCancel;

  const _EnrollmentWrapper({
    required this.onResult,
    required this.onCancel,
  });

  /// Confirms and logs the user out from the enrollment screen. Uses the app's
  /// AuthBloc so logout behaves exactly like elsewhere (clears session and
  /// returns to the login flow).
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
            AppLocalizations.of(context).translate(i18.common.coreCommonLogout)),
        content: Text(AppLocalizations.of(context)
            .translate(i18.faceAuth.logoutConfirm)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(AppLocalizations.of(context)
                .translate(i18.common.coreCommonNo)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthLogoutEvent());
            },
            child: Text(AppLocalizations.of(context)
                .translate(i18.common.coreCommonYes)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final faceModelService = context.read<FaceModelService>();
    final repository = context.read<FaceEmbeddingRepository>();
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    // Override colorScheme.primary to digit orange so package widgets use it
    // primary1 = orange (0xFFC84C0E), primary2 = teal (0xFF0B4B66)
    final orangeTheme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: colorTheme.primary.primary1,
        onPrimary: colorTheme.paper.primary,
      ),
    );

    return Theme(
      data: orangeTheme,
      child: BlocProvider(
        create: (_) => FaceEnrollmentBloc(repository: repository),
        child: BlocListener<FaceEnrollmentBloc, FaceEnrollmentState>(
          listener: (context, state) {
            // Catch completed state at app level — handles PIN confirm navigation
            if (state is FaceEnrollmentCompletedState) {
              debugPrint('_EnrollmentWrapper: FaceEnrollmentBloc completed, calling onResult');
              onResult(true, null);
            }
          },
          child: FaceEnrollmentView(
            faceModelService: faceModelService,
            individualId: context.loggedInIndividualIdOrNull ?? "",
            isSystemUser: true,
            enrolledBy: context.loggedInUserUuid,
            onResult: onResult,
            onCancel: onCancel,
            onLogout: () => _confirmLogout(context),
          ),
        ),
      ),
    );
  }
}

// ── Scanning View ──

class _ScanningView extends StatelessWidget {
  final void Function(List<double> embedding, double quality, {Uint8List? faceImageBytes}) onCaptured;
  final int? attemptNumber;
  final int? maxAttempts;
  final double? lastConfidence;

  const _ScanningView({
    super.key,
    required this.onCaptured,
    this.attemptNumber,
    this.maxAttempts,
    this.lastConfidence,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Stack(
      children: [
        FaceCaptureView(
          key: ValueKey('gate_capture_${attemptNumber ?? 0}'),
          faceModelService: context.read<FaceModelService>(),
          preferredLens: CameraLensDirection.front,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            onCaptured(embedding, quality, faceImageBytes: faceImageBytes);
          },
          guidanceText: AppLocalizations.of(context)
              .translate(i18.faceAuth.positionFace),
        ),
        if (attemptNumber != null && maxAttempts != null)
          Positioned(
            top: MediaQuery.of(context).padding.top + 70,
            left: 24,
            right: 24,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: colorTheme.alert.error.withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh,
                          color: colorTheme.paper.primary, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        '${AppLocalizations.of(context).translate(i18.faceAuth.gateAttemptCounter)} $attemptNumber/$maxAttempts',
                        style: TextStyle(
                          color: colorTheme.paper.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (lastConfidence != null && lastConfidence! > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${AppLocalizations.of(context).translate(i18.faceAuth.gateMatchLabel)}: ${(lastConfidence! * 100).toStringAsFixed(1)}%',
                        style: TextStyle(
                          color: colorTheme.paper.primary.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// ── Fallback View ──

class _FallbackView extends StatelessWidget {
  final String reason;
  final VoidCallback onPinEntry;

  const _FallbackView({required this.reason, required this.onPinEntry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade50,
                ),
                child: Icon(
                  Icons.face_retouching_off,
                  size: 52,
                  color: Colors.orange.shade700,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.verificationFailed),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                reason,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              DigitButton(
                label: AppLocalizations.of(context)
                    .translate(i18.faceAuth.reVerificationUsePinInstead),
                onPressed: onPinEntry,
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                prefixIcon: Icons.dialpad_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── PIN Entry View ──

class _PinEntryView extends StatelessWidget {
  final void Function(String pin) onSubmit;
  final String? errorMessage;
  final int attemptCount;

  const _PinEntryView({required this.onSubmit, required this.attemptCount, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorTheme.primary.primary1.withOpacity(0.08),
                  ),
                  child: Icon(
                    Icons.lock_rounded,
                    size: 40,
                    color: colorTheme.primary.primary1,
                  ),
                ),
                const SizedBox(height: 24),
                if (errorMessage != null) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: colorTheme.alert.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: colorTheme.alert.error.withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error_outline_rounded,
                            size: 16, color: colorTheme.alert.error),
                        const SizedBox(width: 8),
                        Text(
                          errorMessage!,
                          style: TextStyle(
                            color: colorTheme.alert.error,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                CustomPinPad(
                  key: ValueKey(attemptCount),
                  title: AppLocalizations.of(context)
                      .translate(i18.faceAuth.enterYourPin),
                  subtitle: AppLocalizations.of(context)
                      .translate(i18.faceAuth.pinSubtitle),
                  submitLabel: AppLocalizations.of(context)
                      .translate(i18.faceAuth.pinVerify),
                  primaryColor: colorTheme.primary.primary1,
                  onComplete: onSubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Success View ──

class _SuccessView extends StatefulWidget {
  final String method;
  final double confidence;
  final String name;
  final void Function(LocationData? location) onDone;

  const _SuccessView({
    required this.method,
    required this.confidence,
    required this.name,
    required this.onDone,
  });

  @override
  State<_SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<_SuccessView> {
  LocationData? _location;

  @override
  void initState() {
    super.initState();
    _fetchLocationThenNavigate();
  }

  Future<void> _fetchLocationThenNavigate() async {
    final data = await _FaceGatePageState._fetchLocation();
    if (mounted) setState(() => _location = data);
    if (mounted) widget.onDone(_location);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;
    final isFace = widget.method == 'FACE_SUCCESS';

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                size: 56,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context).translate(i18.faceAuth.gateVerified),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorTheme.text.primary,
              ),
            ),
            if (widget.name.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.primary.primary1,
                ),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              isFace
                  ? AppLocalizations.of(context)
                      .translate(i18.faceAuth.faceMatch)
                  : AppLocalizations.of(context)
                      .translate(i18.faceAuth.pinVerified),
              style: TextStyle(
                fontSize: 15,
                color: colorTheme.text.secondary,
              ),
            ),
            if (isFace && widget.confidence > 0) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  '${(widget.confidence * 100).toStringAsFixed(1)}% match',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            _LocationRow(location: _location),
          ],
        ),
      ),
    );
  }
}

// ── Location Row ──

/// Shows GPS coordinates and accuracy after a successful verification.
/// Displays a loading indicator while location is being fetched, then
/// replaces it with "lat, long (±Xm)" once available.
class _LocationRow extends StatelessWidget {
  final LocationData? location;

  const _LocationRow({required this.location});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorTheme;

    if (location == null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: colorTheme.text.secondary,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Fetching location…',
            style: TextStyle(fontSize: 12, color: colorTheme.text.secondary),
          ),
        ],
      );
    }

    final lat = location!.latitude;
    final lng = location!.longitude;
    final acc = location!.accuracy;

    if (lat == null || lng == null) return const SizedBox.shrink();

    final latStr = lat.toStringAsFixed(4);
    final lngStr = lng.toStringAsFixed(4);
    final accStr = acc != null ? '±${acc.toStringAsFixed(0)}m' : '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: colorTheme.paper.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorTheme.generic.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_rounded, size: 14, color: colorTheme.text.secondary),
          const SizedBox(width: 6),
          Text(
            '$latStr, $lngStr',
            style: TextStyle(fontSize: 12, color: colorTheme.text.primary),
          ),
          if (accStr.isNotEmpty) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: colorTheme.primary.primary1.withOpacity(0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                accStr,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.primary.primary1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Worker Not Found View ──

class _WorkerNotFoundView extends StatelessWidget {
  final VoidCallback onRetry;

  const _WorkerNotFoundView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.alert.error.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.person_off_rounded,
                  size: 52,
                  color: colorTheme.alert.error,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.workerNotFound),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.workerNotFoundMessage),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              DigitButton(
                label: AppLocalizations.of(context)
                    .translate(i18.common.coreCommonRetry),
                onPressed: onRetry,
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                prefixIcon: Icons.refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Error View ──

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.alert.error.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 52,
                  color: colorTheme.alert.error,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.somethingWentWrong),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              DigitButton(
                label: AppLocalizations.of(context)
                    .translate(i18.common.coreCommonRetry),
                onPressed: onRetry,
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                prefixIcon: Icons.refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Location Fetching View ──

class _LocationFetchingView extends StatelessWidget {
  const _LocationFetchingView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: colorTheme.primary.primary1,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Fetching location…',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.capturingGps),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Capacity Reached View ──

class _CapacityReachedView extends StatelessWidget {
  final VoidCallback onContact;

  const _CapacityReachedView({required this.onContact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade50,
                ),
                child: Icon(Icons.group_off_rounded,
                    size: 56, color: Colors.orange.shade700),
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.deviceCapacityReached),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.deviceCapacityMessage),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    height: 1.4),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: onContact,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)
                      .translate(i18.faceAuth.continueAnyway)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
