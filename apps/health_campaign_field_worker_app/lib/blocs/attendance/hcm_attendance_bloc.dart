import 'package:attendance_management/attendance_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(context.loggedInUserUuid));
  }
}
