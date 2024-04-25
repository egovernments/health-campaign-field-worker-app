// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/facility.dart';

class FacilityRemoteRepository extends RemoteRepository<FacilityModel, FacilitySearchModel> {
  FacilityRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Facility',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.facility;
}
