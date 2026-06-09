// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AcknowledgementRouteArgs>(
        orElse: () => const AcknowledgementRouteArgs(),
      );
      return AcknowledgementPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        isDataRecordSuccess: args.isDataRecordSuccess,
        label: args.label,
        description: args.description,
        descriptionTableData: args.descriptionTableData,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AcknowledgementRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        isDataRecordSuccess == other.isDataRecordSuccess &&
        label == other.label &&
        description == other.description &&
        const MapEquality<String, dynamic>().equals(
          descriptionTableData,
          other.descriptionTableData,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      isDataRecordSuccess.hashCode ^
      label.hashCode ^
      description.hashCode ^
      const MapEquality<String, dynamic>().hash(descriptionTableData);
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
    )
    onScanResult,
    int quantity = 1,
    bool singleValue = false,
    bool isGS1code = false,
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceDigitScannerRouteArgs>();
      return AttendanceDigitScannerPage(
        key: args.key,
        enableDynamicQRScanning: args.enableDynamicQRScanning,
        attendees: args.attendees,
        onScanResult: args.onScanResult,
        quantity: args.quantity,
        singleValue: args.singleValue,
        isGS1code: args.isGS1code,
      );
    },
  );
}

class AttendanceDigitScannerRouteArgs {
  const AttendanceDigitScannerRouteArgs({
    this.key,
    required this.enableDynamicQRScanning,
    required this.attendees,
    required this.onScanResult,
    this.quantity = 1,
    this.singleValue = false,
    this.isGS1code = false,
  });

  final Key? key;

  final bool enableDynamicQRScanning;

  final List<AttendeeModel> attendees;

  final void Function(ScannedIndividualDataModel, AttendanceValidationResult)
  onScanResult;

  final int quantity;

  final bool singleValue;

  final bool isGS1code;

  @override
  String toString() {
    return 'AttendanceDigitScannerRouteArgs{key: $key, enableDynamicQRScanning: $enableDynamicQRScanning, attendees: $attendees, onScanResult: $onScanResult, quantity: $quantity, singleValue: $singleValue, isGS1code: $isGS1code}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AttendanceDigitScannerRouteArgs) return false;
    return key == other.key &&
        enableDynamicQRScanning == other.enableDynamicQRScanning &&
        const ListEquality<AttendeeModel>().equals(
          attendees,
          other.attendees,
        ) &&
        quantity == other.quantity &&
        singleValue == other.singleValue &&
        isGS1code == other.isGS1code;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      enableDynamicQRScanning.hashCode ^
      const ListEquality<AttendeeModel>().hash(attendees) ^
      quantity.hashCode ^
      singleValue.hashCode ^
      isGS1code.hashCode;
}

/// generated route for
/// [AuthenticatedPageWrapper]
class AuthenticatedRouteWrapper extends PageRouteInfo<void> {
  const AuthenticatedRouteWrapper({List<PageRouteInfo>? children})
    : super(AuthenticatedRouteWrapper.name, initialChildren: children);

  static const String name = 'AuthenticatedRouteWrapper';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticatedPageWrapper();
    },
  );
}

/// generated route for
/// [BeneficiariesReportPage]
class BeneficiariesReportRoute extends PageRouteInfo<void> {
  const BeneficiariesReportRoute({List<PageRouteInfo>? children})
    : super(BeneficiariesReportRoute.name, initialChildren: children);

  static const String name = 'BeneficiariesReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BeneficiariesReportPage();
    },
  );
}

/// generated route for
/// [BeneficiaryIdDownSyncPage]
class BeneficiaryIdDownSyncRoute
    extends PageRouteInfo<BeneficiaryIdDownSyncRouteArgs> {
  BeneficiaryIdDownSyncRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
         BeneficiaryIdDownSyncRoute.name,
         args: BeneficiaryIdDownSyncRouteArgs(
           key: key,
           appLocalizations: appLocalizations,
         ),
         initialChildren: children,
       );

  static const String name = 'BeneficiaryIdDownSyncRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BeneficiaryIdDownSyncRouteArgs>(
        orElse: () => const BeneficiaryIdDownSyncRouteArgs(),
      );
      return BeneficiaryIdDownSyncPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class BeneficiaryIdDownSyncRouteArgs {
  const BeneficiaryIdDownSyncRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryIdDownSyncRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BeneficiaryIdDownSyncRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BoundarySelectionRouteArgs>(
        orElse: () => const BoundarySelectionRouteArgs(),
      );
      return BoundarySelectionPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class BoundarySelectionRouteArgs {
  const BoundarySelectionRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'BoundarySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BoundarySelectionRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CurrentBoundaryRouteArgs>(
        orElse: () => const CurrentBoundaryRouteArgs(),
      );
      return CurrentBoundaryPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        onBoundarySelected: args.onBoundarySelected,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CurrentBoundaryRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DataReceiverRouteArgs>();
      return DataReceiverPage(
        key: args.key,
        connectedDevice: args.connectedDevice,
        nearbyService: args.nearbyService,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DataReceiverRouteArgs) return false;
    return key == other.key &&
        connectedDevice == other.connectedDevice &&
        nearbyService == other.nearbyService;
  }

  @override
  int get hashCode =>
      key.hashCode ^ connectedDevice.hashCode ^ nearbyService.hashCode;
}

