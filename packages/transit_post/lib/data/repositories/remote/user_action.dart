import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

// This will create , update and search data from remote Repository
class UserActionRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  UserActionRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'UserAction',
  });

  @override
  DataModelType get type => DataModelType.userAction;
}
