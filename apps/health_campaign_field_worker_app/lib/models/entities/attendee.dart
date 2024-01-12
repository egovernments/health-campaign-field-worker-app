// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class AttendeeSearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? clientReferenceId;
  
  AttendeeSearchModel({
    this.id,
    this.clientReferenceId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  AttendeeSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class AttendeeModel extends EntityModel {

  static const schemaName = 'Attendee';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final AttendeeAdditionalFields? additionalFields;

  AttendeeModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.registerId,
    this.individualId,
    this.enrollmentDate,
    this.denrollmentDate,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  AttendeeCompanion get companion {
    return AttendeeCompanion(
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
      tenantId: Value(tenantId),
      registerId: Value(registerId),
      individualId: Value(individualId),
      enrollmentDate: Value(enrollmentDate),
      denrollmentDate: Value(denrollmentDate),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class AttendeeAdditionalFields extends AdditionalFields {
  AttendeeAdditionalFields({
    super.schema = 'Attendee',
    required super.version,
    super.fields,
  });
}
