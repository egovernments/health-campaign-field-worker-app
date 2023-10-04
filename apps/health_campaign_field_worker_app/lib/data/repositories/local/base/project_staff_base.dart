import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectStaffLocalBaseRepository
    extends LocalRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  const ProjectStaffLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectStaff;

  @override
  TableInfo get table => sql.projectStaff;
}