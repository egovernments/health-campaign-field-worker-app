import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/referral.dart';
import '../../../models/entities/side_effect.dart';
import '../../../models/entities/task.dart';

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
