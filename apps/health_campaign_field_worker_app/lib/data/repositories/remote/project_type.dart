// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/registration_delivery.dart';

class ProjectTypeRemoteRepository
    extends RemoteRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  ProjectTypeRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectType',
  });

  @override
  DataModelType get type => DataModelType.projectType;
}
