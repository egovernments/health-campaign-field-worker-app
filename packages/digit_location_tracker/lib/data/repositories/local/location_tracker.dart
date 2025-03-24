import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

class LocationTrackerLocalBaseRepository
    extends LocalRepository<UserActionModel, UserActionSearchModel> {
  const LocationTrackerLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.userLocation;

  @override
  FutureOr<List<UserActionModel>> search(UserActionSearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
