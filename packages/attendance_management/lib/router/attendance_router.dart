import 'package:auto_route/auto_route.dart';

import 'attendance_router.gm.dart';

@AutoRouterConfig.module()
class AttendanceRoute extends $AttendanceRoute {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(page: ManageAttendanceRoute.page),
    AutoRoute(page: AttendanceDateSessionSelectionRoute.page,),
    AutoRoute(page: MarkAttendanceRoute.page,),
    AutoRoute(page: AttendanceAcknowledgementRoute.page),
  ];
}
