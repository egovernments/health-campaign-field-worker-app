import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/service_attributes.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ServiceAttributesLocalBaseRepository
    extends LocalRepository<ServiceAttributesModel, ServiceAttributesSearchModel> {
  const ServiceAttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceAttributes;

  @override
  TableInfo get table => sql.serviceAttributes;
}
