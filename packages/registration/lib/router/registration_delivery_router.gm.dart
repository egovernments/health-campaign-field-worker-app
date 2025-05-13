// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:digit_data_model/data_model.dart' as _i21;
import 'package:flutter/material.dart' as _i17;
import 'package:registration/blocs/app_localization.dart' as _i18;
import 'package:registration/blocs/search_households/search_households.dart'
    as _i20;
import 'package:registration/pages/beneficiary/beneficiary_details.dart' as _i2;
import 'package:registration/pages/beneficiary/beneficiary_wrapper.dart' as _i4;
import 'package:registration/pages/beneficiary/facility_selection.dart' as _i5;
import 'package:registration/pages/beneficiary/household_overview.dart' as _i10;
import 'package:registration/pages/beneficiary/widgets/household_acknowledgement.dart'
    as _i8;
import 'package:registration/pages/beneficiary_registration/beneficiary_acknowledgement.dart'
    as _i1;
import 'package:registration/pages/beneficiary_registration/beneficiary_registration_wrapper.dart'
    as _i3;
import 'package:registration/pages/beneficiary_registration/house_details.dart'
    as _i6;
import 'package:registration/pages/beneficiary_registration/household_details.dart'
    as _i7;
import 'package:registration/pages/beneficiary_registration/household_location.dart'
    as _i9;
import 'package:registration/pages/beneficiary_registration/individual_details.dart'
    as _i11;
import 'package:registration/pages/reason_for_deletion.dart' as _i12;
import 'package:registration/pages/registration_delivery_wrapper.dart' as _i13;
import 'package:registration/pages/search_beneficiary.dart' as _i14;
import 'package:registration/pages/summary_page.dart' as _i15;
import 'package:registration/registration_delivery.dart' as _i19;

