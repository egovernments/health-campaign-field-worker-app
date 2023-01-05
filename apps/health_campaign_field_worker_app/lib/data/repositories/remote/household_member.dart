// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class HouseholdMemberRepository extends RemoteRepository<HouseholdMemberModel, HouseholdMemberRequestModel> {
  HouseholdMemberRepository(
    super.dio, {
    required super.path,
    super.entityName = 'HouseholdMember',
  });
}
