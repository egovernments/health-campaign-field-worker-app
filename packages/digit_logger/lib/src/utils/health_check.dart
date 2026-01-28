/// Health status of the logger.
///
/// Provides insight into logger state for monitoring and debugging.
class LoggerHealth {
  /// Whether the logger is initialized.
  final bool isInitialized;

  /// Whether storage is healthy (no recent errors).
  final bool isStorageHealthy;

  /// Whether sync is healthy (no recent failures).
  final bool isSyncHealthy;

  /// Number of logs in the pre-init buffer.
  final int bufferedLogCount;

  /// Number of logs pending sync to remote.
  final int pendingSyncCount;

  /// Timestamp of last successful sync.
  final DateTime? lastSuccessfulSync;

  /// Last error message if any.
  final String? lastError;

  /// Current session ID.
  final String? sessionId;

  /// Total logs written this session.
  final int totalLogsWritten;

  const LoggerHealth({
    required this.isInitialized,
    required this.isStorageHealthy,
    required this.isSyncHealthy,
    required this.bufferedLogCount,
    required this.pendingSyncCount,
    this.lastSuccessfulSync,
    this.lastError,
    this.sessionId,
    required this.totalLogsWritten,
  });

  /// Creates a healthy status.
  factory LoggerHealth.healthy({
    required String sessionId,
    required int totalLogsWritten,
  }) {
    return LoggerHealth(
      isInitialized: true,
      isStorageHealthy: true,
      isSyncHealthy: true,
      bufferedLogCount: 0,
      pendingSyncCount: 0,
      sessionId: sessionId,
      totalLogsWritten: totalLogsWritten,
    );
  }

  /// Creates an uninitialized status.
  factory LoggerHealth.uninitialized({int bufferedLogCount = 0}) {
    return LoggerHealth(
      isInitialized: false,
      isStorageHealthy: false,
      isSyncHealthy: false,
      bufferedLogCount: bufferedLogCount,
      pendingSyncCount: 0,
      totalLogsWritten: 0,
    );
  }

  /// Whether the logger is overall healthy.
  bool get isHealthy => isInitialized && isStorageHealthy;

  /// Converts to a map for logging/debugging.
  Map<String, dynamic> toJson() {
    return {
      'isInitialized': isInitialized,
      'isStorageHealthy': isStorageHealthy,
      'isSyncHealthy': isSyncHealthy,
      'bufferedLogCount': bufferedLogCount,
      'pendingSyncCount': pendingSyncCount,
      if (lastSuccessfulSync != null)
        'lastSuccessfulSync': lastSuccessfulSync!.toIso8601String(),
      if (lastError != null) 'lastError': lastError,
      if (sessionId != null) 'sessionId': sessionId,
      'totalLogsWritten': totalLogsWritten,
    };
  }

  @override
  String toString() {
    return 'LoggerHealth(initialized: $isInitialized, '
        'storageHealthy: $isStorageHealthy, '
        'logs: $totalLogsWritten)';
  }
}
