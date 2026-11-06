import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../utils/i18_key_constants.dart' as i18;

/// Result of a liveness check.
class LivenessResult {
  final bool passed;
  final LivenessChallenge? currentChallenge;
  final String instruction;
  final double progress; // 0.0 to 1.0

  const LivenessResult({
    required this.passed,
    this.currentChallenge,
    required this.instruction,
    required this.progress,
  });
}

/// Types of liveness challenges.
enum LivenessChallenge { blink, turnLeft, turnRight }

/// Passive liveness detection using ML Kit face landmarks.
/// Requires a single blink. The head-turn angle captures that follow
/// the liveness step (left/right/up/down during enrollment) provide
/// additional evidence of a live subject, so a second "turnLeft"
/// liveness challenge would collide with the step-3 left-angle capture
/// and force the user to turn left twice.
class LivenessDetectionService {
  static const double _blinkClosedThreshold = 0.3;
  static const double _blinkOpenThreshold = 0.7;
  static const double _headTurnAngleThreshold = 25.0;
  static const List<LivenessChallenge> _defaultChallenges = [
    LivenessChallenge.blink,
  ];

  final List<LivenessChallenge> _challenges;
  int _currentChallengeIndex = 0;
  bool _blinkEyesClosed = false;

  LivenessDetectionService({
    List<LivenessChallenge>? challenges,
  }) : _challenges = (challenges != null && challenges.isNotEmpty)
            ? challenges
            : _defaultChallenges;

  /// Reset state for a new liveness session.
  void reset() {
    _currentChallengeIndex = 0;
    _blinkEyesClosed = false;
  }

  /// Process a face frame and return the current liveness state.
  LivenessResult processFace(Face face) {
    if (_currentChallengeIndex >= _challenges.length) {
      return const LivenessResult(
        passed: true,
        instruction: 'FACE_AUTH_LIVENESS_PASSED',
        progress: 1.0,
      );
    }

    final challenge = _challenges[_currentChallengeIndex];
    bool challengePassed = false;

    switch (challenge) {
      case LivenessChallenge.blink:
        challengePassed = _detectBlink(face);
        break;
      case LivenessChallenge.turnLeft:
        challengePassed = _detectHeadTurn(face, isLeft: true);
        break;
      case LivenessChallenge.turnRight:
        challengePassed = _detectHeadTurn(face, isLeft: false);
        break;
    }

    if (challengePassed) {
      _currentChallengeIndex++;
      _blinkEyesClosed = false;

      if (_currentChallengeIndex >= _challenges.length) {
        return const LivenessResult(
          passed: true,
          instruction: 'FACE_AUTH_LIVENESS_PASSED',
          progress: 1.0,
        );
      }
    }

    final progress = _currentChallengeIndex / _challenges.length;
    final nextChallenge = _currentChallengeIndex < _challenges.length
        ? _challenges[_currentChallengeIndex]
        : null;

    return LivenessResult(
      passed: false,
      currentChallenge: nextChallenge,
      instruction: _getInstruction(nextChallenge),
      progress: progress,
    );
  }

  /// Detect a blink: eyes closed (< 0.3) then opened (> 0.7).
  bool _detectBlink(Face face) {
    final leftEyeOpen = face.leftEyeOpenProbability;
    final rightEyeOpen = face.rightEyeOpenProbability;

    if (leftEyeOpen == null || rightEyeOpen == null) return false;

    final avgEyeOpen = (leftEyeOpen + rightEyeOpen) / 2.0;

    if (!_blinkEyesClosed && avgEyeOpen < _blinkClosedThreshold) {
      _blinkEyesClosed = true;
      return false;
    }

    if (_blinkEyesClosed && avgEyeOpen > _blinkOpenThreshold) {
      return true; // Blink detected
    }

    return false;
  }

  /// Detect a head turn exceeding the angle threshold.
  bool _detectHeadTurn(Face face, {required bool isLeft}) {
    final yAngle = face.headEulerAngleY;
    if (yAngle == null) return false;

    if (isLeft) {
      return yAngle > _headTurnAngleThreshold;
    } else {
      return yAngle < -_headTurnAngleThreshold;
    }
  }

  String _getInstruction(LivenessChallenge? challenge) {
    switch (challenge) {
      case LivenessChallenge.blink:
        return i18.faceVerification.livenessBlink;
      case LivenessChallenge.turnLeft:
        return i18.faceVerification.livenessTurnLeft;
      case LivenessChallenge.turnRight:
        return i18.faceVerification.livenessTurnRight;
      case null:
        return '';
    }
  }

  /// The total number of challenges.
  int get totalChallenges => _challenges.length;

  /// The current challenge index (0-based).
  int get currentIndex => _currentChallengeIndex;

  /// Whether all challenges are completed.
  bool get isComplete => _currentChallengeIndex >= _challenges.length;
}
