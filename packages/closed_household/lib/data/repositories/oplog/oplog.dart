import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/user_action.dart';

class ClosedHouseholdOpLogManager extends OpLogManager<UserActionModel> {
  ClosedHouseholdOpLogManager(super.isar);

  @override
  UserActionModel applyServerGeneratedIdToEntity(
      UserActionModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(UserActionModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(UserActionModel entity) => entity.id;

  @override
  int? getRowVersion(UserActionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(UserActionModel entity) =>
      entity.nonRecoverableError;
}
