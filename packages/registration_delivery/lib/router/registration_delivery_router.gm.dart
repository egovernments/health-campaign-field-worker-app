// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:digit_data_model/data_model.dart' as _i14;
import 'package:flutter/foundation.dart' as _i15;
import 'package:flutter/material.dart' as _i12;
import 'package:registration_delivery/blocs/app_localization.dart' as _i13;
import 'package:registration_delivery/pages/beneficiary/beneficiary_details.dart'
    as _i2;
import 'package:registration_delivery/pages/beneficiary/beneficiary_id_downsync.dart'
    as _i4;
import 'package:registration_delivery/pages/beneficiary/household_overview.dart'
    as _i7;
import 'package:registration_delivery/pages/beneficiary/parent_overview.dart'
    as _i8;
import 'package:registration_delivery/pages/beneficiary/widgets/household_acknowledgement.dart'
    as _i6;
import 'package:registration_delivery/pages/beneficiary_registration/beneficiary_acknowledgement.dart'
    as _i1;
import 'package:registration_delivery/pages/beneficiary_registration/beneficiary_error.dart'
    as _i3;
import 'package:registration_delivery/pages/registration_delivery_wrapper.dart'
    as _i9;
import 'package:registration_delivery/pages/search_beneficiary.dart' as _i10;

abstract class $RegistrationDeliveryRoute extends _i11.AutoRouterModule {
  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    BeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const BeneficiaryAcknowledgementRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BeneficiaryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryErrorRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryErrorRouteArgs>(
          orElse: () => const BeneficiaryErrorRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BeneficiaryErrorPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    BeneficiaryIdDownSyncRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryIdDownSyncRouteArgs>(
          orElse: () => const BeneficiaryIdDownSyncRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BeneficiaryIdDownSyncPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementRouteArgs>(
          orElse: () => const HouseholdAcknowledgementRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    HouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewRouteArgs>(
          orElse: () => const HouseholdOverviewRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ParentOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<ParentOverviewRouteArgs>(
          orElse: () => const ParentOverviewRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ParentOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    RegistrationDeliveryWrapperRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RegistrationDeliveryWrapperPage(),
      );
    },
    SearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryRouteArgs>(
          orElse: () => const SearchBeneficiaryRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SearchBeneficiaryPage(
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
    extends _i11.PageRouteInfo<BeneficiaryAcknowledgementRouteArgs> {
  BeneficiaryAcknowledgementRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<BeneficiaryAcknowledgementRouteArgs> page =
      _i11.PageInfo<BeneficiaryAcknowledgementRouteArgs>(name);
}

class BeneficiaryAcknowledgementRouteArgs {
  const BeneficiaryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'BeneficiaryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i2.BeneficiaryDetailsPage]
class BeneficiaryDetailsRoute
    extends _i11.PageRouteInfo<BeneficiaryDetailsRouteArgs> {
  BeneficiaryDetailsRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BeneficiaryDetailsRoute.name,
          args: BeneficiaryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDetailsRoute';

  static const _i11.PageInfo<BeneficiaryDetailsRouteArgs> page =
      _i11.PageInfo<BeneficiaryDetailsRouteArgs>(name);
}

class BeneficiaryDetailsRouteArgs {
  const BeneficiaryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.BeneficiaryErrorPage]
class BeneficiaryErrorRoute
    extends _i11.PageRouteInfo<BeneficiaryErrorRouteArgs> {
  BeneficiaryErrorRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BeneficiaryErrorRoute.name,
          args: BeneficiaryErrorRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryErrorRoute';

  static const _i11.PageInfo<BeneficiaryErrorRouteArgs> page =
      _i11.PageInfo<BeneficiaryErrorRouteArgs>(name);
}

class BeneficiaryErrorRouteArgs {
  const BeneficiaryErrorRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'BeneficiaryErrorRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i4.BeneficiaryIdDownSyncPage]
class BeneficiaryIdDownSyncRoute
    extends _i11.PageRouteInfo<BeneficiaryIdDownSyncRouteArgs> {
  BeneficiaryIdDownSyncRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BeneficiaryIdDownSyncRoute.name,
          args: BeneficiaryIdDownSyncRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryIdDownSyncRoute';

  static const _i11.PageInfo<BeneficiaryIdDownSyncRouteArgs> page =
      _i11.PageInfo<BeneficiaryIdDownSyncRouteArgs>(name);
}

class BeneficiaryIdDownSyncRouteArgs {
  const BeneficiaryIdDownSyncRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryIdDownSyncRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.FacilitySelectionPage]
class FacilitySelectionRoute
    extends _i11.PageRouteInfo<FacilitySelectionRouteArgs> {
  FacilitySelectionRoute({
    _i12.Key? key,
    required List<_i14.FacilityModel> facilities,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          FacilitySelectionRoute.name,
          args: FacilitySelectionRouteArgs(
            key: key,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'FacilitySelectionRoute';

  static const _i11.PageInfo<FacilitySelectionRouteArgs> page =
      _i11.PageInfo<FacilitySelectionRouteArgs>(name);
}

class FacilitySelectionRouteArgs {
  const FacilitySelectionRouteArgs({
    this.key,
    required this.facilities,
  });

  final _i12.Key? key;

  final List<_i14.FacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [_i6.HouseholdAcknowledgementPage]
class HouseholdAcknowledgementRoute
    extends _i11.PageRouteInfo<HouseholdAcknowledgementRouteArgs> {
  HouseholdAcknowledgementRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<HouseholdAcknowledgementRouteArgs> page =
      _i11.PageInfo<HouseholdAcknowledgementRouteArgs>(name);
}

class HouseholdAcknowledgementRouteArgs {
  const HouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'HouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i7.HouseholdOverviewPage]
class HouseholdOverviewRoute
    extends _i11.PageRouteInfo<HouseholdOverviewRouteArgs> {
  HouseholdOverviewRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HouseholdOverviewRoute.name,
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdOverviewRoute';

  static const _i11.PageInfo<HouseholdOverviewRouteArgs> page =
      _i11.PageInfo<HouseholdOverviewRouteArgs>(name);
}

class HouseholdOverviewRouteArgs {
  const HouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.ParentOverviewPage]
class ParentOverviewRoute extends _i11.PageRouteInfo<ParentOverviewRouteArgs> {
  ParentOverviewRoute({
    _i12.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ParentOverviewRoute.name,
          args: ParentOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ParentOverviewRoute';

  static const _i11.PageInfo<ParentOverviewRouteArgs> page =
      _i11.PageInfo<ParentOverviewRouteArgs>(name);
}

class ParentOverviewRouteArgs {
  const ParentOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i12.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'ParentOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i9.RegistrationDeliveryWrapperPage]
class RegistrationDeliveryWrapperRoute extends _i11.PageRouteInfo<void> {
  const RegistrationDeliveryWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegistrationDeliveryWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationDeliveryWrapperRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SearchBeneficiaryPage]
class SearchBeneficiaryRoute
    extends _i11.PageRouteInfo<SearchBeneficiaryRouteArgs> {
  SearchBeneficiaryRoute({
    _i15.Key? key,
    _i13.RegistrationDeliveryLocalization? appLocalizations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SearchBeneficiaryRoute.name,
          args: SearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBeneficiaryRoute';

  static const _i11.PageInfo<SearchBeneficiaryRouteArgs> page =
      _i11.PageInfo<SearchBeneficiaryRouteArgs>(name);
}

class SearchBeneficiaryRouteArgs {
  const SearchBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i13.RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
