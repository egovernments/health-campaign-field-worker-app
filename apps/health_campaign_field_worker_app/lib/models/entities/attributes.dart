// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class AttributesSearchModel extends EntitySearchModel {
  final String? id;
  final String? dataType;
  final String? referenceId;
  final String? tenantId;
  final String? code;
  final String? isActive;
  final bool? required;
  final String? regex;
  final int? order;
  
  AttributesSearchModel({
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.isActive,
    this.required,
    this.regex,
    this.order,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  AttributesSearchModel.ignoreDeleted({
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.isActive,
    this.required,
    this.regex,
    this.order,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class AttributesModel extends EntityModel {

  static const schemaName = 'Attributes';

  final String? id;
  final String? dataType;
  final String? referenceId;
  final String? tenantId;
  final String? code;
  final List<String>? values;
  final String? isActive;
  final bool? required;
  final String? regex;
  final int? order;
  final int? rowVersion;
  final AttributesAdditionalFields? additionalFields;

  AttributesModel({
    this.additionalFields,
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.values,
    this.isActive,
    this.required,
    this.regex,
    this.order,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  AttributesCompanion get companion {
    return AttributesCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      dataType: Value(dataType),
      referenceId: Value(referenceId),
      tenantId: Value(tenantId),
      code: Value(code),
      values: Value(values?.toString()),
      isActive: Value(isActive),
      required: Value(required),
      regex: Value(regex),
      order: Value(order),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class AttributesAdditionalFields extends AdditionalFields {
  AttributesAdditionalFields({
    super.schema = 'Attributes',
    required super.version,
    super.fields,
  });
}
