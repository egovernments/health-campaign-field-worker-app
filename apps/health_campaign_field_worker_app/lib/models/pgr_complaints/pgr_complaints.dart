import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

@MappableClass(ignoreNull: true)
class PgrComplaintModel extends EntityModel {
  final PgrServiceModel service;
  final PgrWorkflowModel? workflow;

  const PgrComplaintModel({
    required this.service,
    this.workflow,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplainantModel extends EntityModel {
  final int? id;
  final String clientReferenceId;
  final String complaintClientReferenceId;
  final String? userName;
  final String? name;
  final String? type;
  final String? mobileNumber;
  final String? emailId;
  final List<PgrRolesModel> roles;
  final String tenantId;
  final String? uuid;
  final bool active;
  final bool isDeleted;
  final int rowVersion;

  const PgrComplainantModel({
    this.id,
    required this.clientReferenceId,
    required this.complaintClientReferenceId,
    this.userName,
    this.name,
    this.type,
    this.mobileNumber,
    this.emailId,
    this.roles = const [],
    required this.tenantId,
    this.uuid,
    this.active = true,
    this.isDeleted = false,
    this.rowVersion = 1,
    super.auditDetails,
  }) : super();

  PgrComplainantCompanion get companion {
    return PgrComplainantCompanion(
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      complaintClientReferenceId: Value(complaintClientReferenceId),
      userName: Value(userName),
      name: Value(name),
      type: Value(type),
      mobileNumber: Value(mobileNumber),
      emailId: Value(emailId),
      tenantId: Value(tenantId),
      uuid: Value(uuid),
      active: Value(active),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true)
class PgrRolesModel extends EntityModel {
  final String name;
  final String code;

  const PgrRolesModel({
    required this.name,
    required this.code,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceSearchModel extends EntitySearchModel {
  final String? tenantId;
  final String? serviceRequestId;
  final String? clientReferenceId;
  final String? complaintAssignedTo;
  final String? currentUserId;
  final String? complaintTypeCode;
  final String? locality;
  final List<PgrServiceApplicationStatus>? complaintStatus;

  const PgrServiceSearchModel({
    this.complaintAssignedTo,
    this.currentUserId,
    this.complaintTypeCode,
    this.locality,
    this.complaintStatus,
    this.tenantId,
    this.serviceRequestId,
    this.clientReferenceId,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceModel extends EntityModel {
  final bool active;
  final PgrComplainantModel employee;
  final String clientReferenceId;
  final String? id;
  final String tenantId;
  final String serviceCode;
  final String? serviceRequestId;
  final String description;
  final String? accountId;
  final PgrServiceApplicationStatus applicationStatus;
  final String? source;
  final bool isDeleted;
  final int rowVersion;
  final AddressModel address;

  const PgrServiceModel({
    required this.clientReferenceId,
    this.active = true,
    this.id,
    required this.tenantId,
    required this.serviceCode,
    this.serviceRequestId,
    required this.description,
    this.accountId,
    required this.applicationStatus,
    this.source,
    required this.employee,
    this.isDeleted = false,
    this.rowVersion = 1,
    required this.address,
    super.auditDetails,
  }) : super();

  PgrServiceCompanion get companion {
    return PgrServiceCompanion(
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      active: Value(active),
      tenantId: Value(tenantId),
      serviceCode: Value(serviceCode),
      serviceRequestId: Value(serviceRequestId),
      description: Value(description),
      accountId: Value(accountId),
      applicationStatus: Value(applicationStatus),
      source: Value(source),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true)
class PgrWorkflowModel extends EntityModel {
  final String action;
  final List<String> assignees;
  final String comments;

  const PgrWorkflowModel({
    required this.action,
    @MappableField(key: 'assignes') this.assignees = const [],
    required this.comments,
  }) : super();
}

@MappableEnum()
enum PgrServiceApplicationStatus {
  @MappableValue('CREATED')
  created,
  @MappableValue('PENDINGFORASSIGNMENT')
  pendingForAssignment,
  @MappableValue('RESOLVED')
  resolved,
  @MappableValue('REJECTED')
  rejected,
  @MappableValue('CANCELLED')
  cancelled,
}
