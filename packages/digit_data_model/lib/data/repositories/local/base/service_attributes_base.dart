import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class ServiceAttributesLocalBaseRepository
    extends LocalRepository<ServiceAttributesModel, ServiceAttributesSearchModel> {
  const ServiceAttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceAttributes;

  TableInfo get table => sql.serviceAttributes;
}
