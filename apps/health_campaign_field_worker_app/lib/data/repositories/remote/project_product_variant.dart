// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectProductVariantRemoteRepository extends RemoteRepository<ProjectProductVariantModel, ProjectProductVariantSearchModel> {
  ProjectProductVariantRemoteRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectProductVariant',
  });

  @override
  DataModelType get type => DataModelType.projectProductVariant;
}
