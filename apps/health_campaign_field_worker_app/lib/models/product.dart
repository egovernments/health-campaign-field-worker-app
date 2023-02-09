// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class ProductSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? type;
  final String? name;
  final String? manufacturer;
  final String? clientReferenceId;
  
  ProductSearchModel({
    this.id,
    this.tenantId,
    this.type,
    this.name,
    this.manufacturer,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProductModel extends EntityModel implements ProductSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? type;
  
  @override
  final String? name;
  
  @override
  final String? manufacturer;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  

  ProductModel({
    this.id,
    this.tenantId,
    this.type,
    this.name,
    this.manufacturer,
    this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  ProductCompanion get companion {
    return ProductCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      type: Value(type),
      name: Value(name),
      manufacturer: Value(manufacturer),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
