import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectTypeLocalBaseRepository
    extends LocalRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  const ProjectTypeLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectType;

  @override
  TableInfo get table => sql.projectType;
}