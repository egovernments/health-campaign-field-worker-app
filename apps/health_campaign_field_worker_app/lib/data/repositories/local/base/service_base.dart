import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ServiceLocalBaseRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  const ServiceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.service;

  @override
  TableInfo get table => sql.service;
}