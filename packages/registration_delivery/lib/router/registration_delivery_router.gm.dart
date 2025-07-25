// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:digit_data_model/data_model.dart' as _i31;
import 'package:flutter/foundation.dart' as _i30;
import 'package:flutter/material.dart' as _i28;
import 'package:registration_delivery/blocs/app_localization.dart' as _i29;
import 'package:registration_delivery/blocs/search_households/search_households.dart'
    as _i33;
import 'package:registration_delivery/models/entities/task.dart' as _i34;
import 'package:registration_delivery/pages/beneficiary/beneficiary_checklist.dart'
    as _i2;
import 'package:registration_delivery/pages/beneficiary/beneficiary_details.dart'
    as _i3;
import 'package:registration_delivery/pages/beneficiary/beneficiary_id_downsync.dart'
    as _i4;
import 'package:registration_delivery/pages/beneficiary/beneficiary_wrapper.dart'
    as _i6;
import 'package:registration_delivery/pages/beneficiary/deliver_intervention.dart'
    as _i7;
import 'package:registration_delivery/pages/beneficiary/delivery_summary_page.dart'
    as _i8;
import 'package:registration_delivery/pages/beneficiary/dose_administered.dart'
    as _i9;
import 'package:registration_delivery/pages/beneficiary/facility_selection.dart'
    as _i10;
import 'package:registration_delivery/pages/beneficiary/household_overview.dart'
    as _i15;
import 'package:registration_delivery/pages/beneficiary/parent_overview.dart'
    as _i17;
import 'package:registration_delivery/pages/beneficiary/record_past_delivery_details.dart'
    as _i19;
import 'package:registration_delivery/pages/beneficiary/refer_beneficiary.dart'
    as _i20;
import 'package:registration_delivery/pages/beneficiary/refused_delivery.dart'
    as _i21;
import 'package:registration_delivery/pages/beneficiary/side_effects.dart'
    as _i24;
import 'package:registration_delivery/pages/beneficiary/widgets/household_acknowledgement.dart'
    as _i13;
import 'package:registration_delivery/pages/beneficiary/widgets/splash_acknowledgement.dart'
    as _i25;
import 'package:registration_delivery/pages/beneficiary_registration/beneficiary_acknowledgement.dart'
    as _i1;
import 'package:registration_delivery/pages/beneficiary_registration/beneficiary_registration_wrapper.dart'
    as _i5;
import 'package:registration_delivery/pages/beneficiary_registration/house_details.dart'
    as _i11;
import 'package:registration_delivery/pages/beneficiary_registration/household_details.dart'
    as _i12;
import 'package:registration_delivery/pages/beneficiary_registration/household_location.dart'
    as _i14;
import 'package:registration_delivery/pages/beneficiary_registration/individual_details.dart'
    as _i16;
import 'package:registration_delivery/pages/reason_for_deletion.dart' as _i18;
import 'package:registration_delivery/pages/registration_delivery_wrapper.dart'
    as _i22;
import 'package:registration_delivery/pages/search_beneficiary.dart' as _i23;
import 'package:registration_delivery/pages/summary_page.dart' as _i26;
import 'package:registration_delivery/registration_delivery.dart' as _i32;

