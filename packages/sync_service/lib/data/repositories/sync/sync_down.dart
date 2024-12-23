import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:sync_service/utils/utils.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import 'remote_type.dart';

/// The `PerformSyncDown` class provides a method to perform a sync down operation.
class PerformSyncDown {
  /// Performs a sync down operation.
  ///
  /// This method accepts a `BandwidthModel`, a list of `LocalRepository` objects, a list of `RemoteRepository` objects, and a `PersistenceConfiguration` as parameters.
  /// It throws an exception if the persistence configuration is `onlineOnly`.
  /// It gets the items to be synced down from each local repository and groups them by type and operation.
  /// It then gets the remote and local repositories for each type and applies the server generated ID to each entity.
  /// Finally, it updates each entity in the local repository.
  static FutureOr<void> syncDown({
    required BandwidthModel bandwidthModel,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required PersistenceConfiguration configuration,
  }) async {
    if (configuration == PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync down is not valid for online only configuration');
    }
    final futures = await Future.wait(
      localRepositories
          .map((e) => e.getItemsToBeSyncedDown(bandwidthModel.userId)),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final groupedEntries = pendingSyncEntries
        .where((element) => element.type != DataModelType.service)
        .toList()
        .groupListsBy(
          (element) => element.type,
        );

    for (final typeGroupedEntity in groupedEntries.entries) {
      final groupedOperations = typeGroupedEntity.value.groupListsBy(
        (element) => element.operation,
      );

      final remote = RepositoryType.getRemoteForType(
        typeGroupedEntity.key,
        remoteRepositories,
      );

      final local = RepositoryType.getLocalForType(
        typeGroupedEntity.key,
        localRepositories,
      );

      for (final operationGroupedEntity in groupedOperations.entries) {
        final entities = operationGroupedEntity.value.map((e) {
          final serverGeneratedId = e.serverGeneratedId;
          final rowVersion = e.rowVersion;
          if (serverGeneratedId != null && !e.nonRecoverableError) {
            return local.opLogManager.applyServerGeneratedIdToEntity(
              e.entity,
              serverGeneratedId,
              rowVersion,
            );
          }

          return e.entity;
        }).toList();

        List<EntityModel>? responseEntities = [];

        responseEntities = await SyncServiceSingleton()
            .entityMapper
            ?.syncDownEntityResponse(typeGroupedEntity, operationGroupedEntity,
                entities, remote, local);

        for (var element in responseEntities!) {
          await local.update(element, createOpLog: false);
        }
      }
    }
  }
}
