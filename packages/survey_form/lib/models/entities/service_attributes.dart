// Generated using mason. Do not modify by hand
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'service_attributes.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceAttributesSearchModel extends EntitySearchModel
    with ServiceAttributesSearchModelMappable {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final String? id;

  ServiceAttributesSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.id,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  ServiceAttributesSearchModel.ignoreDeleted({
    this.clientReferenceId,
    this.tenantId,
    this.id,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceAttributesModel extends EntityModel
    with ServiceAttributesModelMappable {
  static const schemaName = 'ServiceAttributes';
  final String? id;
  final String? attributeCode;
  final dynamic value;
  final String? dataType;
  final String? referenceId; // Service Client Id
  final dynamic additionalDetails;
  final bool? nonRecoverableError;
  final String? clientReferenceId;
  final String? serviceClientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final ServiceAttributesAdditionalFields? additionalFields;

  ServiceAttributesModel({
    this.id,
    this.additionalFields,
    this.attributeCode,
    this.value,
    this.dataType,
    this.referenceId,
    this.additionalDetails,
    this.nonRecoverableError = false,
    this.clientReferenceId,
    this.serviceClientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  //Helper object to represents the data you want to insert or update in a table
  ServiceAttributesCompanion get companion {
    return ServiceAttributesCompanion(
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
      attributeCode: Value(attributeCode),
      value: Value(value),
      id: Value(id),
      dataType: Value(dataType),
      referenceId: Value(referenceId),
      additionalDetails: Value(jsonEncode(additionalDetails)),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      serviceClientReferenceId: Value(serviceClientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ServiceAttributesAdditionalFields extends AdditionalFields
    with ServiceAttributesAdditionalFieldsMappable {
  ServiceAttributesAdditionalFields({
    super.schema = 'ServiceAttributes',
    required super.version,
    super.fields,
  });
}
