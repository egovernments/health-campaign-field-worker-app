import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/project_resource.dart';

abstract class ProjectResourceLocalBaseRepository
    extends LocalRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  const ProjectResourceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectResource;

  @override
  TableInfo get table => sql.projectResource;
}
