import 'package:dart_mappable/dart_mappable.dart';
import 'package:health_campaigns_flutter/models/address/address_model.dart';
import 'package:health_campaigns_flutter/models/data_model.dart';

@MappableClass()
class ProjectRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectTypeId;
  final AddressModel? address;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final bool? isTaskEnabled;
  final String? parent;

  ProjectRequestModel({
    this.id,
    this.tenantId,
    this.projectTypeId,
    this.address,
    int? startDate,
    int? endDate,
    this.isTaskEnabled,
    this.parent,
    super.auditDetails,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate);

  int? get startDate => startDateTime?.millisecondsSinceEpoch;
  int? get endDate => endDateTime?.millisecondsSinceEpoch;
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
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final bool isTaskEnabled;
  @override
  final String? parent;

  ProjectModel({
    required this.id,
    required this.tenantId,
    required this.projectTypeId,
    required int startDate,
    required int endDate,
    this.address,
    this.isTaskEnabled = true,
    this.parent,
    required AuditDetails auditDetails,
  })  : startDateTime = DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = DateTime.fromMillisecondsSinceEpoch(endDate),
        super(auditDetails: auditDetails);

  @override
  int get startDate => startDateTime.millisecondsSinceEpoch;
  @override
  int get endDate => endDateTime.millisecondsSinceEpoch;
}
