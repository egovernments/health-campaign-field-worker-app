// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class HouseholdMemberRemoteRepository extends RemoteRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  HouseholdMemberRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HouseholdMember',
  });

  @override
  DataModelType get type => DataModelType.householdMember;
}
