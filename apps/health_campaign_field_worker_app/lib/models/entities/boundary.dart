// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class BoundarySearchModel extends EntitySearchModel {
  final String? tenantId;
  final bool? isDeleted;
  
  BoundarySearchModel({
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class BoundaryModel extends EntityModel {
  final String? code;
  final String? name;
  final String? label;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  BoundaryModel({
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
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
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
