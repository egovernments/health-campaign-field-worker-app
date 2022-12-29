import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProductRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? type;
  final String? name;
  final String? manufacturer;
  final int? rowVersion;
  final String? clientReferenceId;
  
  ProductRequestModel({
    this.id,
    this.tenantId,
    this.type,
    this.name,
    this.manufacturer,
    this.rowVersion,
    this.clientReferenceId,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProductModel extends DataModel implements ProductRequestModel {
  
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
  
  @override
  final int rowVersion;
  
  @override
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
