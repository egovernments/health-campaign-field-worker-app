import 'package:digit_data_model/data/repositories/oplog/oplog.dart';

import '../../../models/entities/hf_referral.dart';

class HFReferralOpLogManager extends OpLogManager<HFReferralModel> {
  HFReferralOpLogManager(super.isar);

  @override
  HFReferralModel applyServerGeneratedIdToEntity(
    HFReferralModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(HFReferralModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(HFReferralModel entity) => entity.id;

  @override
  int? getRowVersion(HFReferralModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(HFReferralModel entity) =>
      entity.nonRecoverableError;
}
