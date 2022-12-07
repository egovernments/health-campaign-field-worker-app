import 'dart:async';

import 'package:dio/dio.dart';
import 'package:health_campaigns_flutter/models/data_model.dart';

abstract class DataRepository<D extends DataModel, R extends DataModel> {
  FutureOr<List<D>> search(R query);

  String create(D entity);

  String update(D entity);
}

abstract class RemoteRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  final Dio dio;

  RemoteRepository(this.dio);
}

abstract class LocalRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  // TODO(ajil): Add local store
}
