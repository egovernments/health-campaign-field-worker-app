// Importing necessary packages.
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../data/local_store/no_sql/schema/entity_mapper_listener.dart';

/// This function takes an iterable of boolean expressions and builds an AND expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the & operator, and checks if the result equals true.
Expression<bool> buildAnd(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

/// This function takes an iterable of boolean expressions and builds an OR expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the | operator, and checks if the result equals true.
Expression<bool> buildOr(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value | element);

  return result.equals(true);
}

/// `IdGen` is a singleton class that generates unique identifiers.
/// It uses the `Uuid` package to generate version 1 UUIDs.
class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a version 1 UUID and returns it as a string.
  String get identifier => uuid.v1();
}

/// `DigitDataModelSingleton` is a singleton class that holds environment configuration variables.
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
  EntityMapperListener? _entityListener;

  /// Sets the environment configuration variables.
  void setData(
      {required int syncDownRetryCount,
      required int retryTimeInterval,
      required String tenantId,
      required EntityMapperListener entityMapper,
      required String errorDumpApiPath}) {
    _syncDownRetryCount = syncDownRetryCount;
    _retryTimeInterval = retryTimeInterval;
    _entityListener = entityMapper;
    _tenantId = tenantId;
    _errorDumpApiPath = errorDumpApiPath;
  }

  // Getters for the environment configuration variables.
  get syncDownRetryCount => _syncDownRetryCount;
  get retryTimeInterval => _retryTimeInterval;
  get tenantId => _tenantId;
  get errorDumpApiPath => _errorDumpApiPath;
  EntityMapperListener? get entityMapper => _entityListener;
}

/// `PersistenceConfiguration` is an enum that represents the different types of persistence configurations.
enum PersistenceConfiguration { offlineFirst, onlineOnly }