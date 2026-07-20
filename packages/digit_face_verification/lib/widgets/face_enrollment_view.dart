import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_localization.dart';
import '../blocs/face_enrollment_bloc.dart';
import '../blocs/liveness_bloc.dart';
import '../data/face_model_service.dart';
import '../data/liveness_detection_service.dart';
import '../utils/i18_key_constants.dart' as i18;
import 'face_capture_view.dart';
import 'face_guide_icon.dart';
import 'liveness_challenge_view.dart';

/// Multi-step enrollment wizard:
/// intro -> angle captures -> processing -> PIN display -> confirmation.
class FaceEnrollmentView extends StatefulWidget {
  final FaceModelService faceModelService;
  final String individualId;
  final bool isSystemUser;
  final String enrolledBy;
  final void Function(bool success, String? pin) onResult;
  final VoidCallback onCancel;

  /// Optional logout action. When provided, a logout control is shown on the
  /// enrollment intro screen so a user can sign out instead of enrolling.
  final VoidCallback? onLogout;

  const FaceEnrollmentView({
    super.key,
    required this.faceModelService,
    required this.individualId,
    required this.isSystemUser,
    required this.enrolledBy,
    required this.onResult,
    required this.onCancel,
    this.onLogout,
  });

  @override
  State<FaceEnrollmentView> createState() => _FaceEnrollmentViewState();
}

class _FaceEnrollmentViewState extends State<FaceEnrollmentView> {
  bool _showIntro = true;
  int _captureResetTrigger = 0;

  void _startEnrollment() {
    setState(() => _showIntro = false);
    context.read<FaceEnrollmentBloc>().add(
          FaceEnrollmentEvent.start(
            individualId: widget.individualId,
            isSystemUser: widget.isSystemUser,
            enrolledBy: widget.enrolledBy,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return _IntroScreen(
        onStart: _startEnrollment,
        onLogout: widget.onLogout,
      );
    }

    return BlocConsumer<FaceEnrollmentBloc, FaceEnrollmentState>(
      buildWhen: (_, next) => next is! FaceEnrollmentQualityInsufficientState,
      listener: (context, state) {
        state.maybeWhen(
          qualityInsufficient: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) => _QualityTipsSheet(
                onRetry: () {
                  Navigator.of(context).pop();
                  setState(() => _captureResetTrigger++);
                },
              ),
            );
          },
          error: (message) {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) => _QualityTipsSheet(
                errorMessage: message,
                onRetry: () {
                  Navigator.of(context).pop();
                  setState(() => _captureResetTrigger++);
                },
              ),
            );
          },
          maxUsersReached: () {},
          // For non-system users, enrollment completes without a PIN screen.
          // Call onResult directly from here so the parent is always notified.
          completed: () => widget.onResult(true, null),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        final cs = theme.colorScheme;

        return state.maybeWhen(
          capturingAngle: (current, total, instruction) {
            return _AngleCaptureScreen(
              faceModelService: widget.faceModelService,
              current: current,
              total: total,
              instruction: instruction,
              resetTrigger: _captureResetTrigger,
              onCaptured: (embedding, quality, {faceImageBytes}) {
                context.read<FaceEnrollmentBloc>().add(
                      FaceEnrollmentEvent.captureAngle(
                        embedding: embedding,
                        quality: quality,
                      ),
                    );
              },
            );
          },
          livenessCheck: () {
            final bloc = context.read<FaceEnrollmentBloc>();
            return _LivenessScreen(
              faceModelService: widget.faceModelService,
              currentStep: 2,
              totalSteps: bloc.totalSteps,
              onPassed: () {
                bloc.add(const FaceEnrollmentEvent.livenessCompleted());
              },
            );
          },
          processing: () => Scaffold(
            backgroundColor: cs.surface,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: cs.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    FaceVerificationLocalization.of(context).translate(i18.faceVerification.settingUpProfile),
                    style: TextStyle(
                        fontSize: 16,
                        color: cs.onSurface.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
          pinAssigned: (pin) {
            final onResult = widget.onResult;
            return _PinDisplayScreen(
              pin: pin,
              onConfirm: () {
                debugPrint('FaceEnrollmentView: PIN confirmed, calling onResult');
                onResult(true, pin);
              },
            );
          },
          duplicateDetected: (matchedId, similarity) => _DuplicateScreen(
            matchedId: matchedId,
            similarity: similarity,
            onCancel: widget.onCancel,
          ),
          maxUsersReached: () => _MaxUsersScreen(onCancel: widget.onCancel),
          orElse: () => Scaffold(
            backgroundColor: cs.surface,
            body: Center(
              child: CircularProgressIndicator(color: cs.primary),
            ),
          ),
        );
      },
    );
  }
}

