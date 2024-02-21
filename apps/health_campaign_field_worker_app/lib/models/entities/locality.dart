// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'locality.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class LocalitySearchModel extends EntitySearchModel with LocalitySearchModelMappable {
  final String? code;
  final String? name;
  final String? tenantId;
  
  LocalitySearchModel({
    this.code,
    this.name,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  LocalitySearchModel.ignoreDeleted({
    this.code,
    this.name,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class LocalityModel extends EntityModel with LocalityModelMappable {

  static const schemaName = 'Locality';

  final String code;
  final String? name;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final LocalityAdditionalFields? additionalFields;

  LocalityModel({
    this.additionalFields,
    required this.code,
    this.name,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  LocalityCompanion get companion {
    return LocalityCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      code: Value(code),
      name: Value(name),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class LocalityAdditionalFields extends AdditionalFields with LocalityAdditionalFieldsMappable {
  LocalityAdditionalFields({
    super.schema = 'Locality',
    required super.version,
    super.fields,
  });
}

