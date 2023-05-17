// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ServiceAttributesSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;

  ServiceAttributesSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class ServiceAttributesModel extends EntityModel {
  static const schemaName = 'ServiceAttributes';

  final String? attributeCode;
  final dynamic value;
  final String? dataType;
  final String? referenceId;
  final dynamic additionalDetails;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final ServiceAttributesAdditionalFields? additionalFields;

  ServiceAttributesModel({
    this.additionalFields,
    this.attributeCode,
    this.value,
    this.dataType,
    this.referenceId,
    this.additionalDetails,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
  }) : super();

  ServiceAttributesCompanion get companion {
    return ServiceAttributesCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      attributeCode: Value(attributeCode),
      value: Value(value),
      dataType: Value(dataType),
      referenceId: Value(referenceId),
      additionalDetails: Value(additionalDetails),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true)
class ServiceAttributesAdditionalFields extends AdditionalFields {
  ServiceAttributesAdditionalFields({
    super.schema = 'ServiceAttributes',
    required super.version,
    super.fields,
  });
}
