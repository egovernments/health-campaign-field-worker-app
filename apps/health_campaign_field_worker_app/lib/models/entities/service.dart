// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ServiceSearchModel extends EntitySearchModel {
  final String? id;
  final String? clientId;
  final String? serviceDefId;
  final String? accountId;
  final String? createdAt;
  final String? tenantId;
  final bool? isDeleted;
  
  ServiceSearchModel({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.accountId,
    this.createdAt,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ServiceModel extends EntityModel {

  static const schemaName = 'Service';

  final String? id;
  final String? clientId;
  final String? serviceDefId;
  final bool? isActive;
  final String? accountId;
  final String? additionalDetails;
  final String? createdAt;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final List<ServiceAttributesModel>? attributes;
  

  ServiceModel({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.isActive,
    this.accountId,
    this.additionalDetails,
    this.createdAt,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.attributes,
    super.auditDetails,
    super.additionalFields,
  }):  super();

  ServiceCompanion get companion {
    return ServiceCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      clientId: Value(clientId),
      serviceDefId: Value(serviceDefId),
      isActive: Value(isActive),
      accountId: Value(accountId),
      additionalDetails: Value(additionalDetails),
      createdAt: Value(createdAt),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
