import 'dart:async';
import 'package:health_campaigns_flutter/data/data_repository.dart';

import 'package:health_campaigns_flutter/models/data_model.dart';

abstract class DataManager<D extends DataModel, R extends DataModel> {
  final RemoteRepository<D, R> remoteRepository;
  final LocalRepository<D, R> localRepository;

  const DataManager({
    required this.localRepository,
    required this.remoteRepository,
  });

  DataRepository<D, R> _getRepository(PersistenceConfiguration configuration) {
    switch (configuration) {
      case PersistenceConfiguration.offline:
        return localRepository;
      case PersistenceConfiguration.online:
        return remoteRepository;
    }
  }

  FutureOr<List<D>> search(
    R query, {
    PersistenceConfiguration configuration = PersistenceConfiguration.offline,
  }) =>
      _getRepository(configuration).search(query);

  FutureOr<String> create(
    D entity, {
    PersistenceConfiguration configuration = PersistenceConfiguration.offline,
  }) =>
      _getRepository(configuration).create(entity);

  FutureOr<String> update(
    D entity, {
    PersistenceConfiguration configuration = PersistenceConfiguration.offline,
  }) =>
      _getRepository(configuration).update(entity);
}

enum PersistenceConfiguration { offline, online }
