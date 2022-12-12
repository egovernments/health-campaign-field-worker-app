library models;

import 'package:dart_mappable/dart_mappable.dart';

export 'project/project.dart';
export 'oplog/oplog_entry.dart';
export 'data_model.mapper.g.dart';

@MappableClass()
abstract class DataModel {
  final AuditDetails? auditDetails;

  const DataModel({this.auditDetails});
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
