import 'package:digit_data_model/data/repositories/oplog/oplog.dart';

import '../../../models/entities/attendance_log.dart';
import '../../../models/entities/attendance_register.dart';

class AttendanceOpLogManager extends OpLogManager<AttendanceRegisterModel> {
  AttendanceOpLogManager(super.isar);

  @override
  AttendanceRegisterModel applyServerGeneratedIdToEntity(
    AttendanceRegisterModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //ClientreferenceId is not needed for register

  @override
  String? getServerGeneratedId(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //Not being used for down sync using client referenceIds

  @override
  int? getRowVersion(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
  //Not being used for down sync using client referenceIds

  @override
  bool? getNonRecoverableError(AttendanceRegisterModel entity) =>
      throw UnimplementedError();
//Not being used for down sync using client referenceIds
}

class AttendanceLogOpLogManager extends OpLogManager<AttendanceLogModel> {
  AttendanceLogOpLogManager(super.isar);

  @override
  AttendanceLogModel applyServerGeneratedIdToEntity(
    AttendanceLogModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(AttendanceLogModel entity) =>
      entity.clientReferenceId!;

  @override
  String? getServerGeneratedId(AttendanceLogModel entity) => entity.id;

  @override
  int? getRowVersion(AttendanceLogModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(AttendanceLogModel entity) =>
      entity.nonRecoverableError;
}
