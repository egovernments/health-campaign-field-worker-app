// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class NameSearchModel extends EntitySearchModel {
  final String? id;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String? tenantId;
  
  NameSearchModel({
    this.id,
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
    this.givenName,
    this.familyName,
    this.otherNames,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class NameModel extends EntityModel {

  static const schemaName = 'Name';

  final String? id;
  final String? individualClientReferenceId;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
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
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  NameCompanion get companion {
    return NameCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      individualClientReferenceId: Value(individualClientReferenceId),
      givenName: Value(givenName),
      familyName: Value(familyName),
      otherNames: Value(otherNames),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class NameAdditionalFields extends AdditionalFields {
  NameAdditionalFields({
    super.schema = 'Name',
    required super.version,
    super.fields,
  });
}
