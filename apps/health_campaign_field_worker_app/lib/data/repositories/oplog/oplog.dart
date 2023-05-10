import 'dart:async';

import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

import '../../../models/data_model.dart';
import '../../../utils/app_exception.dart';
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
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
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

    var entries = [
      createOpLogs,
      updateOpLogs,
      deleteOpLogs,
      singleCreateOpLogs,
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
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAll();

    oplogs = oplogs.sortedBy((element) => element.createdAt);

    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<void> put(OpLogEntry<T> entry) async {
    await isar.writeTxn(() async {
      await isar.opLogs.put(entry
          .copyWith(
            clientReferenceId: getClientReferenceId(entry.entity),
            serverGeneratedId: getServerGeneratedId(entry.entity),
          )
          .oplog);
    });
  }

  Future<void> markSyncUp({
    OpLogEntry<T>? entry,
    int? id,
    String? clientReferenceId,
  }) async {
    if (entry != null) {
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

  String? getServerGeneratedId(T entity);

  String getClientReferenceId(T entity);

  T applyServerGeneratedIdToEntity(
    T entity,
    String serverGeneratedId,
  );
}

class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);

  @override
  IndividualModel applyServerGeneratedIdToEntity(
    IndividualModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(IndividualModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(IndividualModel entity) => entity.id;
}

class HouseholdOpLogManager extends OpLogManager<HouseholdModel> {
  HouseholdOpLogManager(super.isar);

  @override
  HouseholdModel applyServerGeneratedIdToEntity(
    HouseholdModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(HouseholdModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HouseholdModel entity) => entity.id;
}

class FacilityOpLogManager extends OpLogManager<FacilityModel> {
  FacilityOpLogManager(super.isar);

  @override
  FacilityModel applyServerGeneratedIdToEntity(
    FacilityModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(FacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(FacilityModel entity) => entity.id;
}

class HouseholdMemberOpLogManager extends OpLogManager<HouseholdMemberModel> {
  HouseholdMemberOpLogManager(super.isar);

  @override
  HouseholdMemberModel applyServerGeneratedIdToEntity(
    HouseholdMemberModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(HouseholdMemberModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HouseholdMemberModel entity) => entity.id;
}

class ProjectBeneficiaryOpLogManager
    extends OpLogManager<ProjectBeneficiaryModel> {
  ProjectBeneficiaryOpLogManager(super.isar);

  @override
  ProjectBeneficiaryModel applyServerGeneratedIdToEntity(
    ProjectBeneficiaryModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProjectBeneficiaryModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(ProjectBeneficiaryModel entity) => entity.id;
}

class ProjectFacilityOpLogManager extends OpLogManager<ProjectFacilityModel> {
  ProjectFacilityOpLogManager(super.isar);

  @override
  ProjectFacilityModel applyServerGeneratedIdToEntity(
    ProjectFacilityModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProjectFacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectFacilityModel entity) => entity.id;
}

class TaskOpLogManager extends OpLogManager<TaskModel> {
  TaskOpLogManager(super.isar);

  @override
  TaskModel applyServerGeneratedIdToEntity(
    TaskModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(TaskModel entity) => entity.clientReferenceId;

  @override
  String? getServerGeneratedId(TaskModel entity) => entity.id;
}

class ProjectStaffOpLogManager extends OpLogManager<ProjectStaffModel> {
  ProjectStaffOpLogManager(super.isar);

  @override
  ProjectStaffModel applyServerGeneratedIdToEntity(
    ProjectStaffModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProjectStaffModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectStaffModel entity) => entity.id;
}

class ProjectOpLogManager extends OpLogManager<ProjectModel> {
  ProjectOpLogManager(super.isar);

  @override
  ProjectModel applyServerGeneratedIdToEntity(
    ProjectModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProjectModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectModel entity) => entity.id;
}

class StockOpLogManager extends OpLogManager<StockModel> {
  StockOpLogManager(super.isar);

  @override
  StockModel applyServerGeneratedIdToEntity(
    StockModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(StockModel entity) => entity.clientReferenceId;

  @override
  String? getServerGeneratedId(StockModel entity) => entity.id;
}

class StockReconciliationOpLogManager
    extends OpLogManager<StockReconciliationModel> {
  StockReconciliationOpLogManager(super.isar);

  @override
  StockReconciliationModel applyServerGeneratedIdToEntity(
    StockReconciliationModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(StockReconciliationModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(StockReconciliationModel entity) => entity.id;
}

class ServiceDefinitionOpLogManager
    extends OpLogManager<ServiceDefinitionModel> {
  ServiceDefinitionOpLogManager(super.isar);

  @override
  ServiceDefinitionModel applyServerGeneratedIdToEntity(
    ServiceDefinitionModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ServiceDefinitionModel entity) {
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(ServiceDefinitionModel entity) => entity.id;
}

class ServiceOpLogManager extends OpLogManager<ServiceModel> {
  ServiceOpLogManager(super.isar);

  @override
  ServiceModel applyServerGeneratedIdToEntity(
    ServiceModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ServiceModel entity) => entity.clientId;

  @override
  String? getServerGeneratedId(ServiceModel entity) => entity.id;
}

class ProjectResourceOpLogManager extends OpLogManager<ProjectResourceModel> {
  ProjectResourceOpLogManager(super.isar);

  @override
  ProjectResourceModel applyServerGeneratedIdToEntity(
    ProjectResourceModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProjectResourceModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(ProjectResourceModel entity) => entity.id;
}

class ProductVariantOpLogManager extends OpLogManager<ProductVariantModel> {
  ProductVariantOpLogManager(super.isar);

  @override
  ProductVariantModel applyServerGeneratedIdToEntity(
    ProductVariantModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  @override
  String getClientReferenceId(ProductVariantModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProductVariantModel entity) => entity.id;
}

class BoundaryOpLogManager extends OpLogManager<BoundaryModel> {
  BoundaryOpLogManager(super.isar);

  @override
  BoundaryModel applyServerGeneratedIdToEntity(
    BoundaryModel entity,
    String serverGeneratedId,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(BoundaryModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(BoundaryModel entity) =>
      throw UnimplementedError();
}

class PgrServiceOpLogManager extends OpLogManager<PgrServiceModel> {
  PgrServiceOpLogManager(super.isar);

  @override
  PgrServiceModel applyServerGeneratedIdToEntity(
    PgrServiceModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(serviceRequestId: serverGeneratedId);

  @override
  String getClientReferenceId(PgrServiceModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(PgrServiceModel entity) {
    return entity.serviceRequestId;
  }

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

  const UpdateServerGeneratedIdModel({
    required this.clientReferenceId,
    required this.serverGeneratedId,
    required this.dataOperation,
    this.additionalIds,
    this.entry,
  });
}
