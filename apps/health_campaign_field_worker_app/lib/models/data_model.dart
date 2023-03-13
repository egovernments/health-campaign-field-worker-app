library models;

import 'package:dart_mappable/dart_mappable.dart';

export 'data_model.mapper.g.dart';
export 'entities/address.dart';
export 'entities/address_type.dart';
export 'entities/blood_group.dart';
export 'entities/boundary.dart';
export 'entities/document.dart';
export 'entities/facility.dart';
export 'entities/gender.dart';
export 'entities/household.dart';
export 'entities/household_member.dart';
export 'entities/identifier.dart';
export 'entities/individual.dart';
export 'entities/name.dart';
export 'entities/product.dart';
export 'entities/product_variant.dart';
export 'entities/project.dart';
export 'entities/project_beneficiary.dart';
export 'entities/project_facility.dart';
export 'entities/project_product_variant.dart';
export 'entities/project_resource.dart';
export 'entities/project_staff.dart';
export 'entities/project_type.dart';
export 'entities/status.dart';
export 'entities/stock.dart';
export 'entities/stock_reconciliation.dart';
export 'entities/target.dart';
export 'entities/task.dart';
export 'entities/task_resource.dart';
export 'entities/transaction_reason.dart';
export 'entities/transaction_type.dart';
export 'oplog/oplog_entry.dart';

@MappableClass()
abstract class DataModel {
  final String? boundaryCode;

  const DataModel({this.boundaryCode});
}

@MappableClass()
abstract class EntityModel extends DataModel {
  final AuditDetails? auditDetails;

  const EntityModel({this.auditDetails});
}

@MappableClass()
abstract class EntitySearchModel extends DataModel {
  final AuditDetails? auditDetails;

  const EntitySearchModel({super.boundaryCode, this.auditDetails});
}

@MappableClass()
class AuditDetails {
  final String createdBy;
  final String lastModifiedBy;
  final int createdTime;
  final int lastModifiedTime;

  const AuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
}

enum DataModelType {
  user,
  facility,
  household,
  householdMember,
  individual,
  product,
  productVariant,
  project,
  projectBeneficiary,
  projectFacility,
  projectProductVariant,
  projectStaff,
  projectResource,
  projectType,
  stock,
  stockReconciliation,
  task,
}
