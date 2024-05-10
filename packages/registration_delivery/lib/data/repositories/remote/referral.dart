// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/referral.dart';

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
