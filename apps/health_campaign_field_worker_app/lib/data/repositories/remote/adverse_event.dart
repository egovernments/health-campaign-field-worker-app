// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class AdverseEventRemoteRepository extends RemoteRepository<AdverseEventModel, AdverseEventSearchModel> {
  AdverseEventRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'AdverseEvent',
  });

  @override
  DataModelType get type => DataModelType.adverseEvent;
}
