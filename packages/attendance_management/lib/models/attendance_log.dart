import 'package:dart_mappable/dart_mappable.dart';

@MappableClass(ignoreNull: true)
class AttendanceLogSearchModel {
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
class AttendanceLogModel {
  static const schemaName = 'Attendee';

  final String id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final int? status;

  AttendanceLogModel({
    required this.id,
    this.tenantId,
    this.registerId,
    this.individualId,
    this.nonRecoverableError = false,
    this.rowVersion,
    this.status = -1,
  }) : super();
}
