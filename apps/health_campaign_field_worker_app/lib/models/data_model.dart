library models;

import 'package:dart_mappable/dart_mappable.dart';

export 'oplog/oplog_entry.dart';

export 'address.dart';
export 'address_type.dart';
export 'boundary.dart';
export 'document.dart';
export 'facility.dart';
export 'gender.dart';
export 'household.dart';
export 'household_member.dart';
export 'identifier.dart';
export 'individual.dart';
export 'product.dart';
export 'product_variant.dart';
export 'project.dart';
export 'blood_group.dart';
export 'name.dart';
export 'project_beneficiary.dart';
export 'project_facility.dart';
export 'project_product_variant.dart';
export 'project_resource.dart';
export 'project_staff.dart';
export 'project_type.dart';
export 'target.dart';
export 'task.dart';
export 'task_resource.dart';

export 'data_model.mapper.g.dart';

@MappableClass()
abstract class DataModel {
  final AuditDetails? auditDetails;
  final bool isDeleted;
  final String? boundaryCode;

  const DataModel({
    this.auditDetails,
    this.isDeleted = false,
    this.boundaryCode,
  });
}

@MappableClass()
class AuditDetails {
  final String createdBy;
  final String lastModifiedBy;
  final int createdTime;
  final int lastModifiedTime;

  const AuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
}

enum DataModelType { project }
