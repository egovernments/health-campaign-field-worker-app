import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data_model.dart';

part 'boundary.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class BoundarySearchModel extends EntitySearchModel
    with BoundarySearchModelMappable {
  final String? boundaryType;
  final String? tenantId;
  final String? codes;
  final int? boundaryNum;
  final bool? isSingle;
  final String? hierarchyType;
  final bool? includeChildren;

  BoundarySearchModel({
    this.boundaryType,
    this.tenantId,
    this.codes,
    this.boundaryNum,
    this.isSingle,
    this.hierarchyType,
    this.includeChildren,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  BoundarySearchModel.ignoreDeleted({
    this.boundaryType,
    this.tenantId,
    this.codes,
    this.boundaryNum,
    this.isSingle,
    this.hierarchyType,
    this.includeChildren,
    super.boundaryCode,
    super.additionalFields,
    super.auditDetails,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class BoundaryModel extends EntityModel with BoundaryModelMappable {
  final String? code;
  final String? name;
  final String? label;
  final String? latitude;
  final int? boundaryNum;
  final String? longitude;
  final String? materializedPath;
  final String? tenantId;
  final int? rowVersion;
  final String? boundaryType;
  final List<BoundaryModel> children;

  BoundaryModel({
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    this.tenantId,
    this.boundaryNum,
    this.rowVersion,
    this.children = const [],
    this.boundaryType,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  BoundaryCompanion get companion {
    return BoundaryCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      code: Value(code),
      name: Value(name),
      label: Value(label),
      boundaryNum: Value(boundaryNum),
      latitude: Value(latitude),
      longitude: Value(longitude),
      materializedPath: Value(materializedPath),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }

  List<String> get materializedPathList {
    if (materializedPath == null || materializedPath!.isEmpty) {
      throw ArgumentError(
        'materializedPath cannot be null or empty. code: $code',
      );
    }

    return materializedPath!.split('.');
  }
}
