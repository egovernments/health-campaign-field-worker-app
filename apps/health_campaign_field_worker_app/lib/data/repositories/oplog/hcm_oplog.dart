import 'dart:async';

import 'package:collection/collection.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:digit_data_model/data_model.dart';

import 'package:isar/isar.dart';

import '../../../models/entities/hcm_hf_referral.dart';
import '../../../models/entities/project_staff.dart';

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

class HFReferralOpLogManager extends OpLogManager<HcmHFReferralModel> {
  HFReferralOpLogManager(super.isar);

  @override
  HcmHFReferralModel applyServerGeneratedIdToEntity(
    HcmHFReferralModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
          hFReferral: entity.hFReferral
              ?.copyWith(id: serverGeneratedId, rowVersion: rowVersion));

  @override
  String getClientReferenceId(HcmHFReferralModel entity) =>
      entity.hFReferral!.clientReferenceId;

  @override
  String? getServerGeneratedId(HcmHFReferralModel entity) =>
      entity.hFReferral?.id;

  @override
  int? getRowVersion(HcmHFReferralModel entity) =>
      entity.hFReferral?.rowVersion;

  @override
  bool? getNonRecoverableError(HcmHFReferralModel entity) =>
      entity.hFReferral?.nonRecoverableError;
}

class AttendanceOpLogManager extends OpLogManager<AttendanceRegisterModel> {
  AttendanceOpLogManager(super.isar);

  @override
  AttendanceRegisterModel applyServerGeneratedIdToEntity(
    AttendanceRegisterModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //ClientreferenceId is not needed for register

  @override
  String? getServerGeneratedId(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //Not being used for down sync using client referenceIds

  @override
  int? getRowVersion(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //Not being used for down sync using client referenceIds

  @override
  bool? getNonRecoverableError(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
//Not being used for down sync using client referenceIds
}

class AttendanceLogOpLogManager extends OpLogManager<AttendanceLogModel> {
  AttendanceLogOpLogManager(super.isar);

  @override
  AttendanceLogModel applyServerGeneratedIdToEntity(
    AttendanceLogModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(AttendanceLogModel entity) =>
      entity.clientReferenceId.toString();

  @override
  String? getServerGeneratedId(AttendanceLogModel entity) => entity.id;

  @override
  int? getRowVersion(AttendanceLogModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(AttendanceLogModel entity) =>
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
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(StockModel entity) => entity.clientReferenceId!;

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

class DownsyncOpLogManager extends OpLogManager<DownsyncModel> {
  DownsyncOpLogManager(super.isar);

  @override
  DownsyncModel applyServerGeneratedIdToEntity(
    DownsyncModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  int? getRowVersion(DownsyncModel entity) => throw UnimplementedError();

  @override
  bool? getNonRecoverableError(DownsyncModel entity) =>
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