import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/attributes.dart';

abstract class AttributesLocalBaseRepository
    extends LocalRepository<AttributesModel, AttributesSearchModel> {
  const AttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.attributes;

  @override
  TableInfo get table => sql.attributes;
}