// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class HouseholdRemoteRepository extends RemoteRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Household',
  });

  @override
  DataModelType get type => DataModelType.household;
}
