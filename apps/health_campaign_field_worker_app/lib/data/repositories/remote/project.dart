// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectRemoteRepository extends RemoteRepository<ProjectModel, ProjectSearchModel> {
  ProjectRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'Project',
  });

  @override
  DataModelType get type => DataModelType.project;
}
