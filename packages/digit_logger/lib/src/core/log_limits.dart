/// Size limits for log entries to prevent memory and storage issues.
///
/// These limits are enforced when creating log entries. Values that exceed
/// these limits are truncated or dropped with appropriate markers.
class LogLimits {
  LogLimits._();

  /// Maximum length for log messages in characters.
  /// Messages exceeding this are truncated with '...' suffix.
  static const int maxMessageLength = 1000;

  /// Maximum size for serialized context in bytes.
  /// If exceeded, context is dropped and `_contextDropped: true` is added.
  static const int maxContextSize = 10 * 1024; // 10KB

  /// Maximum number of stack trace frames to keep.
  /// Additional frames are indicated with '... X more frames'.
  static const int maxStackFrames = 50;

  /// Maximum nesting depth for context maps.
  /// Deeper values are replaced with '[nested object]'.
  static const int maxContextDepth = 5;

  /// Maximum length for context map keys.
  /// Longer keys are truncated with '...' suffix.
  static const int maxContextKeyLength = 100;

  /// Maximum length for context map string values.
  /// Longer values are truncated with '...' suffix.
  static const int maxContextValueLength = 500;

  /// Maximum number of logs to buffer before init() is called.
  static const int maxPreInitBuffer = 100;

  /// Truncates a string to the specified max length with '...' suffix.
  static String truncate(String value, int maxLength) {
    if (value.length <= maxLength) return value;
    if (maxLength <= 3) return '...';
    return '${value.substring(0, maxLength - 3)}...';
  }

  /// Truncates a message to [maxMessageLength].
  static String truncateMessage(String message) =>
      truncate(message, maxMessageLength);

  /// Truncates a context key to [maxContextKeyLength].
  static String truncateKey(String key) => truncate(key, maxContextKeyLength);

  /// Truncates a context value to [maxContextValueLength].
  static String truncateValue(String value) =>
      truncate(value, maxContextValueLength);

  /// Truncates a stack trace to [maxStackFrames] frames.
  static String truncateStackTrace(StackTrace stackTrace) {
    final lines = stackTrace.toString().split('\n');
    if (lines.length <= maxStackFrames) {
      return stackTrace.toString();
    }
    final kept = lines.take(maxStackFrames).join('\n');
    final remaining = lines.length - maxStackFrames;
    return '$kept\n... $remaining more frames';
  }
}
