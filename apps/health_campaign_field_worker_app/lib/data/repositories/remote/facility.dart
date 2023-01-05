// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class FacilityRepository extends RemoteRepository<FacilityModel, FacilityRequestModel> {
  FacilityRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Facility',
  });
}
