// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectTypeRemoteRepository extends RemoteRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  ProjectTypeRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'ProjectType',
  });

  @override
  DataModelType get type => DataModelType.projectType;
}
