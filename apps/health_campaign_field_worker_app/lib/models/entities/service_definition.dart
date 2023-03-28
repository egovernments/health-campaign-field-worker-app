// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ServiceDefinitionSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final List<String>? code;
  final bool? isActive;
  final bool? isDeleted;
  
  ServiceDefinitionSearchModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ServiceDefinitionModel extends EntityModel {

  static const schemaName = 'ServiceDefinition';

  final String? id;
  final String? tenantId;
  final String? code;
  final bool? isActive;
  final bool? isDeleted;
  final int? rowVersion;
  final List<AttributesModel>? attributes;
  final ServiceDefinitionAdditionalFields? additionalFields;

  ServiceDefinitionModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.isDeleted,
    this.rowVersion,
    this.attributes,
    super.auditDetails,
  }): super();

  ServiceDefinitionCompanion get companion {
    return ServiceDefinitionCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      id: Value(id),
      tenantId: Value(tenantId),
      code: Value(code),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class ServiceDefinitionAdditionalFields extends AdditionalFields {
  ServiceDefinitionAdditionalFields({
    super.schema = 'ServiceDefinition',
    required super.version,
    super.fields,
  });
}
