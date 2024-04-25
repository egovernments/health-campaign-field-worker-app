import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/project_facility.dart';

abstract class ProjectFacilityLocalBaseRepository
    extends LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  const ProjectFacilityLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectFacility;

  @override
  TableInfo get table => sql.projectFacility;
}
