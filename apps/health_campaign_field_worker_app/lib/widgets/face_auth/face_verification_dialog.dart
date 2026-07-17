import 'dart:typed_data';

import 'package:camera/camera.dart';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/face_auth/face_gate_bloc.dart';
import '../../blocs/localization/app_localization.dart';
import '../../data/remote_client.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../services/face_auth_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../services/worker_registry_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';

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
/// [individualId] scopes the face comparison to this person's embeddings only —
/// must be the logged-in distributor's ID for re-verification so co-worker faces
/// cannot pass as the distributor.
Future<FaceVerificationResult> showFaceVerificationDialog(
  BuildContext context, {
  FaceEmbeddingRepository? repository,
  FaceModelService? faceModelService,
  String? individualId,
}) async {
  final repo = repository ?? context.read<FaceEmbeddingRepository>();
  final modelService = faceModelService ?? context.read<FaceModelService>();
  // Default to logged-in user's individual ID so the comparison is always
  // scoped to the distributor only, preventing co-worker face false positives.
  final targetId = individualId ?? context.loggedInIndividualIdOrNull ?? '';

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
              configLoader: () => MdmsRepository(DioClient().dio)
                  .searchFaceAuthConfig(
                envConfig.variables.mdmsApiPath,
                envConfig.variables.tenantId,
              ),
            ),
          ),
          BlocProvider(
            create: (_) => FaceVerificationBloc(
              faceModelService: modelService,
              embeddingRepository: repo,
              similarityThreshold: FaceAuthConfig.defaultFaceMatchThreshold,
              thresholdLoader: () async => (await MdmsRepository(DioClient().dio)
                      .searchFaceAuthConfig(
                    envConfig.variables.mdmsApiPath,
                    envConfig.variables.tenantId,
                  ))
                  ?.faceMatchThreshold,
            ),
          ),
          BlocProvider(
            create: (_) => LivenessBloc(),
          ),
        ],
        child: _FaceVerificationScreen(
          faceModelService: modelService,
          individualId: targetId,
        ),
      ),
    ),
  );

  return result ?? FaceVerificationResult.failed;
}

class _FaceVerificationScreen extends StatefulWidget {
  final FaceModelService faceModelService;
  final String individualId;

  const _FaceVerificationScreen({
    required this.faceModelService,
    this.individualId = '',
  });

  @override
  State<_FaceVerificationScreen> createState() =>
      _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<_FaceVerificationScreen> {
  bool _autoClosePending = false;
  String? _pinErrorMessage;
  int _pinAttemptCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<FaceGateBloc>().add(FaceGateEvent.checkEnrollment(
      skipWorkerCheck: true,
      individualId: widget.individualId,
    ));
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
              passed: (_, method, confidence, faceImageBytes) {
                if (!_autoClosePending) {
                  _autoClosePending = true;
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    if (mounted) {
                      _close(FaceVerificationResult(
                        passed: true,
                        confidence: confidence,
                        faceImageBytes: faceImageBytes,
                      ));
                    }
                  });
                }
              },
              error: (message) {
                // Bloc emits error then immediately pinEntry — builder skips
                // the error state entirely. Capture it here so the PIN screen
                // can show the inline error message.
                if (mounted) setState(() {
                  _pinErrorMessage = message;
                  _pinAttemptCount++;
                });
              },
              // No-op: prevent orElse from clearing _pinErrorMessage when
              // pinEntry fires immediately after error.
              pinEntry: () {},
              orElse: () {
                if (mounted && _pinErrorMessage != null) {
                  setState(() => _pinErrorMessage = null);
                }
              },
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
              rejected: (attempt, max, confidence, faceImageBytes) => _buildCamera(
                context,
                attemptNumber: attempt,
                maxAttempts: max,
                lastConfidence: confidence,
              ),
              fallbackRequired: (reason) => _buildFallback(context, reason),
              pinEntry: () => _buildPinEntry(context, errorMessage: _pinErrorMessage),
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
          preferredLens: CameraLensDirection.front,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            context.read<FaceGateBloc>().add(
                  FaceGateEvent.attemptFaceVerify(
                    embedding: embedding,
                    faceImageBytes: faceImageBytes,
                  ),
                );
          },
          guidanceText: attemptNumber != null
              ? AppLocalizations.of(context)
                  .translate(i18.faceAuth.tryAgainLookCamera)
              : AppLocalizations.of(context)
                  .translate(i18.faceAuth.positionFace),
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

    String name = '';
    try {
      name = context.loggedInUser.name ?? '';
    } catch (_) {}

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
            if (name.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                name,
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
              AppLocalizations.of(context)
                  .translate(i18.faceAuth.verificationFailed),
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
              label: AppLocalizations.of(context)
                  .translate(i18.faceAuth.reVerificationUsePinInstead),
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
              label: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonCancel),
              onPressed: _closeFailed,
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinEntry(BuildContext context, {String? errorMessage}) {
    return _PinEntryView(
      onSubmit: (pin) {
        if (mounted) setState(() => _pinErrorMessage = null);
        context.read<FaceGateBloc>().add(
              FaceGateEvent.pinFallback(pin: pin, individualId: ''),
            );
      },
      errorMessage: errorMessage,
      attemptCount: _pinAttemptCount,
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
              AppLocalizations.of(context)
                  .translate(i18.faceAuth.somethingWentWrong),
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
              label: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonRetry),
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
              label: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonCancel),
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
  final String? errorMessage;
  final int attemptCount;

  const _PinEntryView({
    required this.onSubmit,
    required this.attemptCount,
    this.errorMessage,
  });

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

