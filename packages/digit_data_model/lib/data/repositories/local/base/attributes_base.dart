import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class AttributesLocalBaseRepository
    extends LocalRepository<AttributesModel, AttributesSearchModel> {
  const AttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.attributes;

  TableInfo get table => sql.attributes;
}