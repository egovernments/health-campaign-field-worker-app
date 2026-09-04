// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class SideEffectRemoteRepository
    extends RemoteRepository<SideEffectModel, SideEffectSearchModel> {
  SideEffectRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'SideEffect',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.sideEffect;
}
