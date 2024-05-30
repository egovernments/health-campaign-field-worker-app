// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class ProjectProductVariantRemoteRepository extends RemoteRepository<ProjectProductVariantModel, ProjectProductVariantSearchModel> {
  ProjectProductVariantRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectProductVariant',
  });

  @override
  DataModelType get type => DataModelType.projectProductVariant;
}
