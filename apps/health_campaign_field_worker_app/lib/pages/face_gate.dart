import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/face_auth/face_gate_bloc.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../data/remote_client.dart';
import '../services/face_auth_event_logger.dart';
import '../services/worker_registry_service.dart';
import '../utils/environment_config.dart';
import '../utils/extensions/extensions.dart';

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
  FaceAuthEventLogger? _logger;

  @override
  void initState() {
    super.initState();
    final individualId = context.loggedInIndividualId;
    debugPrint('FaceGatePage: checking enrollment for individualId=$individualId');
    _initLogger();
    context.read<FaceGateBloc>().add(
          FaceGateEvent.checkEnrollment(individualId: individualId),
        );
  }

  void _initLogger() {
    try {
      _logger = FaceAuthEventLogger(
        repository: context.read<LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
        userId: context.loggedInUserUuid,
        projectId: context.projectId,
        boundaryCode: context.boundaryOrNull?.code ?? '',
      );
    } catch (e) {
      debugPrint('FaceGatePage: failed to init logger: $e');
    }
  }

  bool _isDismissing = false;

  void _onEnrollmentComplete(bool success, String? pin) {
    debugPrint('FaceGatePage: _onEnrollmentComplete called success=$success mounted=$mounted');
    if (!success || !mounted || _isDismissing) return;
    _isDismissing = true;
    _logger?.logEnrollment(success: true);
    _updateWorkerRegistry(context.loggedInIndividualId);
    LocalSecureStore.instance.setFaceEnrollmentComplete(true);
    LocalSecureStore.instance.setFaceGatePassed(true);
    Navigator.of(context).pop();
    widget.onVerified();
  }

  void _updateWorkerRegistry(String individualId) {
    final repository = context.read<FaceEmbeddingRepository>();
    final service = WorkerRegistryService(
      dio: DioClient().dio,
      tenantId: envConfig.variables.tenantId,
    );
    // Fire-and-forget — don't block enrollment completion
    service.updateWorkerWithFaceEnrollment(
      individualId: individualId,
      repository: repository,
    );
  }

  void _onVerified() async {
    if (_isDismissing) return;
    _isDismissing = true;
    await LocalSecureStore.instance.setFaceGatePassed(true);
    if (mounted) Navigator.of(context).pop();
    widget.onVerified();
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

    if (_showEnrollment) {
      return _EnrollmentWrapper(
        onResult: _onEnrollmentComplete,
        onCancel: () {
          context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
                individualId: context.loggedInIndividualId,
              ));
        },
      );
    }

    return BlocConsumer<FaceGateBloc, FaceGateState>(
      listener: (context, state) {
        state.maybeWhen(
          notEnrolled: () => setState(() => _showEnrollment = true),
          passed: (individualId, method, confidence, faceImageBytes) {
            if (method == 'FACE_SUCCESS') {
              _logger?.logFaceSuccess(
                eventType: FaceAuthEventType.login,
                confidence: confidence,
                faceImageBytes: faceImageBytes,
              );
            } else if (method == 'PIN_FALLBACK') {
              _logger?.logPinFallback(
                eventType: FaceAuthEventType.login,
              );
            }
            // Don't navigate immediately — let the builder show the success screen
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorTheme.paper.primary,
          body: state.maybeWhen(
            passed: (individualId, method, confidence, faceImageBytes) => _SuccessView(
              method: method,
              confidence: confidence,
              onDone: _onVerified,
            ),
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
            rejected: (attempt, max, confidence) => _ScanningView(
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
              onSubmit: (pin) {
                context.read<FaceGateBloc>().add(
                      FaceGateEvent.pinFallback(
                        pin: pin,
                        individualId: '',
                      ),
                    );
              },
            ),
            workerNotFound: () => _WorkerNotFoundView(
              onRetry: () => context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
                    individualId: context.loggedInIndividualId,
                  )),
            ),
            error: (message) => _ErrorView(
              message: message,
              onRetry: () => context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
                    individualId: context.loggedInIndividualId,
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
            individualId: context.loggedInIndividualId,
            isSystemUser: true,
            enrolledBy: context.loggedInUserUuid,
            onResult: onResult,
            onCancel: onCancel,
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
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            onCaptured(embedding, quality, faceImageBytes: faceImageBytes);
          },
          guidanceText: 'Position your face to verify identity',
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
                        'Attempt $attemptNumber of $maxAttempts',
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
                        'Match: ${(lastConfidence! * 100).toStringAsFixed(1)}%',
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
                'Face Verification Failed',
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
                label: 'Use PIN Instead',
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

  const _PinEntryView({required this.onSubmit});

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
                const SizedBox(height: 32),
                CustomPinPad(
                  title: 'Enter Your PIN',
                  subtitle: 'Enter the 4-digit backup PIN',
                  submitLabel: 'Verify PIN',
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
  final VoidCallback onDone;

  const _SuccessView({
    required this.method,
    required this.confidence,
    required this.onDone,
  });

  @override
  State<_SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<_SuccessView> {
  @override
  void initState() {
    super.initState();
    // Auto-navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) widget.onDone();
    });
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
              'Face Verified',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorTheme.text.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isFace ? 'Face match' : 'PIN verified',
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
          ],
        ),
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
                'Worker Not Found',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your worker record was not found in the registry. Please contact your supervisor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              DigitButton(
                label: 'Retry',
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
                'Something Went Wrong',
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
                label: 'Try Again',
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
