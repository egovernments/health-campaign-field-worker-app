// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../models/entities/household.dart';

class HouseholdRemoteRepository
    extends RemoteRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Household',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.household;
}