/// generated route for
/// [DataShareHomePage]
class DataShareHomeRoute extends PageRouteInfo<void> {
  const DataShareHomeRoute({List<PageRouteInfo>? children})
    : super(DataShareHomeRoute.name, initialChildren: children);

  static const String name = 'DataShareHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DataShareHomePage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DataTransferRouteArgs>();
      return DataTransferPage(
        key: args.key,
        nearbyService: args.nearbyService,
        connectedDevices: args.connectedDevices,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DataTransferRouteArgs) return false;
    return key == other.key &&
        nearbyService == other.nearbyService &&
        const ListEquality<Device>().equals(
          connectedDevices,
          other.connectedDevices,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      nearbyService.hashCode ^
      const ListEquality<Device>().hash(connectedDevices);
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DeviceChangeReasonRouteArgs>();
      return DeviceChangeReasonPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        username: args.username,
        password: args.password,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DeviceChangeReasonRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      username.hashCode ^
      password.hashCode;
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
         args: DevicesListRouteArgs(key: key, deviceType: deviceType),
         initialChildren: children,
       );

  static const String name = 'DevicesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DevicesListRouteArgs>();
      return DevicesListPage(key: args.key, deviceType: args.deviceType);
    },
  );
}

class DevicesListRouteArgs {
  const DevicesListRouteArgs({this.key, required this.deviceType});

  final Key? key;

  final DeviceType deviceType;

  @override
  String toString() {
    return 'DevicesListRouteArgs{key: $key, deviceType: $deviceType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DevicesListRouteArgs) return false;
    return key == other.key && deviceType == other.deviceType;
  }

  @override
  int get hashCode => key.hashCode ^ deviceType.hashCode;
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
         args: HomeRouteArgs(key: key, appLocalizations: appLocalizations),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomePage(key: args.key, appLocalizations: args.appLocalizations);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}

/// generated route for
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute({List<PageRouteInfo>? children})
    : super(LanguageSelectionRoute.name, initialChildren: children);

  static const String name = 'LanguageSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageSelectionPage();
    },
  );
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
         args: LoginRouteArgs(key: key, appLocalizations: appLocalizations),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginPage(key: args.key, appLocalizations: args.appLocalizations);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}

/// generated route for
/// [NonMobileUserListPage]
class NonMobileUserListRoute extends PageRouteInfo<void> {
  const NonMobileUserListRoute({List<PageRouteInfo>? children})
    : super(NonMobileUserListRoute.name, initialChildren: children);

  static const String name = 'NonMobileUserListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NonMobileUserListPage();
    },
  );
}

/// generated route for
/// [PeerToPeerWrapperPage]
class PeerToPeerWrapperRoute extends PageRouteInfo<void> {
  const PeerToPeerWrapperRoute({List<PageRouteInfo>? children})
    : super(PeerToPeerWrapperRoute.name, initialChildren: children);

  static const String name = 'PeerToPeerWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PeerToPeerWrapperPage());
    },
  );
}

/// generated route for
/// [PermissionsPage]
class PermissionsRoute extends PageRouteInfo<void> {
  const PermissionsRoute({List<PageRouteInfo>? children})
    : super(PermissionsRoute.name, initialChildren: children);

  static const String name = 'PermissionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PermissionsPage();
    },
  );
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
         args: ProfileRouteArgs(key: key, appLocalizations: appLocalizations),
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>(
        orElse: () => const ProfileRouteArgs(),
      );
      return ProfilePage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectFacilitySelectionRouteArgs>();
      return ProjectFacilitySelectionPage(
        key: args.key,
        projectFacilities: args.projectFacilities,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectFacilitySelectionRouteArgs) return false;
    return key == other.key &&
        const ListEquality<ProjectFacilityModel>().equals(
          projectFacilities,
          other.projectFacilities,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality<ProjectFacilityModel>().hash(projectFacilities);
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectSelectionRouteArgs>(
        orElse: () => const ProjectSelectionRouteArgs(),
      );
      return ProjectSelectionPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class ProjectSelectionRouteArgs {
  const ProjectSelectionRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProjectSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectSelectionRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}

/// generated route for
/// [UnauthenticatedPageWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
    : super(UnauthenticatedRouteWrapper.name, initialChildren: children);

  static const String name = 'UnauthenticatedRouteWrapper';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnauthenticatedPageWrapper();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserQRDetailsRouteArgs>(
        orElse: () => const UserQRDetailsRouteArgs(),
      );
      return UserQRDetailsPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class UserQRDetailsRouteArgs {
  const UserQRDetailsRouteArgs({this.key, this.appLocalizations});

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'UserQRDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserQRDetailsRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}
