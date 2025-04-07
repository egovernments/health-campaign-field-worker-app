// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

class UniqueIdPoolRemoteRepository
    extends RemoteRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> {
  UniqueIdPoolRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'UniqueId',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.uniqueId;
}
