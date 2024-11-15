import 'package:auto_route/auto_route.dart';

import 'attendance_router.gm.dart';

@AutoRouterConfig.module()
class AttendanceRoute extends $AttendanceRoute {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: MarkAttendanceRoute.page,
      path: 'mark-attendance',
    ),
    AutoRoute(
        page: ManageAttendanceRoute.page,
        path: 'manage-attendance',
    ),
    AutoRoute(
      page: AttendanceDateSessionSelectionRoute.page,
      path: 'attendance-date-session-selection',
    ),
    AutoRoute(
      page: AttendanceAcknowledgementRoute.page,
      path: 'attendance-acknowledgement',
    ),
  ];
}
