import 'package:auto_route/auto_route.dart';

import 'attendance_router.gm.dart';

@AutoRouterConfig.module()
class AttendanceRoute extends $AttendanceRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    AutoRoute(page: ManageAttendanceRoute.page),
    AutoRoute(
      page: MarkAttendanceRoute.page,
    ),
    AutoRoute(page: AttendanceAcknowledgementRoute.page),
  ];
}
