@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library data_model;

import 'package:attendance_management/models/entities/attendance_log.dart';
import 'package:attendance_management/models/entities/attendance_register.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:registration_delivery/models/entities/downsync.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/task.dart';

import 'data_model.dart';

export 'data/data_repository.dart';

export 'data/repositories/local/base/attributes_base.dart';
export 'data/repositories/local/base/product_variant_base.dart';
export 'data/repositories/local/base/project_base.dart';
export 'data/repositories/local/base/project_product_variant_base.dart';
export 'data/repositories/local/base/project_resource_base.dart';
export 'data/repositories/local/base/service_attributes_base.dart';
export 'data/repositories/local/base/service_base.dart';
export 'data/repositories/local/base/service_definition_base.dart';
export 'data/repositories/local/base/facility_base.dart';
export 'data/repositories/local/base/project_facility_base.dart';

export 'data/repositories/local/address.dart';
export 'data/repositories/local/boundary.dart';
export 'data/repositories/local/service.dart';
export 'data/repositories/local/service_definition.dart';
export 'data/repositories/local/project.dart';
export 'data/repositories/local/product_variant.dart';
export 'data/repositories/local/project_resource.dart';
export 'data/repositories/local/facility.dart';
export 'data/repositories/local/individual.dart';
export 'data/repositories/local/project_facility.dart';
export 'data/repositories/oplog/oplog.dart';


export 'data/repositories/remote/service.dart';
export 'data/repositories/remote/service_definition.dart';
export 'data/repositories/remote/project.dart';

export 'data/local_store/no_sql/schema/oplog.dart' hide AdditionalId;
export 'data/local_store/sql_store/sql_store.dart';

export 'models/oplog/oplog_entry.dart' show OpLogEntry;

export 'blocs/facility/facility.dart';
export 'blocs/project_facility/project_facility.dart';
export 'blocs/product_variant/product_variant.dart';

export 'utils/constants.dart' hide EntityPlurals;

export 'models/entities/address.dart';
export 'models/entities/boundary.dart';
export 'models/entities/locality.dart';
export 'models/entities/blood_group.dart';
export 'models/entities/gender.dart';
export 'models/entities/identifier.dart';
export 'models/entities/individual.dart';
export 'models/entities/name.dart';
export 'models/entities/facility.dart';
export 'models/entities/project_facility.dart';
export 'models/entities/attributes.dart';
export 'models/entities/name_model_converter.dart';
export 'models/entities/service.dart';
export 'models/entities/service_definition.dart';
export 'models/entities/service_attributes.dart';
export 'models/entities/project.dart';
export 'models/entities/document.dart';
export 'models/entities/product_variant.dart';
export 'models/entities/project_product_variant.dart';
export 'models/entities/project_resource.dart';
export 'models/project_type/project_type_model.dart';
export 'models/pgr_complaints/pgr_address.dart';
export 'models/pgr_complaints/pgr_complaints.dart';
export 'models/pgr_complaints/pgr_complaints_response.dart';
export 'models/oplog/oplog_entry.dart';

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
  AttendanceRegisterModel,
  AttendanceLogModel,
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
  AttendanceRegisterSearchModel,
  AttendanceLogSearchModel,
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
    AddressAdditionalFields,
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

abstract class ModelProvider {
  List<Type> getModels();
}

class ModelProviderRegistry {
  final _providers = <ModelProvider>[];

  void register(ModelProvider provider) {
    _providers.add(provider);
  }

  List<Type> getAllModels() {
    return _providers.expand((p) => p.getModels()).toList();
  }
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
