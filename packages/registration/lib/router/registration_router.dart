import 'package:auto_route/auto_route.dart';

import 'registration_router.gm.dart';

@AutoRouterConfig.module()
class RegistrationRoute extends $RegistrationRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
        AutoRoute(
            page: RegistrationWrapperRoute.page,
            path: 'registration-delivery-wrapper',
            children: [
              AutoRoute(
                  initial: true,
                  page: SearchBeneficiaryRoute.page,
                  path: 'search-beneficiary'),

              /// Beneficiary Registration
              AutoRoute(
                page: BeneficiaryRegistrationWrapperRoute.page,
                path: 'beneficiary-registration',
                children: [
                  AutoRoute(
                      page: IndividualDetailsRoute.page,
                      path: 'individual-details'),
                  AutoRoute(
                      page: HouseHoldDetailsRoute.page,
                      path: 'household-details'),
                  AutoRoute(
                      page: HouseDetailsRoute.page, path: 'house-details'),
                  AutoRoute(
                    page: HouseholdLocationRoute.page,
                    path: 'household-location',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryAcknowledgementRoute.page,
                    path: 'beneficiary-acknowledgement',
                  ),
                  AutoRoute(
                    page: SummaryRoute.page,
                    path: 'beneficiary-summary',
                  ),
                ],
              ),
              AutoRoute(
                page: BeneficiaryWrapperRoute.page,
                path: 'beneficiary',
                children: [
                  AutoRoute(
                    page: HouseholdOverviewRoute.page,
                    path: 'overview',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryDetailsRoute.page,
                    path: 'beneficiary-details',
                  ),
                  AutoRoute(
                    page: ReasonForDeletionRoute.page,
                    path: 'reason-for-deletion',
                  ),
                  AutoRoute(
                    page: HouseholdAcknowledgementRoute.page,
                    path: 'household-acknowledgement',
                  ),
                ],
              ),
            ]),
      ];
}
