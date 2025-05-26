// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/referral.dart';

class ReferralRemoteRepository
    extends RemoteRepository<ReferralModel, ReferralSearchModel> {
  ReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Referral',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.referral;
}
