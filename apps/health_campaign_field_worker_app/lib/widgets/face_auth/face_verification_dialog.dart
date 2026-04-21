import 'dart:typed_data';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/face_auth/face_gate_bloc.dart';
import '../../data/remote_client.dart';
import '../../services/worker_registry_service.dart';
import '../../utils/environment_config.dart';

/// Result from the face verification dialog.
class FaceVerificationResult {
  final bool passed;
  final double confidence;
  final Uint8List? faceImageBytes;

  const FaceVerificationResult({
    required this.passed,
    this.confidence = 0.0,
    this.faceImageBytes,
  });

  static const failed = FaceVerificationResult(passed: false);
}

/// Shows a full-screen face verification overlay.
/// Returns a [FaceVerificationResult] with pass/fail, confidence, and face image.
///
/// [repository] and [faceModelService] can be passed explicitly to avoid
/// Provider lookup issues (e.g. when called from a bottom sheet context).
Future<FaceVerificationResult> showFaceVerificationDialog(
  BuildContext context, {
  FaceEmbeddingRepository? repository,
  FaceModelService? faceModelService,
}) async {
  final repo = repository ?? context.read<FaceEmbeddingRepository>();
  final modelService = faceModelService ?? context.read<FaceModelService>();

  final result = await Navigator.of(context).push<FaceVerificationResult>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FaceGateBloc(
              repository: repo,
              workerRegistryService: WorkerRegistryService(
                dio: DioClient().dio,
                tenantId: envConfig.variables.tenantId,
              ),
            ),
          ),
          BlocProvider(
            create: (_) => FaceVerificationBloc(
              faceModelService: modelService,
              embeddingRepository: repo,
            ),
          ),
          BlocProvider(
            create: (_) => LivenessBloc(),
          ),
        ],
        child: _FaceVerificationScreen(faceModelService: modelService),
      ),
    ),
  );

  return result ?? FaceVerificationResult.failed;
}

class _FaceVerificationScreen extends StatefulWidget {
  final FaceModelService faceModelService;

  const _FaceVerificationScreen({required this.faceModelService});

  @override
  State<_FaceVerificationScreen> createState() =>
      _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<_FaceVerificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FaceGateBloc>().add(const FaceGateEvent.checkEnrollment(skipWorkerCheck: true));
  }

  void _close(FaceVerificationResult result) =>
      Navigator.of(context).pop(result);

  void _closeFailed() => _close(FaceVerificationResult.failed);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) _closeFailed();
      },
      child: Scaffold(
        backgroundColor: colorTheme.paper.primary,
        body: BlocConsumer<FaceGateBloc, FaceGateState>(
          listener: (context, state) {
            state.maybeWhen(
              notEnrolled: () => _close(const FaceVerificationResult(passed: true)),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              passed: (_, method, confidence, faceImageBytes) => _buildSuccess(
                context,
                method: method,
                confidence: confidence,
                faceImageBytes: faceImageBytes,
              ),
              scanning: () => _buildCamera(context),
              rejected: (attempt, max, confidence) => _buildCamera(
                context,
                attemptNumber: attempt,
                maxAttempts: max,
                lastConfidence: confidence,
              ),
              fallbackRequired: (reason) => _buildFallback(context, reason),
              pinEntry: () => _buildPinEntry(context),
              error: (msg) => _buildError(context, msg),
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCamera(
    BuildContext context, {
    int? attemptNumber,
    int? maxAttempts,
    double? lastConfidence,
  }) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Stack(
      children: [
        FaceCaptureView(
          key: ValueKey('verify_capture_${attemptNumber ?? 0}'),
          faceModelService: widget.faceModelService,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            context.read<FaceGateBloc>().add(
                  FaceGateEvent.attemptFaceVerify(
                    embedding: embedding,
                    faceImageBytes: faceImageBytes,
                  ),
                );
          },
          guidanceText: attemptNumber != null
              ? 'Try again — look at the camera'
              : 'Position your face to verify',
        ),

        // Back button
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          child: IconButton(
            icon: Icon(Icons.close,
                color: colorTheme.text.primary, size: 28),
            onPressed: _closeFailed,
          ),
        ),

        // Retry banner
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

  Widget _buildSuccess(
    BuildContext context, {
    required String method,
    required double confidence,
    Uint8List? faceImageBytes,
  }) {
    final colorTheme = Theme.of(context).colorTheme;
    final isFace = method == 'FACE_SUCCESS';

    // Auto-close after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _close(FaceVerificationResult(
          passed: true,
          confidence: confidence,
          faceImageBytes: faceImageBytes,
        ));
      }
    });

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
            if (isFace && confidence > 0) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.withOpacity(0.2)),
                ),
                child: Text(
                  '${(confidence * 100).toStringAsFixed(1)}% match',
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

  Widget _buildFallback(BuildContext context, String reason) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return SafeArea(
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
              child: Icon(Icons.face_retouching_off,
                  size: 52, color: Colors.orange.shade700),
            ),
            const SizedBox(height: 28),
            Text(
              'Face Verification Failed',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary),
            ),
            const SizedBox(height: 12),
            Text(
              reason,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4),
            ),
            const SizedBox(height: 40),
            DigitButton(
              label: 'Use PIN Instead',
              onPressed: () {
                context
                    .read<FaceGateBloc>()
                    .add(const FaceGateEvent.goToPinEntry());
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              prefixIcon: Icons.dialpad_rounded,
            ),
            const SizedBox(height: 16),
            DigitButton(
              label: 'Cancel',
              onPressed: _closeFailed,
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinEntry(BuildContext context) {
    return _PinEntryView(
      onSubmit: (pin) {
        context.read<FaceGateBloc>().add(
              FaceGateEvent.pinFallback(pin: pin, individualId: ''),
            );
      },
      onCancel: _closeFailed,
    );
  }

  Widget _buildError(BuildContext context, String message) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return SafeArea(
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
              child: Icon(Icons.error_outline_rounded,
                  size: 52, color: colorTheme.alert.error),
            ),
            const SizedBox(height: 28),
            Text(
              'Something Went Wrong',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: colorTheme.text.secondary,
                  height: 1.4),
            ),
            const SizedBox(height: 40),
            DigitButton(
              label: 'Try Again',
              onPressed: () => context
                  .read<FaceGateBloc>()
                  .add(const FaceGateEvent.checkEnrollment()),
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              prefixIcon: Icons.refresh,
            ),
            const SizedBox(height: 16),
            DigitButton(
              label: 'Cancel',
              onPressed: _closeFailed,
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }
}

// ── PIN Entry View ──

class _PinEntryView extends StatelessWidget {
  final void Function(String pin) onSubmit;
  final VoidCallback onCancel;

  const _PinEntryView({required this.onSubmit, required this.onCancel});

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
                const SizedBox(height: 16),
                DigitButton(
                  label: 'Cancel',
                  onPressed: onCancel,
                  type: DigitButtonType.tertiary,
                  size: DigitButtonSize.medium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
