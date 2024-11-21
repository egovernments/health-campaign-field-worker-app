// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

class LocationTrackerRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  LocationTrackerRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'UserAction',
  });

  @override
  DataModelType get type => DataModelType.userLocation;
}
