import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/project_type.dart';


abstract class ProjectTypeLocalBaseRepository
    extends LocalRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  const ProjectTypeLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectType;

  @override
  TableInfo get table => sql.projectType;
}