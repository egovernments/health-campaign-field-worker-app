// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectFacilitySearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectFacilityModel extends EntityModel {

  static const schemaName = 'ProjectFacility';

  final String id;
  final String facilityId;
  final String projectId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  ProjectFacilityModel({
    required this.id,
    required this.facilityId,
    required this.projectId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    ProjectFacilityAdditionalFields? additionalFields,
  }):  super(additionalFields: additionalFields);

  ProjectFacilityCompanion get companion {
    return ProjectFacilityCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

class ProjectFacilityAdditionalFields extends AdditionalFields {
  ProjectFacilityAdditionalFields({
    super.schema = 'ProjectFacility',
    required super.version,
    super.fields,
  });
}
