import 'dart:async';

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'local_store/sql_store.dart';
import '../models/data_model.dart';

abstract class DataRepository<D extends DataModel, R extends DataModel> {
  FutureOr<List<D>> search(R query);

  FutureOr<dynamic> create(D entity);

  FutureOr<dynamic> update(D entity);
}

abstract class RemoteRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  final Dio dio;

  RemoteRepository(this.dio);

  @override
  FutureOr<void> create(D entity);

  @override
  FutureOr<void> update(D entity);
}

abstract class LocalRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  final LocalSqlDataStore sqlDataStore;
  final Isar isar;

  LocalRepository(this.sqlDataStore, this.isar);

  @override
  FutureOr<int> create(D entity);

  @override
  FutureOr<int> update(D entity);

  FutureOr<int> createOplogEntry(D entity, ApiOperation operation);

  FutureOr<void> deleteOplogEntry(OpLogEntry<D> entry);
}
