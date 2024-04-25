import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/service.dart';

abstract class ServiceLocalBaseRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  const ServiceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.service;

  @override
  TableInfo get table => sql.service;
}