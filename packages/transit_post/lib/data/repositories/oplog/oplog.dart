import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

class UserActionOpLogManager extends OpLogManager<UserActionModel> {
  UserActionOpLogManager(super.isar);

  @override
  UserActionModel applyServerGeneratedIdToEntity(
    UserActionModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: entity.id,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(UserActionModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(UserActionModel entity) {
    return entity.id;
  }

  @override
  int? getRowVersion(UserActionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(UserActionModel entity) =>
      entity.nonRecoverableError;
}
