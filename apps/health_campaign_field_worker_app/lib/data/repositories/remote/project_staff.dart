// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectStaffRemoteRepository extends RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  ProjectStaffRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectStaff',
  });

  @override
  DataModelType get type => DataModelType.projectStaff;
}
