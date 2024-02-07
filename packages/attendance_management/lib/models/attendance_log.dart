import 'package:dart_mappable/dart_mappable.dart';

part 'attendance_log.mapper.dart';

@MappableClass(ignoreNull: true)
class AttendanceLogSearchModel with AttendanceLogSearchModelMappable {
  final String? id;
  final String? registerId;

  AttendanceLogSearchModel({
    this.id,
    this.registerId,
  }) : super();

  @MappableConstructor()
  AttendanceLogSearchModel.ignoreDeleted({
    this.id,
    this.registerId,
  });
}

@MappableClass(ignoreNull: true)
class AttendanceLogModel with AttendanceLogModelMappable {
  static const schemaName = 'Attendee';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? time;
  final String? status;
  final String? type;
  final String? clientReferenceId;
  final bool? uploadToServer;

  AttendanceLogModel({
    this.id,
    this.tenantId,
    this.registerId,
    this.individualId,
    this.type,
    this.time,
    this.status,
    this.clientReferenceId,
    this.uploadToServer = false,
  }) : super();
}
