// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../../models/entities/user.dart';
import '../../data_repository.dart';

class UserRemoteRepository
    extends RemoteRepository<UserModel, UserSearchModel> {
  UserRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'User',
  });

  @override
  DataModelType get type => DataModelType.user;
}
