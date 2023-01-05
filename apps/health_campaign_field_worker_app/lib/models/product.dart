// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProductSearchModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? type;
  final String? name;
  final String? manufacturer;
  
  ProductSearchModel({
    this.id,
    this.tenantId,
    this.type,
    this.name,
    this.manufacturer,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProductModel extends DataModel implements ProductSearchModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String type;
  
  @override
  final String name;
  
  @override
  final String? manufacturer;
  final int rowVersion;
  final String clientReferenceId;
  

  ProductModel({
    this.id,
    required this.tenantId,
    required this.type,
    required this.name,
    this.manufacturer,
    required this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