abstract class $RegistrationDeliveryRoute extends _i16.AutoRouterModule {
  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    BeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const BeneficiaryAcknowledgementRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BeneficiaryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    BeneficiaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDetailsRouteArgs>(
          orElse: () => const BeneficiaryDetailsRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BeneficiaryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryRegistrationWrapperRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(
            child: _i3.BeneficiaryRegistrationWrapperPage(
          key: args.key,
          initialState: args.initialState,
        )),
      );
    },
    BeneficiaryWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryWrapperRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BeneficiaryWrapperPage(
          key: args.key,
          wrapper: args.wrapper,
          isEditing: args.isEditing,
        ),
      );
    },
    FacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<FacilitySelectionRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.FacilitySelectionPage(
          key: args.key,
          facilities: args.facilities,
        ),
      );
    },
    HouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseDetailsRouteArgs>(
          orElse: () => const HouseDetailsRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HouseDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseHoldDetailsRouteArgs>(
          orElse: () => const HouseHoldDetailsRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HouseHoldDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementRouteArgs>(
          orElse: () => const HouseholdAcknowledgementRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    HouseholdLocationRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdLocationRouteArgs>(
          orElse: () => const HouseholdLocationRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.HouseholdLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewRouteArgs>(
          orElse: () => const HouseholdOverviewRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    IndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualDetailsRouteArgs>(
          orElse: () => const IndividualDetailsRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.IndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
        ),
      );
    },
    ReasonForDeletionRoute.name: (routeData) {
      final args = routeData.argsAs<ReasonForDeletionRouteArgs>(
          orElse: () => const ReasonForDeletionRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ReasonForDeletionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHousholdDelete: args.isHousholdDelete,
        ),
      );
    },
    RegistrationDeliveryWrapperRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RegistrationDeliveryWrapperPage(),
      );
    },
    SearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryRouteArgs>(
          orElse: () => const SearchBeneficiaryRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.SearchBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SummaryRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryRouteArgs>(
          orElse: () => const SummaryRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SummaryPage(
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
    extends _i16.PageRouteInfo<BeneficiaryAcknowledgementRouteArgs> {
  BeneficiaryAcknowledgementRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<BeneficiaryAcknowledgementRouteArgs> page =
      _i16.PageInfo<BeneficiaryAcknowledgementRouteArgs>(name);
}

class BeneficiaryAcknowledgementRouteArgs {
  const BeneficiaryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'BeneficiaryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i2.BeneficiaryDetailsPage]
class BeneficiaryDetailsRoute
    extends _i16.PageRouteInfo<BeneficiaryDetailsRouteArgs> {
  BeneficiaryDetailsRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          BeneficiaryDetailsRoute.name,
          args: BeneficiaryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDetailsRoute';

  static const _i16.PageInfo<BeneficiaryDetailsRouteArgs> page =
      _i16.PageInfo<BeneficiaryDetailsRouteArgs>(name);
}

class BeneficiaryDetailsRouteArgs {
  const BeneficiaryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.BeneficiaryRegistrationWrapperPage]
class BeneficiaryRegistrationWrapperRoute
    extends _i16.PageRouteInfo<BeneficiaryRegistrationWrapperRouteArgs> {
  BeneficiaryRegistrationWrapperRoute({
    _i17.Key? key,
    required _i19.BeneficiaryRegistrationState initialState,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          BeneficiaryRegistrationWrapperRoute.name,
          args: BeneficiaryRegistrationWrapperRouteArgs(
            key: key,
            initialState: initialState,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryRegistrationWrapperRoute';

  static const _i16.PageInfo<BeneficiaryRegistrationWrapperRouteArgs> page =
      _i16.PageInfo<BeneficiaryRegistrationWrapperRouteArgs>(name);
}

class BeneficiaryRegistrationWrapperRouteArgs {
  const BeneficiaryRegistrationWrapperRouteArgs({
    this.key,
    required this.initialState,
  });

  final _i17.Key? key;

  final _i19.BeneficiaryRegistrationState initialState;

  @override
  String toString() {
    return 'BeneficiaryRegistrationWrapperRouteArgs{key: $key, initialState: $initialState}';
  }
}

/// generated route for
/// [_i4.BeneficiaryWrapperPage]
class BeneficiaryWrapperRoute
    extends _i16.PageRouteInfo<BeneficiaryWrapperRouteArgs> {
  BeneficiaryWrapperRoute({
    _i17.Key? key,
    required _i20.HouseholdMemberWrapper wrapper,
    bool isEditing = false,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<BeneficiaryWrapperRouteArgs> page =
      _i16.PageInfo<BeneficiaryWrapperRouteArgs>(name);
}

class BeneficiaryWrapperRouteArgs {
  const BeneficiaryWrapperRouteArgs({
    this.key,
    required this.wrapper,
    this.isEditing = false,
  });

  final _i17.Key? key;

  final _i20.HouseholdMemberWrapper wrapper;

  final bool isEditing;

  @override
  String toString() {
    return 'BeneficiaryWrapperRouteArgs{key: $key, wrapper: $wrapper, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i5.FacilitySelectionPage]
class FacilitySelectionRoute
    extends _i16.PageRouteInfo<FacilitySelectionRouteArgs> {
  FacilitySelectionRoute({
    _i17.Key? key,
    required List<_i21.FacilityModel> facilities,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          FacilitySelectionRoute.name,
          args: FacilitySelectionRouteArgs(
            key: key,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'FacilitySelectionRoute';

  static const _i16.PageInfo<FacilitySelectionRouteArgs> page =
      _i16.PageInfo<FacilitySelectionRouteArgs>(name);
}

class FacilitySelectionRouteArgs {
  const FacilitySelectionRouteArgs({
    this.key,
    required this.facilities,
  });

  final _i17.Key? key;

  final List<_i21.FacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [_i6.HouseDetailsPage]
class HouseDetailsRoute extends _i16.PageRouteInfo<HouseDetailsRouteArgs> {
  HouseDetailsRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HouseDetailsRoute.name,
          args: HouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseDetailsRoute';

  static const _i16.PageInfo<HouseDetailsRouteArgs> page =
      _i16.PageInfo<HouseDetailsRouteArgs>(name);
}

class HouseDetailsRouteArgs {
  const HouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.HouseHoldDetailsPage]
class HouseHoldDetailsRoute
    extends _i16.PageRouteInfo<HouseHoldDetailsRouteArgs> {
  HouseHoldDetailsRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HouseHoldDetailsRoute.name,
          args: HouseHoldDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseHoldDetailsRoute';

  static const _i16.PageInfo<HouseHoldDetailsRouteArgs> page =
      _i16.PageInfo<HouseHoldDetailsRouteArgs>(name);
}

class HouseHoldDetailsRouteArgs {
  const HouseHoldDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseHoldDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.HouseholdAcknowledgementPage]
class HouseholdAcknowledgementRoute
    extends _i16.PageRouteInfo<HouseholdAcknowledgementRouteArgs> {
  HouseholdAcknowledgementRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<HouseholdAcknowledgementRouteArgs> page =
      _i16.PageInfo<HouseholdAcknowledgementRouteArgs>(name);
}

class HouseholdAcknowledgementRouteArgs {
  const HouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'HouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i9.HouseholdLocationPage]
class HouseholdLocationRoute
    extends _i16.PageRouteInfo<HouseholdLocationRouteArgs> {
  HouseholdLocationRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HouseholdLocationRoute.name,
          args: HouseholdLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdLocationRoute';

  static const _i16.PageInfo<HouseholdLocationRouteArgs> page =
      _i16.PageInfo<HouseholdLocationRouteArgs>(name);
}

class HouseholdLocationRouteArgs {
  const HouseholdLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i10.HouseholdOverviewPage]
class HouseholdOverviewRoute
    extends _i16.PageRouteInfo<HouseholdOverviewRouteArgs> {
  HouseholdOverviewRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HouseholdOverviewRoute.name,
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdOverviewRoute';

  static const _i16.PageInfo<HouseholdOverviewRouteArgs> page =
      _i16.PageInfo<HouseholdOverviewRouteArgs>(name);
}

class HouseholdOverviewRouteArgs {
  const HouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i11.IndividualDetailsPage]
class IndividualDetailsRoute
    extends _i16.PageRouteInfo<IndividualDetailsRouteArgs> {
  IndividualDetailsRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    bool isHeadOfHousehold = false,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          IndividualDetailsRoute.name,
          args: IndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'IndividualDetailsRoute';

  static const _i16.PageInfo<IndividualDetailsRouteArgs> page =
      _i16.PageInfo<IndividualDetailsRouteArgs>(name);
}

class IndividualDetailsRouteArgs {
  const IndividualDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  final bool isHeadOfHousehold;

  @override
  String toString() {
    return 'IndividualDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isHeadOfHousehold: $isHeadOfHousehold}';
  }
}

/// generated route for
/// [_i12.ReasonForDeletionPage]
class ReasonForDeletionRoute
    extends _i16.PageRouteInfo<ReasonForDeletionRouteArgs> {
  ReasonForDeletionRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    bool isHousholdDelete = false,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<ReasonForDeletionRouteArgs> page =
      _i16.PageInfo<ReasonForDeletionRouteArgs>(name);
}

class ReasonForDeletionRouteArgs {
  const ReasonForDeletionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHousholdDelete = false,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  final bool isHousholdDelete;

  @override
  String toString() {
    return 'ReasonForDeletionRouteArgs{key: $key, appLocalizations: $appLocalizations, isHousholdDelete: $isHousholdDelete}';
  }
}

/// generated route for
/// [_i13.RegistrationDeliveryWrapperPage]
class RegistrationDeliveryWrapperRoute extends _i16.PageRouteInfo<void> {
  const RegistrationDeliveryWrapperRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegistrationDeliveryWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationDeliveryWrapperRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SearchBeneficiaryPage]
class SearchBeneficiaryRoute
    extends _i16.PageRouteInfo<SearchBeneficiaryRouteArgs> {
  SearchBeneficiaryRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SearchBeneficiaryRoute.name,
          args: SearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBeneficiaryRoute';

  static const _i16.PageInfo<SearchBeneficiaryRouteArgs> page =
      _i16.PageInfo<SearchBeneficiaryRouteArgs>(name);
}

class SearchBeneficiaryRouteArgs {
  const SearchBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i15.SummaryPage]
class SummaryRoute extends _i16.PageRouteInfo<SummaryRouteArgs> {
  SummaryRoute({
    _i17.Key? key,
    _i18.RegistrationDeliveryLocalization? appLocalizations,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SummaryRoute.name,
          args: SummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryRoute';

  static const _i16.PageInfo<SummaryRouteArgs> page =
      _i16.PageInfo<SummaryRouteArgs>(name);
}

class SummaryRouteArgs {
  const SummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i17.Key? key;

  final _i18.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
