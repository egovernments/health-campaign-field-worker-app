// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProductSearchModel extends EntitySearchModel {
  final String? id;
  final String? type;
  final String? name;
  final String? manufacturer;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProductSearchModel({
    this.id,
    this.type,
    this.name,
    this.manufacturer,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProductModel extends EntityModel {
  final String? id;
  final String? type;
  final String? name;
  final String? manufacturer;
  final String clientReferenceId;
  final String? tenantId;
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime createdAtTime;
  

  ProductModel({
    this.id,
    this.type,
    this.name,
    this.manufacturer,
    required this.clientReferenceId,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  ProductCompanion get companion {
    return ProductCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      id: Value(id),
      type: Value(type),
      name: Value(name),
      manufacturer: Value(manufacturer),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      );
  }
}
