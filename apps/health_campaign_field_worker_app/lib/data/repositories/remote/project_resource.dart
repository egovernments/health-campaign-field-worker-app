// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

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
