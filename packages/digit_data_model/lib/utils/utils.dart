import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// This function takes an iterable of boolean expressions and builds an AND expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the & operator, and checks if the result equals true.
Expression<bool> buildAnd(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

Expression<bool> buildOr(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value | element);

  return result.equals(true);
}

class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  String get identifier => uuid.v1();
}

// create a singleton class to hold the envConfigVariables

class DigitDataModelSingleton {
  static final DigitDataModelSingleton _digitDataModelSingleton =
      DigitDataModelSingleton._internal();

  factory DigitDataModelSingleton() {
    return _digitDataModelSingleton;
  }

  DigitDataModelSingleton._internal();

  int? _syncDownRetryCount;
  int? _retryTimeInterval;
  String? _tenantId, _errorDumpApiPath;

  void setData(
      {required int syncDownRetryCount,
      required int retryTimeInterval,
      required String tenantId,
      required String errorDumpApiPath}) {
    _syncDownRetryCount = syncDownRetryCount;
    _retryTimeInterval = retryTimeInterval;
    _tenantId = tenantId;
    _errorDumpApiPath = errorDumpApiPath;
  }

  get syncDownRetryCount => _syncDownRetryCount;
  get retryTimeInterval => _retryTimeInterval;
  get tenantId => _tenantId;
  get errorDumpApiPath => _errorDumpApiPath;
}

enum PersistenceConfiguration { offlineFirst, onlineOnly }
