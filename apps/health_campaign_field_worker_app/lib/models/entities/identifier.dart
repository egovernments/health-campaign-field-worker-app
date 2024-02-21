// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'identifier.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IdentifierSearchModel extends EntitySearchModel with IdentifierSearchModelMappable {
  final String? id;
  final String? identifierType;
  final String? identifierId;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  IdentifierSearchModel({
    this.id,
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  IdentifierSearchModel.ignoreDeleted({
    this.id,
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IdentifierModel extends EntityModel with IdentifierModelMappable {

  static const schemaName = 'Identifier';

  final String? id;
  final String? identifierType;
  final String? identifierId;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final IdentifierAdditionalFields? additionalFields;

  IdentifierModel({
    this.additionalFields,
    this.id,
    this.identifierType,
    this.identifierId,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  IdentifierCompanion get companion {
    return IdentifierCompanion(
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
      identifierType: Value(identifierType),
      identifierId: Value(identifierId),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IdentifierAdditionalFields extends AdditionalFields with IdentifierAdditionalFieldsMappable {
  IdentifierAdditionalFields({
    super.schema = 'Identifier',
    required super.version,
    super.fields,
  });
}

