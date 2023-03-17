// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IdentifierSearchModel extends EntitySearchModel {
  final String? id;
  final String? identifierType;
  final String? identifierId;
  final String? tenantId;
  final bool? isDeleted;
  
  IdentifierSearchModel({
    this.id,
    this.identifierType,
    this.identifierId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IdentifierModel extends EntityModel {

  static const schemaName = 'Identifier';

  final String? id;
  final String? individualClientReferenceId;
  final String? identifierType;
  final String? identifierId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  IdentifierModel({
    this.id,
    this.individualClientReferenceId,
    this.identifierType,
    this.identifierId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    IdentifierAdditionalFields? additionalFields,
  }):  super(additionalFields: additionalFields);

  IdentifierCompanion get companion {
    return IdentifierCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      individualClientReferenceId: Value(individualClientReferenceId),
      identifierType: Value(identifierType),
      identifierId: Value(identifierId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

class IdentifierAdditionalFields extends AdditionalFields {
  IdentifierAdditionalFields({
    super.schema = 'Identifier',
    required super.version,
    super.fields,
  });
}
