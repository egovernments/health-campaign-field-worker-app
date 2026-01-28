import 'log_category.dart';
import 'log_entry.dart';
import 'log_level.dart';

/// Filter for querying log entries.
///
/// All filter conditions are combined with AND logic. A log entry must
/// match all specified conditions to be included in results.
class LogFilter {
  /// Minimum level to include (inclusive).
  final LogLevel? minLevel;

  /// Maximum level to include (inclusive).
  final LogLevel? maxLevel;

  /// Categories to include (null = all categories).
  final List<LogCategory>? categories;

  /// Categories to exclude.
  final List<LogCategory>? excludeCategories;

  /// Start time (inclusive).
  final DateTime? startTime;

  /// End time (exclusive).
  final DateTime? endTime;

  /// Filter by correlation ID.
  final String? correlationId;

  /// Filter by session ID.
  final String? sessionId;

  /// Filter by user ID.
  final String? userId;

  /// Search in message text (case-insensitive contains).
  final String? searchText;

  /// Filter by sync status (true = synced only, false = unsynced only).
  final bool? syncedOnly;

  const LogFilter({
    this.minLevel,
    this.maxLevel,
    this.categories,
    this.excludeCategories,
    this.startTime,
    this.endTime,
    this.correlationId,
    this.sessionId,
    this.userId,
    this.searchText,
    this.syncedOnly,
  });

  /// Creates a filter that matches all entries.
  const LogFilter.all() : this();

  /// Creates a filter for a specific level range.
  factory LogFilter.levelRange(LogLevel min, LogLevel max) {
    return LogFilter(minLevel: min, maxLevel: max);
  }

  /// Creates a filter for errors and above.
  factory LogFilter.errorsOnly() {
    return const LogFilter(minLevel: LogLevel.error);
  }

  /// Creates a filter for a specific time range.
  factory LogFilter.timeRange(DateTime start, DateTime end) {
    return LogFilter(startTime: start, endTime: end);
  }

  /// Creates a filter for a specific correlation ID.
  factory LogFilter.byCorrelation(String correlationId) {
    return LogFilter(correlationId: correlationId);
  }

  /// Creates a filter for a specific session.
  factory LogFilter.bySession(String sessionId) {
    return LogFilter(sessionId: sessionId);
  }

  /// Creates a filter for specific categories.
  factory LogFilter.byCategories(List<LogCategory> categories) {
    return LogFilter(categories: categories);
  }

  /// Returns true if the given [entry] matches this filter.
  bool matches(LogEntry entry) {
    // Check level range
    if (minLevel != null && entry.level < minLevel!) {
      return false;
    }
    if (maxLevel != null && entry.level > maxLevel!) {
      return false;
    }

    // Check categories
    if (categories != null && categories!.isNotEmpty) {
      if (!categories!.contains(entry.category)) {
        return false;
      }
    }

    // Check excluded categories
    if (excludeCategories != null && excludeCategories!.isNotEmpty) {
      if (excludeCategories!.contains(entry.category)) {
        return false;
      }
    }

    // Check time range
    if (startTime != null && entry.timestamp.isBefore(startTime!)) {
      return false;
    }
    if (endTime != null && !entry.timestamp.isBefore(endTime!)) {
      return false;
    }

    // Check correlation ID
    if (correlationId != null && entry.correlationId != correlationId) {
      return false;
    }

    // Check session ID
    if (sessionId != null && entry.sessionId != sessionId) {
      return false;
    }

    // Check user ID
    if (userId != null && entry.userId != userId) {
      return false;
    }

    // Check search text
    if (searchText != null && searchText!.isNotEmpty) {
      if (!entry.message.toLowerCase().contains(searchText!.toLowerCase())) {
        return false;
      }
    }

    // Check sync status
    if (syncedOnly != null && entry.synced != syncedOnly) {
      return false;
    }

    return true;
  }

  /// Creates a new filter with the given fields merged.
  LogFilter copyWith({
    LogLevel? minLevel,
    LogLevel? maxLevel,
    List<LogCategory>? categories,
    List<LogCategory>? excludeCategories,
    DateTime? startTime,
    DateTime? endTime,
    String? correlationId,
    String? sessionId,
    String? userId,
    String? searchText,
    bool? syncedOnly,
  }) {
    return LogFilter(
      minLevel: minLevel ?? this.minLevel,
      maxLevel: maxLevel ?? this.maxLevel,
      categories: categories ?? this.categories,
      excludeCategories: excludeCategories ?? this.excludeCategories,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      correlationId: correlationId ?? this.correlationId,
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      searchText: searchText ?? this.searchText,
      syncedOnly: syncedOnly ?? this.syncedOnly,
    );
  }

  @override
  String toString() {
    final parts = <String>[];
    if (minLevel != null) parts.add('minLevel: $minLevel');
    if (maxLevel != null) parts.add('maxLevel: $maxLevel');
    if (categories != null) parts.add('categories: $categories');
    if (correlationId != null) parts.add('correlationId: $correlationId');
    if (sessionId != null) parts.add('sessionId: $sessionId');
    if (searchText != null) parts.add('searchText: $searchText');
    return 'LogFilter(${parts.join(', ')})';
  }
}
