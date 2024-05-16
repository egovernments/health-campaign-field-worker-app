// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/project_staff.dart';

class ProjectStaffRemoteRepository
    extends RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  ProjectStaffRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectStaff',
  });

  @override
  DataModelType get type => DataModelType.projectStaff;
}
