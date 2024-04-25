import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/project_type.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ProjectTypeLocalBaseRepository
    extends LocalRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  const ProjectTypeLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectType;

  @override
  TableInfo get table => sql.projectType;
}