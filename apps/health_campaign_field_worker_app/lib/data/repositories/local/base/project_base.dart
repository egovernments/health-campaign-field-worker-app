import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/project.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ProjectLocalBaseRepository
    extends LocalRepository<ProjectModel, ProjectSearchModel> {
  const ProjectLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.project;

  @override
  TableInfo get table => sql.project;
}
