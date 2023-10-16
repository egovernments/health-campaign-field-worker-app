import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectLocalBaseRepository
    extends LocalRepository<ProjectModel, ProjectSearchModel> {
  const ProjectLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.project;

  @override
  TableInfo get table => sql.project;
}