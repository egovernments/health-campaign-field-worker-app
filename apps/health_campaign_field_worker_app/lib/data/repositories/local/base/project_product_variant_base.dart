import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/project_product_variant.dart';

abstract class ProjectProductVariantLocalBaseRepository
    extends LocalRepository<ProjectProductVariantModel, ProjectProductVariantSearchModel> {
  const ProjectProductVariantLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectProductVariant;

  @override
  TableInfo get table => sql.projectProductVariant;
}