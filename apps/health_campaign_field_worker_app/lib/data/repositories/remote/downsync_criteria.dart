// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class DownsyncCriteriaRemoteRepository extends RemoteRepository<DownsyncCriteriaModel, DownsyncCriteriaSearchModel> {
  DownsyncCriteriaRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'DownsyncCriteria',
  });

  @override
  DataModelType get type => DataModelType.downsyncCriteria;
}
