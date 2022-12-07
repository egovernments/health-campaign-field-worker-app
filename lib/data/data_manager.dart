import 'dart:async';
import 'package:dio/dio.dart';

import 'package:health_campaigns_flutter/models/data_model.dart';

abstract class DataAccessInterface<D extends DataModel, R extends DataModel> {
  FutureOr<List<D>> search(R query);

  String create(D entity);

  String update(D entity);
}

abstract class RemoteDataAccess<D extends DataModel, R extends DataModel>
    extends DataAccessInterface<D, R> {
  final Dio dio;

  RemoteDataAccess(this.dio);
}

abstract class LocalDataAccess<D extends DataModel, R extends DataModel>
    extends DataAccessInterface<D, R> {
  // TODO(ajil): Add local store
}

abstract class DataManager<D extends DataModel, R extends DataModel> {
  final PersistenceConfiguration persistenceConfiguration;

  DataManager({
    this.persistenceConfiguration = PersistenceConfiguration.offline,
  });

  FutureOr<List<D>> search(R query);

  String create(D entity);

  String update(D entity);
}

enum PersistenceConfiguration { offline, online }
