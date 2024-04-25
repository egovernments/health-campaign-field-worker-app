import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/service.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ServiceLocalBaseRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  const ServiceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.service;

  @override
  TableInfo get table => sql.service;
}