import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectResourceRepository extends RemoteRepository<ProjectResourceModel, ProjectResourceRequestModel> {
  ProjectResourceRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectResource',
  });
}
