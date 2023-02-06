import 'dart:async';

import 'package:isar/isar.dart';

import '../../../models/data_model.dart';

part 'no_sql_store.g.dart';

/// Exposes an instance of [isar] object that can be used to access the system's
/// NoSQL data store
///
/// The [initialize] method needs to be called before attempting to access
/// [isar] object. An exception will be thrown otherwise
class NoSqlStore {
  static NoSqlStore get instance => _instance;
  static final NoSqlStore _instance = NoSqlStore._();

  Isar? _isar;

  NoSqlStore._();

  Isar get isar {
    final isar = _isar;
    if (isar == null) {
      throw StoreNotInitializedException();
    }

    return isar;
  }

  FutureOr<void> initialize() async {
    final isar = await Isar.open([OpLogSchema]);
    _isar = isar;
  }
}

@Collection()
class OpLog<T extends EntityModel> {
  Id id = Isar.autoIncrement;
  late String entityString;

  @ignore
  T get entity => Mapper.fromJson<T>(entityString);
  set entity(T entity) {
    entityString = entity.toJson();
  }

  @Enumerated(EnumType.name)
  late DataModelType entityType;

  @Enumerated(EnumType.name)
  late DataOperation operation;

  late DateTime createdOn;

  DateTime? syncedOn;

  late bool isSynced;
}

class StoreNotInitializedException implements Exception {}
