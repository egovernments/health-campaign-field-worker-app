import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class AttributesLocalBaseRepository
    extends LocalRepository<AttributesModel, AttributesSearchModel> {
  const AttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.attributes;

  @override
  TableInfo get table => sql.attributes;
}