// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class HFReferralRemoteRepository extends RemoteRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferral',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.hFReferral;
}
