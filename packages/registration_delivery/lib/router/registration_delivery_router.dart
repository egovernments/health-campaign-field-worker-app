import 'package:auto_route/auto_route.dart';
import 'package:digit_forms_engine/router/forms_router.dart';

import 'registration_delivery_router.gm.dart';

@AutoRouterConfig.module()
class RegistrationDeliveryRoute extends $RegistrationDeliveryRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
        AutoRoute(
            page: RegistrationDeliveryWrapperRoute.page,
            path: 'registration-delivery-wrapper',
            children: [
              ...FormsRoute().routes,
              AutoRoute(
                  initial: true,
                  page: SearchBeneficiaryRoute.page,
                  path: 'search-beneficiary'),
              AutoRoute(
                page: BeneficiaryErrorRoute.page,
                path: 'beneficiary-error',
              ),
              AutoRoute(
                page: BeneficiaryAcknowledgementRoute.page,
                path: 'beneficiary-acknowledgement',
              ),
              AutoRoute(
                page: HouseholdOverviewRoute.page,
                path: 'overview',
              ),
              AutoRoute(
                page: BeneficiaryDetailsRoute.page,
                path: 'beneficiary-details',
              ),
              AutoRoute(
                page: HouseholdAcknowledgementRoute.page,
                path: 'household-acknowledgement',
              ),
            ]),
        AutoRoute(page: BeneficiaryIdDownSyncRoute.page)
      ];
}
