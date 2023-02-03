// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class FacilityRemoteRepository extends RemoteRepository<FacilityModel, FacilitySearchModel> {
  FacilityRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'Facility',
  });

  @override
  DataModelType get type => DataModelType.facility;
}
