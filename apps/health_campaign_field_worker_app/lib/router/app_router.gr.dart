// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AcknowledgementRouteArgs>(
          orElse: () => const AcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    AttendanceDigitScannerRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDigitScannerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AttendanceDigitScannerPage(
          key: args.key,
          enableDynamicQRScanning: args.enableDynamicQRScanning,
          attendees: args.attendees,
          onScanResult: args.onScanResult,
          quantity: args.quantity,
          singleValue: args.singleValue,
          isGS1code: args.isGS1code,
        ),
      );
    },
    AuthenticatedRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticatedPageWrapper(),
      );
    },
    BeneficiariesReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BeneficiariesReportPage(),
      );
    },
    BoundarySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<BoundarySelectionRouteArgs>(
          orElse: () => const BoundarySelectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BoundarySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CurrentBoundaryRoute.name: (routeData) {
      final args = routeData.argsAs<CurrentBoundaryRouteArgs>(
          orElse: () => const CurrentBoundaryRouteArgs());
      return AutoRoutePage<BoundaryModel>(
        routeData: routeData,
        child: CurrentBoundaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          onBoundarySelected: args.onBoundarySelected,
        ),
      );
    },
    DataReceiverRoute.name: (routeData) {
      final args = routeData.argsAs<DataReceiverRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DataReceiverPage(
          key: args.key,
          connectedDevice: args.connectedDevice,
          nearbyService: args.nearbyService,
        ),
      );
    },
    DataShareHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DataShareHomePage(),
      );
    },
    DataTransferRoute.name: (routeData) {
      final args = routeData.argsAs<DataTransferRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DataTransferPage(
          key: args.key,
          nearbyService: args.nearbyService,
          connectedDevices: args.connectedDevices,
        ),
      );
    },
    DeviceChangeReasonRoute.name: (routeData) {
      final args = routeData.argsAs<DeviceChangeReasonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeviceChangeReasonPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          username: args.username,
          password: args.password,
        ),
      );
    },
    DevicesListRoute.name: (routeData) {
      final args = routeData.argsAs<DevicesListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DevicesListPage(
          key: args.key,
          deviceType: args.deviceType,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageSelectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    NonMobileUserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NonMobileUserListPage(),
      );
    },
    PeerToPeerWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PeerToPeerWrapperPage()),
      );
    },
    PermissionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PermissionsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ProjectFacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectFacilitySelectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectFacilitySelectionPage(
          key: args.key,
          projectFacilities: args.projectFacilities,
        ),
      );
    },
    ProjectSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectSelectionRouteArgs>(
          orElse: () => const ProjectSelectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    UnauthenticatedRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedPageWrapper(),
      );
    },
    UserQRDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserQRDetailsRouteArgs>(
          orElse: () => const UserQRDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserQRDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ...DigitScannerPackageRoute().pagesMap,
    ...DashboardRoute().pagesMap,
    ...SurveyFormRoute().pagesMap,
    ...TransitPostRoute().pagesMap,
    ...FormsRoute().pagesMap,
    ...FlowBuilderRoute().pagesMap,
  };
}

/// generated route for
/// [AcknowledgementPage]
class AcknowledgementRoute extends PageRouteInfo<AcknowledgementRouteArgs> {
  AcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<PageRouteInfo>? children,
  }) : super(
          AcknowledgementRoute.name,
          args: AcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'AcknowledgementRoute';

  static const PageInfo<AcknowledgementRouteArgs> page =
      PageInfo<AcknowledgementRouteArgs>(name);
}

