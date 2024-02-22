// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'service.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceSearchModel extends EntitySearchModel with ServiceSearchModelMappable {
  final String? id;
  final String? clientId;
  final String? serviceDefId;
  final String? accountId;
  final String? createdAt;
  final String? tenantId;
  
  ServiceSearchModel({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.accountId,
    this.createdAt,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ServiceSearchModel.ignoreDeleted({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.accountId,
    this.createdAt,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceModel extends EntityModel with ServiceModelMappable {

  static const schemaName = 'Service';

  final String? id;
  final String clientId;
  final String? serviceDefId;
  final bool? isActive;
  final String? accountId;
  final String? additionalDetails;
  final String? createdAt;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final List<ServiceAttributesModel>? attributes;
  final ServiceAdditionalFields? additionalFields;

  ServiceModel({
    this.additionalFields,
    this.id,
    required this.clientId,
    this.serviceDefId,
    this.isActive,
    this.accountId,
    this.additionalDetails,
    this.createdAt,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.attributes,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ServiceCompanion get companion {
    return ServiceCompanion(
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
      clientId: Value(clientId),
      serviceDefId: Value(serviceDefId),
      isActive: Value(isActive),
      accountId: Value(accountId),
      additionalDetails: Value(additionalDetails),
      createdAt: Value(createdAt),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceAdditionalFields extends AdditionalFields with ServiceAdditionalFieldsMappable {
  ServiceAdditionalFields({
    super.schema = 'Service',
    required super.version,
    super.fields,
  });
}

