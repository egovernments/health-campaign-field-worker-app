// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectResourceRepository extends RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  ProjectResourceRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectResource',
  });
}
