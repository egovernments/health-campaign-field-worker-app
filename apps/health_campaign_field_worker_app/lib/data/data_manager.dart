import 'dart:async';

import 'package:digit_data_model/data_model.dart';

class DataManager<D extends EntityModel, R extends EntitySearchModel> {
  final RemoteRepository<D, R> remoteRepository;
  final LocalRepository<D, R> localRepository;
  final PersistenceConfiguration configuration;

  const DataManager({
    required this.localRepository,
    required this.remoteRepository,
    required this.configuration,
  });

  DataRepository<D, R> _getRepository(PersistenceConfiguration configuration) {
    switch (configuration) {
      case PersistenceConfiguration.offline:
        return localRepository;
      case PersistenceConfiguration.online:
        return remoteRepository;
    }
  }

  FutureOr<List<D>> search(R query) =>
      _getRepository(configuration).search(query);

  FutureOr<dynamic> create(D entity) =>
      _getRepository(configuration).create(entity);

  FutureOr<dynamic> update(D entity) =>
      _getRepository(configuration).update(entity);
}

enum PersistenceConfiguration { offline, online }
