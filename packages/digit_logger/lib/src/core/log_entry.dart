import 'package:uuid/uuid.dart';

import 'log_category.dart';
import 'log_level.dart';
import 'log_limits.dart';

/// Immutable log entry representing a single log event.
///
/// All timestamps are stored in UTC for consistency across time zones.
class LogEntry {
  /// Unique identifier (UUID v4).
  final String id;

  /// Log severity level.
  final LogLevel level;

  /// Category for filtering and grouping.
  final LogCategory category;

  /// Human-readable log message (max [LogLimits.maxMessageLength] chars).
  final String message;

  /// Structured context data (max [LogLimits.maxContextSize] bytes serialized).
  final Map<String, dynamic>? context;

  /// UTC timestamp when the log was created.
  final DateTime timestamp;

  /// Source location (file:line) - only populated in debug builds.
  final String? source;

  /// Stack trace string (for errors only, max [LogLimits.maxStackFrames] frames).
  final String? stackTrace;

  /// Correlation ID for tracing related operations.
  final String? correlationId;

  /// Session ID for grouping logs within a session.
  final String sessionId;

  /// User ID (should be sanitized/hashed in production).
  final String? userId;

  /// Sequence number within session for ordering.
  final int sequenceNumber;

  /// Whether this log has been synced to remote.
  final bool synced;

  /// Duplicate count if deduplication is enabled.
  final int duplicateCount;

  /// Error object if this is an error log.
  final Object? error;

  const LogEntry._({
    required this.id,
    required this.level,
    required this.category,
    required this.message,
    this.context,
    required this.timestamp,
    this.source,
    this.stackTrace,
    this.correlationId,
    required this.sessionId,
    this.userId,
    required this.sequenceNumber,
    this.synced = false,
    this.duplicateCount = 1,
    this.error,
  });

  /// Creates a new log entry with automatic ID and timestamp generation.
  factory LogEntry({
    required LogLevel level,
    required LogCategory category,
    required String message,
    Map<String, dynamic>? context,
    String? source,
    StackTrace? stackTrace,
    String? correlationId,
    required String sessionId,
    String? userId,
    required int sequenceNumber,
    bool synced = false,
    int duplicateCount = 1,
    Object? error,
  }) {
    return LogEntry._(
      id: const Uuid().v4(),
      level: level,
      category: category,
      message: LogLimits.truncateMessage(message),
      context: context,
      timestamp: DateTime.now().toUtc(),
      source: source,
      stackTrace: stackTrace != null
          ? LogLimits.truncateStackTrace(stackTrace)
          : null,
      correlationId: correlationId,
      sessionId: sessionId,
      userId: userId,
      sequenceNumber: sequenceNumber,
      synced: synced,
      duplicateCount: duplicateCount,
      error: error,
    );
  }

  /// Creates a copy of this entry with the given fields replaced.
  LogEntry copyWith({
    String? id,
    LogLevel? level,
    LogCategory? category,
    String? message,
    Map<String, dynamic>? context,
    DateTime? timestamp,
    String? source,
    String? stackTrace,
    String? correlationId,
    String? sessionId,
    String? userId,
    int? sequenceNumber,
    bool? synced,
    int? duplicateCount,
    Object? error,
  }) {
    return LogEntry._(
      id: id ?? this.id,
      level: level ?? this.level,
      category: category ?? this.category,
      message: message ?? this.message,
      context: context ?? this.context,
      timestamp: timestamp ?? this.timestamp,
      source: source ?? this.source,
      stackTrace: stackTrace ?? this.stackTrace,
      correlationId: correlationId ?? this.correlationId,
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      synced: synced ?? this.synced,
      duplicateCount: duplicateCount ?? this.duplicateCount,
      error: error ?? this.error,
    );
  }

  /// Converts the entry to a JSON-serializable map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level.name,
      'category': category.code,
      'message': message,
      if (context != null) 'context': context,
      'timestamp': timestamp.toIso8601String(),
      if (source != null) 'source': source,
      if (stackTrace != null) 'stackTrace': stackTrace,
      if (correlationId != null) 'correlationId': correlationId,
      'sessionId': sessionId,
      if (userId != null) 'userId': userId,
      'sequenceNumber': sequenceNumber,
      'synced': synced,
      'duplicateCount': duplicateCount,
    };
  }

  @override
  String toString() {
    return 'LogEntry(id: $id, level: $level, category: $category, '
        'message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogEntry &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
