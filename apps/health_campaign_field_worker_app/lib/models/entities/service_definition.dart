// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'service_definition.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceDefinitionSearchModel extends EntitySearchModel with ServiceDefinitionSearchModelMappable {
  final String? id;
  final String? tenantId;
  final List<String>? code;
  final bool? isActive;
  
  ServiceDefinitionSearchModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ServiceDefinitionSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceDefinitionModel extends EntityModel with ServiceDefinitionModelMappable {

  static const schemaName = 'ServiceDefinition';

  final String? id;
  final String? tenantId;
  final String? code;
  final bool? isActive;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final List<AttributesModel>? attributes;
  final ServiceDefinitionAdditionalFields? additionalFields;

  ServiceDefinitionModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.nonRecoverableError = false,
    this.rowVersion,
    this.attributes,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ServiceDefinitionCompanion get companion {
    return ServiceDefinitionCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      tenantId: Value(tenantId),
      code: Value(code),
      isActive: Value(isActive),
      nonRecoverableError: Value(nonRecoverableError),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceDefinitionAdditionalFields extends AdditionalFields with ServiceDefinitionAdditionalFieldsMappable {
  ServiceDefinitionAdditionalFields({
    super.schema = 'ServiceDefinition',
    required super.version,
    super.fields,
  });
}

