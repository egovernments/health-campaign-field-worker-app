import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data/repositories/oplog/oplog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/oplog/oplog_entry.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import '../../../models/entities/hcm_hf_referral.dart';
import '../../../utils/environment_config.dart';
import '../../network_manager.dart';
import '../oplog/hcm_oplog.dart';
import '../remote/pgr_service.dart';
import './remote_type.dart';

class PerformSyncDown {
  static FutureOr<void> syncDown({
    required BandwidthModel bandwidthModel,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required NetworkManagerConfiguration configuration,
  }) async {
    const taskResourceIdKey = 'taskResourceId';
    const individualIdentifierIdKey = 'individualIdentifierId';
    const householdAddressIdKey = 'householdAddressId';
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
          case DataModelType.household:
            responseEntities = await remote.search(HouseholdSearchModel(
              clientReferenceId: entities
                  .whereType<HouseholdModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HouseholdModel;
              final responseEntity =
                  responseEntities.whereType<HouseholdModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                final addressAdditionalId = responseEntity?.address?.id == null
                    ? null
                    : AdditionalId(
                        idType: householdAddressIdKey,
                        id: responseEntity!.address!.id!,
                      );

                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: [
                      if (addressAdditionalId != null) addressAdditionalId,
                    ],
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                    nonRecoverableError: element.nonRecoverableError,
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

          case DataModelType.householdMember:
            responseEntities = await remote.search(HouseholdMemberSearchModel(
              clientReferenceId: entities
                  .whereType<HouseholdMemberModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HouseholdMemberModel;
              final responseEntity = responseEntities
                  .whereType<HouseholdMemberModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );
              final serverGeneratedId = responseEntity?.id;
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

          case DataModelType.sideEffect:
            responseEntities = await remote.search(SideEffectSearchModel(
              clientReferenceId: entities
                  .whereType<SideEffectModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as SideEffectModel;
              var responseEntity = responseEntities
                  .whereType<SideEffectModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
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

          case DataModelType.referral:
            responseEntities = await remote.search(ReferralSearchModel(
              clientReferenceId: entities
                  .whereType<ReferralModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as ReferralModel;
              var responseEntity =
                  responseEntities.whereType<ReferralModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
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

          case DataModelType.projectBeneficiary:
            responseEntities =
                await remote.search(ProjectBeneficiarySearchModel(
              clientReferenceId: entities
                  .whereType<ProjectBeneficiaryModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as ProjectBeneficiaryModel;
              final responseEntity = responseEntities
                  .whereType<ProjectBeneficiaryModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );
              final serverGeneratedId = responseEntity?.id;
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
          case DataModelType.task:
            responseEntities = await remote.search(TaskSearchModel(
              clientReferenceId: entities
                  .whereType<TaskModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final taskModel = element.entity as TaskModel;
              var responseEntity =
                  responseEntities.whereType<TaskModel>().firstWhereOrNull(
                        (e) =>
                            e.clientReferenceId == taskModel.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;

              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: taskModel.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: responseEntity?.resources
                        ?.map((e) {
                          final id = e.id;
                          if (id == null) return null;

                          return AdditionalId(
                            idType: taskResourceIdKey,
                            id: id,
                          );
                        })
                        .whereNotNull()
                        .toList(),
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(taskModel.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    taskModel.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;
          case DataModelType.hFReferral:
            responseEntities = await remote.search(
              HcmHFReferralSearchModel(
                hFReferral: HFReferralSearchModel(
                  clientReferenceId: entities
                      .whereType<HcmHFReferralModel>()
                      .map((e) => e.hFReferral?.clientReferenceId)
                      .whereNotNull()
                      .toList(),
                ),
              ),
            );

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HcmHFReferralModel;
              final responseEntity = responseEntities
                  .whereType<HcmHFReferralModel>()
                  .firstWhereOrNull(
                    (e) =>
                        e.hFReferral?.clientReferenceId ==
                        entity.hFReferral?.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.hFReferral?.id;
              final rowVersion = responseEntity?.hFReferral?.rowVersion;
              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.hFReferral!.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    nonRecoverableError: entity.hFReferral?.nonRecoverableError,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.hFReferral!.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                        hFReferral: entity.hFReferral?.copyWith(
                      nonRecoverableError: true,
                    )),
                    createOpLog: false,
                  );
                }
              }
            }

            break;

          case DataModelType.attendance:
          // responseEntities = await remote.search(HCMAttendanceLogSearchModel(
          //   clientReferenceId: entities
          //       .whereType<HCMAttendanceLogModel>()
          //       .map((e) => e.attendance?.clientReferenceId!)
          //       .whereNotNull()
          //       .toList(),
          //   isDeleted: true,
          //   tenantId: envConfig.variables.tenantId,
          // ));
          //
          // for (var element in operationGroupedEntity.value) {
          //   if (element.id == null) return;
          //   final entity = element.entity as HCMAttendanceLogModel;
          //   final responseEntity = responseEntities
          //       .whereType<HCMAttendanceLogModel>()
          //       .firstWhereOrNull(
          //         (e) =>
          //             e.attendance?.clientReferenceId ==
          //             entity.attendance?.clientReferenceId,
          //       );
          //
          //   final serverGeneratedId = responseEntity?.attendance?.id;
          //   final rowVersion = responseEntity?.rowVersion;
          //   if (serverGeneratedId != null) {
          //     await local.opLogManager.updateServerGeneratedIds(
          //       model: UpdateServerGeneratedIdModel(
          //         clientReferenceId:
          //             entity.attendance!.clientReferenceId.toString(),
          //         serverGeneratedId: serverGeneratedId,
          //         nonRecoverableError: entity.nonRecoverableError,
          //         dataOperation: element.operation,
          //         rowVersion: rowVersion,
          //       ),
          //     );
          //   } else {
          //     final bool markAsNonRecoverable =
          //         await local.opLogManager.updateSyncDownRetry(
          //       entity.attendance!.clientReferenceId.toString(),
          //     );
          //
          //     if (markAsNonRecoverable) {
          //       await local.update(
          //         entity.copyWith(
          //           nonRecoverableError: true,
          //         ),
          //         createOpLog: false,
          //       );
          //     }
          //   }
          // }
          //
          // break;

          case DataModelType.stock:
            responseEntities = await remote.search(
              StockSearchModel(
                clientReferenceId: entities
                    .whereType<StockModel>()
                    .map((e) => e.clientReferenceId)
                    .whereNotNull()
                    .toList(),
              ),
            );

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockModel;
              final responseEntity =
                  responseEntities.whereType<StockModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;

              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId!,
                    serverGeneratedId: serverGeneratedId,
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

          case DataModelType.stockReconciliation:
            responseEntities =
                await remote.search(StockReconciliationSearchModel(
              clientReferenceId: entities
                  .whereType<StockReconciliationModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockReconciliationModel;
              final responseEntity = responseEntities
                  .whereType<StockReconciliationModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;
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
