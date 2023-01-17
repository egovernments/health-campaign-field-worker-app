// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class HouseholdRepository extends RemoteRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Household',
  });
}
