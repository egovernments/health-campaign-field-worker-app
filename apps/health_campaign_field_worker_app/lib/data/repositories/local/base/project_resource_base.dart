import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectResourceLocalBaseRepository
    extends LocalRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  const ProjectResourceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectResource;

  @override
  TableInfo get table => sql.projectResource;
}