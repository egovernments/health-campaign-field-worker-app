import 'package:dart_mappable/dart_mappable.dart';

part 'attendance_log.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault,)
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

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault,)
class AttendanceLogModel with AttendanceLogModelMappable {

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? time;
  final String? status;
  final String? type;
  final String? clientReferenceId;
  final bool? uploadToServer;
  final List<String>? documentIds;
  final Map<String, dynamic>? additionalDetails;

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
    this.documentIds = const [],
    this.additionalDetails,
  }) : super();
}
