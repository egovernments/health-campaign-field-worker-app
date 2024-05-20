// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

class HFReferralRemoteRepository
    extends RemoteRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferral',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.hFReferral;
}
