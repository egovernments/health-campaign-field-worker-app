import '../core/log_entry.dart';

/// Abstract interface for formatting log entries for output.
///
/// Implementations can format logs for different purposes:
/// - [PrettyFormatter] for readable development console output
/// - [CompactFormatter] for production/CI single-line output
abstract class LogFormatter {
  const LogFormatter();

  /// Formats a log entry for output.
  ///
  /// Returns a string representation suitable for the target output.
  String format(LogEntry entry);
}
