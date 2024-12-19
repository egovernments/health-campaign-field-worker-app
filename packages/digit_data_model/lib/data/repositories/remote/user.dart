// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class UserRemoteRepository
    extends RemoteRepository<UserModel, UserSearchModel> {
  UserRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'User',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.user;
}
