import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';

import '../../../../models/entities/hf_referral.dart';

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

class UniqueIdOpLogManager extends OpLogManager<UniqueIdPoolModel> {
  UniqueIdOpLogManager(super.isar);

  @override
  UniqueIdPoolModel applyServerGeneratedIdToEntity(
      UniqueIdPoolModel entity, String serverGeneratedId, int rowVersion) {
    // TODO: implement applyServerGeneratedIdToEntity
    throw UnimplementedError();
  }

  @override
  String getClientReferenceId(UniqueIdPoolModel entity) {
    // TODO: implement getClientReferenceId
    throw UnimplementedError();
  }

  @override
  bool? getNonRecoverableError(UniqueIdPoolModel entity) {
    // TODO: implement getNonRecoverableError
    throw UnimplementedError();
  }

  @override
  int? getRowVersion(UniqueIdPoolModel entity) {
    // TODO: implement getRowVersion
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(UniqueIdPoolModel entity) {
    // TODO: implement getServerGeneratedId
    throw UnimplementedError();
  }
}

class HFReferralOpLogManager extends OpLogManager<HFReferralModel> {
  HFReferralOpLogManager(super.isar);

  @override
  HFReferralModel applyServerGeneratedIdToEntity(
      HFReferralModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(HFReferralModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HFReferralModel entity) => entity.id;

  @override
  int? getRowVersion(HFReferralModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(HFReferralModel entity) =>
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
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

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

//Note: PendingDownSync is not required for PGR Create Oplogs. This creates Mapper Exception issue for checking pending downsync entries of complaints type
// @override
// Future<List<OpLogEntry<PgrServiceModel>>> getPendingDownSync(
//     DataModelType type, {
//       required String createdBy,
//     }) async {
//   final pendingEntries = await isar.opLogs
//       .filter()
//       .entityTypeEqualTo(type)
//       .serverGeneratedIdIsNotNull()
//       .syncedUpEqualTo(true)
//       .syncedDownEqualTo(false)
//       .createdByEqualTo(createdBy)
//       .sortByCreatedAt()
//       .findAll();
//
//   final entriesList = pendingEntries
//       .map((e) {
//     final entity = e.getEntity<PgrServiceModel>();
//     if ([
//       PgrServiceApplicationStatus.created,
//       PgrServiceApplicationStatus.pendingAssignment,
//     ].contains(entity.applicationStatus)) {
//       return OpLogEntry.fromOpLog<PgrServiceModel>(e);
//     }
//
//     return null;
//   })
//       .whereNotNull()
//       .toList();
//
//   return entriesList;
// }
}
