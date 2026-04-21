/// Central configuration for face authentication timing constants.
/// All values have sensible defaults and can be overridden at instantiation.
class FaceAuthConfig {
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

  /// Cosine similarity threshold for face match. Default: 0.80.
  final double faceMatchThreshold;

  const FaceAuthConfig({
    this.startHour = 8,
    this.endHour = 18,
    this.promptCount = 3,
    this.minGapMinutes = 180,
    this.countdownDuration = const Duration(minutes: 5),
    this.maxFaceAttempts = 3,
    this.faceMatchThreshold = 0.80,
  });

  /// Total minutes in the verification window.
  int get windowMinutes => (endHour - startHour) * 60;
}
