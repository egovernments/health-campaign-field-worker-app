import 'package:auto_route/auto_route.dart';

import 'digit_scanner_router.gr.dart';

export 'digit_scanner_router.gr.dart';

@AutoRouterConfig()
class DigitScannerPackageRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: DigitScannerRoute.page,
      path: 'digit-scanner',
    ),
  ];
}
