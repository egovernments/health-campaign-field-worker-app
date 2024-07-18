import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data_model.dart';

class ClosedHouseholdRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  ClosedHouseholdRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'UserAction',
        super.isSearchResponsePlural = true,
      });

  @override
  DataModelType get type => DataModelType.userAction;
}
