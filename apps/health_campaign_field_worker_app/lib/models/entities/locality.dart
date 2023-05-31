// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class LocalitySearchModel extends EntitySearchModel {
  final String? code;
  final String? name;
  final String? tenantId;
  @override
  final bool? isDeleted;
  
  LocalitySearchModel({
    this.code,
    this.name,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class LocalityModel extends EntityModel {

  static const schemaName = 'Locality';

  final String code;
  final String? name;
  final String? tenantId;
  @override
  final bool? isDeleted;
  final int? rowVersion;
  final LocalityAdditionalFields? additionalFields;

  LocalityModel({
    this.additionalFields,
    required this.code,
    this.name,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
  }): super();

  LocalityCompanion get companion {
    return LocalityCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      code: Value(code),
      name: Value(name),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class LocalityAdditionalFields extends AdditionalFields {
  LocalityAdditionalFields({
    super.schema = 'Locality',
    required super.version,
    super.fields,
  });
}
