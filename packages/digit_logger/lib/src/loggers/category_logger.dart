import '../core/log_category.dart';
import '../core/logger.dart';

/// A logger pre-scoped to a specific category.
///
/// Simplifies logging when all logs in a class/module share the same category:
///
/// ```dart
/// final _log = DigitLogger.schema; // CategoryLogger for schema
///
/// void parseSchema(Map<String, dynamic> json) {
///   _log.debug('Parsing schema'); // Automatically uses schema category
///   // ...
///   _log.info('Schema parsed successfully');
/// }
/// ```
class CategoryLogger {
  /// The category for all logs from this logger.
  final LogCategory category;

  /// Creates a category-scoped logger.
  const CategoryLogger(this.category);

  /// Logs a trace message.
  void trace(String message, {Map<String, dynamic>? context}) {
    DigitLogger.trace(message, category: category, context: context);
  }

  /// Logs a debug message.
  void debug(String message, {Map<String, dynamic>? context}) {
    DigitLogger.debug(message, category: category, context: context);
  }

  /// Logs an info message.
  void info(String message, {Map<String, dynamic>? context}) {
    DigitLogger.info(message, category: category, context: context);
  }

  /// Logs a warning message.
  void warn(String message, {Map<String, dynamic>? context}) {
    DigitLogger.warn(message, category: category, context: context);
  }

  /// Logs an error message.
  void error(
    String message, {
    Map<String, dynamic>? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    DigitLogger.error(
      message,
      category: category,
      context: context,
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
    DigitLogger.fatal(
      message,
      category: category,
      context: context,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
