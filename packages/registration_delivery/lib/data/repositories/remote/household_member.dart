// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class HouseholdMemberRemoteRepository
    extends RemoteRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  HouseholdMemberRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HouseholdMember',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.householdMember;
}
