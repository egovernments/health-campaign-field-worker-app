@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library referral_reconciliation;

import 'package:dart_mappable/dart_mappable.dart';

export 'data/repositories/local/hf_referral.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/remote/hf_referral.dart';
export 'models/entities/hf_referral.dart';
export 'referral_reconciliation.init.dart';
export 'router/referral_reconciliation_router.dart';
export 'utils/utils.dart';
