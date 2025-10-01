// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:digit_data_model/data_model.dart' as _i8;
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/material.dart' as _i6;
import 'package:referral_reconciliation/blocs/app_localization.dart' as _i7;
import 'package:referral_reconciliation/pages/acknowledgement.dart' as _i2;
import 'package:referral_reconciliation/pages/project_facility/project_facility_selection.dart'
    as _i3;
import 'package:referral_reconciliation/pages/referral_wrapper.dart' as _i1;
import 'package:referral_reconciliation/pages/search_referral_reconciliations.dart'
    as _i4;

abstract class $ReferralReconciliationRoute extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HFReferralWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HFReferralWrapperPage(),
      );
    },
    ReferralReconAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReconAcknowledgementRouteArgs>(
          orElse: () => const ReferralReconAcknowledgementRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ReferralReconAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReconProjectFacilitySelectionRoute.name: (routeData) {
      final args =
          routeData.argsAs<ReferralReconProjectFacilitySelectionRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ReferralReconProjectFacilitySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          projectFacilities: args.projectFacilities,
        ),
      );
    },
    SearchReferralReconciliationsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchReferralReconciliationsRouteArgs>(
          orElse: () => const SearchReferralReconciliationsRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SearchReferralReconciliationsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HFReferralWrapperPage]
class HFReferralWrapperRoute extends _i5.PageRouteInfo<void> {
  const HFReferralWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HFReferralWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HFReferralWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ReferralReconAcknowledgementPage]
class ReferralReconAcknowledgementRoute
    extends _i5.PageRouteInfo<ReferralReconAcknowledgementRouteArgs> {
  ReferralReconAcknowledgementRoute({
    _i6.Key? key,
    _i7.ReferralReconLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ReferralReconAcknowledgementRoute.name,
          args: ReferralReconAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReconAcknowledgementRoute';

  static const _i5.PageInfo<ReferralReconAcknowledgementRouteArgs> page =
      _i5.PageInfo<ReferralReconAcknowledgementRouteArgs>(name);
}

class ReferralReconAcknowledgementRouteArgs {
  const ReferralReconAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i6.Key? key;

  final _i7.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReconAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ReferralReconProjectFacilitySelectionPage]
class ReferralReconProjectFacilitySelectionRoute
    extends _i5.PageRouteInfo<ReferralReconProjectFacilitySelectionRouteArgs> {
  ReferralReconProjectFacilitySelectionRoute({
    _i6.Key? key,
    _i7.ReferralReconLocalization? appLocalizations,
    required List<_i8.ProjectFacilityModel> projectFacilities,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ReferralReconProjectFacilitySelectionRoute.name,
          args: ReferralReconProjectFacilitySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            projectFacilities: projectFacilities,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReconProjectFacilitySelectionRoute';

  static const _i5.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>
      page = _i5.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>(name);
}

class ReferralReconProjectFacilitySelectionRouteArgs {
  const ReferralReconProjectFacilitySelectionRouteArgs({
    this.key,
    this.appLocalizations,
    required this.projectFacilities,
  });

  final _i6.Key? key;

  final _i7.ReferralReconLocalization? appLocalizations;

  final List<_i8.ProjectFacilityModel> projectFacilities;

  @override
  String toString() {
    return 'ReferralReconProjectFacilitySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations, projectFacilities: $projectFacilities}';
  }
}

/// generated route for
/// [_i4.SearchReferralReconciliationsPage]
class SearchReferralReconciliationsRoute
    extends _i5.PageRouteInfo<SearchReferralReconciliationsRouteArgs> {
  SearchReferralReconciliationsRoute({
    _i9.Key? key,
    _i7.ReferralReconLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SearchReferralReconciliationsRoute.name,
          args: SearchReferralReconciliationsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchReferralReconciliationsRoute';

  static const _i5.PageInfo<SearchReferralReconciliationsRouteArgs> page =
      _i5.PageInfo<SearchReferralReconciliationsRouteArgs>(name);
}

class SearchReferralReconciliationsRouteArgs {
  const SearchReferralReconciliationsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i9.Key? key;

  final _i7.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchReferralReconciliationsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
