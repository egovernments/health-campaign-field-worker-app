import 'package:dart_mappable/dart_mappable.dart';
import '../address/address_model.dart';

import '../data_model.dart';

@MappableClass()
class ProjectRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  
  final AddressRequestModel? address;
  
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectRequestModel({
    this.id,
    this.tenantId,
    this.projectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.address,
    int? startDate,
    int? endDate,
    super.auditDetails,
  }): startDateTime = startDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(startDate),
  endDateTime = endDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(endDate),
   super();

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
  final bool isTaskEnabled;
  
  @override
  final String? parent;
  
  
  @override
  final AddressRequestModel? address;
  
  
  @override
  final DateTime startDateTime;
  
  @override
  final DateTime endDateTime;
  

  ProjectModel({
    required this.id,
    required this.tenantId,
    required this.projectTypeId,
    required this.isTaskEnabled,
     this.parent,
     this.address,
    required int startDate,
    required int endDate,
    super.auditDetails,
  }): startDateTime = startDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = endDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(endDate),
       super();

  
  @override
  int get startDate => startDateTime .millisecondsSinceEpoch;
  
  @override
  int get endDate => endDateTime .millisecondsSinceEpoch;
  
}