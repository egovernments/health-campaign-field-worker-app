// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProductRequestModel extends DataModel {
  
  ProductRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProductModel extends DataModel implements ProductRequestModel {
  final String? id;
  final String tenantId;
  final String type;
  final String name;
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
