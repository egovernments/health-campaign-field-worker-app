@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library attendance_management;

import 'package:dart_mappable/dart_mappable.dart';

export 'blocs/app_localization.dart';
export 'blocs/attendance_bloc.dart';
export 'blocs/attendance_listeners.dart';

export 'models/entities/attendance_log.dart';
export 'models/entities/attendance_register.dart';
export 'models/entities/attendee.dart';
export 'models/entities/staff.dart';
export 'models/entities/register_status.dart';
export 'models/entities/enum_values.dart';

export 'data/local_store/sql_store/tables/attendance.dart';
export 'data/local_store/sql_store/tables/attendance_register.dart';
export 'data/local_store/sql_store/tables/attendee.dart';
export 'data/local_store/sql_store/tables/staff.dart';

export 'data/repositories/local/attendance_register.dart';
export 'data/repositories/local/attendance_logs.dart';

export 'data/repositories/remote/attendance_register.dart';
export 'data/repositories/remote/attendance_logs.dart';

export 'pages/manage_attendance.dart';
export 'pages/mark_attendance.dart';
export 'pages/session_select.dart';

export 'router/attendance_router.dart';
