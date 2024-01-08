library models;

import 'package:dart_mappable/dart_mappable.dart';

export 'data_model.mapper.g.dart';
export 'entities/additional_fields_type.dart';
export 'entities/address.dart';
export 'entities/address_type.dart';
export 'entities/attributes.dart';
export 'entities/beneficiary_type.dart';
export 'entities/blood_group.dart';
export 'entities/boundary.dart';
export 'entities/deliver_strategy_type.dart';
export 'entities/document.dart';
export 'entities/downsync.dart';
export 'entities/facility.dart';
export 'entities/gender.dart';
export 'entities/h_f_referral.dart';
export 'entities/household.dart';
export 'entities/household_member.dart';
export 'entities/identifier.dart';
export 'entities/individual.dart';
export 'entities/locality.dart';
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
export 'entities/referral.dart';
export 'entities/roles.dart';
export 'entities/roles_type.dart';
export 'entities/service.dart';
export 'entities/service_attributes.dart';
export 'entities/service_definition.dart';
export 'entities/side_effect.dart';
export 'entities/status.dart';
export 'entities/stock.dart';
export 'entities/stock_reconciliation.dart';
export 'entities/target.dart';
export 'entities/task.dart';
export 'entities/task_resource.dart';
export 'entities/transaction_reason.dart';
export 'entities/transaction_type.dart';
export 'entities/user.dart';
export 'oplog/oplog_entry.dart';
export 'pgr_complaints/pgr_address.dart';
export 'pgr_complaints/pgr_complaints.dart';
export 'pgr_complaints/pgr_complaints_response.dart';

abstract class DataModel {
  final String? boundaryCode;
  final bool? isDeleted;

  const DataModel({
    this.boundaryCode,
    this.isDeleted,
  });
}

@MappableClass()
abstract class EntityModel extends DataModel {
  final AuditDetails? auditDetails;
  final ClientAuditDetails? clientAuditDetails;
  const EntityModel({
    this.auditDetails,
    this.clientAuditDetails,
    super.isDeleted = false,
  });
}

@MappableClass(ignoreNull: true)
abstract class EntitySearchModel extends DataModel {
  final AuditDetails? auditDetails;
  final AdditionalFields? additionalFields;

  const EntitySearchModel({
    super.boundaryCode,
    this.auditDetails,
    this.additionalFields,
    super.isDeleted = false,
  });

  @MappableConstructor()
  const EntitySearchModel.ignoreDeleted({
    super.boundaryCode,
    this.auditDetails,
    this.additionalFields,
  }) : super(isDeleted: false);
}

@MappableClass()
abstract class AdditionalFields {
  final String schema;
  final int version;
  final List<AdditionalField> fields;

  const AdditionalFields({
    required this.schema,
    required this.version,
    this.fields = const [],
  });
}

@MappableClass()
class AdditionalField {
  final String key;
  final dynamic value;

  const AdditionalField(this.key, this.value);
}

@MappableClass()
class ClientAuditDetails {
  final int createdTime;
  final int? lastModifiedTime;
  final String createdBy;
  final String lastModifiedBy;

  ClientAuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
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
  address,
  household,
  individual,
  projectBeneficiary,
  householdMember,
  product,
  productVariant,
  project,
  projectFacility,
  projectProductVariant,
  projectStaff,
  projectResource,
  projectType,
  stock,
  stockReconciliation,
  task,
  sideEffect,
  referral,
  serviceDefinition,
  service,
  complaints,
  attributes,
  boundary,
  serviceAttributes,
  locality,
  downsync,
  downsyncCriteria,
  hFReferral,
}
