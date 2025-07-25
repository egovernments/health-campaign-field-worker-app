import 'package:attendance_management/router/attendance_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:closed_household/router/closed_household_router.dart';
import 'package:complaints/router/complaints_router.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/router/dashboard_router.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:digit_forms_engine/router/forms_router.dart';
import 'package:digit_scanner/router/digit_scanner_router.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.dart';
import 'package:registration_delivery/router/registration_delivery_router.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:survey_form/router/survey_form_router.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';
import 'package:transit_post/router/transit_post_router.dart';

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
  modules: [
    InventoryRoute,
    AttendanceRoute,
    ReferralReconciliationRoute,
    DigitScannerPackageRoute,
    RegistrationDeliveryRoute,
    ClosedHouseholdPackageRoute,
    DashboardRoute,
    SurveyFormRoute,
    ComplaintsRoute,
    TransitPostRoute,
    FormsRoute,
  ],
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
        AutoRoute(page: DigitScannerRoute.page, path: 'scanner'),
      ],
    ),
    AutoRoute(
      page: AuthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: UserQRDetailsRoute.page, path: 'user-qr-code'),
        AutoRoute(page: DigitScannerRoute.page, path: 'scanner'),
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
        ...RegistrationDeliveryRoute().routes,

        /// close household
        ...ClosedHouseholdPackageRoute().routes,

        AutoRoute(
            page: SurveyFormWrapperRoute.page,
            path: 'surveyForm',
            children: [
              AutoRoute(
                page: SurveyformRoute.page,
                path: '',
              ),
              AutoRoute(
                  page: SurveyFormBoundaryViewRoute.page,
                  path: 'view-boundary'),
              AutoRoute(page: SurveyFormViewRoute.page, path: 'view'),
              AutoRoute(page: SurveyFormPreviewRoute.page, path: 'preview'),
              AutoRoute(
                  page: SurveyFormAcknowledgementRoute.page,
                  path: 'surveyForm-acknowledgement'),
            ]),
        AutoRoute(
          page: BeneficiaryAcknowledgementRoute.page,
          path: 'beneficiary-acknowledgement',
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

        // INFO : Need to add Router of package Here
        AutoRoute(
          page: ComplaintsInboxWrapperRoute.page,
          path: 'complaints-inbox',
          children: [
            AutoRoute(
              page: ComplaintsInboxRoute.page,
              path: 'complaints-inbox-items',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsInboxFilterRoute.page,
              path: 'complaints-inbox-filter',
            ),
            AutoRoute(
              page: ComplaintsInboxSearchRoute.page,
              path: 'complaints-inbox-search',
            ),
            AutoRoute(
              page: ComplaintsInboxSortRoute.page,
              path: 'complaints-inbox-sort',
            ),
            AutoRoute(
              page: ComplaintsDetailsViewRoute.page,
              path: 'complaints-inbox-view-details',
            ),
          ],
        ),

        /// Complaints registration
        AutoRoute(
          page: ComplaintsRegistrationWrapperRoute.page,
          path: 'complaints-registration',
          children: [
            AutoRoute(
              page: ComplaintTypeRoute.page,
              path: 'complaints-type',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsLocationRoute.page,
              path: 'complaints-location',
            ),
            AutoRoute(
              page: ComplaintsDetailsRoute.page,
              path: 'complaints-details',
            ),
          ],
        ),

        /// Complaints Acknowledgemnet
        AutoRoute(
          page: ComplaintsAcknowledgementRoute.page,
          path: 'complaints-acknowledgement',
        ),

        // Attendance Route
        ...AttendanceRoute().routes,

        //Inventory Route
        ...InventoryRoute().routes,

        // Referral Reconciliation Route
        ...ReferralReconciliationRoute().routes,

        // Forms Route
        ...FormsRoute().routes,

        ...TransitPostRoute().routes,

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
