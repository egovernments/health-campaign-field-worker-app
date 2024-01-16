// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';


@MappableClass(ignoreNull: true)
class AttendanceRegisterSearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? clientReferenceId;
  final List<StaffSearchModel>? staff;
  final List<AttendeeSearchModel>? attendees;

  AttendanceRegisterSearchModel({
    this.id,
    this.clientReferenceId,
    this.staff,
    this.attendees,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  AttendanceRegisterSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
    this.staff,
    this.attendees,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterModel extends EntityModel {

  static const schemaName = 'AttendanceRegister';

  final String? id;
  final String? tenantId;
  final String? registerNumber;
  final String? name;
  final String? referenceId;
  final String? serviceCode;
  final String? status;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final List<StaffModel>? staff;
  final List<AttendeeModel>? attendees;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final AttendanceRegisterAdditionalFields? additionalFields;

  AttendanceRegisterModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.registerNumber,
    this.name,
    this.referenceId,
    this.serviceCode,
    this.status,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    this.staff,
    this.attendees,
    int? startDate,
    int? endDate,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): startDateTime = startDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = endDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(endDate),
      super();

  int?  get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int?  get endDate => endDateTime?.millisecondsSinceEpoch;
  

  AttendanceRegisterCompanion get companion {
    return AttendanceRegisterCompanion(
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
      registerNumber: Value(registerNumber),
      name: Value(name),
      referenceId: Value(referenceId),
      serviceCode: Value(serviceCode),
      status: Value(status),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      startDate: Value(startDate),
      endDate: Value(endDate),
      );
  }
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterAdditionalFields extends AdditionalFields {
  AttendanceRegisterAdditionalFields({
    super.schema = 'AttendanceRegister',
    required super.version,
    super.fields,
  });
}
