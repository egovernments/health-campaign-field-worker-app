import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import '../../../utils/environment_config.dart';
import '../../network_manager.dart';
import './remote_type.dart';

class PerformSyncDown {
  static FutureOr<void> syncDown({
    required BandwidthModel bandwidthModel,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required NetworkManagerConfiguration configuration,
  }) async {
    const individualIdentifierIdKey = 'individualIdentifierId';
    const individualAddressIdKey = 'individualAddressId';

    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
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

        List<EntityModel> responseEntities = [];

        switch (typeGroupedEntity.key) {
          case DataModelType.individual:
            responseEntities = await remote.search(IndividualSearchModel(
              clientReferenceId: entities
                  .whereType<IndividualModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as IndividualModel;
              final responseEntity = responseEntities
                  .whereType<IndividualModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                final identifierAdditionalIds = responseEntity?.identifiers
                    ?.map((e) {
                      final id = e.id;

                      if (id == null) return null;

                      return AdditionalId(
                        idType: individualIdentifierIdKey,
                        id: id,
                      );
                    })
                    .whereNotNull()
                    .toList();

                final addressAdditionalIds = responseEntity?.address
                    ?.map((e) {
                      final id = e.id;

                      if (id == null) return null;

                      return AdditionalId(
                        idType: individualAddressIdKey,
                        id: id,
                      );
                    })
                    .whereNotNull()
                    .toList();

                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    nonRecoverableError: entity.nonRecoverableError,
                    additionalIds: [
                      if (identifierAdditionalIds != null)
                        ...identifierAdditionalIds,
                      if (addressAdditionalIds != null) ...addressAdditionalIds,
                    ],
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;

          case DataModelType.complaints:
            if (remote is! PgrServiceRemoteRepository) continue;

            final futures = entities
                .whereType<PgrServiceModel>()
                .map((e) => e.serviceRequestId)
                .whereNotNull()
                .map(
              (e) {
                final future = remote.searchWithoutClientReferenceId(
                  PgrServiceSearchModel(
                    serviceRequestId: e,
                  ),
                );

                return Future.sync(() => future);
              },
            );

            final resolvedFutures = await Future.wait(futures);

            responseEntities = resolvedFutures
                .expand((element) => element)
                .whereType<PgrServiceResponseModel>()
                // We only need serviceRequestId and application status
                .map((e) => PgrServiceModel(
                      clientReferenceId: '',
                      tenantId: e.tenantId ?? '',
                      serviceCode: e.serviceCode ?? '',
                      description: e.description ?? '',
                      serviceRequestId: e.serviceRequestId,
                      applicationStatus: e.applicationStatus ??
                          PgrServiceApplicationStatus.pendingAssignment,
                      user: PgrComplainantModel(
                        clientReferenceId: '',
                        tenantId: '',
                        complaintClientReferenceId: e.serviceRequestId ?? '',
                      ),
                      address: PgrAddressModel(),
                    ))
                .toList();

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as PgrServiceModel;
              final responseEntity = responseEntities
                  .whereType<PgrServiceModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.serviceRequestId;
              final rowVersion = responseEntity?.rowVersion;

              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              }
            }

            break;

          case DataModelType.attendance:
            responseEntities = await remote.search(AttendanceLogSearchModel(
              clientReferenceId: entities
                  .whereType<AttendanceLogModel>()
                  .map((e) => e.clientReferenceId!)
                  .whereNotNull()
                  .toList(),
              tenantId: envConfig.variables.tenantId,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as AttendanceLogModel;
              final responseEntity = responseEntities
                  .whereType<AttendanceLogModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId.toString(),
                    serverGeneratedId: serverGeneratedId,
                    nonRecoverableError: entity.nonRecoverableError,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable =
                    await local.opLogManager.updateSyncDownRetry(
                  entity.clientReferenceId.toString(),
                );

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;

          default:
            continue;
        }

        for (var element in responseEntities) {
          await local.update(element, createOpLog: false);
        }
      }
    }
  }
}
