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

