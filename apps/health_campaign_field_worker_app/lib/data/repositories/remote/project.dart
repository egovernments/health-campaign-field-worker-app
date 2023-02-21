// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectRemoteRepository
    extends RemoteRepository<ProjectModel, ProjectSearchModel> {
  ProjectRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Project',
    super.isPlural = true,
  });

  @override
  DataModelType get type => DataModelType.project;
}
