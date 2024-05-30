import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class ProjectProductVariantLocalBaseRepository
    extends LocalRepository<ProjectProductVariantModel, ProjectProductVariantSearchModel> {
  const ProjectProductVariantLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectProductVariant;

  TableInfo get table => sql.projectProductVariant;
}