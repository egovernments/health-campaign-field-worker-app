@CodeGen(runAfter: [], targets: ['sync'])
library sync_annotation_module;

import 'package:super_annotations/super_annotations.dart';
import 'package:sync_service/data/sync_service_annotation.dart';

// @SyncServiceAnnotation()
// class SyncModule {
//
//   final StockModel stockModel;
//
//   SyncModule(this.stockModel);
// }

@SyncEnumAnnotation()
enum DataModelType {
  projectBeneficiary,
  householdMember,
  stock,
  stockReconciliation,
  task,
  sideEffect,
  referral,
  hFReferral,
}