/// Central configuration for face authentication timing constants.
/// All values have sensible defaults and can be overridden at instantiation.
class FaceAuthConfig {
  // Static constants — usable as default parameter values in other classes.
  static const defaultFaceMatchThreshold = 0.70;
  static const defaultMaxFaceAttempts = 3;

  /// Start of re-verification window (hour, 24h format). Default: 8 (8 AM).
  final int startHour;

  /// End of re-verification window (hour, 24h format). Default: 18 (6 PM).
  final int endHour;

  /// Number of re-verification prompts per day. Default: 3.
  final int promptCount;

  /// Minimum gap between prompts in minutes. Default: 180 (3 hours).
  final int minGapMinutes;

  /// Duration of the countdown window before a prompt expires. Default: 5 minutes.
  final Duration countdownDuration;

  /// Maximum face verification attempts before PIN fallback. Default: 3.
  final int maxFaceAttempts;

  /// Cosine similarity threshold for face match. Default: 0.70.
  final double faceMatchThreshold;

  const FaceAuthConfig({
    this.startHour = 8,
    this.endHour = 18,
    this.promptCount = 3,
    this.minGapMinutes = 180,
    this.countdownDuration = const Duration(minutes: 5),
    this.maxFaceAttempts = 3,
    this.faceMatchThreshold = 0.70,
  });

  /// Builds a config from a FACE_AUTH_CONFIG MDMS record. Any missing key
  /// falls back to the corresponding compile-time default, so a partial or
  /// empty server record still yields a usable config.
  factory FaceAuthConfig.fromMdms(Map<String, dynamic> data) {
    const d = FaceAuthConfig();
    return FaceAuthConfig(
      faceMatchThreshold:
          (data['FACE_MATCH_THRESHOLD'] as num?)?.toDouble() ??
              d.faceMatchThreshold,
      maxFaceAttempts:
          (data['MAX_FACE_ATTEMPTS'] as num?)?.toInt() ?? d.maxFaceAttempts,
      startHour: (data['START_HOUR'] as num?)?.toInt() ?? d.startHour,
      endHour: (data['END_HOUR'] as num?)?.toInt() ?? d.endHour,
      promptCount: (data['PROMPT_COUNT'] as num?)?.toInt() ?? d.promptCount,
      minGapMinutes:
          (data['MIN_GAP_MINUTES'] as num?)?.toInt() ?? d.minGapMinutes,
      countdownDuration: Duration(
        minutes: (data['COUNTDOWN_DURATION_MINUTES'] as num?)?.toInt() ??
            d.countdownDuration.inMinutes,
      ),
    );
  }

  /// Total minutes in the verification window.
  int get windowMinutes => (endHour - startHour) * 60;
}
