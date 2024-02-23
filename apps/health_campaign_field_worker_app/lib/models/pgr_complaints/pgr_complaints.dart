import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'pgr_complaints.mapper.dart';

@MappableClass(ignoreNull: true)
class PgrComplaintModel extends EntityModel with PgrComplaintModelMappable {
  final PgrServiceModel service;
  final PgrWorkflowModel? workflow;

  const PgrComplaintModel({
    required this.service,
    this.workflow,
       super.isDeleted  = false,
        super.auditDetails,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplainantModel extends EntityModel with PgrComplainantModelMappable {
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
  @override
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
class PgrRolesModel extends EntityModel with PgrRolesModelMappable {
  final String name;
  final String code;

  const PgrRolesModel({
    required this.name,
    required this.code,
        super.isDeleted  = false,
        super.auditDetails,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceSearchModel extends EntitySearchModel with PgrServiceSearchModelMappable {
  final String? tenantId;
  final String? serviceRequestId;
  final String? clientReferenceId;
  final String? complaintAssignedTo;
  final String? currentUserName;
  final String? complaintTypeCode;
  final String? locality;
  final String? complainantMobileNumber;
  final String? complaintNumber;
  final List<PgrServiceApplicationStatus>? complaintStatus;

  const PgrServiceSearchModel({
    this.complaintAssignedTo,
    this.currentUserName,
    this.complaintTypeCode,
    this.locality,
    this.complaintStatus,
    this.tenantId,
    this.serviceRequestId,
    this.clientReferenceId,
    this.complainantMobileNumber,
    this.complaintNumber,
       super.isDeleted  = false,
        super.auditDetails,
        super.additionalFields,
        super.boundaryCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceModel extends EntityModel with PgrServiceModelMappable {
  final bool active;
  final PgrComplainantModel user;
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
  final PgrAddressModel address;
  final String? additionalDetail;


  const PgrServiceModel( {
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
    required this.user,
    this.isDeleted = false,
    this.rowVersion = 1,
    required this.address,
    this.additionalDetail,
    super.auditDetails,

  }) : super(isDeleted: false);

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
      additionalFields: Value(additionalDetail),
    );
  }

  bool? get nonRecoverableError => null;
}

@MappableClass(ignoreNull: true)
class PgrWorkflowModel extends EntityModel with PgrWorkflowModelMappable {
  final String action;
  final List<String> assignees;
  final String comments;

  const PgrWorkflowModel({
    required this.action,
    @MappableField(key: 'assignes') this.assignees = const [],
    required this.comments,
    super.auditDetails,
  super.isDeleted  = false,
  }) : super();
}

@MappableEnum()
enum PgrServiceApplicationStatus {
  @MappableValue('CREATED')
  created,
  @MappableValue('PENDING_ASSIGNMENT')
  pendingAssignment,
  @MappableValue('RESOLVED')
  resolved,
  @MappableValue('REJECTED')
  rejected,
  @MappableValue('CANCELLED')
  cancelled,
}

@MappableClass(ignoreNull: true)
class PgrFilters with PgrFiltersMappable {
  String? complaintAssignedTo;
  String? complaintTypeCode;
  String? locality;
  List<PgrServiceApplicationStatus>? complaintStatus;

  PgrFilters({
    this.complaintAssignedTo,
    this.complaintTypeCode,
    this.locality,
    this.complaintStatus,
  });
}

@MappableClass(ignoreNull: true)
class PgrSearchKeys with PgrSearchKeysMappable {
  String? complaintNumber;
  String? complainantMobileNumber;

  PgrSearchKeys({
    this.complaintNumber,
    this.complainantMobileNumber,
  });
}

@MappableClass(ignoreNull: true)
class PgrAdditionalDetails with PgrAdditionalDetailsMappable {
  String? supervisorName;
  String? supervisorContactNumber;
  String? otherComplaintDescription;

  PgrAdditionalDetails({
    this.supervisorName,
    this.supervisorContactNumber,
    this.otherComplaintDescription,
  });

  factory PgrAdditionalDetails.fromJson(Map<String, dynamic> json) {
    return PgrAdditionalDetails(
      supervisorName: json['supervisorName'] ?? "",
      supervisorContactNumber: json['supervisorContactNumber'] ?? "",
      otherComplaintDescription: json['otherComplaintDescription'] ?? "",
    );
  }

  @override
  String toString() {
    final map = {
      "supervisorName": supervisorName,
      "supervisorContactNumber": supervisorContactNumber,
      "otherComplaintDescription": otherComplaintDescription,
    };

    return jsonEncode(map);
  }
}
