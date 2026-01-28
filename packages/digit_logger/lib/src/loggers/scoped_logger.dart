import '../core/log_category.dart';
import '../core/logger.dart';

/// A logger scoped to a specific operation with shared context.
///
/// All logs from a scoped logger share:
/// - The same correlation ID
/// - Base context merged with per-log context
/// - Optional category override
///
/// Usage:
/// ```dart
/// final scopedLog = DigitLogger.scope(
///   operation: 'transformHousehold',
///   context: {'householdId': 'hh-123'},
/// );
///
/// scopedLog.debug('Starting transformation');
/// scopedLog.trace('Processing member', context: {'memberId': 'm-1'});
/// scopedLog.info('Transformation complete');
/// ```
class ScopedLogger {
  /// Operation name for context.
  final String operation;

  /// Correlation ID shared across all logs.
  final String correlationId;

  /// Base context merged into all logs.
  final Map<String, dynamic> baseContext;

  /// Optional category for all logs.
  final LogCategory? category;

  /// Creates a scoped logger.
  ScopedLogger({
    required this.operation,
    required this.correlationId,
    Map<String, dynamic>? context,
    this.category,
  }) : baseContext = {'operation': operation, ...?context};

  /// Merges base context with additional context.
  Map<String, dynamic> _mergeContext(Map<String, dynamic>? additionalContext) {
    if (additionalContext == null || additionalContext.isEmpty) {
      return baseContext;
    }
    return {...baseContext, ...additionalContext};
  }

  /// Logs a trace message.
  void trace(String message, {Map<String, dynamic>? context}) {
    DigitLogger.traceWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
    );
  }

  /// Logs a debug message.
  void debug(String message, {Map<String, dynamic>? context}) {
    DigitLogger.debugWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
    );
  }

  /// Logs an info message.
  void info(String message, {Map<String, dynamic>? context}) {
    DigitLogger.infoWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
    );
  }

  /// Logs a warning message.
  void warn(String message, {Map<String, dynamic>? context}) {
    DigitLogger.warnWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
    );
  }

  /// Logs an error message.
  void error(
    String message, {
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    DigitLogger.errorWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a fatal message.
  void fatal(
    String message, {
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    DigitLogger.fatalWithCorrelation(
      message,
      correlationId: correlationId,
      category: category,
      context: _mergeContext(context),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
