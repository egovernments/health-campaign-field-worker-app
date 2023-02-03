// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectFacilityRemoteRepository extends RemoteRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  ProjectFacilityRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'ProjectFacility',
  });

  @override
  DataModelType get type => DataModelType.projectFacility;
}
