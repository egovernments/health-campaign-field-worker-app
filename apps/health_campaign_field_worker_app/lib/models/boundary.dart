import 'package:dart_mappable/dart_mappable.dart';

import 'boundary.dart';
import 'data_model.dart';

@MappableClass()
class BoundaryRequestModel extends DataModel {
  final String? code;
  final String? name;
  final String? label;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  
  final BoundaryRequestModel? children;
  
  
  BoundaryRequestModel({
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    this.children,
    super.auditDetails,
  }):  super();

  
}

@MappableClass()
class BoundaryModel extends DataModel implements BoundaryRequestModel {
  
  @override
  final String code;
  
  @override
  final String name;
  
  @override
  final String? label;
  
  @override
  final String? latitude;
  
  @override
  final String? longitude;
  
  @override
  final String? materializedPath;
  
  
  @override
  final BoundaryRequestModel? children;
  
  

  BoundaryModel({
    required this.code,
    required this.name,
     this.label,
     this.latitude,
     this.longitude,
     this.materializedPath,
     this.children,
    super.auditDetails,
  }):  super();

  
}