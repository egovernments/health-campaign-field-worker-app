import 'package:dart_mappable/dart_mappable.dart';

import '../data_model.dart';

@MappableClass(ignoreNull: true)
class PgrServiceCreateResponseModel extends EntityModel {
  final List<PgrComplaintResponseModel> serviceWrappers;

  const PgrServiceCreateResponseModel({
    @MappableField(key: 'ServiceWrappers') this.serviceWrappers = const [],
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplaintResponseModel extends EntityModel {
  final PgrServiceResponseModel service;
  final PgrWorkflowModel? workflow;

  const PgrComplaintResponseModel({
    required this.service,
    this.workflow,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplainantResponseModel extends EntityModel {
  final int? id;
  final String? userName;
  final String? name;
  final String? type;
  final String? mobileNumber;
  final String? emailId;
  final List<PgrRolesModel>? roles;
  final String? tenantId;
  final String? uuid;
  final bool? active;
  @override
  final bool? isDeleted;
  final int? rowVersion;

  const PgrComplainantResponseModel({
    this.id,
    this.userName,
    this.name,
    this.type,
    this.mobileNumber,
    this.emailId,
    this.roles = const [],
    this.tenantId,
    this.uuid,
    this.active = true,
    this.isDeleted = false,
    this.rowVersion = 1,
    super.auditDetails,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceResponseModel extends EntityModel {
  final bool? active;
  final PgrComplainantResponseModel? user;
  final String? id;
  final String? tenantId;
  final String? serviceCode;
  final String? serviceRequestId;
  final String? description;
  final String? accountId;
  final PgrServiceApplicationStatus? applicationStatus;
  final String? source;
  @override
  final bool? isDeleted;
  final int? rowVersion;

  const PgrServiceResponseModel({
    this.active = true,
    this.id,
    this.tenantId,
    this.serviceCode,
    this.serviceRequestId,
    this.description,
    this.accountId,
    this.applicationStatus,
    this.source,
    this.user,
    this.isDeleted = false,
    this.rowVersion = 1,
    super.auditDetails,
  }) : super();
}
