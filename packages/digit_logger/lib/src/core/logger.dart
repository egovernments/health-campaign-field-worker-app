import 'dart:async';

import 'package:flutter/foundation.dart';

import '../correlation/correlation_context.dart';
import '../loggers/category_logger.dart';
import '../loggers/scoped_logger.dart';
import '../sanitization/log_sanitizer.dart';
import '../session/session_manager.dart';
import '../utils/health_check.dart';
import '../utils/pre_init_buffer.dart';
import 'log_category.dart';
import 'log_config.dart';
import 'log_entry.dart';
import 'log_level.dart';

/// Main logger class for the digit_logger package.
///
/// DigitLogger is a singleton that provides:
/// - Multiple log levels (trace, debug, info, warn, error, fatal)
/// - Category-based filtering
/// - Automatic PII sanitization
/// - Zone-based correlation ID propagation
/// - Pre-init buffering (logs before init() are not lost)
/// - Compile-time stripping of trace/debug in release builds
///
/// ## Quick Start
///
/// ```dart
/// // Initialize at app start
/// await DigitLogger.init(config: LogConfig.development());
///
/// // Log messages
/// DigitLogger.info('App started');
/// DigitLogger.debug('User logged in', context: {'userId': '123'});
/// DigitLogger.error('Failed to load data', error: e, stackTrace: stack);
///
/// // Dispose on app shutdown
/// await DigitLogger.dispose();
/// ```
///
/// ## Error Capture
///
/// ```dart
/// // Wrap app with zone-based error capture
/// DigitLogger.runGuarded(() async {
///   await DigitLogger.init(config: LogConfig.development());
///   runApp(MyApp());
/// });
///
/// // Or capture Flutter framework errors
/// DigitLogger.captureFlutterErrors();
/// ```
class DigitLogger {
  static DigitLogger? _instance;
  static final PreInitBuffer _preInitBuffer = PreInitBuffer();
  static int _sequenceNumber = 0;

  final LogConfig _config;
  final LogSanitizer _sanitizer;
  int _totalLogsWritten = 0;
  String? _lastError;
  bool _disposed = false;

  DigitLogger._(this._config) : _sanitizer = LogSanitizer(_config.sanitization);

  // ============================================================
  // Initialization
  // ============================================================

  /// Initializes the logger with the given configuration.
  ///
  /// Must be called before logging (though pre-init logs are buffered).
  /// Typically called early in main().
  static Future<void> init({required LogConfig config}) async {
    if (_instance != null) {
      throw StateError('DigitLogger already initialized. Call dispose() first.');
    }

    _instance = DigitLogger._(config);

    // Start session
    SessionManager.startSession();

    // Initialize targets
    for (final target in config.targets) {
      await target.init();
    }

    // Initialize storage
    if (config.enableStorage && config.storage != null) {
      await config.storage!.init();
    }

    // Flush pre-init buffer
    final pendingLogs = _preInitBuffer.flush();
    for (final pending in pendingLogs) {
      _instance!._writeLog(
        level: pending.level,
        message: pending.message,
        category: pending.category,
        context: pending.context,
        error: pending.error,
        stackTrace: pending.stackTrace,
        correlationId: pending.correlationId,
        timestamp: pending.timestamp,
      );
    }
  }

  /// Whether the logger is initialized.
  static bool get isInitialized => _instance != null;

  /// Gets the singleton instance (for DI scenarios).
  ///
  /// Throws if not initialized.
  static DigitLogger get instance {
    if (_instance == null) {
      throw StateError('DigitLogger not initialized. Call init() first.');
    }
    return _instance!;
  }

  /// Disposes the logger and releases resources.
  static Future<void> dispose() async {
    if (_instance == null) return;

    _instance!._disposed = true;

    // Dispose targets
    for (final target in _instance!._config.targets) {
      await target.dispose();
    }

    // Dispose storage
    if (_instance!._config.storage != null) {
      await _instance!._config.storage!.dispose();
    }

    _instance = null;
  }

  /// Resets the logger for testing.
  @visibleForTesting
  static void reset() {
    _instance = null;
    _preInitBuffer.clear();
    _sequenceNumber = 0;
    SessionManager.reset();
  }

  // ============================================================
  // Error Capture Helpers
  // ============================================================

  /// Runs code in a guarded zone that captures all uncaught errors.
  ///
  /// Wrap your entire app with this to catch async errors:
  /// ```dart
  /// DigitLogger.runGuarded(() async {
  ///   await DigitLogger.init(config: LogConfig.development());
  ///   runApp(MyApp());
  /// });
  /// ```
  static R runGuarded<R>(R Function() body) {
    return runZonedGuarded(
      body,
      (error, stackTrace) {
        DigitLogger.fatal(
          'Uncaught error',
          error: error,
          stackTrace: stackTrace,
          category: LogCategory.lifecycle,
        );
      },
    ) as R;
  }

