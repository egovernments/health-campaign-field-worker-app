import 'package:auto_route/auto_route.dart';

import 'digit_scanner_router.gm.dart';

@AutoRouterConfig.module()
class DigitScannerPackageRoute extends $DigitScannerPackageRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    AutoRoute(
      page: DigitScannerRoute.page,
      path: 'digit-scanner',
    ),
  ];
}
