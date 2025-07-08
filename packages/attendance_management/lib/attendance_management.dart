@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library attendance_management;

import 'package:dart_mappable/dart_mappable.dart';

export 'attendance_management.init.dart';
export 'blocs/app_localization.dart';
export 'blocs/attendance_bloc.dart';
export 'data/repositories/local/attendance_logs.dart';
export 'data/repositories/local/attendance_register.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/remote/attendance_logs.dart';
export 'data/repositories/remote/attendance_register.dart';
export 'models/entities/attendance_log.dart';
export 'models/entities/attendance_register.dart';
export 'models/entities/attendee.dart';
export 'models/entities/enum_values.dart';
export 'models/entities/register_status.dart';
export 'models/entities/staff.dart';
export 'pages/manage_attendance.dart';
export 'pages/mark_attendance.dart';
export 'router/attendance_router.dart';
export 'utils/utils.dart';
