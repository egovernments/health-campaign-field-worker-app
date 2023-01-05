// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectStaffRepository extends RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  ProjectStaffRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectStaff',
  });
}
