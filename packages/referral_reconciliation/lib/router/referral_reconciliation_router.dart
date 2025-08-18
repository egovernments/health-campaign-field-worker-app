import 'package:auto_route/auto_route.dart';
import 'package:digit_forms_engine/router/forms_router.dart';
import 'referral_reconciliation_router.gm.dart';

@AutoRouterConfig.module()
class ReferralReconciliationRoute extends $ReferralReconciliationRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    AutoRoute(
        page: HFReferralWrapperRoute.page,
        path: 'referal-wrapper-start',
        children: [
          ...FormsRoute().routes,
          AutoRoute(
              page: SearchReferralReconciliationsRoute.page,
              path: 'search-referrals',
              initial: true),
          AutoRoute(
            page: ReferralReconProjectFacilitySelectionRoute.page,
            path: 'referral-project-facility',
          ),
          //

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
