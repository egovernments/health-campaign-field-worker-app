import 'package:digit_logger/digit_logger.dart';
import 'package:drift/drift.dart';

/// A Drift QueryInterceptor that routes SQL query logs through DigitLogger.
///
/// This interceptor captures all SQL statements executed by Drift and logs them
/// using DigitLogger at the trace level, allowing them to be filtered and
/// controlled via the app's logging configuration.
class DigitQueryInterceptor extends QueryInterceptor {
  /// Creates a new DigitQueryInterceptor.
  ///
  /// [enabled] controls whether logging is active. Defaults to true.
  /// [logResults] controls whether query results are logged. Defaults to false.
  final bool enabled;
  final bool logResults;

  const DigitQueryInterceptor({
    this.enabled = true,
    this.logResults = false,
  });

  @override
  TransactionExecutor beginTransaction(QueryExecutor parent) {
    if (enabled) {
      DigitLogger.trace(
        'BEGIN TRANSACTION',
        category: LogCategory.storage,
      );
    }
    return super.beginTransaction(parent);
  }

  @override
  Future<void> commitTransaction(TransactionExecutor inner) async {
    if (enabled) {
      DigitLogger.trace(
        'COMMIT TRANSACTION',
        category: LogCategory.storage,
      );
    }
    return super.commitTransaction(inner);
  }

  @override
  Future<void> rollbackTransaction(TransactionExecutor inner) async {
    if (enabled) {
      DigitLogger.trace(
        'ROLLBACK TRANSACTION',
        category: LogCategory.storage,
      );
    }
    return super.rollbackTransaction(inner);
  }

  @override
  Future<int> runInsert(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final stopwatch = Stopwatch()..start();
    final result = await super.runInsert(executor, statement, args);
    stopwatch.stop();

    if (enabled) {
      _logQuery('INSERT', statement, args, stopwatch.elapsedMilliseconds);
      if (logResults) {
        DigitLogger.trace(
          'Result: $result rows affected',
          category: LogCategory.storage,
        );
      }
    }
    return result;
  }

  @override
  Future<int> runUpdate(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final stopwatch = Stopwatch()..start();
    final result = await super.runUpdate(executor, statement, args);
    stopwatch.stop();

    if (enabled) {
      _logQuery('UPDATE', statement, args, stopwatch.elapsedMilliseconds);
      if (logResults) {
        DigitLogger.trace(
          'Result: $result rows affected',
          category: LogCategory.storage,
        );
      }
    }
    return result;
  }

  @override
  Future<int> runDelete(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final stopwatch = Stopwatch()..start();
    final result = await super.runDelete(executor, statement, args);
    stopwatch.stop();

    if (enabled) {
      _logQuery('DELETE', statement, args, stopwatch.elapsedMilliseconds);
      if (logResults) {
        DigitLogger.trace(
          'Result: $result rows affected',
          category: LogCategory.storage,
        );
      }
    }
    return result;
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final stopwatch = Stopwatch()..start();
    final result = await super.runSelect(executor, statement, args);
    stopwatch.stop();

    if (enabled) {
      _logQuery('SELECT', statement, args, stopwatch.elapsedMilliseconds);
      if (logResults) {
        DigitLogger.trace(
          'Result: ${result.length} rows returned',
          category: LogCategory.storage,
        );
      }
    }
    return result;
  }

  @override
  Future<void> runCustom(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final stopwatch = Stopwatch()..start();
    await super.runCustom(executor, statement, args);
    stopwatch.stop();

    if (enabled) {
      _logQuery('CUSTOM', statement, args, stopwatch.elapsedMilliseconds);
    }
  }

  @override
  Future<void> runBatched(
    QueryExecutor executor,
    BatchedStatements statements,
  ) async {
    final stopwatch = Stopwatch()..start();
    await super.runBatched(executor, statements);
    stopwatch.stop();

    if (enabled) {
      DigitLogger.trace(
        'BATCH: ${statements.statements.length} statements executed in ${stopwatch.elapsedMilliseconds}ms',
        category: LogCategory.storage,
      );
    }
  }

  void _logQuery(
    String operation,
    String statement,
    List<Object?> args,
    int elapsedMs,
  ) {
    final argsStr = args.isNotEmpty ? ' args: $args' : '';
    DigitLogger.trace(
      '[$operation] $statement$argsStr (${elapsedMs}ms)',
      category: LogCategory.storage,
    );
  }
}
