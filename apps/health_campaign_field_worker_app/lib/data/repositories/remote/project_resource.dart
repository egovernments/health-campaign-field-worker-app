// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectResourceRemoteRepository extends RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  ProjectResourceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectResource',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.projectResource;
}
