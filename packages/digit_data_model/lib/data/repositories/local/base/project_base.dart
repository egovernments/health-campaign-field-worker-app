import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';


abstract class ProjectLocalBaseRepository
    extends LocalRepository<ProjectModel, ProjectSearchModel> {
  const ProjectLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.project;

  TableInfo get table => sql.project;
}
