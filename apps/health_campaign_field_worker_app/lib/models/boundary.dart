// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class BoundaryRequestModel extends DataModel {
  
  BoundaryRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class BoundaryModel extends DataModel implements BoundaryRequestModel {
  final String code;
  final String name;
  final String? label;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  final String clientReferenceId;
  final BoundaryRequestModel? children;
  

  BoundaryModel({
    required this.code,
    required this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    required this.clientReferenceId,
    this.children,
    super.auditDetails,
  }):  super();
}
