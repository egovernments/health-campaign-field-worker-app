// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class AdverseEventSearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? taskClientReferenceId;
  final int? reAttempts;
  final List<String>? symptoms;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  AdverseEventSearchModel({
    this.id,
    this.taskClientReferenceId,
    this.reAttempts,
    this.symptoms,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  AdverseEventSearchModel.ignoreDeleted({
    this.id,
    this.taskClientReferenceId,
    this.reAttempts,
    this.symptoms,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class AdverseEventModel extends EntityModel {

  static const schemaName = 'AdverseEvent';

  final String? id;
  final String? taskClientReferenceId;
  final int? reAttempts;
  final List<String>? symptoms;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final AdverseEventAdditionalFields? additionalFields;

  AdverseEventModel({
    this.additionalFields,
    this.id,
    this.taskClientReferenceId,
    this.reAttempts,
    this.symptoms,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  AdverseEventCompanion get companion {
    return AdverseEventCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      taskClientReferenceId: Value(taskClientReferenceId),
      reAttempts: Value(reAttempts),
      symptoms: Value(symptoms?.toString()),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class AdverseEventAdditionalFields extends AdditionalFields {
  AdverseEventAdditionalFields({
    super.schema = 'AdverseEvent',
    required super.version,
    super.fields,
  });
}
