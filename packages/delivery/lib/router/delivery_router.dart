import 'package:auto_route/auto_route.dart';
import 'package:delivery/router/delivery_router.gm.dart';

@AutoRouterConfig.module()
class DeliveryRoute extends $DeliveryRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
        AutoRoute(
            page: DeliveryWrapperRoute.page,
            path: 'delivery-wrapper',
            children: [
              AutoRoute(
                  initial: true,
                  page: SearchBeneficiaryDeliveryRoute.page,
                  path: 'search-beneficiary'),
              AutoRoute(
                page: DeliveryBeneficiaryWrapperRoute.page,
                path: 'beneficiary',
                children: [
                  AutoRoute(
                    page: HouseholdOverviewDeliveryRoute.page,
                    path: 'overview',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryDetailsDeliveryRoute.page,
                    path: 'beneficiary-details',
                  ),
                  AutoRoute(
                    page: BeneficiaryChecklistRoute.page,
                    path: 'beneficiary-checklist',
                  ),

                  AutoRoute(
                    page: DeliverInterventionRoute.page,
                    path: 'deliver-intervention',
                  ),
                  AutoRoute(
                    page: RefusedDeliveryRoute.page,
                    path: 'refused-delivery',
                  ),
                  AutoRoute(
                    page: SideEffectsRoute.page,
                    path: 'side-effects',
                  ),
                  AutoRoute(
                    page: ReferBeneficiaryRoute.page,
                    path: 'refer-beneficiary',
                  ),
                  AutoRoute(
                    page: DoseAdministeredRoute.page,
                    path: 'dose-administered',
                  ),
                  AutoRoute(
                    page: SplashAcknowledgementRoute.page,
                    path: 'splash-acknowledgement',
                  ),
                  //  AutoRoute(
                  //   page: ReasonForDeletionRoute.page,
                  //   path: 'reason-for-deletion',
                  // ),
                  AutoRoute(
                    page: RecordPastDeliveryDetailsRoute.page,
                    path: 'record-past-delivery-details',
                  ),
                  AutoRoute(
                    page: HouseholdAcknowledgementDeliveryRoute.page,
                    path: 'household-acknowledgement',
                  ),
                  AutoRoute(
                    page: DeliverySummaryRoute.page,
                    path: 'delivery-summary',
                  ),
                ],
              ),
            ]),
      ];
}
