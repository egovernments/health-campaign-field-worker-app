import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_data_model/data_model.dart';

import '../../utils/utils.dart';
import '../sync/sync.dart';

// Bloc responsible for managing attendance related operations
class HCMAttendanceBloc extends AttendanceListeners {
  final BuildContext context;

  // Constructor
  HCMAttendanceBloc({
    required this.context,
  });

  @override
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters(
      {required int limit, required int offset}) async {
    return [];
  }

  @override
  Future<List<AttendanceRegisterModel>> loadMoreAttendanceRegisters(
      {required int limit, required int offSet}) async {
    return [];
  }

  @override
  Future<List<AttendanceLogModel>> searchAttendanceLog(
      {required String registerId,
      required String tenantId,
      required int entryTime,
      required int exitTime,
      required int currentDate}) async {
    return [];
  }

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {}

  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(context.loggedInUserUuid));
  }
}
