import 'package:auto_route/auto_route.dart';

import '../pages/inbox/complaints_inbox_dialog.dart';
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
          page: ComplaintsInboxFilterRoute.page,
          path: 'complaints-inbox-filter',
        ),
        AutoRoute(
          page: ComplaintsInboxSearchRoute.page,
          path: 'complaints-inbox-search',
        ),
        AutoRoute(
          page: ComplaintsInboxSortRoute.page,
          path: 'complaints-inbox-sort',
        ),
        AutoRoute(
          page: ComplaintsDetailsViewRoute.page,
          path: 'complaints-inbox-view-details',
        ),
      ],
    ),

    /// Complaints registration
    AutoRoute(
      page: ComplaintsRegistrationWrapperRoute.page,
      path: 'complaints-registration',
      children: [
        AutoRoute(
          page: ComplaintTypeRoute.page,
          path: 'complaints-type',
          initial: true,
        ),
        AutoRoute(
          page: ComplaintsLocationRoute.page,
          path: 'complaints-location',
        ),
        AutoRoute(
          page: ComplaintsDetailsRoute.page,
          path: 'complaints-details',
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
