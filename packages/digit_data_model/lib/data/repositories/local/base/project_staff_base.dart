import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class ProjectStaffLocalBaseRepository
    extends LocalRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  const ProjectStaffLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectStaff;

  TableInfo get table => sql.projectStaff;
}
