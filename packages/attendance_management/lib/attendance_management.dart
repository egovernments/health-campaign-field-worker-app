@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library attendance_management;

import 'package:dart_mappable/dart_mappable.dart';

export 'blocs/app_localization.dart';
export 'blocs/attendance_bloc.dart';
export 'pages/manage_attendance.dart';
export 'pages/mark_attendance.dart';
export 'router/attendance_router.dart';
export 'utils/utils.dart';
