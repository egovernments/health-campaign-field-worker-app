// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:digit_data_model/data_model.dart';

part 'name.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class NameSearchModel extends EntitySearchModel with NameSearchModelMappable {
  final String? id;
  final int? offset;
  final int? limit;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String? tenantId;
  
  NameSearchModel({
    this.id,
    this.offset,
    this.limit,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  NameSearchModel.ignoreDeleted({
    this.id,
    this.offset,
    this.limit,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class NameModel extends EntityModel with NameModelMappable {

  static const schemaName = 'Name';

  final String? id;
  final String? individualClientReferenceId;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final NameAdditionalFields? additionalFields;

  NameModel({
    this.additionalFields,
    this.id,
    this.individualClientReferenceId,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  NameCompanion get companion {
    return NameCompanion(
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
      id: Value(id),
      individualClientReferenceId: Value(individualClientReferenceId),
      givenName: Value(givenName),
      familyName: Value(familyName),
      otherNames: Value(otherNames),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class NameAdditionalFields extends AdditionalFields with NameAdditionalFieldsMappable {
  NameAdditionalFields({
    super.schema = 'Name',
    required super.version,
    super.fields,
  });
}

