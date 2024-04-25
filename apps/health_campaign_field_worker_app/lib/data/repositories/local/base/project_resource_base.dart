import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/project_resource.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ProjectResourceLocalBaseRepository
    extends LocalRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  const ProjectResourceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectResource;

  @override
  TableInfo get table => sql.projectResource;
}
