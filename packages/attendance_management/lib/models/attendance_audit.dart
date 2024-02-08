import 'package:dart_mappable/dart_mappable.dart';

@MappableClass()
class AttendanceAuditDetails {
  final String createdBy;
  final String lastModifiedBy;
  final int createdTime;
  final int lastModifiedTime;

  const AttendanceAuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
}