abstract class $RegistrationDeliveryRoute extends _i27.AutoRouterModule {
  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    BeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const BeneficiaryAcknowledgementRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BeneficiaryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    BeneficiaryChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryChecklistRouteArgs>(
          orElse: () => const BeneficiaryChecklistRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BeneficiaryChecklistPage(
          key: args.key,
          beneficiaryClientRefId: args.beneficiaryClientRefId,
          beneficiaryAddress: args.beneficiaryAddress,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDetailsRouteArgs>(
          orElse: () => const BeneficiaryDetailsRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BeneficiaryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryIdDownSyncRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryIdDownSyncRouteArgs>(
          orElse: () => const BeneficiaryIdDownSyncRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BeneficiaryIdDownSyncPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryRegistrationWrapperRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i5.BeneficiaryRegistrationWrapperPage(
          key: args.key,
          initialState: args.initialState,
        )),
      );
    },
    BeneficiaryWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryWrapperRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.BeneficiaryWrapperPage(
          key: args.key,
          wrapper: args.wrapper,
          isEditing: args.isEditing,
        ),
      );
    },
    DeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverInterventionRouteArgs>(
          orElse: () => const DeliverInterventionRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    DeliverySummaryRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverySummaryRouteArgs>(
          orElse: () => const DeliverySummaryRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeliverySummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DoseAdministeredRoute.name: (routeData) {
      final args = routeData.argsAs<DoseAdministeredRouteArgs>(
          orElse: () => const DoseAdministeredRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DoseAdministeredPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    FacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<FacilitySelectionRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.FacilitySelectionPage(
          key: args.key,
          facilities: args.facilities,
        ),
      );
    },
    HouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseDetailsRouteArgs>(
          orElse: () => const HouseDetailsRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.HouseDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseHoldDetailsRouteArgs>(
          orElse: () => const HouseHoldDetailsRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.HouseHoldDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementRouteArgs>(
          orElse: () => const HouseholdAcknowledgementRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.HouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    HouseholdLocationRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdLocationRouteArgs>(
          orElse: () => const HouseholdLocationRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.HouseholdLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewRouteArgs>(
          orElse: () => const HouseholdOverviewRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    IndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualDetailsRouteArgs>(
          orElse: () => const IndividualDetailsRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.IndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
          parentClientReferenceId: args.parentClientReferenceId,
        ),
      );
    },
    ParentOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<ParentOverviewRouteArgs>(
          orElse: () => const ParentOverviewRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ParentOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReasonForDeletionRoute.name: (routeData) {
      final args = routeData.argsAs<ReasonForDeletionRouteArgs>(
          orElse: () => const ReasonForDeletionRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.ReasonForDeletionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHousholdDelete: args.isHousholdDelete,
        ),
      );
    },
    RecordPastDeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordPastDeliveryDetailsRouteArgs>(
          orElse: () => const RecordPastDeliveryDetailsRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.RecordPastDeliveryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
        ),
      );
    },
    ReferBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReferBeneficiaryRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.ReferBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          projectBeneficiaryClientRefId: args.projectBeneficiaryClientRefId,
        ),
      );
    },
    RefusedDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<RefusedDeliveryRouteArgs>(
          orElse: () => const RefusedDeliveryRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.RefusedDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    RegistrationDeliveryWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.RegistrationDeliveryWrapperPage(),
      );
    },
    SearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryRouteArgs>(
          orElse: () => const SearchBeneficiaryRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SearchBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SideEffectsRoute.name: (routeData) {
      final args = routeData.argsAs<SideEffectsRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.SideEffectsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
          isEditing: args.isEditing,
        ),
      );
    },
    SplashAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<SplashAcknowledgementRouteArgs>(
          orElse: () => const SplashAcknowledgementRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SplashAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableBackToSearch: args.enableBackToSearch,
        ),
      );
    },
    SummaryRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryRouteArgs>(
          orElse: () => const SummaryRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.SummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BeneficiaryAcknowledgementPage]
class BeneficiaryAcknowledgementRoute
    extends _i27.PageRouteInfo<BeneficiaryAcknowledgementRouteArgs> {
  BeneficiaryAcknowledgementRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryAcknowledgementRoute.name,
          args: BeneficiaryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryAcknowledgementRoute';

  static const _i27.PageInfo<BeneficiaryAcknowledgementRouteArgs> page =
      _i27.PageInfo<BeneficiaryAcknowledgementRouteArgs>(name);
}

