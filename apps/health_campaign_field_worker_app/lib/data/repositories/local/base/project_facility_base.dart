import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectFacilityLocalBaseRepository
    extends LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  const ProjectFacilityLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectFacility;

  @override
  TableInfo get table => sql.projectFacility;
}