class AcknowledgementRouteArgs {
  const AcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'AcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [AttendanceDigitScannerPage]
class AttendanceDigitScannerRoute
    extends PageRouteInfo<AttendanceDigitScannerRouteArgs> {
  AttendanceDigitScannerRoute({
    Key? key,
    required bool enableDynamicQRScanning,
    required List<AttendeeModel> attendees,
    required void Function(
      ScannedIndividualDataModel,
      AttendanceValidationResult,
    ) onScanResult,
    required int quantity,
    bool singleValue = false,
    required bool isGS1code,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceDigitScannerRoute.name,
          args: AttendanceDigitScannerRouteArgs(
            key: key,
            enableDynamicQRScanning: enableDynamicQRScanning,
            attendees: attendees,
            onScanResult: onScanResult,
            quantity: quantity,
            singleValue: singleValue,
            isGS1code: isGS1code,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDigitScannerRoute';

  static const PageInfo<AttendanceDigitScannerRouteArgs> page =
      PageInfo<AttendanceDigitScannerRouteArgs>(name);
}

class AttendanceDigitScannerRouteArgs {
  const AttendanceDigitScannerRouteArgs({
    this.key,
    required this.enableDynamicQRScanning,
    required this.attendees,
    required this.onScanResult,
    required this.quantity,
    this.singleValue = false,
    required this.isGS1code,
  });

  final Key? key;

  final bool enableDynamicQRScanning;

  final List<AttendeeModel> attendees;

  final void Function(
    ScannedIndividualDataModel,
    AttendanceValidationResult,
  ) onScanResult;

  final int quantity;

  final bool singleValue;

  final bool isGS1code;

  @override
  String toString() {
    return 'AttendanceDigitScannerRouteArgs{key: $key, enableDynamicQRScanning: $enableDynamicQRScanning, attendees: $attendees, onScanResult: $onScanResult, quantity: $quantity, singleValue: $singleValue, isGS1code: $isGS1code}';
  }
}

/// generated route for
/// [AuthenticatedPageWrapper]
class AuthenticatedRouteWrapper extends PageRouteInfo<void> {
  const AuthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BeneficiariesReportPage]
class BeneficiariesReportRoute extends PageRouteInfo<void> {
  const BeneficiariesReportRoute({List<PageRouteInfo>? children})
      : super(
          BeneficiariesReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'BeneficiariesReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BoundarySelectionPage]
class BoundarySelectionRoute extends PageRouteInfo<BoundarySelectionRouteArgs> {
  BoundarySelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          BoundarySelectionRoute.name,
          args: BoundarySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BoundarySelectionRoute';

  static const PageInfo<BoundarySelectionRouteArgs> page =
      PageInfo<BoundarySelectionRouteArgs>(name);
}

class BoundarySelectionRouteArgs {
  const BoundarySelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'BoundarySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CurrentBoundaryPage]
class CurrentBoundaryRoute extends PageRouteInfo<CurrentBoundaryRouteArgs> {
  CurrentBoundaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    dynamic Function(BuildContext)? onBoundarySelected,
    List<PageRouteInfo>? children,
  }) : super(
          CurrentBoundaryRoute.name,
          args: CurrentBoundaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            onBoundarySelected: onBoundarySelected,
          ),
          initialChildren: children,
        );

  static const String name = 'CurrentBoundaryRoute';

  static const PageInfo<CurrentBoundaryRouteArgs> page =
      PageInfo<CurrentBoundaryRouteArgs>(name);
}

class CurrentBoundaryRouteArgs {
  const CurrentBoundaryRouteArgs({
    this.key,
    this.appLocalizations,
    this.onBoundarySelected,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final dynamic Function(BuildContext)? onBoundarySelected;

  @override
  String toString() {
    return 'CurrentBoundaryRouteArgs{key: $key, appLocalizations: $appLocalizations, onBoundarySelected: $onBoundarySelected}';
  }
}

/// generated route for
/// [DataReceiverPage]
class DataReceiverRoute extends PageRouteInfo<DataReceiverRouteArgs> {
  DataReceiverRoute({
    Key? key,
    required Device connectedDevice,
    required NearbyService nearbyService,
    List<PageRouteInfo>? children,
  }) : super(
          DataReceiverRoute.name,
          args: DataReceiverRouteArgs(
            key: key,
            connectedDevice: connectedDevice,
            nearbyService: nearbyService,
          ),
          initialChildren: children,
        );

  static const String name = 'DataReceiverRoute';

  static const PageInfo<DataReceiverRouteArgs> page =
      PageInfo<DataReceiverRouteArgs>(name);
}

class DataReceiverRouteArgs {
  const DataReceiverRouteArgs({
    this.key,
    required this.connectedDevice,
    required this.nearbyService,
  });

  final Key? key;

  final Device connectedDevice;

  final NearbyService nearbyService;

  @override
  String toString() {
    return 'DataReceiverRouteArgs{key: $key, connectedDevice: $connectedDevice, nearbyService: $nearbyService}';
  }
}

/// generated route for
/// [DataShareHomePage]
class DataShareHomeRoute extends PageRouteInfo<void> {
  const DataShareHomeRoute({List<PageRouteInfo>? children})
      : super(
          DataShareHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataShareHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DataTransferPage]
class DataTransferRoute extends PageRouteInfo<DataTransferRouteArgs> {
  DataTransferRoute({
    Key? key,
    required NearbyService nearbyService,
    required List<Device> connectedDevices,
    List<PageRouteInfo>? children,
  }) : super(
          DataTransferRoute.name,
          args: DataTransferRouteArgs(
            key: key,
            nearbyService: nearbyService,
            connectedDevices: connectedDevices,
          ),
          initialChildren: children,
        );

  static const String name = 'DataTransferRoute';

  static const PageInfo<DataTransferRouteArgs> page =
      PageInfo<DataTransferRouteArgs>(name);
}

class DataTransferRouteArgs {
  const DataTransferRouteArgs({
    this.key,
    required this.nearbyService,
    required this.connectedDevices,
  });

  final Key? key;

  final NearbyService nearbyService;

  final List<Device> connectedDevices;

  @override
  String toString() {
    return 'DataTransferRouteArgs{key: $key, nearbyService: $nearbyService, connectedDevices: $connectedDevices}';
  }
}

/// generated route for
/// [DeviceChangeReasonPage]
class DeviceChangeReasonRoute
    extends PageRouteInfo<DeviceChangeReasonRouteArgs> {
  DeviceChangeReasonRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    required String username,
    required String password,
    List<PageRouteInfo>? children,
  }) : super(
          DeviceChangeReasonRoute.name,
          args: DeviceChangeReasonRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            username: username,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'DeviceChangeReasonRoute';

  static const PageInfo<DeviceChangeReasonRouteArgs> page =
      PageInfo<DeviceChangeReasonRouteArgs>(name);
}

class DeviceChangeReasonRouteArgs {
  const DeviceChangeReasonRouteArgs({
    this.key,
    this.appLocalizations,
    required this.username,
    required this.password,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final String username;

  final String password;

  @override
  String toString() {
    return 'DeviceChangeReasonRouteArgs{key: $key, appLocalizations: $appLocalizations, username: $username, password: $password}';
  }
}

/// generated route for
/// [DevicesListPage]
class DevicesListRoute extends PageRouteInfo<DevicesListRouteArgs> {
  DevicesListRoute({
    Key? key,
    required DeviceType deviceType,
    List<PageRouteInfo>? children,
  }) : super(
          DevicesListRoute.name,
          args: DevicesListRouteArgs(
            key: key,
            deviceType: deviceType,
          ),
          initialChildren: children,
        );

  static const String name = 'DevicesListRoute';

  static const PageInfo<DevicesListRouteArgs> page =
      PageInfo<DevicesListRouteArgs>(name);
}

class DevicesListRouteArgs {
  const DevicesListRouteArgs({
    this.key,
    required this.deviceType,
  });

  final Key? key;

  final DeviceType deviceType;

  @override
  String toString() {
    return 'DevicesListRouteArgs{key: $key, deviceType: $deviceType}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute({List<PageRouteInfo>? children})
      : super(
          LanguageSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [NonMobileUserListPage]
class NonMobileUserListRoute extends PageRouteInfo<void> {
  const NonMobileUserListRoute({List<PageRouteInfo>? children})
      : super(
          NonMobileUserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonMobileUserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PeerToPeerWrapperPage]
class PeerToPeerWrapperRoute extends PageRouteInfo<void> {
  const PeerToPeerWrapperRoute({List<PageRouteInfo>? children})
      : super(
          PeerToPeerWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PeerToPeerWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PermissionsPage]
class PermissionsRoute extends PageRouteInfo<void> {
  const PermissionsRoute({List<PageRouteInfo>? children})
      : super(
          PermissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PermissionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ProjectFacilitySelectionPage]
class ProjectFacilitySelectionRoute
    extends PageRouteInfo<ProjectFacilitySelectionRouteArgs> {
  ProjectFacilitySelectionRoute({
    Key? key,
    required List<ProjectFacilityModel> projectFacilities,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectFacilitySelectionRoute.name,
          args: ProjectFacilitySelectionRouteArgs(
            key: key,
            projectFacilities: projectFacilities,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectFacilitySelectionRoute';

  static const PageInfo<ProjectFacilitySelectionRouteArgs> page =
      PageInfo<ProjectFacilitySelectionRouteArgs>(name);
}

class ProjectFacilitySelectionRouteArgs {
  const ProjectFacilitySelectionRouteArgs({
    this.key,
    required this.projectFacilities,
  });

  final Key? key;

  final List<ProjectFacilityModel> projectFacilities;

  @override
  String toString() {
    return 'ProjectFacilitySelectionRouteArgs{key: $key, projectFacilities: $projectFacilities}';
  }
}

/// generated route for
/// [ProjectSelectionPage]
class ProjectSelectionRoute extends PageRouteInfo<ProjectSelectionRouteArgs> {
  ProjectSelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectSelectionRoute.name,
          args: ProjectSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectSelectionRoute';

  static const PageInfo<ProjectSelectionRouteArgs> page =
      PageInfo<ProjectSelectionRouteArgs>(name);
}

class ProjectSelectionRouteArgs {
  const ProjectSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProjectSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [UnauthenticatedPageWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserQRDetailsPage]
class UserQRDetailsRoute extends PageRouteInfo<UserQRDetailsRouteArgs> {
  UserQRDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          UserQRDetailsRoute.name,
          args: UserQRDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'UserQRDetailsRoute';

  static const PageInfo<UserQRDetailsRouteArgs> page =
      PageInfo<UserQRDetailsRouteArgs>(name);
}

class UserQRDetailsRouteArgs {
  const UserQRDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'UserQRDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
