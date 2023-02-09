// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class DocumentSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  DocumentSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class DocumentModel extends EntityModel implements DocumentSearchModel {
  final String? id;
  final String? tenantId;
  final String? documentType;
  final String? fileStoreId;
  final String? documentUid;
  
  @override
  final String clientReferenceId;
  

  DocumentModel({
    this.id,
    this.tenantId,
    this.documentType,
    this.fileStoreId,
    this.documentUid,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  DocumentCompanion get companion {
    return DocumentCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      documentType: Value(documentType),
      fileStoreId: Value(fileStoreId),
      documentUid: Value(documentUid),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
