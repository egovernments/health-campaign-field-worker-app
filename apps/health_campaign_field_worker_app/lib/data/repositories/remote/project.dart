import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectRepository extends RemoteRepository<ProjectModel, ProjectRequestModel> {
  ProjectRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Project',
  });
}