  /// Captures Flutter framework errors.
  ///
  /// Call once after init():
  /// ```dart
  /// await DigitLogger.init(...);
  /// DigitLogger.captureFlutterErrors();
  /// ```
  static void captureFlutterErrors() {
    FlutterError.onError = (details) {
      DigitLogger.error(
        'Flutter error: ${details.exceptionAsString()}',
        error: details.exception,
        stackTrace: details.stack,
        category: LogCategory.lifecycle,
        context: {
          'library': details.library,
          if (details.context != null) 'context': details.context.toString(),
        },
      );
    };
  }

  // ============================================================
  // Static Logging Methods
  // ============================================================

  /// Logs a trace message (stripped in release builds).
  static void trace(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    // Compile-time stripped in release mode
    if (kReleaseMode) return;
    _logOrBuffer(
      LogLevel.trace,
      message,
      category: category ?? LogCategory.general,
      context: context,
    );
  }

  /// Logs a debug message (stripped in release builds).
  static void debug(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    // Compile-time stripped in release mode
    if (kReleaseMode) return;
    _logOrBuffer(
      LogLevel.debug,
      message,
      category: category ?? LogCategory.general,
      context: context,
    );
  }

  /// Logs an info message.
  static void info(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    _logOrBuffer(
      LogLevel.info,
      message,
      category: category ?? LogCategory.general,
      context: context,
    );
  }

  /// Logs a warning message.
  static void warn(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    _logOrBuffer(
      LogLevel.warn,
      message,
      category: category ?? LogCategory.general,
      context: context,
    );
  }

  /// Logs an error message.
  static void error(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logOrBuffer(
      LogLevel.error,
      message,
      category: category ?? LogCategory.general,
      context: context,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a fatal message.
  static void fatal(
    String message, {
    LogCategory? category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logOrBuffer(
      LogLevel.fatal,
      message,
      category: category ?? LogCategory.general,
      context: context,
      error: error,
      stackTrace: stackTrace,
    );
  }

  // ============================================================
  // Correlation ID Methods (for ScopedLogger)
  // ============================================================

  /// Logs a trace message with explicit correlation ID.
  static void traceWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    if (kReleaseMode) return;
    _logOrBuffer(
      LogLevel.trace,
      message,
      category: category ?? LogCategory.general,
      context: context,
      correlationId: correlationId,
    );
  }

  /// Logs a debug message with explicit correlation ID.
  static void debugWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    if (kReleaseMode) return;
    _logOrBuffer(
      LogLevel.debug,
      message,
      category: category ?? LogCategory.general,
      context: context,
      correlationId: correlationId,
    );
  }

  /// Logs an info message with explicit correlation ID.
  static void infoWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    _logOrBuffer(
      LogLevel.info,
      message,
      category: category ?? LogCategory.general,
      context: context,
      correlationId: correlationId,
    );
  }

