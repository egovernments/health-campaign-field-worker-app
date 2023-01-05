import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectStaffRepository extends RemoteRepository<ProjectStaffModel, ProjectStaffRequestModel> {
  ProjectStaffRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectStaff',
  });
}
