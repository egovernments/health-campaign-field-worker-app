/// The `data_model.dart` file contains the definitions of various classes and enums used in the project.
/// It also exports several other files that are part of the data model.

/// The `MappableLib` annotation is used to generate mapping code for the classes in this library.
@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library data_model;

// Import statements for various packages and files used in this file.
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

export 'blocs/boundary/boundary.dart';
// Export statements for various files that are part of the data model.

export 'blocs/facility/facility.dart';
export 'blocs/product_variant/product_variant.dart';
export 'blocs/project_facility/project_facility.dart';
export 'blocs/user/user.dart';
export 'data/data_repository.dart';
export 'data/local_store/no_sql/schema/oplog.dart' hide AdditionalId;
export 'data/local_store/sql_store/sql_store.dart';
export 'data/oplog/oplog.dart';
export 'data/repositories/local/address.dart';
export 'data/repositories/local/base/attributes_base.dart';
export 'data/repositories/local/base/facility_base.dart';
export 'data/repositories/local/base/product_base.dart';
export 'data/repositories/local/base/product_variant_base.dart';
export 'data/repositories/local/base/project_base.dart';
export 'data/repositories/local/base/project_facility_base.dart';
export 'data/repositories/local/base/project_product_variant_base.dart';
export 'data/repositories/local/base/project_resource_base.dart';
export 'data/repositories/local/base/project_staff_base.dart';
export 'data/repositories/local/base/user_base.dart';
export 'data/repositories/local/boundary.dart';
export 'data/repositories/local/facility.dart';
export 'data/repositories/local/individual.dart';
export 'data/repositories/local/product_variant.dart';
export 'data/repositories/local/project.dart';
export 'data/repositories/local/project_facility.dart';
export 'data/repositories/local/project_resource.dart';
export 'data/repositories/local/project_staff.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/remote/attributes.dart';
export 'data/repositories/remote/boundary.dart';
export 'data/repositories/remote/facility.dart';
export 'data/repositories/remote/individual.dart';
export 'data/repositories/remote/product.dart';
export 'data/repositories/remote/product_variant.dart';
export 'data/repositories/remote/project.dart';
export 'data/repositories/remote/project_facility.dart';
export 'data/repositories/remote/project_product_variant.dart';
export 'data/repositories/remote/project_resource.dart';
export 'data/repositories/remote/project_staff.dart';
export 'data/repositories/remote/user.dart';
export 'models/entities/address.dart';
export 'models/entities/attributes.dart';
export 'models/entities/beneficiary_type.dart';
export 'models/entities/blood_group.dart';
export 'models/entities/boundary.dart';
export 'models/entities/document.dart';
export 'models/entities/facility.dart';
export 'models/entities/gender.dart';
export 'models/entities/household.dart';
export 'models/entities/household_member.dart';
export 'models/entities/household_member_relationship.dart';
export 'models/entities/identifier.dart';
export 'models/entities/identifier_types.dart';
export 'models/entities/individual.dart';
export 'models/entities/locality.dart';
export 'models/entities/name.dart';
export 'models/entities/name_model_converter.dart';
export 'models/entities/product.dart';
export 'models/entities/product_variant.dart';
export 'models/entities/project.dart';
export 'models/entities/project_beneficiary.dart';
export 'models/entities/project_facility.dart';
export 'models/entities/project_product_variant.dart';
export 'models/entities/project_resource.dart';
export 'models/entities/project_staff.dart';
export 'models/entities/project_type.dart';
export 'models/entities/referral.dart';
export 'models/entities/side_effect.dart';
export 'models/entities/stock.dart';
export 'models/entities/stock_reconciliation.dart';
export 'models/entities/target.dart';
export 'models/entities/task.dart';
export 'models/entities/task_resource.dart';
export 'models/entities/unique_id_pool.dart';
export 'models/entities/user.dart';
export 'models/oplog/oplog_entry.dart' show OpLogEntry;
export 'models/oplog/oplog_entry.dart';
export 'models/project_type/project_type_model.dart';
export 'utils/constants.dart' hide EntityPlurals;
export 'utils/utils.dart';

// The `part` directive is used to split the library into multiple files.
// The `data_model.mapper.dart` file contains the generated mapping code.
part 'data_model.mapper.dart';

/// The `DataModel` class is the base class for all data models in the project.
/// It contains common properties like `boundaryCode` and `isDeleted`.
abstract class DataModel {
  final String? boundaryCode;
  final bool? isDeleted;

  const DataModel({
    this.boundaryCode,
    this.isDeleted,
  });
}

/// The `EntityModel` class extends `DataModel` and adds additional properties like `auditDetails` and `clientAuditDetails`.
/// It is also annotated with `MappableClass` to generate mapping code.
@MappableClass(includeSubClasses: [
  AddressModel,
  BoundaryModel,
  LocalityModel,
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

/// The `EntitySearchModel` class extends `DataModel` and adds additional properties like `auditDetails` and `additionalFields`.
/// It is also annotated with `MappableClass` to generate mapping code.
@MappableClass(ignoreNull: true, includeSubClasses: [
  AddressSearchModel,
  LocalitySearchModel,
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

/// The `AdditionalFields` class represents additional fields that can be added to an entity.
/// It is also annotated with `MappableClass` to generate mapping code.
@MappableClass(
  includeSubClasses: [
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

/// The `AdditionalField` class represents a single additional field.
/// It is also annotated with `MappableClass` to generate mapping code.
@MappableClass(includeSubClasses: [])
class AdditionalField with AdditionalFieldMappable {
  final String key;
  final dynamic value;

  const AdditionalField(this.key, this.value);
}

/// The `ClientAuditDetails` class represents the audit details for a client.
/// It is also annotated with `MappableClass` to generate mapping code.
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

/// The `AuditDetails` class represents the audit details for an entity.
/// It is also annotated with `MappableClass` to generate mapping code.
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

/// The `ModelProvider` class is an abstract class that defines a method `getModels` that should be implemented by subclasses.
abstract class ModelProvider {
  List<Type> getModels();
}

/// The `ModelProviderRegistry` class is used to register and retrieve all model providers.
class ModelProviderRegistry {
  final _providers = <ModelProvider>[];

  void register(ModelProvider provider) {
    _providers.add(provider);
  }

  List<Type> getAllModels() {
    return _providers.expand((p) => p.getModels()).toList();
  }
}

/// The `DataModelType` enum represents the different types of data models in the project.
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
  userLocation,
  userAction,
  uniqueId
}
