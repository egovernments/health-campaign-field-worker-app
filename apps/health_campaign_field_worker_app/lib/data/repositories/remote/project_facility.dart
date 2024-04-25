// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/project_facility.dart';
import '../../data_repository.dart';

class ProjectFacilityRemoteRepository extends RemoteRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  ProjectFacilityRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectFacility',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.projectFacility;
}
