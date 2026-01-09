import 'package:digit_data_model/data_model.dart';
import '../../../models/hf_referral_downsync/hf_referral_downsync.dart';

class HFReferralDownsyncRemoteRepository extends RemoteRepository<
    HFReferralDownsyncModel, HFReferralDownsyncSearchModel> {
  HFReferralDownsyncRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferralDownsync',
  });

  @override
  DataModelType get type => DataModelType.hFReferral;
}