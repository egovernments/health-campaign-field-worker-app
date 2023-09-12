// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class DocumentSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  DocumentSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  DocumentSearchModel.ignoreDeleted({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class DocumentModel extends EntityModel {

  static const schemaName = 'Document';

  final String? id;
  final String? documentType;
  final String? fileStoreId;
  final String? documentUid;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final DocumentAdditionalFields? additionalFields;

  DocumentModel({
    this.additionalFields,
    this.id,
    this.documentType,
    this.fileStoreId,
    this.documentUid,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  DocumentCompanion get companion {
    return DocumentCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      documentType: Value(documentType),
      fileStoreId: Value(fileStoreId),
      documentUid: Value(documentUid),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class DocumentAdditionalFields extends AdditionalFields {
  DocumentAdditionalFields({
    super.schema = 'Document',
    required super.version,
    super.fields,
  });
}
