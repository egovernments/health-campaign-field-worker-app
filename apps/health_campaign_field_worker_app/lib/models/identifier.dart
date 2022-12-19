import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IdentifierRequestModel extends DataModel {
  final String? type;
  final String? id;
  
  
  
  IdentifierRequestModel({
    this.type,
    this.id,
    super.auditDetails,
  }):  super();

  
}

@MappableClass()
class IdentifierModel extends DataModel implements IdentifierRequestModel {
  
  @override
  final String? type;
  
  @override
  final String? id;
  
  
  

  IdentifierModel({
     this.type,
     this.id,
    super.auditDetails,
  }):  super();

  
}
