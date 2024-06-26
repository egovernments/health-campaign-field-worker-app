import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:auto_route/auto_route.dart';

import '../pages/household_extension.dart';

export 'package:auto_route/auto_route.dart';

part 'custom_router.gr.dart';

@AutoRouterConfig.module()
class CustomRoute extends RegistrationDeliveryRoute {
  @override
  static List<AutoRoute> get routes {
    // Get the existing routes from the super class
    var existingRoutes = [
      AutoRoute(
          page: RegistrationDeliveryWrapperRoute.page,
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
                  page: CustomHouseHoldLocationRoute.page,
                  path: 'household-location',
                  initial: true,
                ),
                AutoRoute(
                  page: BeneficiaryAcknowledgementRoute.page,
                  path: 'beneficiary-acknowledgement',
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
                  page: DeliverInterventionRoute.page,
                  path: 'deliver-intervention',
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
                AutoRoute(
                  page: ReasonForDeletionRoute.page,
                  path: 'reason-for-deletion',
                ),
                AutoRoute(
                  page: RecordPastDeliveryDetailsRoute.page,
                  path: 'record-past-delivery-details',
                ),
                AutoRoute(
                  page: HouseholdAcknowledgementRoute.page,
                  path: 'household-acknowledgement',
                ),
              ],
            ),
          ])
    ];
    return existingRoutes;
  }
}
