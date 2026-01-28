import '../core/log_entry.dart';
import '../core/log_filter.dart';
import 'log_storage.dart';

/// In-memory implementation of [LogStorage] for testing.
///
/// Stores all entries in a list. Useful for unit tests and scenarios
/// where persistence is not needed.
class MemoryStorage implements LogStorage {
  final List<LogEntry> _entries = [];

  /// Maximum number of entries to keep (0 = unlimited).
  final int maxEntries;

  MemoryStorage({this.maxEntries = 0});

  /// All stored entries (for testing).
  List<LogEntry> get entries => List.unmodifiable(_entries);

  @override
  Future<void> init() async {
    // No initialization needed for memory storage
  }

  @override
  Future<void> write(LogEntry entry) async {
    _entries.add(entry);
    _enforceLimit();
  }

  @override
  Future<void> writeBatch(List<LogEntry> entries) async {
    _entries.addAll(entries);
    _enforceLimit();
  }

  @override
  Future<List<LogEntry>> query(
    LogFilter filter, {
    int? limit,
    int? offset,
  }) async {
    var results = _entries.where(filter.matches).toList();

    // Sort by timestamp descending (newest first)
    results.sort((a, b) => b.timestamp.compareTo(a.timestamp));

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

  @override
  Future<void> markSynced(List<String> ids) async {
    final idSet = ids.toSet();
    for (var i = 0; i < _entries.length; i++) {
      if (idSet.contains(_entries[i].id)) {
        _entries[i] = _entries[i].copyWith(synced: true);
      }
    }
  }

  @override
  Future<void> delete(LogFilter filter) async {
    _entries.removeWhere(filter.matches);
  }

  @override
  Future<int> count({LogFilter? filter}) async {
    if (filter == null) {
      return _entries.length;
    }
    return _entries.where(filter.matches).length;
  }

  @override
  Future<void> dispose() async {
    _entries.clear();
  }

  /// Clears all entries (for testing).
  void clear() {
    _entries.clear();
  }

  void _enforceLimit() {
    if (maxEntries > 0 && _entries.length > maxEntries) {
      final excess = _entries.length - maxEntries;
      _entries.removeRange(0, excess);
    }
  }
}
