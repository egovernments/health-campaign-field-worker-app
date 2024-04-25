import 'package:drift/drift.dart';

/// This function takes an iterable of boolean expressions and builds an AND expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the & operator, and checks if the result equals true.
Expression<bool> buildAnd(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
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
