import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/liveness_bloc.dart';
import '../data/liveness_detection_service.dart';

/// Animated overlay that displays liveness challenge instructions
/// on top of the camera feed.
class LivenessChallengeView extends StatelessWidget {
  /// When true, left/right arrow icons are swapped because the back camera
  /// preview is not mirrored — screen-left is the subject's right.
  final bool isBackCamera;

  const LivenessChallengeView({super.key, this.isBackCamera = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivenessBloc, LivenessState>(
      builder: (context, state) {
        return state.maybeWhen(
          challenging: (challenge, instruction, progress) {
            return _ChallengeOverlay(
              challenge: challenge,
              instruction: instruction,
              progress: progress,
              isBackCamera: isBackCamera,
            );
          },
          passed: () => _StatusOverlay(
            icon: Icons.check_circle,
            color: Colors.green,
            text: 'Liveness verified!',
          ),
          failed: (reason) => _StatusOverlay(
            icon: Icons.error,
            color: Colors.red,
            text: reason,
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _ChallengeOverlay extends StatelessWidget {
  final LivenessChallenge challenge;
  final String instruction;
  final double progress;
  final bool isBackCamera;

  const _ChallengeOverlay({
    required this.challenge,
    required this.instruction,
    required this.progress,
    this.isBackCamera = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Progress indicator
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white24,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          minHeight: 4,
        ),
        const SizedBox(height: 16),
        // Challenge icon
        _ChallengeIcon(challenge: challenge, isBackCamera: isBackCamera),
        const SizedBox(height: 12),
        // Instruction text
        Text(
          instruction,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(blurRadius: 4, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChallengeIcon extends StatelessWidget {
  final LivenessChallenge challenge;
  final bool isBackCamera;

  const _ChallengeIcon({required this.challenge, this.isBackCamera = false});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (challenge) {
      case LivenessChallenge.blink:
        icon = Icons.visibility;
        break;
      case LivenessChallenge.turnLeft:
        // Back camera preview is not mirrored: screen-left = subject's right.
        icon = isBackCamera ? Icons.arrow_forward : Icons.arrow_back;
        break;
      case LivenessChallenge.turnRight:
        icon = isBackCamera ? Icons.arrow_back : Icons.arrow_forward;
        break;
    }

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Icon(icon, color: Colors.white, size: 36),
    );
  }
}

class _StatusOverlay extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _StatusOverlay({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 48),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            shadows: const [
              Shadow(blurRadius: 4, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}
