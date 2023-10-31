// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ReferralRemoteRepository extends RemoteRepository<ReferralModel, ReferralSearchModel> {
  ReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Referral',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.referral;
}
