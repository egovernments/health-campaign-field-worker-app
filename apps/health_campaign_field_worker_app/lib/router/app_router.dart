import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../blocs/localization/app_localization.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/boundary_selection.dart';
import '../pages/home.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/non_mobile_user/non_mobile_user_list.dart';
import '../pages/peer_to_peer/data_receiver.dart';
import '../pages/peer_to_peer/data_share_home.dart';
import '../pages/peer_to_peer/data_transfer.dart';
import '../pages/peer_to_peer/devices_list.dart';
import '../pages/peer_to_peer/peer_to_peer_wrapper.dart';
import '../pages/profile.dart';
import '../pages/project_facility_selection.dart';
import '../pages/project_selection.dart';
import '../pages/qr_details_page.dart';
import '../pages/reports/beneficiary/beneficaries_report.dart';
import '../pages/unauthenticated.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  // INFO : Need to add the router modules here
  modules: [],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: UnauthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(
          page: LanguageSelectionRoute.page,
          path: 'language_selection',
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page, path: 'login'),
      ],
    ),
    AutoRoute(
      page: AuthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: UserQRDetailsRoute.page, path: 'user-qr-code'),
        AutoRoute(
          page: BeneficiariesReportRoute.page,
          path: 'beneficiary-downsync-report',
        ),

        // NonMobile User
        AutoRoute(
          page: NonMobileUserListRoute.page,
          path: 'non-mobile-users',
        ),
        // DSS Dashboard Routes
        AutoRoute(
          page: UserDashboardRoute.page,
          path: 'dashboard',
        ),

        AutoRoute(page: AcknowledgementRoute.page, path: 'acknowledgement'),

        AutoRoute(
          page: ProjectFacilitySelectionRoute.page,
          path: 'select-project-facilities',
        ),

        /// Project Selection
        AutoRoute(
          page: ProjectSelectionRoute.page,
          path: 'select-project',
          initial: true,
        ),

        /// Boundary Selection
        AutoRoute(
          page: BoundarySelectionRoute.page,
          path: 'select-boundary',
        ),
        AutoRoute(
          page: DataShareHomeRoute.page,
          path: 'data-share-home',
        ),
        AutoRoute(
            page: PeerToPeerWrapperRoute.page,
            path: 'peer-to-peer-wrapper',
            children: [
              AutoRoute(
                  page: DevicesListRoute.page,
                  path: 'devices-list',
                  initial: true),
              AutoRoute(page: DataTransferRoute.page, path: 'data-transfer'),
              AutoRoute(page: DataReceiverRoute.page, path: 'data-receiver'),
            ]),
      ],
    )
  ];
}
