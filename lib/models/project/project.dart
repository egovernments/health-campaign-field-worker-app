import 'package:dart_mappable/dart_mappable.dart';
import 'package:health_campaigns_flutter/models/address/address_model.dart';
import 'package:health_campaigns_flutter/models/data_model.dart';

@MappableClass()
class ProjectRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectTypeId;
  final AddressModel? address;

  const ProjectRequestModel({
    this.id,
    this.tenantId,
    this.projectTypeId,
    this.address,
    super.auditDetails,
  });
}

@MappableClass()
class ProjectModel extends DataModel implements ProjectRequestModel {
  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String projectTypeId;
  @override
  final AddressModel? address;

  const ProjectModel({
    required this.id,
    required this.tenantId,
    required this.projectTypeId,
    this.address,
    super.auditDetails,
  });
}
