import '../core/log_category.dart';
import '../core/logger.dart';

/// Extension for automatic error logging on Futures.
///
/// Wraps any Future with error logging without requiring try-catch at the
/// call site:
///
/// ```dart
/// // Instead of:
/// try {
///   await api.getHouseholds();
/// } catch (e, stack) {
///   DigitLogger.error('Failed to fetch households', error: e, stackTrace: stack);
///   rethrow;
/// }
///
/// // Just add .logged():
/// await api.getHouseholds().logged('fetch households');
/// ```
///
/// Errors are automatically logged and then rethrown.
extension LoggedFuture<T> on Future<T> {
  /// Wraps this Future with automatic error logging.
  ///
  /// If the Future fails, logs the error with:
  /// - Error level
  /// - Operation name in message
  /// - Original error and stack trace
  /// - Optional category and context
  ///
  /// The error is then rethrown so normal error handling continues.
  ///
  /// [operation] - Human-readable description of the operation
  /// [category] - Log category (defaults to general)
  /// [context] - Additional context to include in log
  Future<T> logged(
    String operation, {
    LogCategory? category,
    Map<String, dynamic>? context,
  }) async {
    try {
      return await this;
    } catch (e, stack) {
      DigitLogger.error(
        'Failed: $operation',
        error: e,
        stackTrace: stack,
        category: category ?? LogCategory.general,
        context: context,
      );
      rethrow;
    }
  }

  /// Wraps this Future with automatic error logging for network operations.
  ///
  /// Shorthand for `.logged()` with network category.
  Future<T> loggedNetwork(String operation) =>
      logged(operation, category: LogCategory.network);

  /// Wraps this Future with automatic error logging for storage operations.
  ///
  /// Shorthand for `.logged()` with storage category.
  Future<T> loggedStorage(String operation) =>
      logged(operation, category: LogCategory.storage);

  /// Wraps this Future with automatic error logging for sync operations.
  ///
  /// Shorthand for `.logged()` with sync category.
  Future<T> loggedSync(String operation) =>
      logged(operation, category: LogCategory.sync);
}
