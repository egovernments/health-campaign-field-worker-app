import 'dart:async';

import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

import '../../../models/data_model.dart';
import '../../../utils/app_exception.dart';
import '../../../utils/environment_config.dart';
import '../../local_store/no_sql/schema/oplog.dart' hide AdditionalId;

abstract class OpLogManager<T extends EntityModel> {
  final Isar isar;

  const OpLogManager(this.isar);

  Future<List<OpLogEntry<T>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final createOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final singleCreateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.singleCreate)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final updateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNotNull()
        .nonRecoverableErrorEqualTo(false)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final errorOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(true)
        .createdByEqualTo(createdBy)
        .findAll();

    final deleteOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.delete)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final nonRecoverableOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedUpEqualTo(true)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(false)
        .syncDownRetryCountGreaterThan(
          envConfig.variables.syncDownRetryCount - 1,
        )
        .createdByEqualTo(createdBy)
        .findAll();

    var entries = [
      createOpLogs,
      updateOpLogs,
      deleteOpLogs,
      singleCreateOpLogs,
      errorOpLogs,
      nonRecoverableOpLogs,
    ].expand((element) => element);

    entries = entries.sortedBy((element) => element.createdAt);

    final groupedEntries = entries.groupListsBy(
      (element) => element.clientReferenceId,
    );

    final entriesForUpSync = groupedEntries.entries
        .map<OpLog?>((entry) {
          if (entry.key == null) return null;
          if (entry.value.isEmpty) return null;

          return entry.value.first;
        })
        .whereNotNull()
        .toList();

    return entriesForUpSync.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLogEntry<T>>> getPendingDownSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    var oplogs = await isar.opLogs
        .filter()
        .syncedUpEqualTo(true)
        .syncDownRetryCountLessThan(envConfig.variables.syncDownRetryCount)
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAll();

    oplogs = oplogs
        .sortedBy((element) => element.createdAt)
        .where(
          (element) => element.entityType != DataModelType.service,
          // Added Memeber and service so that we don't get the respose from the server
        )
        .toList();

    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<void> put(OpLogEntry<T> entry) async {
    await isar.writeTxn(() async {
      await isar.opLogs.put(entry
          .copyWith(
            clientReferenceId: getClientReferenceId(entry.entity),
            serverGeneratedId: getServerGeneratedId(entry.entity),
            rowVersion: getRowVersion(entry.entity),
            nonRecoverableError: getNonRecoverableError(entry.entity),
          )
          .oplog);
    });
  }

  Future<void> markSyncUp({
    OpLogEntry<T>? entry,
    int? id,
    String? clientReferenceId,
    bool? nonRecoverableError,
  }) async {
    if (nonRecoverableError == true && id != null && entry != null) {
      final oplog = await isar.opLogs.filter().idEqualTo(id).findFirst();
      if (oplog == null) return;
      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);
      await isar.writeTxn(() async {
        await isar.opLogs.put(fetchedEntry
            .copyWith(
              syncedUp: true,
              syncedDown: true,
              syncedDownOn: DateTime.now(),
              syncedUpOn: DateTime.now(),
            )
            .oplog);
      });
    } else if (entry != null) {
      await put(entry.copyWith(syncedUp: true, syncedUpOn: DateTime.now()));
    } else if (id != null) {
      OpLog? oplog;

      oplog = await isar.opLogs.get(id);
      if (oplog == null) return;
      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ),
      );
    } else if (clientReferenceId != null) {
      final oplog = await isar.opLogs
          .filter()
          .clientReferenceIdEqualTo(clientReferenceId)
          .findFirst();

      if (oplog == null) return;

      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ),
      );
    } else {
      throw AppException('Invalid arguments');
    }
  }

  Future<void> updateServerGeneratedIds({
    required UpdateServerGeneratedIdModel model,
  }) async {
    final opLogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(model.clientReferenceId)
        .findAll();

    for (final oplog in opLogs) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);

      OpLogEntry updatedEntry = entry.copyWith(
        serverGeneratedId: model.serverGeneratedId,
        additionalIds: model.additionalIds,
        rowVersion: model.rowVersion,
        nonRecoverableError: model.nonRecoverableError,
      );

      if (entry.syncedUp) {
        updatedEntry = updatedEntry.copyWith(
          syncedDown: true,
          syncedDownOn: DateTime.now(),
        );
      }

      final updatedOplog = updatedEntry.oplog;

      await isar.writeTxn(() async {
        await isar.opLogs.put(updatedOplog);
      });
    }
  }

  Future<List<OpLogEntry<T>>> getEntries(
    String clientReferenceId,
    DataOperation operation,
  ) async {
    final oplog = await isar.opLogs
        .filter()
        .operationEqualTo(operation)
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    if (oplog.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }

    return oplog.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLog>> getSyncDownRetryList(
    String clientReferenceId,
  ) async {
    final oplogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    return oplogs;
  }

  Future<bool> updateSyncDownRetry(
    String clientReferenceId,
  ) async {
    final oplogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    if (oplogs.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }
    bool markAsNonRecoverable = false;
    for (final oplog in oplogs) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);
      final syncDownRetryCount =
          entry.syncDownRetryCount < 0 ? 0 : entry.syncDownRetryCount;
      OpLogEntry updatedEntry = entry.copyWith(
        syncDownRetryCount: syncDownRetryCount + 1,
      );
      if (updatedEntry.syncDownRetryCount >=
          envConfig.variables.syncDownRetryCount) {
        markAsNonRecoverable = true;
        updatedEntry = updatedEntry.copyWith(nonRecoverableError: true);
      }

      await isar.writeTxn(() async {
        await isar.opLogs.put(updatedEntry.oplog);
      });
    }

    // [TODO] need to cross check only first records is failing

    if (oplogs.first.syncDownRetryCount == 1) {
      await Future.delayed(const Duration(seconds: 1));
    } else {
      await Future.delayed(Duration(
        seconds: envConfig.variables.retryTimeInterval *
            oplogs.first.syncDownRetryCount,
      ));
    }

    return markAsNonRecoverable;
  }

  String? getServerGeneratedId(T entity);

  int? getRowVersion(T entity);

  String getClientReferenceId(T entity);

  bool? getNonRecoverableError(T entity);
  T applyServerGeneratedIdToEntity(
    T entity,
    String serverGeneratedId,
    int rowVersion,
  );
}

