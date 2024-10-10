import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

class LocationTrackerOpLogManager extends OpLogManager<UserActionModel> {
  LocationTrackerOpLogManager(super.isar);

  @override
  UserActionModel applyServerGeneratedIdToEntity(
    UserActionModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(rowVersion: rowVersion);

  @override
  String getClientReferenceId(UserActionModel entity) =>
      entity.clientReferenceId;

  @override
  int? getRowVersion(UserActionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(UserActionModel entity) =>
      entity.nonRecoverableError;

  @override
  String? getServerGeneratedId(UserActionModel entity) =>
      entity.clientReferenceId;
}
