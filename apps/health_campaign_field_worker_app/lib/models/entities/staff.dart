// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class StaffSearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? clientReferenceId;
  
  StaffSearchModel({
    this.id,
    this.clientReferenceId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  StaffSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class StaffModel extends EntityModel {

  static const schemaName = 'Staff';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? userId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final StaffAdditionalFields? additionalFields;

  StaffModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.registerId,
    this.userId,
    this.enrollmentDate,
    this.denrollmentDate,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  StaffCompanion get companion {
    return StaffCompanion(
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
      userId: Value(userId),
      enrollmentDate: Value(enrollmentDate),
      denrollmentDate: Value(denrollmentDate),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class StaffAdditionalFields extends AdditionalFields {
  StaffAdditionalFields({
    super.schema = 'Staff',
    required super.version,
    super.fields,
  });
}
