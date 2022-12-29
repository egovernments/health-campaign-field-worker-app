import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class DocumentRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? documentType;
  final String? fileStoreId;
  final String? documentUid;
  final String? clientReferenceId;
  
  DocumentRequestModel({
    this.id,
    this.tenantId,
    this.documentType,
    this.fileStoreId,
    this.documentUid,
    this.clientReferenceId,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class DocumentModel extends DataModel implements DocumentRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String documentType;
  
  @override
  final String fileStoreId;
  
  @override
  final String documentUid;
  
  @override
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
