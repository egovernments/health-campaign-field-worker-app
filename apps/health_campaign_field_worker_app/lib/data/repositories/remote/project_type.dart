// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectTypeRepository extends RemoteRepository<ProjectTypeModel, ProjectTypeRequestModel> {
  ProjectTypeRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectType',
  });
}
