import 'dart:async';

import 'package:uuid/uuid.dart';

/// Zone-based correlation ID context for tracing related operations.
///
/// Correlation IDs are propagated automatically through async operations
/// within a zone, allowing all logs in an operation to be linked together.
///
/// Usage:
/// ```dart
/// await CorrelationContext.run(CorrelationContext.generate(), () async {
///   DigitLogger.info('Starting operation'); // Has correlationId
///   await doSomething();
///   DigitLogger.info('Operation complete'); // Same correlationId
/// });
/// ```
class CorrelationContext {
  static const Uuid _uuid = Uuid();

  /// Symbol used as zone key for correlation ID.
  static const Symbol _correlationKey = #correlationId;

  CorrelationContext._();

  /// Gets the current correlation ID from the zone.
  ///
  /// Returns null if not within a correlation context.
  /// IMPORTANT: This is a getter (not a field) so it's evaluated on each access.
  static String? get current => Zone.current[_correlationKey] as String?;

  /// Generates a new correlation ID (UUID v4).
  static String generate() => _uuid.v4();

  /// Runs the function within a correlation context.
  ///
  /// All async operations within [fn] will have access to the same
  /// [correlationId] via [current].
  static Future<T> run<T>(
    String correlationId,
    Future<T> Function() fn,
  ) {
    return runZoned(
      fn,
      zoneValues: {_correlationKey: correlationId},
    );
  }

  /// Runs a synchronous function within a correlation context.
  static T runSync<T>(
    String correlationId,
    T Function() fn,
  ) {
    return runZoned(
      fn,
      zoneValues: {_correlationKey: correlationId},
    );
  }

  /// Runs within a new correlation context with auto-generated ID.
  ///
  /// Returns the generated correlation ID along with the result.
  static Future<(String, T)> runNew<T>(Future<T> Function() fn) async {
    final correlationId = generate();
    final result = await run(correlationId, fn);
    return (correlationId, result);
  }

  /// Gets the current correlation ID, generating one if not present.
  ///
  /// Use this when you need a correlation ID but may not be within
  /// a correlation context.
  static String currentOrGenerate() => current ?? generate();
}
