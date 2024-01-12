// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class AttendanceRegisterRemoteRepository extends RemoteRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel> {
  AttendanceRegisterRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'AttendanceRegister',
  });

  @override
  DataModelType get type => DataModelType.attendanceRegister;
}
