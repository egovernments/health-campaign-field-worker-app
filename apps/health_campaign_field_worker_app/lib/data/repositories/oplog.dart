import 'package:digit_data_model/data_model.dart';

import '../../models/downsync/downsync.dart';
import '../../models/hf_referral_downsync/hf_referral_downsync.dart';

class DownsyncOpLogManager extends OpLogManager<DownsyncModel> {
  DownsyncOpLogManager(super.isar);

  @override
  DownsyncModel applyServerGeneratedIdToEntity(
    DownsyncModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  int? getRowVersion(DownsyncModel entity) => throw UnimplementedError();

  @override
  bool? getNonRecoverableError(DownsyncModel entity) =>
      throw UnimplementedError();
}

class HFReferralDownsyncOpLogManager
    extends OpLogManager<HFReferralDownsyncModel> {
  HFReferralDownsyncOpLogManager(super.isar);

  @override
  HFReferralDownsyncModel applyServerGeneratedIdToEntity(
    HFReferralDownsyncModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(HFReferralDownsyncModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(HFReferralDownsyncModel entity) =>
      throw UnimplementedError();

  @override
  int? getRowVersion(HFReferralDownsyncModel entity) =>
      throw UnimplementedError();

  @override
  bool? getNonRecoverableError(HFReferralDownsyncModel entity) =>
      throw UnimplementedError();
}
