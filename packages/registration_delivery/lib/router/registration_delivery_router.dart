import 'package:auto_route/auto_route.dart';

import 'registration_delivery_router.gm.dart';

@AutoRouterConfig.module()
class RegistrationDeliveryRoute extends $RegistrationDeliveryRoute {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [];
}
