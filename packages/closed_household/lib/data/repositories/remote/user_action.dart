import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data_model.dart';

class UserActionRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  UserActionRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'UserAction',
        super.isSearchResponsePlural = true,
      });

  @override
  DataModelType get type => DataModelType.userAction;
}
