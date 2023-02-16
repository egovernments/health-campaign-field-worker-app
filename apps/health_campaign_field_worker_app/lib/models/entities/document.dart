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
  }):  super();
}

@MappableClass(ignoreNull: true)
class DocumentModel extends EntityModel {
  final String? id;
  final String? documentType;
  final String? fileStoreId;
  final String? documentUid;
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  

  DocumentModel({
    this.id,
    this.documentType,
    this.fileStoreId,
    this.documentUid,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  DocumentCompanion get companion {
    return DocumentCompanion(
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