// ── Intro Screen ──

class _IntroScreen extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback? onLogout;

  const _IntroScreen({required this.onStart, this.onLogout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: onLogout == null
          ? null
          : AppBar(
              backgroundColor: cs.surface,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                TextButton.icon(
                  onPressed: onLogout,
                  icon: Icon(Icons.logout, color: cs.primary, size: 20),
                  label: Text(
                    FaceVerificationLocalization.of(context).translate(i18.faceVerification.logout),
                    style: TextStyle(
                      color: cs.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
      body: ScrollableContent(
        enableFixedDigitButton: true,
        footer: DigitCard(
          margin: EdgeInsets.zero,
          children: [
            DigitButton(
              label: FaceVerificationLocalization.of(context).translate(i18.common.coreCommonContinue),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BeforeWeBeginPage(onContinue: onStart),
                  ),
                );
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.primary.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.face_retouching_natural,
                    size: 64,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  FaceVerificationLocalization.of(context).translate(i18.faceVerification.enrollmentTitle),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  FaceVerificationLocalization.of(context).translate(i18.faceVerification.enrollmentDescription),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: cs.onSurface.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                _StepRow(
                    number: '1',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleStraight)),
                const SizedBox(height: 10),
                _StepRow(
                    number: '2',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.stepLiveness)),
                const SizedBox(height: 10),
                _StepRow(
                    number: '3',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleLeft)),
                const SizedBox(height: 10),
                _StepRow(
                    number: '4',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleRight)),
                const SizedBox(height: 10),
                _StepRow(
                    number: '5',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleUp)),
                const SizedBox(height: 10),
                _StepRow(
                    number: '6',
                    label: FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleDown)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _TipRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  final String number;
  final String label;

  const _StepRow({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cs.primary.withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: cs.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(label,
            style: TextStyle(fontSize: 15, color: cs.onSurface)),
      ],
    );
  }
}

// ── Angle Capture Screen ──

class _AngleCaptureScreen extends StatefulWidget {
  final FaceModelService faceModelService;
  final int current;
  final int total;
  final String instruction;
  final void Function(List<double> embedding, double quality, {Uint8List? faceImageBytes}) onCaptured;
  final int resetTrigger;

  const _AngleCaptureScreen({
    required this.faceModelService,
    required this.current,
    required this.total,
    required this.instruction,
    required this.onCaptured,
    this.resetTrigger = 0,
  });

  /// Maps display step number to expected head pose.
  static ExpectedAngle _expectedAngleForStep(int current) {
    switch (current) {
      case 1:
        return ExpectedAngle.front;
      case 3:
        return ExpectedAngle.left;
      case 4:
        return ExpectedAngle.right;
      case 5:
        return ExpectedAngle.up;
      case 6:
        return ExpectedAngle.down;
      default:
        return ExpectedAngle.front;
    }
  }

  static FaceGuideType _guideTypeForStep(int current) {
    switch (current) {
      case 1:
        return FaceGuideType.front;
      case 3:
        return FaceGuideType.turnLeft;
      case 4:
        return FaceGuideType.turnRight;
      case 5:
        return FaceGuideType.lookUp;
      case 6:
        return FaceGuideType.lookDown;
      default:
        return FaceGuideType.front;
    }
  }

  @override
  State<_AngleCaptureScreen> createState() => _AngleCaptureScreenState();
}

class _AngleCaptureScreenState extends State<_AngleCaptureScreen> {
  bool _isBackCamera = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FaceCaptureView(
          key: ValueKey('enrollment_angle_${widget.current}'),
          faceModelService: widget.faceModelService,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            widget.onCaptured(embedding, quality, faceImageBytes: faceImageBytes);
          },
          // Same wording regardless of camera direction — the user asked to
          // keep the instruction consistent across front / back camera so the
          // text doesn't flip when they switch.
          guidanceText: widget.instruction,
          minQuality: 0.6,
          expectedAngle: _AngleCaptureScreen._expectedAngleForStep(widget.current),
          autoCapture: true,
          resetTrigger: widget.resetTrigger,
          onLensChanged: (lens) {
            setState(() {
              _isBackCamera = lens == CameraLensDirection.back;
            });
          },
        ),
        // Step indicator at top
        Positioned(
          top: MediaQuery.of(context).padding.top + 70,
          left: 0,
          right: 0,
          child: Center(
            child: _StepIndicator(current: widget.current, total: widget.total),
          ),
        ),
        // Face guide icon at bottom-right
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 90,
          right: 24,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FaceGuideIcon(
              type: _AngleCaptureScreen._guideTypeForStep(widget.current),
              size: 70,
              isBackCamera: _isBackCamera,
            ),
          ),
        ),
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int current;
  final int total;

  const _StepIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cs.inverseSurface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(total, (i) {
          final step = i + 1;
          final isActive = step == current;
          final isDone = step < current;
          return Padding(
            padding: EdgeInsets.only(left: i > 0 ? 8 : 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (i > 0)
                  Container(
                    width: 16,
                    height: 2,
                    color: isDone
                        ? Colors.green
                        : cs.onInverseSurface.withOpacity(0.3),
                  ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone
                        ? Colors.green
                        : isActive
                            ? cs.onInverseSurface
                            : cs.onInverseSurface.withOpacity(0.24),
                  ),
                  child: Center(
                    child: isDone
                        ? Icon(Icons.check,
                            size: 16, color: cs.onInverseSurface)
                        : Text(
                            '$step',
                            style: TextStyle(
                              color: isActive
                                  ? cs.inverseSurface
                                  : cs.onInverseSurface.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// ── Liveness Screen ──

class _LivenessScreen extends StatefulWidget {
  final FaceModelService faceModelService;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onPassed;

  const _LivenessScreen({
    required this.faceModelService,
    required this.currentStep,
    required this.totalSteps,
    required this.onPassed,
  });

  @override
  State<_LivenessScreen> createState() => _LivenessScreenState();
}

class _LivenessScreenState extends State<_LivenessScreen> {
  bool _isBackCamera = false;

  @override
  void initState() {
    super.initState();
    context.read<LivenessBloc>().add(const LivenessEvent.start());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LivenessBloc, LivenessState>(
      listener: (context, state) {
        if (state is LivenessPassedState) {
          widget.onPassed();
        } else if (state is LivenessFailedState) {
          context.read<LivenessBloc>().add(const LivenessEvent.start());
        }
      },
      child: Stack(
        children: [
          FaceCaptureView(
            key: const ValueKey('liveness_capture'),
            faceModelService: widget.faceModelService,
            onFaceCaptured: (_, __, {faceImageBytes}) {},
            captureEnabled: false,
            guidanceText: i18.faceVerification.livenessBlink,
            onFaceDetected: (face) {
              context.read<LivenessBloc>().add(
                    LivenessEvent.faceFrame(face: face),
                  );
            },
            onLensChanged: (lens) {
              setState(() {
                _isBackCamera = lens == CameraLensDirection.back;
              });
            },
          ),
          // Step indicator at top
          Positioned(
            top: MediaQuery.of(context).padding.top + 70,
            left: 0,
            right: 0,
            child: Center(
              child: _StepIndicator(
                current: widget.currentStep,
                total: widget.totalSteps,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: LivenessChallengeView(isBackCamera: _isBackCamera),
          ),
          // Blink guide icon at bottom-right
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 90,
            right: 24,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: FaceGuideIcon(
                type: FaceGuideType.blink,
                size: 70,
                isBackCamera: _isBackCamera,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── PIN Display Screen ──

class _PinDisplayScreen extends StatefulWidget {
  final String pin;
  final VoidCallback onConfirm;

  const _PinDisplayScreen({required this.pin, required this.onConfirm});

  @override
  State<_PinDisplayScreen> createState() => _PinDisplayScreenState();
}

class _PinDisplayScreenState extends State<_PinDisplayScreen> {
  static const _bg = Color(0xFFEEEEEE);
  static const _success = Color(0xFF00703C);
  static const _primaryOrange = Color(0xFFC84C0E);
  static const _secondaryText = Color(0xFF787878);
  static const _divider = Color(0xFFD6D5D4);
  static const _pinBoxBg = Color(0xFFFAFAFA);
  static const _pinBoxBorder = Color(0xFFF3F4F6);
  static const _digitColor = Color(0xFF1F2937);
  static const _infoBlue = Color(0xFF0057BD);
  static const _infoBg = Color(0xFFDEEFFF);
  static const _infoBody = Color(0xFF505A5F);

  @override
  Widget build(BuildContext context) {
    final pinDigits = widget.pin.split('');

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(11, 16, 11, 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 185,
                        decoration: BoxDecoration(
                          color: _success,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.white, size: 48),
                            const SizedBox(height: 16),
                            Text(
                              FaceVerificationLocalization.of(context)
                                  .translate(i18
                                      .faceVerification.enrollmentSuccessful),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          FaceVerificationLocalization.of(context)
                              .translate(i18.faceVerification.enrolledMessage),
                          style: const TextStyle(
                            fontSize: 16,
                            color: _secondaryText,
                            height: 1.37,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: _pinBoxBg,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _pinBoxBorder),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0D000000),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            for (var i = 0; i < pinDigits.length; i++) ...[
                              if (i > 0) const SizedBox(width: 12),
                              _PinDigitBox(digit: pinDigits[i]),
                            ],
                            const Spacer(),
                            InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: _copyPin,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.content_copy,
                                        size: 20, color: _primaryOrange),
                                    const SizedBox(width: 4),
                                    Text(
                                      FaceVerificationLocalization.of(context).translate(i18.faceVerification.copy),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: _primaryOrange,
                                        height: 20 / 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(width: 4, color: _infoBlue),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: _infoBg,
                                  border: Border.all(color: _infoBlue),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.info,
                                            color: _infoBlue, size: 24),
                                        const SizedBox(width: 8),
                                        Text(
                                          FaceVerificationLocalization.of(context).translate(i18.faceVerification.info),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: _infoBlue,
                                            height: 1.14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      FaceVerificationLocalization.of(context)
                                          .translate(i18.faceVerification
                                              .enrollmentPinNote),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: _infoBody,
                                        height: 1.37,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0, 2),
                    blurRadius: 3.5,
                  ),
                ],
              ),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    debugPrint('PIN Continue pressed');
                    widget.onConfirm();
                  },
                  child: Text(
                    FaceVerificationLocalization.of(context).translate(i18.common.coreCommonContinue),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _copyPin() async {
    await Clipboard.setData(ClipboardData(text: widget.pin));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(FaceVerificationLocalization.of(context).translate(i18.faceVerification.pinCopied)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _PinDigitBox extends StatelessWidget {
  final String digit;
  const _PinDigitBox({required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: _PinDisplayScreenState._divider),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        digit,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: _PinDisplayScreenState._digitColor,
          height: 32 / 24,
        ),
      ),
    );
  }
}

// ── Max Users Screen ──

class _MaxUsersScreen extends StatelessWidget {
  final VoidCallback onCancel;

  const _MaxUsersScreen({required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
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
                FaceVerificationLocalization.of(context).translate(i18.faceVerification.maxUsersTitle),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                FaceVerificationLocalization.of(context).translate(i18.faceVerification.maxUsersBody),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: cs.onSurface.withOpacity(0.6),
                    height: 1.4),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(FaceVerificationLocalization.of(context).translate(i18.faceVerification.goBack)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Before We Begin Page ──

/// Full-page instructions shown after tapping enrollment Continue, before
/// the actual face capture starts. Matches the HCM "Before We Begin" design.
class BeforeWeBeginPage extends StatelessWidget {
  final VoidCallback onContinue;

  const BeforeWeBeginPage({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFEEEEEE);
    const primaryTeal = Color(0xFF0B4B66);
    const primaryOrange = Color(0xFFC84C0E);
    const secondaryText = Color(0xFF787878);
    const divider = Color(0xFFD6D5D4);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_left,
                            size: 24, color: primaryTeal),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            FaceVerificationLocalization.of(context).translate(i18.faceVerification.back),
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryTeal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FaceVerificationLocalization.of(context).translate(i18.faceVerification.beforeWeBegin),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A4A63),
                        height: 36 / 32,
                        letterSpacing: -0.75,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      FaceVerificationLocalization.of(context).translate(i18.faceVerification.instructionsSubtitle),
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryText,
                        height: 22.75 / 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _BeginTipCard(
                      iconBgColor: Color(0xFFFFFBEB),
                      icon: Icons.wb_sunny_outlined,
                      iconColor: Color(0xFFB45309),
                      title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipGoodLighting),
                      body: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipGoodLightingBody),
                      titleColor: primaryTeal,
                      bodyColor: secondaryText,
                      borderColor: divider,
                    ),
                    SizedBox(height: 8),
                    _BeginTipCard(
                      iconBgColor: Color(0xFFEFF6FF),
                      icon: Icons.face_retouching_natural,
                      iconColor: Color(0xFF1D4ED8),
                      title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipClearFace),
                      body: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipClearFaceBody),
                      titleColor: primaryTeal,
                      bodyColor: secondaryText,
                      borderColor: divider,
                    ),
                    SizedBox(height: 8),
                    _BeginTipCard(
                      iconBgColor: Color(0xFFF0FDF4),
                      icon: Icons.straighten_rounded,
                      iconColor: Color(0xFF15803D),
                      title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipCorrectDistance),
                      body: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipCorrectDistanceBody),
                      titleColor: primaryTeal,
                      bodyColor: secondaryText,
                      borderColor: divider,
                    ),
                    SizedBox(height: 8),
                    _BeginTipCard(
                      iconBgColor: Color(0xFFFAF5FF),
                      icon: Icons.smartphone_outlined,
                      iconColor: Color(0xFF7E22CE),
                      title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipSteadyPhone),
                      body: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipSteadyPhoneBody),
                      titleColor: primaryTeal,
                      bodyColor: secondaryText,
                      borderColor: divider,
                    ),
                    SizedBox(height: 8),
                    _BeginTipCard(
                      iconBgColor: Color(0xFFFEF2F2),
                      icon: Icons.compare_arrows_rounded,
                      iconColor: Color(0xFFB91C1C),
                      title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipFollowGuidance),
                      body: FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipFollowGuidanceBody),
                      titleColor: primaryTeal,
                      bodyColor: secondaryText,
                      borderColor: divider,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onContinue();
                  },
                  child: Text(
                    FaceVerificationLocalization.of(context).translate(i18.faceVerification.gotItContinue),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BeginTipCard extends StatelessWidget {
  final Color iconBgColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;
  final Color titleColor;
  final Color bodyColor;
  final Color borderColor;

  const _BeginTipCard({
    required this.iconBgColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.titleColor,
    required this.bodyColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 24 / 16,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.37,
                    color: bodyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Photo Tips Sheet ──

class _PhotoTipsSheet extends StatelessWidget {
  final VoidCallback? onContinue;

  const _PhotoTipsSheet({this.onContinue});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: cs.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.tips_and_updates_outlined, color: cs.primary, size: 22),
              const SizedBox(width: 10),
              Text(
                FaceVerificationLocalization.of(context).translate(i18.faceVerification.tipsTitle),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _TipRow(
            icon: Icons.wb_sunny_outlined,
            color: Colors.amber.shade700,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipBrightness),
          ),
          const SizedBox(height: 12),
          _TipRow(
            icon: Icons.straighten_rounded,
            color: cs.primary,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipDistance),
          ),
          const SizedBox(height: 12),
          _TipRow(
            icon: Icons.face_outlined,
            color: Colors.teal,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipClarity),
          ),
          const SizedBox(height: 12),
          _TipRow(
            icon: Icons.crop_free_rounded,
            color: Colors.deepPurple,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipStayStill),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onContinue?.call();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cs.primary,
                foregroundColor: cs.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                onContinue != null
                    ? FaceVerificationLocalization.of(context).translate(i18.common.coreCommonContinue)
                    : FaceVerificationLocalization.of(context).translate(i18.faceVerification.gotIt),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// ── Quality Tips Sheet ──

class _QualityTipsSheet extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorMessage;

  const _QualityTipsSheet({required this.onRetry, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: cs.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.warning_amber_rounded,
                    color: Colors.orange.shade700, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  errorMessage != null
                      ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.captureFailed)
                      : FaceVerificationLocalization.of(context).translate(i18.faceVerification.qualityLow),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
              ),
            ],
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              style: TextStyle(
                fontSize: 13,
                color: cs.onSurface.withOpacity(0.6),
              ),
            ),
          ],
          const SizedBox(height: 20),
          Text(
            FaceVerificationLocalization.of(context)
                .translate(i18.faceVerification.tipsTitle),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          _TipRow(
            icon: Icons.wb_sunny_outlined,
            color: Colors.amber.shade700,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipBrightness),
          ),
          const SizedBox(height: 10),
          _TipRow(
            icon: Icons.straighten_rounded,
            color: cs.primary,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipDistance),
          ),
          const SizedBox(height: 10),
          _TipRow(
            icon: Icons.face_outlined,
            color: Colors.teal,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipClarity),
          ),
          const SizedBox(height: 10),
          _TipRow(
            icon: Icons.crop_free_rounded,
            color: Colors.deepPurple,
            text: FaceVerificationLocalization.of(context).translate(i18.faceVerification.photoTipStayStill),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: cs.primary,
                foregroundColor: cs.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                FaceVerificationLocalization.of(context)
                    .translate(i18.faceVerification.tryAgain),
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Duplicate Screen ──

class _DuplicateScreen extends StatelessWidget {
  final String matchedId;
  final double similarity;
  final VoidCallback onCancel;

  const _DuplicateScreen({
    required this.matchedId,
    required this.similarity,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
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
                child: Icon(Icons.warning_rounded,
                    size: 56, color: Colors.orange.shade700),
              ),
              const SizedBox(height: 24),
              Text(
                FaceVerificationLocalization.of(context)
                    .translate(i18.faceVerification.duplicateDetected),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface),
              ),
              const SizedBox(height: 12),
              Text(
                '${FaceVerificationLocalization.of(context).translate(i18.faceVerification.faceMatch)}: '
                '${(similarity * 100).toStringAsFixed(1)}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: cs.onSurface.withOpacity(0.6),
                    height: 1.4),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(FaceVerificationLocalization.of(context).translate(i18.faceVerification.goBack)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
