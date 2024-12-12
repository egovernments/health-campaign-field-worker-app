@CodeGen(runAfter: [], targets: ['sync'])
library sync_annotation_module;

import 'package:super_annotations/super_annotations.dart';
import 'package:sync_service/data/sync_service_annotation.dart';

@SyncServiceAnnotation([
  'individual.address_.identifier_s',
  'household.address',
  'projectBeneficiary',
  'householdMember',
  'stock',
  'stockReconciliation',
  'task.resource_s',
  'sideEffect',
  'referral',
  'hFReferral',
])
class SyncModule {
}
