import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ReferralLocalBaseRepository
    extends LocalRepository<ReferralModel, ReferralSearchModel> {
  const ReferralLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.referral;

  @override
  TableInfo get table => sql.referral;
}