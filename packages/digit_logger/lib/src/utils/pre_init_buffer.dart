import '../core/log_category.dart';
import '../core/log_level.dart';
import '../core/log_limits.dart';

/// Represents a log that was created before the logger was initialized.
///
/// These logs are buffered and flushed to the real logger once [init] is called.
class PendingLog {
  /// Log level.
  final LogLevel level;

  /// Log message.
  final String message;

  /// Log category.
  final LogCategory category;

  /// Structured context data.
  final Map<String, dynamic>? context;

  /// Error object (for error logs).
  final Object? error;

  /// Stack trace (for error logs).
  final StackTrace? stackTrace;

  /// Timestamp when the log was created.
  final DateTime timestamp;

  /// Correlation ID if available.
  final String? correlationId;

  const PendingLog({
    required this.level,
    required this.message,
    required this.category,
    this.context,
    this.error,
    this.stackTrace,
    required this.timestamp,
    this.correlationId,
  });
}

/// Buffer for storing logs before the logger is initialized.
///
/// Logs created before [DigitLogger.init] is called are stored here
/// and flushed once initialization completes. This ensures no logs
/// are lost during app startup.
class PreInitBuffer {
  final List<PendingLog> _buffer = [];

  /// Maximum buffer size (prevents memory issues if init is never called).
  int get maxSize => LogLimits.maxPreInitBuffer;

  /// Number of buffered logs.
  int get length => _buffer.length;

  /// Whether the buffer is empty.
  bool get isEmpty => _buffer.isEmpty;

  /// Whether the buffer is at capacity.
  bool get isFull => _buffer.length >= maxSize;

  /// Adds a log to the buffer if not full.
  ///
  /// Returns true if added, false if buffer is full (log is dropped).
  bool add(PendingLog log) {
    if (isFull) {
      return false;
    }
    _buffer.add(log);
    return true;
  }

  /// Gets all buffered logs and clears the buffer.
  List<PendingLog> flush() {
    final logs = List<PendingLog>.from(_buffer);
    _buffer.clear();
    return logs;
  }

  /// Clears the buffer without returning logs.
  void clear() {
    _buffer.clear();
  }
}
