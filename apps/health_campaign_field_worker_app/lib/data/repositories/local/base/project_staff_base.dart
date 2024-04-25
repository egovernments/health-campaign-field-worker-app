import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/project_staff.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ProjectStaffLocalBaseRepository
    extends LocalRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  const ProjectStaffLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectStaff;

  @override
  TableInfo get table => sql.projectStaff;
}
