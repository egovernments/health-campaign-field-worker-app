import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

import '../../../models/entities/household.dart';
import '../../../models/entities/household_member.dart';
import '../../../models/entities/project_beneficiary.dart';
import '../../../models/entities/referral.dart';
import '../../../models/entities/side_effect.dart';
import '../../../models/entities/task.dart';

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
