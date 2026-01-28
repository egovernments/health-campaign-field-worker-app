import '../core/log_entry.dart';
import '../core/log_filter.dart';
import 'log_target.dart';

/// Log target that stores entries in memory.
///
/// Useful for testing and debugging. Entries can be queried and cleared.
class MemoryTarget extends LogTarget {
  final List<LogEntry> _entries = [];

  /// Maximum number of entries to keep (0 = unlimited).
  final int maxEntries;

  MemoryTarget({this.maxEntries = 0});

  /// All stored log entries.
  List<LogEntry> get entries => List.unmodifiable(_entries);

  /// Number of stored entries.
  int get count => _entries.length;

  @override
  Future<void> write(LogEntry entry) async {
    _entries.add(entry);

    // Enforce max entries limit
    if (maxEntries > 0 && _entries.length > maxEntries) {
      _entries.removeAt(0);
    }
  }

  @override
  Future<void> writeBatch(List<LogEntry> entries) async {
    _entries.addAll(entries);

    // Enforce max entries limit
    if (maxEntries > 0 && _entries.length > maxEntries) {
      final excess = _entries.length - maxEntries;
      _entries.removeRange(0, excess);
    }
  }

  /// Queries entries matching the filter.
  List<LogEntry> query(LogFilter filter, {int? limit, int? offset}) {
    var results = _entries.where(filter.matches).toList();

    // Apply offset
    if (offset != null && offset > 0) {
      results = results.skip(offset).toList();
    }

    // Apply limit
    if (limit != null && limit > 0) {
      results = results.take(limit).toList();
    }

    return results;
  }

  /// Clears all stored entries.
  void clear() {
    _entries.clear();
  }

  /// Returns the most recent entry, or null if empty.
  LogEntry? get lastEntry => _entries.isNotEmpty ? _entries.last : null;

  /// Returns entries matching a predicate.
  List<LogEntry> where(bool Function(LogEntry) test) {
    return _entries.where(test).toList();
  }

  @override
  Future<void> dispose() async {
    _entries.clear();
  }
}
