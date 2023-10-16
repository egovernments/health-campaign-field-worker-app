import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectProductVariantLocalBaseRepository
    extends LocalRepository<ProjectProductVariantModel, ProjectProductVariantSearchModel> {
  const ProjectProductVariantLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectProductVariant;

  @override
  TableInfo get table => sql.projectProductVariant;
}