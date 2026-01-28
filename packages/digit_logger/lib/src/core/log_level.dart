/// Log levels for the digit_logger package.
///
/// Levels are ordered by severity, from least to most severe.
/// In release builds, [trace] and [debug] logs are stripped via compile-time
/// checks using [kReleaseMode].
enum LogLevel implements Comparable<LogLevel> {
  /// Granular debugging - path resolution steps, loop iterations.
  /// Stripped in release builds.
  trace(0, 'TRC'),

  /// Development debugging - variable values, state changes.
  /// Stripped in release builds.
  debug(1, 'DBG'),

  /// Normal operations - flow started, form loaded, sync complete.
  info(2, 'INF'),

  /// Recoverable issues - fallback used, retry attempted.
  warn(3, 'WRN'),

  /// Failures that need attention - transformation failed.
  error(4, 'ERR'),

  /// Critical failures - app crash, data corruption.
  fatal(5, 'FTL');

  /// Numeric value for comparison.
  final int value;

  /// Short code for compact output (3 characters).
  final String code;

  const LogLevel(this.value, this.code);

  /// Whether this level should be included given a minimum level.
  bool shouldLog(LogLevel minLevel) => value >= minLevel.value;

  @override
  int compareTo(LogLevel other) => value.compareTo(other.value);

  /// Returns true if this level is at least as severe as [other].
  bool operator >=(LogLevel other) => value >= other.value;

  /// Returns true if this level is more severe than [other].
  bool operator >(LogLevel other) => value > other.value;

  /// Returns true if this level is less severe or equal to [other].
  bool operator <=(LogLevel other) => value <= other.value;

  /// Returns true if this level is less severe than [other].
  bool operator <(LogLevel other) => value < other.value;
}
