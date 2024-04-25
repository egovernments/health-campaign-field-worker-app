import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/project.dart';

abstract class ProjectLocalBaseRepository
    extends LocalRepository<ProjectModel, ProjectSearchModel> {
  const ProjectLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.project;

  @override
  TableInfo get table => sql.project;
}
