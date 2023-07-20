// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class UserRemoteRepository extends RemoteRepository<UserModel, UserSearchModel> {
  UserRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'User',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.user;
}
