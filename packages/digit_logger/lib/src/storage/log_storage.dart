import '../core/log_entry.dart';
import '../core/log_filter.dart';

/// Abstract interface for persistent log storage.
///
/// Storage implementations persist logs locally for offline access and
/// later synchronization. The logger is not coupled to any specific
/// implementation - consumers can provide their own (Isar, SQLite, Hive, etc.).
///
/// Implementations:
/// - [MemoryStorage] - In-memory storage for testing
abstract class LogStorage {
  /// Initializes the storage.
  ///
  /// Called once during logger initialization.
  Future<void> init();

  /// Writes a single log entry to storage.
  Future<void> write(LogEntry entry);

  /// Writes multiple log entries in batch.
  ///
  /// Batch writes are more efficient than individual writes.
  Future<void> writeBatch(List<LogEntry> entries);

  /// Queries log entries matching the filter.
  ///
  /// Results are ordered by timestamp descending (newest first).
  Future<List<LogEntry>> query(
    LogFilter filter, {
    int? limit,
    int? offset,
  });

  /// Marks entries as synced to remote.
  Future<void> markSynced(List<String> ids);

  /// Deletes entries matching the filter.
  Future<void> delete(LogFilter filter);

  /// Counts entries matching the filter.
  Future<int> count({LogFilter? filter});

  /// Disposes storage resources.
  Future<void> dispose();
}
