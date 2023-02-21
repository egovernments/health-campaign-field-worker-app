// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class DocumentSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  DocumentSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class DocumentModel extends EntityModel {
  final String? id;
  final String? documentType;
  final String? fileStoreId;
  final String? documentUid;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  DocumentModel({
    this.id,
    this.documentType,
    this.fileStoreId,
    this.documentUid,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  DocumentCompanion get companion {
    return DocumentCompanion(
      id: Value(id),
      documentType: Value(documentType),
      fileStoreId: Value(fileStoreId),
      documentUid: Value(documentUid),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
