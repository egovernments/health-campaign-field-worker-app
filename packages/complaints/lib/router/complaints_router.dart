import 'package:auto_route/auto_route.dart';

import 'complaints_router.gm.dart';

/// Complaint Inbox and registration Router
@AutoRouterConfig.module()
class ComplaintsRoute extends $ComplaintsRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    /// Complaints Inbox
    AutoRoute(
      page: ComplaintsInboxWrapperRoute.page,
      path: 'complaints-inbox',
      children: [
        AutoRoute(
          page: ComplaintsInboxRoute.page,
          path: 'complaints-inbox-items',
          initial: true,
        ),
        AutoRoute(
          page: ComplaintsInboxDialogRoute.page,
        ),
        AutoRoute(
          page: ComplaintsDetailsViewRoute.page,
          path: 'complaints-inbox-view-details',
        ),
      ],
    ),

    /// Complaints Acknowledgement
    AutoRoute(
      page: ComplaintsAcknowledgementRoute.page,
      path: 'complaints-acknowledgement',
    ),
  ];
}
