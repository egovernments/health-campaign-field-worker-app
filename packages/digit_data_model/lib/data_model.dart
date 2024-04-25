library data_model;

export 'data/data_repository.dart';
export 'data/repositories/local/address.dart';
export 'data/repositories/local/boundary.dart';
export 'data/local_store/no_sql/schema/oplog.dart' hide AdditionalId;
export 'data/sql_store/sql_store.dart';

export 'models/oplog/oplog_entry.dart' show OpLogEntry;

@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

export 'package:registration_delivery/models/entities/household.dart';
export 'package:registration_delivery/models/entities/task.dart';
export 'package:registration_delivery/models/entities/downsync.dart';

export 'models/entities/address.dart';
export 'models/entities/boundary.dart';
export 'models/entities/locality.dart';

part 'data_model.mapper.dart';

abstract class DataModel {
  final String? boundaryCode;
  final bool? isDeleted;

  const DataModel({
    this.boundaryCode,
    this.isDeleted,
  });
}

@MappableClass(includeSubClasses: [
  AddressModel,
  BoundaryModel,
  LocalityModel,
  DownsyncModel,
  HouseholdModel,
  TaskModel,
])
abstract class EntityModel extends DataModel with EntityModelMappable {
  final AuditDetails? auditDetails;
  final ClientAuditDetails? clientAuditDetails;
  const EntityModel({
    this.auditDetails,
    this.clientAuditDetails,
    super.isDeleted = false,
  });
}

@MappableClass(ignoreNull: true, includeSubClasses: [
  AddressSearchModel,
  LocalitySearchModel,
  HouseholdSearchModel,
  DownsyncSearchModel,
  TaskSearchModel
])
abstract class EntitySearchModel extends DataModel
    with EntitySearchModelMappable {
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

@MappableClass(
  includeSubClasses: [
    DownsyncAdditionalFields,
  ],
)
abstract class AdditionalFields with AdditionalFieldsMappable {
  final String schema;
  final int version;
  final List<AdditionalField> fields;

  const AdditionalFields({
    required this.schema,
    required this.version,
    this.fields = const [],
  });
}

@MappableClass(includeSubClasses: [])
class AdditionalField with AdditionalFieldMappable {
  final String key;
  final dynamic value;

  const AdditionalField(this.key, this.value);
}

@MappableClass()
class ClientAuditDetails with ClientAuditDetailsMappable {
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
class AuditDetails with AuditDetailsMappable {
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
  attendanceRegister,
  attendance,
}
