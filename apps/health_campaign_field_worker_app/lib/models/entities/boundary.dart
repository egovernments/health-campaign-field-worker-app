// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class BoundarySearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  BoundarySearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class BoundaryModel extends EntityModel implements BoundarySearchModel {
  final String? code;
  final String? name;
  final String? label;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  
  @override
  final String clientReferenceId;
  final BoundaryModel? children;
  

  BoundaryModel({
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    required this.clientReferenceId,
    this.children,
    super.auditDetails,
  }):  super();

  BoundaryCompanion get companion {
    return BoundaryCompanion(
      code: Value(code),
      name: Value(name),
      label: Value(label),
      latitude: Value(latitude),
      longitude: Value(longitude),
      materializedPath: Value(materializedPath),
      clientReferenceId: Value(clientReferenceId),
      children: Value(children?.clientReferenceId),
    );
  }
}
