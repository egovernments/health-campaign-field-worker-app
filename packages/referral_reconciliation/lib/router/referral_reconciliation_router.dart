import 'package:auto_route/auto_route.dart';

import 'referral_reconciliation_router.gr.dart';

@AutoRouterConfig()
class ReferralReconciliationRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: SearchReferralReconciliationsRoute.page,
      path: 'search-referrals',
    ),
    AutoRoute(
      page: ReferralReconProjectFacilitySelectionRoute.page,
      path: 'referral-project-facility',
    ),
    AutoRoute(
        page: HFCreateReferralWrapperRoute.page,
        path: 'referral-reconciliation',
        children: [
          AutoRoute(
              page: ReferralFacilityRoute.page,
              path: 'facility-details',
              initial: true),
          AutoRoute(
              page: RecordReferralDetailsRoute.page, path: 'referral-details'),
          AutoRoute(
            page: ReferralReasonChecklistRoute.page,
            path: 'referral-checklist-create',
          ),
          AutoRoute(
            page: ReferralReasonChecklistPreviewRoute.page,
            path: 'referral-checklist-view',
          ),
        ]),
    AutoRoute(
      page: ReferralReconAcknowledgementRoute.page,
      path: 'referral-acknowledgement',
    ),
  ];
}
