// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/project_type.dart';

class ProjectTypeRemoteRepository extends RemoteRepository<ProjectTypeModel, ProjectTypeSearchModel> {
  ProjectTypeRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectType',
  });

  @override
  DataModelType get type => DataModelType.projectType;
}
