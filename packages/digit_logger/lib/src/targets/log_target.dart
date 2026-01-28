import '../core/log_entry.dart';

/// Abstract interface for log output targets.
///
/// Log targets receive formatted log entries and write them to their
/// destination (console, file, remote server, etc.).
///
/// Implementations:
/// - [ConsoleTarget] - Writes to debug console via debugPrint
/// - [MemoryTarget] - Stores in memory for testing
abstract class LogTarget {
  const LogTarget();

  /// Initializes the target.
  ///
  /// Called once during logger initialization.
  Future<void> init() async {}

  /// Writes a single log entry.
  Future<void> write(LogEntry entry);

  /// Writes multiple log entries in batch.
  ///
  /// Default implementation calls [write] for each entry.
  /// Implementations may override for more efficient batch writing.
  Future<void> writeBatch(List<LogEntry> entries) async {
    for (final entry in entries) {
      await write(entry);
    }
  }

  /// Disposes resources used by the target.
  ///
  /// Called during logger shutdown.
  Future<void> dispose() async {}
}
