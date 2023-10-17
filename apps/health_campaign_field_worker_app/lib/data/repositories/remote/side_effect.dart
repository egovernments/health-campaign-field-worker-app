// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class SideEffectRemoteRepository extends RemoteRepository<SideEffectModel, SideEffectSearchModel> {
  SideEffectRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'SideEffect',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.sideEffect;
}