class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);

  @override
  IndividualModel applyServerGeneratedIdToEntity(
    IndividualModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(IndividualModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(IndividualModel entity) => entity.id;

  @override
  int? getRowVersion(IndividualModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(IndividualModel entity) =>
      entity.nonRecoverableError;
}

class HouseholdOpLogManager extends OpLogManager<HouseholdModel> {
  HouseholdOpLogManager(super.isar);

  @override
  HouseholdModel applyServerGeneratedIdToEntity(
    HouseholdModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(HouseholdModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HouseholdModel entity) => entity.id;

  @override
  int? getRowVersion(HouseholdModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(HouseholdModel entity) =>
      entity.nonRecoverableError;
}

class FacilityOpLogManager extends OpLogManager<FacilityModel> {
  FacilityOpLogManager(super.isar);

  @override
  FacilityModel applyServerGeneratedIdToEntity(
    FacilityModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(FacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(FacilityModel entity) => entity.id;

  @override
  int? getRowVersion(FacilityModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(FacilityModel entity) =>
      entity.nonRecoverableError;
}

class HouseholdMemberOpLogManager extends OpLogManager<HouseholdMemberModel> {
  HouseholdMemberOpLogManager(super.isar);

  @override
  HouseholdMemberModel applyServerGeneratedIdToEntity(
    HouseholdMemberModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(HouseholdMemberModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HouseholdMemberModel entity) => entity.id;

  @override
  int? getRowVersion(HouseholdMemberModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(HouseholdMemberModel entity) =>
      entity.nonRecoverableError;
}

class ProjectBeneficiaryOpLogManager
    extends OpLogManager<ProjectBeneficiaryModel> {
  ProjectBeneficiaryOpLogManager(super.isar);

  @override
  ProjectBeneficiaryModel applyServerGeneratedIdToEntity(
    ProjectBeneficiaryModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectBeneficiaryModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(ProjectBeneficiaryModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectBeneficiaryModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectBeneficiaryModel entity) =>
      entity.nonRecoverableError;
}

class ProjectFacilityOpLogManager extends OpLogManager<ProjectFacilityModel> {
  ProjectFacilityOpLogManager(super.isar);

  @override
  ProjectFacilityModel applyServerGeneratedIdToEntity(
    ProjectFacilityModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectFacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectFacilityModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectFacilityModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectFacilityModel entity) =>
      entity.nonRecoverableError;
}

class TaskOpLogManager extends OpLogManager<TaskModel> {
  TaskOpLogManager(super.isar);

  @override
  TaskModel applyServerGeneratedIdToEntity(
    TaskModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(TaskModel entity) => entity.clientReferenceId;

  @override
  String? getServerGeneratedId(TaskModel entity) => entity.id;

  @override
  int? getRowVersion(TaskModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(TaskModel entity) => entity.nonRecoverableError;
}

class AddressOpLogManager extends OpLogManager<AddressModel> {
  AddressOpLogManager(super.isar);

  @override
  AddressModel applyServerGeneratedIdToEntity(
    AddressModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) {
    return entity;
  }

  @override
  String getClientReferenceId(
    AddressModel entity,
  ) {
    return entity.relatedClientReferenceId!;
  }

  @override
  int? getRowVersion(AddressModel entity) {
    return entity.rowVersion;
  }

  @override
  String? getServerGeneratedId(AddressModel entity) {
    return entity.relatedClientReferenceId;
  }

  @override
  bool? getNonRecoverableError(AddressModel entity) =>
      entity.nonRecoverableError;
}

class SideEffectOpLogManager extends OpLogManager<SideEffectModel> {
  SideEffectOpLogManager(super.isar);

  @override
  SideEffectModel applyServerGeneratedIdToEntity(
    SideEffectModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(SideEffectModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(SideEffectModel entity) => entity.id;

  @override
  int? getRowVersion(SideEffectModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(SideEffectModel entity) =>
      entity.nonRecoverableError;
}

class ReferralOpLogManager extends OpLogManager<ReferralModel> {
  ReferralOpLogManager(super.isar);

  @override
  ReferralModel applyServerGeneratedIdToEntity(
    ReferralModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ReferralModel entity) => entity.clientReferenceId;

  @override
  String? getServerGeneratedId(ReferralModel entity) => entity.id;

  @override
  int? getRowVersion(ReferralModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ReferralModel entity) =>
      entity.nonRecoverableError;
}

class ProjectStaffOpLogManager extends OpLogManager<ProjectStaffModel> {
  ProjectStaffOpLogManager(super.isar);

  @override
  ProjectStaffModel applyServerGeneratedIdToEntity(
    ProjectStaffModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectStaffModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectStaffModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectStaffModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectStaffModel entity) =>
      entity.nonRecoverableError;
}

class ProjectOpLogManager extends OpLogManager<ProjectModel> {
  ProjectOpLogManager(super.isar);

  @override
  ProjectModel applyServerGeneratedIdToEntity(
    ProjectModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectModel entity) =>
      entity.nonRecoverableError;
}

class StockOpLogManager extends OpLogManager<StockModel> {
  StockOpLogManager(super.isar);

  @override
  StockModel applyServerGeneratedIdToEntity(
    StockModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(StockModel entity) => entity.clientReferenceId;

  @override
  String? getServerGeneratedId(StockModel entity) => entity.id;

  @override
  int? getRowVersion(StockModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(StockModel entity) => entity.nonRecoverableError;
}

class StockReconciliationOpLogManager
    extends OpLogManager<StockReconciliationModel> {
  StockReconciliationOpLogManager(super.isar);

  @override
  StockReconciliationModel applyServerGeneratedIdToEntity(
    StockReconciliationModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(StockReconciliationModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(StockReconciliationModel entity) => entity.id;

  @override
  int? getRowVersion(StockReconciliationModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(StockReconciliationModel entity) =>
      entity.nonRecoverableError;
}

class ServiceDefinitionOpLogManager
    extends OpLogManager<ServiceDefinitionModel> {
  ServiceDefinitionOpLogManager(super.isar);

  @override
  ServiceDefinitionModel applyServerGeneratedIdToEntity(
    ServiceDefinitionModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ServiceDefinitionModel entity) {
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(ServiceDefinitionModel entity) => entity.id;

  @override
  int? getRowVersion(ServiceDefinitionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ServiceDefinitionModel entity) =>
      entity.nonRecoverableError;
}

class ServiceOpLogManager extends OpLogManager<ServiceModel> {
  ServiceOpLogManager(super.isar);

  @override
  ServiceModel applyServerGeneratedIdToEntity(
    ServiceModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ServiceModel entity) => entity.clientId;

  @override
  String? getServerGeneratedId(ServiceModel entity) => entity.id;

  @override
  int? getRowVersion(ServiceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ServiceModel entity) =>
      entity.nonRecoverableError;
}

class ProjectResourceOpLogManager extends OpLogManager<ProjectResourceModel> {
  ProjectResourceOpLogManager(super.isar);

  @override
  ProjectResourceModel applyServerGeneratedIdToEntity(
    ProjectResourceModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectResourceModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(ProjectResourceModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectResourceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectResourceModel entity) =>
      entity.nonRecoverableError;
}

class ProductVariantOpLogManager extends OpLogManager<ProductVariantModel> {
  ProductVariantOpLogManager(super.isar);

  @override
  ProductVariantModel applyServerGeneratedIdToEntity(
    ProductVariantModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProductVariantModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProductVariantModel entity) => entity.id;

  @override
  int? getRowVersion(ProductVariantModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProductVariantModel entity) =>
      entity.nonRecoverableError;
}

class BoundaryOpLogManager extends OpLogManager<BoundaryModel> {
  BoundaryOpLogManager(super.isar);

  @override
  BoundaryModel applyServerGeneratedIdToEntity(
    BoundaryModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(BoundaryModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(BoundaryModel entity) =>
      throw UnimplementedError();
  @override
  int? getRowVersion(BoundaryModel entity) => throw UnimplementedError();

  @override
  bool? getNonRecoverableError(BoundaryModel entity) =>
      throw UnimplementedError();
}

class PgrServiceOpLogManager extends OpLogManager<PgrServiceModel> {
  PgrServiceOpLogManager(super.isar);

  @override
  PgrServiceModel applyServerGeneratedIdToEntity(
    PgrServiceModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        serviceRequestId: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(PgrServiceModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(PgrServiceModel entity) {
    return entity.serviceRequestId;
  }

  @override
  int? getRowVersion(PgrServiceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(PgrServiceModel entity) =>
      entity.nonRecoverableError;

  @override
  Future<List<OpLogEntry<PgrServiceModel>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final pendingEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final entriesList = pendingEntries.map((e) {
      return OpLogEntry.fromOpLog<PgrServiceModel>(e);
    }).toList();

    return entriesList;
  }

  @override
  Future<List<OpLogEntry<PgrServiceModel>>> getPendingDownSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final pendingEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(true)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final entriesList = pendingEntries
        .map((e) {
          final entity = e.getEntity<PgrServiceModel>();
          if ([
            PgrServiceApplicationStatus.created,
            PgrServiceApplicationStatus.pendingAssignment,
          ].contains(entity.applicationStatus)) {
            return OpLogEntry.fromOpLog<PgrServiceModel>(e);
          }

          return null;
        })
        .whereNotNull()
        .toList();

    return entriesList;
  }
}

class UpdateServerGeneratedIdModel {
  final String clientReferenceId;
  final String serverGeneratedId;
  final DataOperation dataOperation;
  final List<AdditionalId>? additionalIds;
  final OpLogEntry? entry;
  final int? rowVersion;
  final bool? nonRecoverableError;

  const UpdateServerGeneratedIdModel({
    required this.clientReferenceId,
    required this.serverGeneratedId,
    required this.dataOperation,
    this.additionalIds,
    this.entry,
    this.rowVersion,
    this.nonRecoverableError,
  });
}
