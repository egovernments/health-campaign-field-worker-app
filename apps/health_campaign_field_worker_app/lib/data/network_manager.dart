import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';
import 'data_repository.dart';

// TODO(ajil-egov): Needs to be updated to bulk-api

class NetworkManager {
  final List<LocalRepository> localRepositories;
  final List<RemoteRepository> remoteRepositories;

  final NetworkManagerConfiguration configuration;

  const NetworkManager({
    required this.configuration,
    this.localRepositories = const [],
    this.remoteRepositories = const [],
  });

  Future<DataRepository<D, R>> repository<D extends DataModel, R extends DataModel>(BuildContext context) async {
    switch (configuration.persistenceConfig) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
    }
  }

  Future<void> syncUp() async {
    if (configuration.persistenceConfig == PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    final pendingSyncEntries = await Future.wait(localRepositories.map((e) async {
      final items = await e.getItemsToBeSynced();

      return (e.type, items);
    }));

    for (final element in pendingSyncEntries) {
      if (element.$0 == DataModelType.individual) {
        final remote = remoteRepositories.firstWhereOrNull((e) => e.type == DataModelType.individual);
        if (remote == null) break;


        for (final entry in element.$1) {
          if (entry.operation == ApiOperation.create) {
            await remote.create(entry.entity);
          } else if (entry.operation == ApiOperation.update) {
            await remote.update(entry.entity);
          }
        }
      }
    }
  }

  Future<void> syncDown() async {
    if (configuration.persistenceConfig == PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }
  }
}

class NetworkManagerConfiguration {
  final PersistenceConfiguration persistenceConfig;

  const NetworkManagerConfiguration({
    this.persistenceConfig = PersistenceConfiguration.offlineFirst,
  });
}

enum PersistenceConfiguration { offlineFirst, onlineOnly }
