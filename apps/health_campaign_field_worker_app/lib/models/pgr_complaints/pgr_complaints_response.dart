import 'package:dart_mappable/dart_mappable.dart';

import '../data_model.dart';

part 'pgr_complaints_response.mapper.dart';

@MappableClass(ignoreNull: true)
class PgrServiceCreateResponseModel extends EntityModel with PgrServiceCreateResponseModelMappable {
  final List<PgrComplaintResponseModel> serviceWrappers;

  const PgrServiceCreateResponseModel({
    @MappableField(key: 'ServiceWrappers') this.serviceWrappers = const [],
    super.auditDetails,
    super.isDeleted  = false,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplaintResponseModel extends EntityModel with PgrComplaintResponseModelMappable {
  final PgrServiceResponseModel service;
  final PgrWorkflowModel? workflow;

  const PgrComplaintResponseModel({
    required this.service,
    this.workflow,
    super.auditDetails,
        super.isDeleted  = false,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrComplainantResponseModel extends EntityModel with PgrComplainantResponseModelMappable {
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
    this.rowVersion = 1,
    super.auditDetails,
        super.isDeleted  = false,
  }) : super();
}

@MappableClass(ignoreNull: true)
class PgrServiceResponseModel extends EntityModel with PgrServiceResponseModelMappable {
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
    this.rowVersion = 1,
    super.auditDetails,
        super.isDeleted  = false,
  }) : super();
}