  /// Logs a warning message with explicit correlation ID.
  static void warnWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
  }) {
    _logOrBuffer(
      LogLevel.warn,
      message,
      category: category ?? LogCategory.general,
      context: context,
      correlationId: correlationId,
    );
  }

  /// Logs an error message with explicit correlation ID.
  static void errorWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logOrBuffer(
      LogLevel.error,
      message,
      category: category ?? LogCategory.general,
      context: context,
      error: error,
      stackTrace: stackTrace,
      correlationId: correlationId,
    );
  }

  /// Logs a fatal message with explicit correlation ID.
  static void fatalWithCorrelation(
    String message, {
    required String correlationId,
    LogCategory? category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logOrBuffer(
      LogLevel.fatal,
      message,
      category: category ?? LogCategory.general,
      context: context,
      error: error,
      stackTrace: stackTrace,
      correlationId: correlationId,
    );
  }

  // ============================================================
  // Category-Scoped Loggers
  // ============================================================

  /// Logger for schema-related logs.
  static CategoryLogger get schema => const CategoryLogger(LogCategory.schema);

  /// Logger for form-related logs.
  static CategoryLogger get form => const CategoryLogger(LogCategory.form);

  /// Logger for transform-related logs.
  static CategoryLogger get transform =>
      const CategoryLogger(LogCategory.transform);

  /// Logger for condition-related logs.
  static CategoryLogger get condition =>
      const CategoryLogger(LogCategory.condition);

  /// Logger for state-related logs.
  static CategoryLogger get state => const CategoryLogger(LogCategory.state);

  /// Logger for navigation-related logs.
  static CategoryLogger get navigation =>
      const CategoryLogger(LogCategory.navigation);

  /// Logger for network-related logs.
  static CategoryLogger get network =>
      const CategoryLogger(LogCategory.network);

  /// Logger for sync-related logs.
  static CategoryLogger get sync => const CategoryLogger(LogCategory.sync);

  /// Logger for storage-related logs.
  static CategoryLogger get storage =>
      const CategoryLogger(LogCategory.storage);

  /// Logger for lifecycle-related logs.
  static CategoryLogger get lifecycle =>
      const CategoryLogger(LogCategory.lifecycle);

  /// Logger for general logs.
  static CategoryLogger get general =>
      const CategoryLogger(LogCategory.general);

  // ============================================================
  // Scoped Logger
  // ============================================================

  /// Creates a scoped logger for an operation.
  ///
  /// All logs from the scoped logger share the same correlation ID
  /// and base context:
  ///
  /// ```dart
  /// final scopedLog = DigitLogger.scope(
  ///   operation: 'transformHousehold',
  ///   context: {'householdId': 'hh-123'},
  /// );
  ///
  /// scopedLog.debug('Starting');
  /// scopedLog.info('Complete');
  /// ```
  static ScopedLogger scope({
    required String operation,
    String? correlationId,
    Map<String, dynamic>? context,
    LogCategory? category,
  }) {
    return ScopedLogger(
      operation: operation,
      correlationId:
          correlationId ?? CorrelationContext.current ?? CorrelationContext.generate(),
      context: context,
      category: category,
    );
  }

  // ============================================================
  // Health Check
  // ============================================================

  /// Returns the current health status of the logger.
  static Future<LoggerHealth> healthCheck() async {
    if (_instance == null) {
      return LoggerHealth.uninitialized(
        bufferedLogCount: _preInitBuffer.length,
      );
    }

    return LoggerHealth(
      isInitialized: true,
      isStorageHealthy: _instance!._lastError == null,
      isSyncHealthy: true,
      bufferedLogCount: 0,
      pendingSyncCount: 0,
      sessionId: SessionManager.current,
      totalLogsWritten: _instance!._totalLogsWritten,
      lastError: _instance!._lastError,
    );
  }

  // ============================================================
  // Internal Methods
  // ============================================================

  /// Logs or buffers if not initialized.
  static void _logOrBuffer(
    LogLevel level,
    String message, {
    required LogCategory category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
    String? correlationId,
  }) {
    if (_instance != null && !_instance!._disposed) {
      _instance!._writeLog(
        level: level,
        message: message,
        category: category,
        context: context,
        error: error,
        stackTrace: stackTrace,
        correlationId: correlationId,
      );
    } else {
      // Buffer for later
      final added = _preInitBuffer.add(
        PendingLog(
          level: level,
          message: message,
          category: category,
          context: context,
          error: error,
          stackTrace: stackTrace,
          timestamp: DateTime.now().toUtc(),
          correlationId: correlationId ?? CorrelationContext.current,
        ),
      );
      if (!added) {
        // Buffer full - log to console as fallback
        debugPrint('[DIGIT_LOGGER_OVERFLOW] $level: $message');
      }
    }
  }

  /// Writes a log entry to all targets.
  void _writeLog({
    required LogLevel level,
    required String message,
    required LogCategory category,
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
    String? correlationId,
    DateTime? timestamp,
  }) {
    // Check if enabled and level threshold
    if (!_config.enabled) return;
    if (!level.shouldLog(_config.minLevel)) return;

    // Sanitize message and context
    final sanitizedMessage = _sanitizer.sanitizeMessage(message);
    final sanitizedContext = _sanitizer.sanitizeContext(context);
    final validatedContext = _sanitizer.validateContextSize(sanitizedContext);

    // Create entry
    final entry = LogEntry(
      level: level,
      category: category,
      message: sanitizedMessage,
      context: validatedContext,
      stackTrace: stackTrace,
      correlationId: correlationId ?? CorrelationContext.current,
      sessionId: SessionManager.current,
      userId: _sanitizer.sanitizeUserId(_config.userId),
      sequenceNumber: _sequenceNumber++,
      error: error,
    );

    // Write to all targets
    for (final target in _config.targets) {
      try {
        target.write(entry);
      } catch (e) {
        _lastError = 'Target write failed: $e';
        debugPrint('[DIGIT_LOGGER_ERROR] $e');
      }
    }

    // Write to storage if enabled
    if (_config.enableStorage && _config.storage != null) {
      try {
        _config.storage!.write(entry);
      } catch (e) {
        _lastError = 'Storage write failed: $e';
        debugPrint('[DIGIT_LOGGER_ERROR] Storage: $e');
      }
    }

    _totalLogsWritten++;
  }
}
