import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ServiceAttributesLocalBaseRepository
    extends LocalRepository<ServiceAttributesModel, ServiceAttributesSearchModel> {
  const ServiceAttributesLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceAttributes;

  @override
  TableInfo get table => sql.serviceAttributes;
}