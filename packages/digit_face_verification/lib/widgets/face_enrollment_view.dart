import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/face_enrollment_bloc.dart';
import '../blocs/liveness_bloc.dart';
import '../data/face_model_service.dart';
import '../data/liveness_detection_service.dart';
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

  const FaceEnrollmentView({
    super.key,
    required this.faceModelService,
    required this.individualId,
    required this.isSystemUser,
    required this.enrolledBy,
    required this.onResult,
    required this.onCancel,
  });

  @override
  State<FaceEnrollmentView> createState() => _FaceEnrollmentViewState();
}

class _FaceEnrollmentViewState extends State<FaceEnrollmentView> {
  bool _showIntro = true;

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
      return _IntroScreen(onStart: _startEnrollment);
    }

    return BlocConsumer<FaceEnrollmentBloc, FaceEnrollmentState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          },
          maxUsersReached: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Maximum number of users reached on device'),
                backgroundColor: Colors.orange,
              ),
            );
            widget.onCancel();
          },
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
                    'Setting up your profile...',
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
          qualityInsufficient: () => const Center(
            child: Text('Image quality too low. Please try again.'),
          ),
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

  const _IntroScreen({required this.onStart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
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
                'Face Enrollment',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We need to capture your face from 5 angles and '
                'verify liveness to set up secure Face verification. '
                'A backup PIN will also be generated for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: cs.onSurface.withOpacity(0.6),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              // Steps preview
              _StepRow(number: '1', label: 'Look straight at the camera'),
              const SizedBox(height: 10),
              _StepRow(number: '2', label: 'Complete liveness check'),
              const SizedBox(height: 10),
              _StepRow(number: '3', label: 'Turn slightly to the left'),
              const SizedBox(height: 10),
              _StepRow(number: '4', label: 'Turn slightly to the right'),
              const SizedBox(height: 10),
              _StepRow(number: '5', label: 'Look slightly up'),
              const SizedBox(height: 10),
              _StepRow(number: '6', label: 'Look slightly down'),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onStart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
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

class _AngleCaptureScreen extends StatelessWidget {
  final FaceModelService faceModelService;
  final int current;
  final int total;
  final String instruction;
  final void Function(List<double> embedding, double quality, {Uint8List? faceImageBytes}) onCaptured;

  const _AngleCaptureScreen({
    required this.faceModelService,
    required this.current,
    required this.total,
    required this.instruction,
    required this.onCaptured,
  });

  /// Maps display step number to expected head pose.
  /// Step 1 = front, step 2 = liveness (not used here),
  /// step 3 = left, step 4 = right, step 5 = up, step 6 = down.
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FaceCaptureView(
          key: ValueKey('enrollment_angle_$current'),
          faceModelService: faceModelService,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            onCaptured(embedding, quality, faceImageBytes: faceImageBytes);
          },
          guidanceText: instruction,
          minQuality: 0.6,
          expectedAngle: _expectedAngleForStep(current),
        ),
        // Step indicator at top
        Positioned(
          top: MediaQuery.of(context).padding.top + 70,
          left: 0,
          right: 0,
          child: Center(
            child: _StepIndicator(current: current, total: total),
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
              type: _guideTypeForStep(current),
              size: 70,
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
            guidanceText: 'Blink your eyes',
            onFaceDetected: (face) {
              context.read<LivenessBloc>().add(
                    LivenessEvent.faceFrame(face: face),
                  );
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
          const Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: LivenessChallengeView(),
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
              child: const FaceGuideIcon(
                type: FaceGuideType.blink,
                size: 70,
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
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
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
              const SizedBox(height: 28),
              Text(
                'Enrollment Complete!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your face has been enrolled successfully.\nHere is your backup PIN:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: cs.onSurface.withOpacity(0.6),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: cs.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.primary.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  widget.pin,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 12,
                    color: cs.primary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: Colors.amber.shade800, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Remember this PIN. Use it when face verification is unavailable.',
                        style: TextStyle(
                            fontSize: 13, color: cs.onSurface),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => setState(() => _confirmed = !_confirmed),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _confirmed,
                        onChanged: (v) =>
                            setState(() => _confirmed = v ?? false),
                        activeColor: cs.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'I have noted down my PIN',
                        style: TextStyle(
                          fontSize: 14,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _confirmed
                      ? () {
                          debugPrint('PIN button pressed!');
                          widget.onConfirm();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.onPrimary,
                    disabledBackgroundColor: cs.onSurface.withOpacity(0.12),
                    disabledForegroundColor: cs.onSurface.withOpacity(0.38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
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
                'Face already enrolled',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface),
              ),
              const SizedBox(height: 12),
              Text(
                'Your face closely matches an existing profile '
                '(${(similarity * 100).toStringAsFixed(1)}% match). '
                'Please retry for different profile',
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
                  child: const Text('Go Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
