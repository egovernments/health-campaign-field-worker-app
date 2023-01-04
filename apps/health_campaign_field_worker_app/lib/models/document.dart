// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class DocumentRequestModel extends DataModel {
  
  DocumentRequestModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class DocumentModel extends DataModel implements DocumentRequestModel {
  final String? id;
  final String tenantId;
  final String documentType;
  final String fileStoreId;
  final String documentUid;
  final String clientReferenceId;
  

  DocumentModel({
    this.id,
    required this.tenantId,
    required this.documentType,
    required this.fileStoreId,
    required this.documentUid,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
