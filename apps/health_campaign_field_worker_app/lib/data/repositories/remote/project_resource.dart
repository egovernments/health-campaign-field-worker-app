// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectResourceRemoteRepository extends RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  ProjectResourceRemoteRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectResource',
  });

  @override
  DataModelType get type => DataModelType.projectResource;
}
