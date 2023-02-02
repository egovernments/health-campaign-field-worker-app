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

  Future<DataRepository<D, R>>
      repository<D extends DataModel, R extends DataModel>(
    BuildContext context,
  ) async {
    switch (configuration.persistenceConfig) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
    }
  }

  Future<void> syncUp() async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    final futures = await Future.wait(
      localRepositories.map((e) => e.getItemsToBeSynced()),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));

    for (final element in pendingSyncEntries) {
      final remote = _getRemoteForType(element.type);

      if (element.operation == ApiOperation.create) {
        await remote.create(element.entity);
      } else if (element.operation == ApiOperation.create) {
        await remote.update(element.entity);
      }

      final local = _getLocalForType(element.type);
      await local.markSynced(element.copyWith(isSynced: true));
    }
  }

  Future<void> syncDown() async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    // TODO(naveen): Complete implementation for sync down operation
  }

  RemoteRepository _getRemoteForType(DataModelType type) {
    final repository = remoteRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Remote repository is not configured in the network manager',
      );
    }

    return repository;
  }

  LocalRepository _getLocalForType(DataModelType type) {
    final repository = localRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Remote repository is not configured in the network manager',
      );
    }

    return repository;
  }
}

class NetworkManagerConfiguration {
  final PersistenceConfiguration persistenceConfig;

  const NetworkManagerConfiguration({
    this.persistenceConfig = PersistenceConfiguration.offlineFirst,
  });
}

enum PersistenceConfiguration { offlineFirst, onlineOnly }