class BeneficiaryAcknowledgementRouteArgs {
  const BeneficiaryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'BeneficiaryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i2.BeneficiaryChecklistPage]
class BeneficiaryChecklistRoute
    extends _i27.PageRouteInfo<BeneficiaryChecklistRouteArgs> {
  BeneficiaryChecklistRoute({
    _i30.Key? key,
    String? beneficiaryClientRefId,
    _i31.AddressModel? beneficiaryAddress,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryChecklistRoute.name,
          args: BeneficiaryChecklistRouteArgs(
            key: key,
            beneficiaryClientRefId: beneficiaryClientRefId,
            beneficiaryAddress: beneficiaryAddress,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryChecklistRoute';

  static const _i27.PageInfo<BeneficiaryChecklistRouteArgs> page =
      _i27.PageInfo<BeneficiaryChecklistRouteArgs>(name);
}

class BeneficiaryChecklistRouteArgs {
  const BeneficiaryChecklistRouteArgs({
    this.key,
    this.beneficiaryClientRefId,
    this.beneficiaryAddress,
    this.appLocalizations,
  });

  final _i30.Key? key;

  final String? beneficiaryClientRefId;

  final _i31.AddressModel? beneficiaryAddress;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryChecklistRouteArgs{key: $key, beneficiaryClientRefId: $beneficiaryClientRefId, beneficiaryAddress: $beneficiaryAddress, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.BeneficiaryDetailsPage]
class BeneficiaryDetailsRoute
    extends _i27.PageRouteInfo<BeneficiaryDetailsRouteArgs> {
  BeneficiaryDetailsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryDetailsRoute.name,
          args: BeneficiaryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDetailsRoute';

  static const _i27.PageInfo<BeneficiaryDetailsRouteArgs> page =
      _i27.PageInfo<BeneficiaryDetailsRouteArgs>(name);
}

class BeneficiaryDetailsRouteArgs {
  const BeneficiaryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.BeneficiaryIdDownSyncPage]
class BeneficiaryIdDownSyncRoute
    extends _i27.PageRouteInfo<BeneficiaryIdDownSyncRouteArgs> {
  BeneficiaryIdDownSyncRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryIdDownSyncRoute.name,
          args: BeneficiaryIdDownSyncRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryIdDownSyncRoute';

  static const _i27.PageInfo<BeneficiaryIdDownSyncRouteArgs> page =
      _i27.PageInfo<BeneficiaryIdDownSyncRouteArgs>(name);
}

class BeneficiaryIdDownSyncRouteArgs {
  const BeneficiaryIdDownSyncRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryIdDownSyncRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.BeneficiaryRegistrationWrapperPage]
class BeneficiaryRegistrationWrapperRoute
    extends _i27.PageRouteInfo<BeneficiaryRegistrationWrapperRouteArgs> {
  BeneficiaryRegistrationWrapperRoute({
    _i28.Key? key,
    required _i32.BeneficiaryRegistrationState initialState,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryRegistrationWrapperRoute.name,
          args: BeneficiaryRegistrationWrapperRouteArgs(
            key: key,
            initialState: initialState,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryRegistrationWrapperRoute';

  static const _i27.PageInfo<BeneficiaryRegistrationWrapperRouteArgs> page =
      _i27.PageInfo<BeneficiaryRegistrationWrapperRouteArgs>(name);
}

class BeneficiaryRegistrationWrapperRouteArgs {
  const BeneficiaryRegistrationWrapperRouteArgs({
    this.key,
    required this.initialState,
  });

  final _i28.Key? key;

  final _i32.BeneficiaryRegistrationState initialState;

  @override
  String toString() {
    return 'BeneficiaryRegistrationWrapperRouteArgs{key: $key, initialState: $initialState}';
  }
}

/// generated route for
/// [_i6.BeneficiaryWrapperPage]
class BeneficiaryWrapperRoute
    extends _i27.PageRouteInfo<BeneficiaryWrapperRouteArgs> {
  BeneficiaryWrapperRoute({
    _i28.Key? key,
    required _i33.HouseholdMemberWrapper wrapper,
    bool isEditing = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BeneficiaryWrapperRoute.name,
          args: BeneficiaryWrapperRouteArgs(
            key: key,
            wrapper: wrapper,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryWrapperRoute';

  static const _i27.PageInfo<BeneficiaryWrapperRouteArgs> page =
      _i27.PageInfo<BeneficiaryWrapperRouteArgs>(name);
}

class BeneficiaryWrapperRouteArgs {
  const BeneficiaryWrapperRouteArgs({
    this.key,
    required this.wrapper,
    this.isEditing = false,
  });

  final _i28.Key? key;

  final _i33.HouseholdMemberWrapper wrapper;

  final bool isEditing;

  @override
  String toString() {
    return 'BeneficiaryWrapperRouteArgs{key: $key, wrapper: $wrapper, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i7.DeliverInterventionPage]
class DeliverInterventionRoute
    extends _i27.PageRouteInfo<DeliverInterventionRouteArgs> {
  DeliverInterventionRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool isEditing = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          DeliverInterventionRoute.name,
          args: DeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliverInterventionRoute';

  static const _i27.PageInfo<DeliverInterventionRouteArgs> page =
      _i27.PageInfo<DeliverInterventionRouteArgs>(name);
}

class DeliverInterventionRouteArgs {
  const DeliverInterventionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'DeliverInterventionRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i8.DeliverySummaryPage]
class DeliverySummaryRoute
    extends _i27.PageRouteInfo<DeliverySummaryRouteArgs> {
  DeliverySummaryRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          DeliverySummaryRoute.name,
          args: DeliverySummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliverySummaryRoute';

  static const _i27.PageInfo<DeliverySummaryRouteArgs> page =
      _i27.PageInfo<DeliverySummaryRouteArgs>(name);
}

class DeliverySummaryRouteArgs {
  const DeliverySummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'DeliverySummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i9.DoseAdministeredPage]
class DoseAdministeredRoute
    extends _i27.PageRouteInfo<DoseAdministeredRouteArgs> {
  DoseAdministeredRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          DoseAdministeredRoute.name,
          args: DoseAdministeredRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DoseAdministeredRoute';

  static const _i27.PageInfo<DoseAdministeredRouteArgs> page =
      _i27.PageInfo<DoseAdministeredRouteArgs>(name);
}

class DoseAdministeredRouteArgs {
  const DoseAdministeredRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'DoseAdministeredRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i10.FacilitySelectionPage]
class FacilitySelectionRoute
    extends _i27.PageRouteInfo<FacilitySelectionRouteArgs> {
  FacilitySelectionRoute({
    _i28.Key? key,
    required List<_i31.FacilityModel> facilities,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FacilitySelectionRoute.name,
          args: FacilitySelectionRouteArgs(
            key: key,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'FacilitySelectionRoute';

  static const _i27.PageInfo<FacilitySelectionRouteArgs> page =
      _i27.PageInfo<FacilitySelectionRouteArgs>(name);
}

class FacilitySelectionRouteArgs {
  const FacilitySelectionRouteArgs({
    this.key,
    required this.facilities,
  });

  final _i28.Key? key;

  final List<_i31.FacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [_i11.HouseDetailsPage]
class HouseDetailsRoute extends _i27.PageRouteInfo<HouseDetailsRouteArgs> {
  HouseDetailsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HouseDetailsRoute.name,
          args: HouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseDetailsRoute';

  static const _i27.PageInfo<HouseDetailsRouteArgs> page =
      _i27.PageInfo<HouseDetailsRouteArgs>(name);
}

class HouseDetailsRouteArgs {
  const HouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i12.HouseHoldDetailsPage]
class HouseHoldDetailsRoute
    extends _i27.PageRouteInfo<HouseHoldDetailsRouteArgs> {
  HouseHoldDetailsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HouseHoldDetailsRoute.name,
          args: HouseHoldDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseHoldDetailsRoute';

  static const _i27.PageInfo<HouseHoldDetailsRouteArgs> page =
      _i27.PageInfo<HouseHoldDetailsRouteArgs>(name);
}

class HouseHoldDetailsRouteArgs {
  const HouseHoldDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseHoldDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i13.HouseholdAcknowledgementPage]
class HouseholdAcknowledgementRoute
    extends _i27.PageRouteInfo<HouseholdAcknowledgementRouteArgs> {
  HouseholdAcknowledgementRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HouseholdAcknowledgementRoute.name,
          args: HouseholdAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdAcknowledgementRoute';

  static const _i27.PageInfo<HouseholdAcknowledgementRouteArgs> page =
      _i27.PageInfo<HouseholdAcknowledgementRouteArgs>(name);
}

class HouseholdAcknowledgementRouteArgs {
  const HouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'HouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i14.HouseholdLocationPage]
class HouseholdLocationRoute
    extends _i27.PageRouteInfo<HouseholdLocationRouteArgs> {
  HouseholdLocationRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HouseholdLocationRoute.name,
          args: HouseholdLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdLocationRoute';

  static const _i27.PageInfo<HouseholdLocationRouteArgs> page =
      _i27.PageInfo<HouseholdLocationRouteArgs>(name);
}

class HouseholdLocationRouteArgs {
  const HouseholdLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i15.HouseholdOverviewPage]
class HouseholdOverviewRoute
    extends _i27.PageRouteInfo<HouseholdOverviewRouteArgs> {
  HouseholdOverviewRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HouseholdOverviewRoute.name,
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdOverviewRoute';

  static const _i27.PageInfo<HouseholdOverviewRouteArgs> page =
      _i27.PageInfo<HouseholdOverviewRouteArgs>(name);
}

class HouseholdOverviewRouteArgs {
  const HouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i16.IndividualDetailsPage]
class IndividualDetailsRoute
    extends _i27.PageRouteInfo<IndividualDetailsRouteArgs> {
  IndividualDetailsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool isHeadOfHousehold = false,
    String? parentClientReferenceId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          IndividualDetailsRoute.name,
          args: IndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
            parentClientReferenceId: parentClientReferenceId,
          ),
          initialChildren: children,
        );

  static const String name = 'IndividualDetailsRoute';

  static const _i27.PageInfo<IndividualDetailsRouteArgs> page =
      _i27.PageInfo<IndividualDetailsRouteArgs>(name);
}

class IndividualDetailsRouteArgs {
  const IndividualDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHeadOfHousehold = false,
    this.parentClientReferenceId,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool isHeadOfHousehold;

  final String? parentClientReferenceId;

  @override
  String toString() {
    return 'IndividualDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isHeadOfHousehold: $isHeadOfHousehold, parentClientReferenceId: $parentClientReferenceId}';
  }
}

/// generated route for
/// [_i17.ParentOverviewPage]
class ParentOverviewRoute extends _i27.PageRouteInfo<ParentOverviewRouteArgs> {
  ParentOverviewRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ParentOverviewRoute.name,
          args: ParentOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ParentOverviewRoute';

  static const _i27.PageInfo<ParentOverviewRouteArgs> page =
      _i27.PageInfo<ParentOverviewRouteArgs>(name);
}

class ParentOverviewRouteArgs {
  const ParentOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'ParentOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i18.ReasonForDeletionPage]
class ReasonForDeletionRoute
    extends _i27.PageRouteInfo<ReasonForDeletionRouteArgs> {
  ReasonForDeletionRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool isHousholdDelete = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ReasonForDeletionRoute.name,
          args: ReasonForDeletionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHousholdDelete: isHousholdDelete,
          ),
          initialChildren: children,
        );

  static const String name = 'ReasonForDeletionRoute';

  static const _i27.PageInfo<ReasonForDeletionRouteArgs> page =
      _i27.PageInfo<ReasonForDeletionRouteArgs>(name);
}

class ReasonForDeletionRouteArgs {
  const ReasonForDeletionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHousholdDelete = false,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool isHousholdDelete;

  @override
  String toString() {
    return 'ReasonForDeletionRouteArgs{key: $key, appLocalizations: $appLocalizations, isHousholdDelete: $isHousholdDelete}';
  }
}

/// generated route for
/// [_i19.RecordPastDeliveryDetailsPage]
class RecordPastDeliveryDetailsRoute
    extends _i27.PageRouteInfo<RecordPastDeliveryDetailsRouteArgs> {
  RecordPastDeliveryDetailsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i34.TaskModel>? tasks,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          RecordPastDeliveryDetailsRoute.name,
          args: RecordPastDeliveryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordPastDeliveryDetailsRoute';

  static const _i27.PageInfo<RecordPastDeliveryDetailsRouteArgs> page =
      _i27.PageInfo<RecordPastDeliveryDetailsRouteArgs>(name);
}

class RecordPastDeliveryDetailsRouteArgs {
  const RecordPastDeliveryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.tasks,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final List<_i34.TaskModel>? tasks;

  @override
  String toString() {
    return 'RecordPastDeliveryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks}';
  }
}

/// generated route for
/// [_i20.ReferBeneficiaryPage]
class ReferBeneficiaryRoute
    extends _i27.PageRouteInfo<ReferBeneficiaryRouteArgs> {
  ReferBeneficiaryRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool isEditing = false,
    required String projectBeneficiaryClientRefId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ReferBeneficiaryRoute.name,
          args: ReferBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            projectBeneficiaryClientRefId: projectBeneficiaryClientRefId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferBeneficiaryRoute';

  static const _i27.PageInfo<ReferBeneficiaryRouteArgs> page =
      _i27.PageInfo<ReferBeneficiaryRouteArgs>(name);
}

class ReferBeneficiaryRouteArgs {
  const ReferBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    required this.projectBeneficiaryClientRefId,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool isEditing;

  final String projectBeneficiaryClientRefId;

  @override
  String toString() {
    return 'ReferBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, projectBeneficiaryClientRefId: $projectBeneficiaryClientRefId}';
  }
}

/// generated route for
/// [_i21.RefusedDeliveryPage]
class RefusedDeliveryRoute
    extends _i27.PageRouteInfo<RefusedDeliveryRouteArgs> {
  RefusedDeliveryRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          RefusedDeliveryRoute.name,
          args: RefusedDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'RefusedDeliveryRoute';

  static const _i27.PageInfo<RefusedDeliveryRouteArgs> page =
      _i27.PageInfo<RefusedDeliveryRouteArgs>(name);
}

class RefusedDeliveryRouteArgs {
  const RefusedDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'RefusedDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i22.RegistrationDeliveryWrapperPage]
class RegistrationDeliveryWrapperRoute extends _i27.PageRouteInfo<void> {
  const RegistrationDeliveryWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          RegistrationDeliveryWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationDeliveryWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SearchBeneficiaryPage]
class SearchBeneficiaryRoute
    extends _i27.PageRouteInfo<SearchBeneficiaryRouteArgs> {
  SearchBeneficiaryRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SearchBeneficiaryRoute.name,
          args: SearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBeneficiaryRoute';

  static const _i27.PageInfo<SearchBeneficiaryRouteArgs> page =
      _i27.PageInfo<SearchBeneficiaryRouteArgs>(name);
}

class SearchBeneficiaryRouteArgs {
  const SearchBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i24.SideEffectsPage]
class SideEffectsRoute extends _i27.PageRouteInfo<SideEffectsRouteArgs> {
  SideEffectsRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    required List<_i34.TaskModel> tasks,
    bool isEditing = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SideEffectsRoute.name,
          args: SideEffectsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'SideEffectsRoute';

  static const _i27.PageInfo<SideEffectsRouteArgs> page =
      _i27.PageInfo<SideEffectsRouteArgs>(name);
}

class SideEffectsRouteArgs {
  const SideEffectsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.tasks,
    this.isEditing = false,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final List<_i34.TaskModel> tasks;

  final bool isEditing;

  @override
  String toString() {
    return 'SideEffectsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i25.SplashAcknowledgementPage]
class SplashAcknowledgementRoute
    extends _i27.PageRouteInfo<SplashAcknowledgementRouteArgs> {
  SplashAcknowledgementRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableBackToSearch,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SplashAcknowledgementRoute.name,
          args: SplashAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableBackToSearch: enableBackToSearch,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashAcknowledgementRoute';

  static const _i27.PageInfo<SplashAcknowledgementRouteArgs> page =
      _i27.PageInfo<SplashAcknowledgementRouteArgs>(name);
}

class SplashAcknowledgementRouteArgs {
  const SplashAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableBackToSearch,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableBackToSearch;

  @override
  String toString() {
    return 'SplashAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableBackToSearch: $enableBackToSearch}';
  }
}

/// generated route for
/// [_i26.SummaryPage]
class SummaryRoute extends _i27.PageRouteInfo<SummaryRouteArgs> {
  SummaryRoute({
    _i28.Key? key,
    _i29.RegistrationDeliveryLocalization? appLocalizations,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SummaryRoute.name,
          args: SummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryRoute';

  static const _i27.PageInfo<SummaryRouteArgs> page =
      _i27.PageInfo<SummaryRouteArgs>(name);
}

class SummaryRouteArgs {
  const SummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i28.Key? key;

  final _i29.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
